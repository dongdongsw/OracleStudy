package com.sist.jsoup;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.dao.Used_MerchandiseDAO;
import com.sist.vo.Used_MerchandiseVO;

public class Used_MerchandiseJsoup {
    public void usedDataCollenction() throws Exception {
        int l = 0;

        List<String> list = new ArrayList<>();
        list.add(""); // 전체 카테고리
        for (int p = 1; p < 22; p++) {
            list.add(String.valueOf(p));
        }
        list.add("1348");

        Used_MerchandiseDAO dao = Used_MerchandiseDAO.newInstance();

        for (int i = 0; i < list.size(); i++) {
            String url = "";

            for (int p = 1; p <= 2; p++) {
                try {
                    url = "https://web.joongna.com/search?page=" + p + "&category=" + list.get(i);
                    Document doc = Jsoup.connect(url).get();

                    // 목록에서 상세페이지 링크 추출
                    Elements links = doc.select("a[href^=/product/]");

                    for (Element link : links) {
                        try {
                            String detailUrl = "https://web.joongna.com" + link.attr("href");
                            Document dtc = Jsoup.connect(detailUrl).get();

                            // ✅ __NEXT_DATA__ JSON 추출
                            Element scriptTag = dtc.selectFirst("script#__NEXT_DATA__");
                            if (scriptTag == null) {
                                System.out.println("❌ NEXT_DATA 없음: " + detailUrl);
                                continue; // 다음 상품으로 넘어가기
                            }

                            String json = scriptTag.html();
                            ObjectMapper mapper = new ObjectMapper();
                            JsonNode root = mapper.readTree(json);

                            JsonNode product = root.at("/props/pageProps/dehydratedState/queries/1/state/data/data");
                            if (product.isMissingNode()) {
                                continue; // 데이터 없으면 skip
                            }

                            // 1. 제목
                            String title = product.path("productTitle").asText("");
                            // 2. 가격
                            String price = product.path("productPrice").asText("");
                            // 3. 거래 방식
                            String tradeType = "";
                            JsonNode labels = product.path("labels");
                            if (labels.isArray()) {
                                tradeType = StreamSupport.stream(labels.spliterator(), false)
                                        .map(JsonNode::asText)
                                        .collect(Collectors.joining(", "));
                            }
                            // 4. 판매자 닉네임
                            String sellerName = product.path("nickName").asText("");
                            
                            // 5. 판매자 신뢰도
                            JsonNode profile = root.at("/props/pageProps/dehydratedState/queries/5/state/data/profile");
                            int activityScore = profile.path("activityScore").asInt(0);
                            int reliabilityScore = profile.path("reliabilityScore").asInt(0);
                            int sellerTrustScore = activityScore + reliabilityScore;
                            String sellerTrust = String.valueOf(sellerTrustScore);
                            
                            // 6. 상품 설명
                            String description = product.path("productDescription").asText("");
                            
                            // 7. 등록일 / 수정일
                            String createDate = product.path("sortDate").asText("1970-01-01 00:00:00");
                            String modifyDate = product.path("updateDate").asText("1970-01-01 00:00:00");
                            
                            // 8. 카테고리
                            String category = product.path("categoryName").asText("");
                            
                            // 9. 지역
                            String location = "";
                            JsonNode locations = product.path("locations");
                            if (locations.isArray() && locations.size() > 0) {
                                location = locations.get(0).path("locationName").asText("");
                            }

                            Used_MerchandiseVO vo = new Used_MerchandiseVO();
                            vo.setTitle(title);
                            vo.setPrice(price);
                            vo.setTrade_type(tradeType);
                            vo.setSeller(sellerName);
                            vo.setSeller_Trust(sellerTrust);
                            vo.setDescription(description);
                            vo.setCreate_date(createDate);
                            vo.setModify_date(modifyDate);
                            vo.setDetail_link(detailUrl);
                            vo.setCategory(category);
                            vo.setLocation(location);

                            dao.usedInsert(vo);
                            l++;
                            System.out.println("✅ 저장 성공: " + vo.getTitle() + " / " + vo.getPrice());

                        } catch (Exception e) {
                            System.out.println("❌ 처리 실패: " + link.attr("href"));
                            e.printStackTrace();
                            continue;
                        }
                    }

                } catch (Exception ex) {
                    System.out.println("❌ 페이지 로딩 실패: " + url);
                    ex.printStackTrace();
                    continue;
                }
            }
        }

        System.out.println("데이터 수집 완료");
        System.out.println("총 " + l + "개");
    }

    public static void main(String[] args) throws Exception {
        Used_MerchandiseJsoup gm = new Used_MerchandiseJsoup();
        gm.usedDataCollenction();
    }
}

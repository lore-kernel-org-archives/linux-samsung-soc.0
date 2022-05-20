Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD79C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 May 2022 03:06:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343859AbiETDGJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 19 May 2022 23:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345044AbiETDGB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 May 2022 23:06:01 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94F1511450
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 May 2022 20:05:58 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220520030555epoutp01d5d42d4f57b52e8b3d93e73855f4182f~wsUDy4spJ0676706767epoutp01t
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 May 2022 03:05:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220520030555epoutp01d5d42d4f57b52e8b3d93e73855f4182f~wsUDy4spJ0676706767epoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1653015955;
        bh=HkZ559MYQetfWjvsjOJ6gPopP8hMbWmavFMsLCekGfo=;
        h=From:To:Cc:Subject:Date:References:From;
        b=kG4E+yZeIecW3hjFzQsV0HyvnBrwQWKUD5b7OwseiWkHFn8mlOWB2W67I+fxnGJ/k
         l32KyW+DJvOmuaG3KE/tw24vyyQVOdW3YMldlO7dxxwdanO3tL3/08NS6PNj+5BdqZ
         ygUGWJv9hqvwhK7l9JjssAfpsw8U7BS4WXrOgwOg=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220520030554epcas2p3eb26663248db1c972afab33215a398f0~wsUC5AISK0461304613epcas2p3U;
        Fri, 20 May 2022 03:05:54 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.88]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4L4BSJ06Hlz4x9Pv; Fri, 20 May
        2022 03:05:52 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        4D.0A.10028.F8507826; Fri, 20 May 2022 12:05:51 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220520030551epcas2p1a67b9f026ce2ec56b0a167026ef96baf~wsT-ySUFF2679426794epcas2p14;
        Fri, 20 May 2022 03:05:51 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220520030551epsmtrp1307c19b57c169359920dbd6117f78169~wsT-wipWJ3246032460epsmtrp1G;
        Fri, 20 May 2022 03:05:51 +0000 (GMT)
X-AuditID: b6c32a47-589ff7000000272c-87-6287058f2930
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        7E.6B.11276.F8507826; Fri, 20 May 2022 12:05:51 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220520030551epsmtip2addd31906a6fb69b574e80811f15a049~wsT-mYITL2506025060epsmtip2W;
        Fri, 20 May 2022 03:05:51 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH] dt-bindings: clock: exynosautov9: correct count of NR_CLK
Date:   Fri, 20 May 2022 12:06:25 +0900
Message-Id: <20220520030625.145324-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLJsWRmVeSWpSXmKPExsWy7bCmuW4/a3uSwetmK4sH87axWVzer21x
        /ctzVov5R86xWvS9eMhs8bHnHqvFjPP7mCwunnK1aN17hN3i8Jt2Vot/1zayWKza9YfRgcfj
        /Y1Wdo+ds+6ye2xa1cnmcefaHjaPvi2rGD0+b5ILYIvKtslITUxJLVJIzUvOT8nMS7dV8g6O
        d443NTMw1DW0tDBXUshLzE21VXLxCdB1y8wBOlFJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9c
        YquUWpCSU2BeoFecmFtcmpeul5daYmVoYGBkClSYkJ2xv7ubvWCuYMXaba9ZGxi7+LoYOTkk
        BEwkHv64ytbFyMUhJLCDUaKjcTsLhPOJUeLI3JmMEM43RokF55+ywLQcuHGCGSKxl1GidecU
        qP6PjBItDQfBqtgEdCW2PH8F1i4isJpJ4veOq6wgDrPABkaJhzdfg1UJC3hJfF16i72LkYOD
        RUBV4uF7JZAwr4C9xJoVm5gg1slLbJjfywwRF5Q4OfMJWCszULx562ywMyQE/rJLPH02lxGi
        wUVi6ZtFrBC2sMSr41vYIWwpiZf9bVB2scTSWZ+YIJobGCUub/vFBpEwlpj1rJ0R5CBmAU2J
        9bv0QUwJAWWJI7eg9vJJdBz+yw4R5pXoaBOCaFSXOLB9OjSEZCW653yGusBD4v6K62C2kECs
        xNx9LawTGOVnIflmFpJvZiHsXcDIvIpRLLWgODc9tdiowBgercn5uZsYwelUy30H44y3H/QO
        MTJxMB5ilOBgVhLhZcxtSRLiTUmsrEotyo8vKs1JLT7EaAoM3onMUqLJ+cCEnlcSb2hiaWBi
        ZmZobmRqYK4kzuuVsiFRSCA9sSQ1OzW1ILUIpo+Jg1OqgalkcdcRs52P05Un2H7vDai8cGuR
        W1fC3qWizW4rsg2b1r082lG9td0g7rKbet/EDdPebuP6y8miHlfyQDDnzGLp5+yHDmmwax17
        fm/L1p3d7fVJu780HfY4GCWyke9dhPPTPW73/kc8bwwyk/IQdbYulw5yMZxQHVrSvLlrHofc
        q+IZKmJ1T89pRfBcnT/3bLu5iCT/zjuTmuRff4u8HstwVkj3fLri8dwHPgbR1T4RncKb9y86
        5C2+4CTHzsAev32Mt1b/Efl74q3YRMVHasa9L6fPmnDw8u9jif3c1p+S9L7puWlLBIVofTvy
        Zf4ZfWG7I2fWzn5U+OnsiwURKgts3v69Fsh+9PsqVkufKl8lluKMREMt5qLiRABspYItMAQA
        AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDLMWRmVeSWpSXmKPExsWy7bCSvG4/a3uSQcsFMYsH87axWVzer21x
        /ctzVov5R86xWvS9eMhs8bHnHqvFjPP7mCwunnK1aN17hN3i8Jt2Vot/1zayWKza9YfRgcfj
        /Y1Wdo+ds+6ye2xa1cnmcefaHjaPvi2rGD0+b5ILYIvisklJzcksSy3St0vgytjf3c1eMFew
        Yu2216wNjF18XYycHBICJhIHbpxg7mLk4hAS2M0osXv5PlaIhKzEs3c72CFsYYn7LUdYIYre
        M0ocbO5lA0mwCehKbHn+ihEkISKwnkni4+Mr7CAOs8AWRol1b58xgVQJC3hJfF16CyjBwcEi
        oCrx8L0SSJhXwF5izYpNTBAb5CU2zO9lhogLSpyc+YQFxGYGijdvnc08gZFvFpLULCSpBYxM
        qxglUwuKc9Nziw0LDPNSy/WKE3OLS/PS9ZLzczcxggNcS3MH4/ZVH/QOMTJxMB5ilOBgVhLh
        ZcxtSRLiTUmsrEotyo8vKs1JLT7EKM3BoiTOe6HrZLyQQHpiSWp2ampBahFMlomDU6qB6ei8
        yczpK6t1brmFhYg1hwU/vFhcxfr9A0fLR5u8l9pXrlkyBTBscVv45Cv3j5UPPY3mhc9NnzBz
        Bs9JZTNj2SPigebBQj07kvinNa5fH6292ovlzhsFQYdzEzb+9p3+IMNPd+ezswxXzn65mBRQ
        m7stavUC/beeWkvTJCVu7mVWfrqx5Gqz68MrtfHhYhd4nBlkdrtyCF3Y3CtWoWf/5o98yrMJ
        ejuldT4KOyQYpTYk7ONYfpPRQ/eZW1+xQgv7QqHvXkefrzyhcGLjSbu7b2LPBF7KemV48/gZ
        odhih2X8fapBTVvYdFa2/Nv9xGSVTdur/MkT/dU43p044bHr/KIZpXeEDzszNOUlTKhzUGIp
        zkg01GIuKk4EALGs4BLfAgAA
X-CMS-MailID: 20220520030551epcas2p1a67b9f026ce2ec56b0a167026ef96baf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220520030551epcas2p1a67b9f026ce2ec56b0a167026ef96baf
References: <CGME20220520030551epcas2p1a67b9f026ce2ec56b0a167026ef96baf@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

_NR_CLKS which can be used to register clocks via nr_clk_ids. The clock
IDs are started from 1. So, _NR_CLKS should be defined to "the last
clock id + 1"

Fixes: 680e1c8370a2 ("dt-bindings: clock: add clock binding definitions for Exynos Auto v9")
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 include/dt-bindings/clock/samsung,exynosautov9.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/dt-bindings/clock/samsung,exynosautov9.h b/include/dt-bindings/clock/samsung,exynosautov9.h
index 71ec0a955364..ea9f91b4eb1a 100644
--- a/include/dt-bindings/clock/samsung,exynosautov9.h
+++ b/include/dt-bindings/clock/samsung,exynosautov9.h
@@ -166,7 +166,7 @@
 #define GOUT_CLKCMU_PERIC1_IP		248
 #define GOUT_CLKCMU_PERIS_BUS		249
 
-#define TOP_NR_CLK			249
+#define TOP_NR_CLK			250
 
 /* CMU_BUSMC */
 #define CLK_MOUT_BUSMC_BUS_USER		1
@@ -174,7 +174,7 @@
 #define CLK_GOUT_BUSMC_PDMA0_PCLK	3
 #define CLK_GOUT_BUSMC_SPDMA_PCLK	4
 
-#define BUSMC_NR_CLK			4
+#define BUSMC_NR_CLK			5
 
 /* CMU_CORE */
 #define CLK_MOUT_CORE_BUS_USER		1
@@ -183,7 +183,7 @@
 #define CLK_GOUT_CORE_CCI_PCLK		4
 #define CLK_GOUT_CORE_CMU_CORE_PCLK	5
 
-#define CORE_NR_CLK			5
+#define CORE_NR_CLK			6
 
 /* CMU_FSYS2 */
 #define CLK_MOUT_FSYS2_BUS_USER		1
@@ -194,7 +194,7 @@
 #define CLK_GOUT_FSYS2_UFS_EMBD1_ACLK	6
 #define CLK_GOUT_FSYS2_UFS_EMBD1_UNIPRO	7
 
-#define FSYS2_NR_CLK			7
+#define FSYS2_NR_CLK			8
 
 /* CMU_PERIC0 */
 #define CLK_MOUT_PERIC0_BUS_USER	1
@@ -240,7 +240,7 @@
 #define CLK_GOUT_PERIC0_PCLK_10		41
 #define CLK_GOUT_PERIC0_PCLK_11		42
 
-#define PERIC0_NR_CLK			42
+#define PERIC0_NR_CLK			43
 
 /* CMU_PERIC1 */
 #define CLK_MOUT_PERIC1_BUS_USER	1
@@ -286,7 +286,7 @@
 #define CLK_GOUT_PERIC1_PCLK_10		41
 #define CLK_GOUT_PERIC1_PCLK_11		42
 
-#define PERIC1_NR_CLK			42
+#define PERIC1_NR_CLK			43
 
 /* CMU_PERIS */
 #define CLK_MOUT_PERIS_BUS_USER		1
@@ -294,6 +294,6 @@
 #define CLK_GOUT_WDT_CLUSTER0		3
 #define CLK_GOUT_WDT_CLUSTER1		4
 
-#define PERIS_NR_CLK			4
+#define PERIS_NR_CLK			5
 
 #endif /* _DT_BINDINGS_CLOCK_EXYNOSAUTOV9_H */
-- 
2.36.1


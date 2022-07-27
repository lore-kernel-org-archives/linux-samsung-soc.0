Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88800C19F21
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jul 2022 02:18:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240095AbiG0CSh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Jul 2022 22:18:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240109AbiG0CSa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Jul 2022 22:18:30 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 304163C8D8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jul 2022 19:18:28 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220727021826epoutp0254b8ffdc0d31a6b43774f1170e6ff269~FjiAWDI9_1958819588epoutp026
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jul 2022 02:18:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220727021826epoutp0254b8ffdc0d31a6b43774f1170e6ff269~FjiAWDI9_1958819588epoutp026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1658888306;
        bh=YeAGP+qWAoBqrwEc8F7nvagQ9EUVjYZ/93z0QykEGF8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dibGNYpOKBKcdxJHL1yqfua8dU5hlqWZE3GP3+j614fAUBP4FQf/Apeet6syx4jGE
         oEq1KkGbCUOuJu99OYRhNXkoJFy7M6f8d0TIZ0qVVdgeyYHwu2i6Dc/rzpQyjtN9lK
         3JbvnxXRlQaurGgGUhEYlUBPCB5zhyC6HZekrrKY=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220727021825epcas2p4ebe263252cc2b372ef645a26026479b6~Fjh-eGrSV2725127251epcas2p4e;
        Wed, 27 Jul 2022 02:18:25 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.101]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4LsyB86m1hz4x9Q2; Wed, 27 Jul
        2022 02:18:24 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        EE.9B.09662.070A0E26; Wed, 27 Jul 2022 11:18:24 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220727021824epcas2p1f87c387e6c4923b036e4736a5c7855cf~Fjh_hQ4jq2667126671epcas2p1S;
        Wed, 27 Jul 2022 02:18:24 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220727021824epsmtrp1e67fb98144a56989843cfaff4015e3d4~Fjh_gjbG63129031290epsmtrp1M;
        Wed, 27 Jul 2022 02:18:24 +0000 (GMT)
X-AuditID: b6c32a48-9f7ff700000025be-ee-62e0a070cba7
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        42.F2.08905.070A0E26; Wed, 27 Jul 2022 11:18:24 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220727021823epsmtip1af1facfdc5b8e0bcd7907b2e577e6ed5~Fjh_RKOAG2106221062epsmtip1p;
        Wed, 27 Jul 2022 02:18:23 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [RESEND PATCH v2 3/3] clk: samsung: exynosautov9: correct register
 offsets of peric0/c1
Date:   Wed, 27 Jul 2022 11:13:57 +0900
Message-Id: <20220727021357.152421-4-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220727021357.152421-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFJsWRmVeSWpSXmKPExsWy7bCmuW7BggdJBn/OG1s8mLeNzeLyfm2L
        61+es1rsfb2V3WLT42usFh977rFazDi/j8ni4ilXi8Nv2lkt/l3byGKxatcfRgduj/c3Wtk9
        ds66y+6xaVUnm8eda3vYPDYvqffo27KK0ePzJrkA9qhsm4zUxJTUIoXUvOT8lMy8dFsl7+B4
        53hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygC5UUyhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUl
        tkqpBSk5BeYFesWJucWleel6eaklVoYGBkamQIUJ2Rk7u6cwFRxWqHi68hRLA2OHXBcjJ4eE
        gInEyfsHmLsYuTiEBHYwSvzbOJEJwvnEKLHrSgMjhPONUeJV71V2mJZ9x4+zQyT2Mko8XX8e
        quUjo8TjbTuZQarYBHQltjx/BdYuItDCJNF6cAMriMMssAdoy5K1YLOEBZIkzn+/xwZiswio
        Sqw8tI8RxOYVsJfY+/sZK8Q+eYnrN9vApnIKOEjs65nMBFEjKHFy5hMWEJsZqKZ562ywNyQE
        pnJILHnwG+pYF4kN7/uhbGGJV8e3QNlSEi/726DsYomlsz4xQTQ3MEpc3vaLDSJhLDHrWTvQ
        RRxAGzQl1u/SBzElBJQljtyC2ssn0XH4LztEmFeio00IolFd4sD26SwQtqxE95zPUK94SDT2
        rWGFhNZkRonf524wTmBUmIXknVlI3pmFsHgBI/MqRrHUguLc9NRiowITeCQn5+duYgQnWi2P
        HYyz337QO8TIxMF4iFGCg1lJhDch+n6SEG9KYmVValF+fFFpTmrxIUZTYGBPZJYSTc4Hpvq8
        knhDE0sDEzMzQ3MjUwNzJXFer5QNiUIC6YklqdmpqQWpRTB9TBycUg1MIn+dfky9qb3O4fhB
        vcViLa77ky+dt++qyIuO2h/XucntoMmJY19DdK8cN1/+SHJO1LZzHaf5HSQ2t97RT5aOdi7U
        s7v9Z4Om+1O2iPfsH5RaQ45U8pytqjqktz3vzJWLczYs3ZI7/1/XgYsxhy/k3eRlji2aMiH/
        CGvXPpa5YuxHWp2mqXFcVXj98XDWirkHQpMnT2x5uCLi2zPPVbkzZso+ORDO3Cz2+2nEda21
        UXrXTcJMUpu+JM7ctECefeKv/zsbz25+dGHijrbyGSUlH1Ukjz+Ys511usth8T1sDj9yr17r
        kQxPlbY/vN9uk/3b+xbfDSyX/2GY6xnOetLkU98lzf2hM368dvEuC79wdrkSS3FGoqEWc1Fx
        IgAbvv7yPQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMLMWRmVeSWpSXmKPExsWy7bCSnG7BggdJBqu/s1o8mLeNzeLyfm2L
        61+es1rsfb2V3WLT42usFh977rFazDi/j8ni4ilXi8Nv2lkt/l3byGKxatcfRgduj/c3Wtk9
        ds66y+6xaVUnm8eda3vYPDYvqffo27KK0ePzJrkA9igum5TUnMyy1CJ9uwSujJ3dU5gKDitU
        PF15iqWBsUOui5GTQ0LARGLf8ePsXYxcHEICuxklFq+5xwKRkJV49m4HO4QtLHG/5QgriC0k
        8J5R4uF2bxCbTUBXYsvzV4wgzSICHUwSs1ZcZAVxmAX2MUrMPb6JGaRKWCBB4smb42DdLAKq
        EisP7WMEsXkF7CX2/n7GCrFBXuL6zTawek4BB4l9PZOZILbZS6z9cZwdol5Q4uTMJ2DXMQPV
        N2+dzTyBUWAWktQsJKkFjEyrGCVTC4pz03OLDQsM81LL9YoTc4tL89L1kvNzNzGC40FLcwfj
        9lUf9A4xMnEwHmKU4GBWEuFNiL6fJMSbklhZlVqUH19UmpNafIhRmoNFSZz3QtfJeCGB9MSS
        1OzU1ILUIpgsEwenVANTd6rp+ZZzKqIeS79LnnnfKHPQzOn3jgsshyuvSdVVvL3l1FOeeLdo
        6xLxd3XcZpkedyeZ6Ye+uCXJyJO85oNGeKPcmasGOyWWPvXXnfS8I/ge47TrU39vWeqewsdw
        0rgu7K176tPF7TPmLD677PaM8kdhPx2ms86RywtW6q3QeGto6P3n/sZV4YuXeDt/P9Uq5Zwy
        UZ3FWD80sGG5+OMD3PdWBgbN2S/755/wZbWDqa1/EhJ7n8/Wl9/54UfbpbgnE37fFO4r5fQ8
        a1nB8b9rzzIWX4F9pTP0+pd7Xn6QMtmZZdfPxItzxbQ+d8gsEHHJ3iQxbbrGhDMhTz9Wv5HN
        i1RW/frIw/aui+DZe0v+KLEUZyQaajEXFScCAFgdlKb2AgAA
X-CMS-MailID: 20220727021824epcas2p1f87c387e6c4923b036e4736a5c7855cf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220727021824epcas2p1f87c387e6c4923b036e4736a5c7855cf
References: <20220727021357.152421-1-chanho61.park@samsung.com>
        <CGME20220727021824epcas2p1f87c387e6c4923b036e4736a5c7855cf@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Some register offsets of peric0 and peric1 cmu blocks need to be
corrected and re-ordered by numerical order.

Fixes: f2dd366992d0 ("clk: samsung: exynosautov9: add cmu_peric0 clock support")
Fixes: b35f27fe73d8 ("clk: samsung: exynosautov9: add cmu_peric1 clock support")
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov9.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index c5a4e1bee711..76c4841f2970 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -1170,9 +1170,9 @@ static const struct samsung_cmu_info fsys2_cmu_info __initconst = {
 #define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_2	0x2058
 #define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_3	0x205c
 #define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_4	0x2060
-#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_7	0x206c
 #define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_5	0x2064
 #define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_6	0x2068
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_7	0x206c
 #define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_8	0x2070
 #define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_9	0x2074
 #define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_10	0x204c
@@ -1422,14 +1422,14 @@ static const struct samsung_cmu_info peric0_cmu_info __initconst = {
 #define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_11	0x2020
 #define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_0	0x2044
 #define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_1	0x2048
-#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_2	0x2058
-#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_3	0x205c
-#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_4	0x2060
-#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_7	0x206c
-#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_5	0x2064
-#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_6	0x2068
-#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_8	0x2070
-#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_9	0x2074
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_2	0x2054
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_3	0x2058
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_4	0x205c
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_5	0x2060
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_6	0x2064
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_7	0x2068
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_8	0x206c
+#define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_9	0x2070
 #define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_10	0x204c
 #define CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_11	0x2050
 
@@ -1467,9 +1467,9 @@ static const unsigned long peric1_clk_regs[] __initconst = {
 	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_2,
 	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_3,
 	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_4,
-	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_7,
 	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_5,
 	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_6,
+	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_7,
 	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_8,
 	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_9,
 	CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_10,
-- 
2.37.1


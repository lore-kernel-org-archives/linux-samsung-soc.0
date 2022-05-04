Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4122FC41535
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 07:50:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345769AbiEDHyO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 03:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345765AbiEDHxw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 03:53:52 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4278F38D
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 00:50:13 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220504075010epoutp038c277629ba328df335921df84ffcad04~r13qiVerr1219312193epoutp03A
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 07:50:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220504075010epoutp038c277629ba328df335921df84ffcad04~r13qiVerr1219312193epoutp03A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651650610;
        bh=MCG3Bq02CFg1ioqoTOffZojd3YJ1h5FnCVt+sX+ug+c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XU812xZ+EHVzAOIQJtxLB9gMCJZemKmgdv5IU2dzHZifRlChRBBgnJe1oJr4xqZc5
         y7quMKNrDaU8ZRanQ5Bibn5zET5srW4+p/38xJDaRqVpmioIOumZELUqb47SjMvv4t
         OZXKop1AvBlWaigivKfyMsliaZBe8angz/LvFrHQ=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220504075009epcas2p180c73153894203694b203286c0d406bf~r13p2vFE00904109041epcas2p1Y;
        Wed,  4 May 2022 07:50:09 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.98]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4KtTWf1JFZz4x9Q8; Wed,  4 May
        2022 07:50:06 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        7A.E4.10069.C2032726; Wed,  4 May 2022 16:50:04 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220504075004epcas2p1ba5f47d4e9abd1eb871eaaf401f35377~r13lTCiXM3182931829epcas2p13;
        Wed,  4 May 2022 07:50:04 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220504075004epsmtrp17d775f431caab45d1217eee7e4ee1258~r13lSLEMD2992129921epsmtrp1Y;
        Wed,  4 May 2022 07:50:04 +0000 (GMT)
X-AuditID: b6c32a45-a79ff70000002755-53-6272302c9554
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        94.3A.08853.C2032726; Wed,  4 May 2022 16:50:04 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220504075004epsmtip16704aedbe9706ed86db486e74cbe145a~r13lEUoov2116721167epsmtip1W;
        Wed,  4 May 2022 07:50:04 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v3 08/12] clk: samsung: exynosautov9: add cmu_peric0 clock
 support
Date:   Wed,  4 May 2022 16:51:50 +0900
Message-Id: <20220504075154.58819-9-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504075154.58819-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEJsWRmVeSWpSXmKPExsWy7bCmha6OQVGSwcTDphYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYu/rrewWH3vusVrMOL+PyeLiKVeL1r1H2C0Ov2lntfh3bSOLxfM+
        oPiqXX8YHfg83t9oZffYOesuu8emVZ1sHneu7WHz6NuyitHj8ya5ALaobJuM1MSU1CKF1Lzk
        /JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoGOVFMoSc0qBQgGJxcVK+nY2
        RfmlJakKGfnFJbZKqQUpOQXmBXrFibnFpXnpenmpJVaGBgZGpkCFCdkZ9848YS14lV3xc/8J
        9gbGvvguRk4OCQETib1HNjN1MXJxCAnsYJS40TmJDcL5xCixq+E5lPONUeLCtkdscC1zrkO1
        7GWUuPKkhxHC+cgo8X7KdWaQKjYBXYktz1+BJUQEupglLvbdYwFxmAW2MkocvzGLCaRKWCBE
        4s6hW2AdLAKqEq2XdgHFOTh4BewkHuyxBjElBOQl/i0OBTE5BewlHm+wACnmFRCUODnzCQuI
        zQxU0bx1NjPIdAmBpRwSjxsXMEFc6iJx//0NFghbWOLV8S3sELaUxMv+Nii7WGLprE9MEM0N
        jBKXt/2CetNYYtazdkaQxcwCmhLrd+lDnKMsceQW1F4+iY7Df9khwrwSHW1CEI3qEge2T4fa
        KivRPeczK4TtIfFh9msWSFBNYpR4vfYp6wRGhVlI3pmF5J1ZCIsXMDKvYhRLLSjOTU8tNiow
        hMdwcn7uJkZw4tVy3cE4+e0HvUOMTByMhxglOJiVRHidlxYkCfGmJFZWpRblxxeV5qQWH2I0
        BYb0RGYp0eR8YOrPK4k3NLE0MDEzMzQ3MjUwVxLn9UrZkCgkkJ5YkpqdmlqQWgTTx8TBKdXA
        pLVZ46exY+rJ7afWh6uo7LV74cT5qM9+he3OhWHbnjxjUPRf41TwoTSu/2io0NI/zrkKgpl9
        n7m74qeteX/bYL9P+A2bCruTCz/+efd7OYPo2rV2p3/8707viRK4IXk7s2KKqb2vezKPkLC8
        ZUkKk9yxibrxCnmG242ar0gXqU2oX1B3K/rnIrlCh4xVTxWKA+ccKBT8pPZfT/xddTXrfveV
        RYcWHF0/22/9LF7WqReifG1XX2/UPLv4Y65vf/XB5e3WnvWN3/8uvrBEc8HaaeETHz9yaAz2
        0z0Ukausx77sWeCenW3X+RqnNZR05Md1dk3/faXHSqzLpW961JvGVd17KyazRX1eF2Se1huv
        xFKckWioxVxUnAgAwRE6E0UEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsWy7bCSnK6OQVGSwdP9ohYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYu/rrewWH3vusVrMOL+PyeLiKVeL1r1H2C0Ov2lntfh3bSOLxfM+
        oPiqXX8YHfg83t9oZffYOesuu8emVZ1sHneu7WHz6NuyitHj8ya5ALYoLpuU1JzMstQifbsE
        rox7Z56wFrzKrvi5/wR7A2NffBcjJ4eEgInE3jnXmUBsIYHdjBIfH8pAxGUlnr3bwQ5hC0vc
        bznC2sXIBVTznlFizscvjCAJNgFdiS3PXzGCJEQEJjBLvLnygR3EYRbYyShx59UpNpAqYYEg
        iWvTZrCC2CwCqhKtl3YBrePg4BWwk3iwxxrElBCQl/i3OBTE5BSwl3i8wQLEFAIqODqpCKSP
        V0BQ4uTMJywgNjNQcfPW2cwTGAVmIUnNQpJawMi0ilEytaA4Nz232LDAMC+1XK84Mbe4NC9d
        Lzk/dxMjODq0NHcwbl/1Qe8QIxMH4yFGCQ5mJRFe56UFSUK8KYmVValF+fFFpTmpxYcYpTlY
        lMR5L3SdjBcSSE8sSc1OTS1ILYLJMnFwSjUwBc6IFlyhnntmn8Q30xcffuzKe5JvxF+VyfP6
        3IENZWYrLj30PzF/skJSvwirROMUuYQjnQZ3L/5osPitGeGtuXZLR/1iu+ajqryey5c/jpPO
        NJiwPZU7vDDdpFBziV7mlxh51jkVcea9u/8c3sXu6Fm7T2Tan9LFJtNsD2+Yo9Jex6D9wZZr
        /ZEzLbcalpReT+Fd9PX0/HznnCtnqgtYni0yaNwn0qo7my/M5nRMgK+MhJFodoR6cQO3/LRX
        zRtVpO9NPM+y9czj64w/2ztP/hOyDT9VdTT7acH+5p64lMb+tanbRc4Wad1bmdmtn9W74tXD
        V1909/zSXrg0eFvSQZXtS37b8SZEH28L/v9OiaU4I9FQi7moOBEAjRCTDv0CAAA=
X-CMS-MailID: 20220504075004epcas2p1ba5f47d4e9abd1eb871eaaf401f35377
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220504075004epcas2p1ba5f47d4e9abd1eb871eaaf401f35377
References: <20220504075154.58819-1-chanho61.park@samsung.com>
        <CGME20220504075004epcas2p1ba5f47d4e9abd1eb871eaaf401f35377@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

CMU_PERIC0 provides clocks for USI0 ~ USI5 and USIx_I2C. USI0/1/2/3/4/5
have its own divider but USI_I2Cs share "dout_peric0_usi_i2c" divider.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov9.c | 254 +++++++++++++++++++++++++
 1 file changed, 254 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index 8c6ecd3f3eeb..e85efc6c3f71 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -1134,6 +1134,257 @@ static const struct samsung_cmu_info fsys2_cmu_info __initconst = {
 	.clk_name		= "dout_clkcmu_fsys2_bus",
 };
 
+/* ---- CMU_PERIC0 --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_PERIC0 (0x10200000) */
+#define PLL_CON0_MUX_CLKCMU_PERIC0_BUS_USER	0x0600
+#define PLL_CON0_MUX_CLKCMU_PERIC0_IP_USER	0x0610
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI00_USI	0x1000
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI01_USI	0x1004
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI02_USI	0x1008
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI03_USI	0x100c
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI04_USI	0x1010
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI05_USI	0x1014
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI_I2C	0x1018
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI00_USI	0x1800
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI01_USI	0x1804
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI02_USI	0x1808
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI03_USI	0x180c
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI04_USI	0x1810
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI05_USI	0x1814
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI_I2C	0x1818
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_0	0x2014
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_1	0x2018
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_2	0x2024
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_3	0x2028
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_4	0x202c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_5	0x2030
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_6	0x2034
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_7	0x2038
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_8	0x203c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_9	0x2040
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_10	0x201c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_11	0x2020
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_0	0x2044
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_1	0x2048
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_2	0x2058
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_3	0x205c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_4	0x2060
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_7	0x206c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_5	0x2064
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_6	0x2068
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_8	0x2070
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_9	0x2074
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_10	0x204c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_11	0x2050
+
+static const unsigned long peric0_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_PERIC0_BUS_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC0_IP_USER,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI00_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI01_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI02_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI03_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI04_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI05_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI_I2C,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI00_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI01_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI02_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI03_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI04_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI05_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI_I2C,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_0,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_1,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_2,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_3,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_4,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_5,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_6,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_7,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_8,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_9,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_10,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_11,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_0,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_1,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_2,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_3,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_4,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_7,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_5,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_6,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_8,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_9,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_10,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_11,
+};
+
+/* List of parent clocks for Muxes in CMU_PERIC0 */
+PNAME(mout_peric0_bus_user_p) = { "oscclk", "dout_clkcmu_peric0_bus" };
+PNAME(mout_peric0_ip_user_p) = { "oscclk", "dout_clkcmu_peric0_ip" };
+PNAME(mout_peric0_usi_p) = { "oscclk", "mout_peric0_ip_user" };
+
+static const struct samsung_mux_clock peric0_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_PERIC0_BUS_USER, "mout_peric0_bus_user",
+	    mout_peric0_bus_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_BUS_USER, 4, 1),
+	MUX(CLK_MOUT_PERIC0_IP_USER, "mout_peric0_ip_user",
+	    mout_peric0_ip_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_IP_USER, 4, 1),
+	/* USI00 ~ USI05 */
+	MUX(CLK_MOUT_PERIC0_USI00_USI, "mout_peric0_usi00_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI00_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC0_USI01_USI, "mout_peric0_usi01_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI01_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC0_USI02_USI, "mout_peric0_usi02_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI02_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC0_USI03_USI, "mout_peric0_usi03_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI03_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC0_USI04_USI, "mout_peric0_usi04_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI04_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC0_USI05_USI, "mout_peric0_usi05_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI05_USI, 0, 1),
+	/* USI_I2C */
+	MUX(CLK_MOUT_PERIC0_USI_I2C, "mout_peric0_usi_i2c",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI_I2C, 0, 1),
+};
+
+static const struct samsung_div_clock peric0_div_clks[] __initconst = {
+	/* USI00 ~ USI05 */
+	DIV(CLK_DOUT_PERIC0_USI00_USI, "dout_peric0_usi00_usi",
+	    "mout_peric0_usi00_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI00_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI01_USI, "dout_peric0_usi01_usi",
+	    "mout_peric0_usi01_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI01_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI02_USI, "dout_peric0_usi02_usi",
+	    "mout_peric0_usi02_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI02_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI03_USI, "dout_peric0_usi03_usi",
+	    "mout_peric0_usi03_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI03_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI04_USI, "dout_peric0_usi04_usi",
+	    "mout_peric0_usi04_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI04_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI05_USI, "dout_peric0_usi05_usi",
+	    "mout_peric0_usi05_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI05_USI,
+	    0, 4),
+	/* USI_I2C */
+	DIV(CLK_DOUT_PERIC0_USI_I2C, "dout_peric0_usi_i2c",
+	    "mout_peric0_usi_i2c", CLK_CON_DIV_DIV_CLK_PERIC0_USI_I2C, 0, 4),
+};
+
+static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
+	/* IPCLK */
+	GATE(CLK_GOUT_PERIC0_IPCLK_0, "gout_peric0_ipclk_0",
+	     "dout_peric0_usi00_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_0,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_IPCLK_1, "gout_peric0_ipclk_1",
+	     "dout_peric0_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_1,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_IPCLK_2, "gout_peric0_ipclk_2",
+	     "dout_peric0_usi01_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_2,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_IPCLK_3, "gout_peric0_ipclk_3",
+	     "dout_peric0_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_3,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_IPCLK_4, "gout_peric0_ipclk_4",
+	     "dout_peric0_usi02_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_4,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_IPCLK_5, "gout_peric0_ipclk_5",
+	     "dout_peric0_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_5,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_IPCLK_6, "gout_peric0_ipclk_6",
+	     "dout_peric0_usi03_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_6,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_IPCLK_7, "gout_peric0_ipclk_7",
+	     "dout_peric0_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_7,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_IPCLK_8, "gout_peric0_ipclk_8",
+	     "dout_peric0_usi04_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_8,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_IPCLK_9, "gout_peric0_ipclk_9",
+	     "dout_peric0_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_9,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_IPCLK_10, "gout_peric0_ipclk_10",
+	     "dout_peric0_usi05_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_10,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_IPCLK_11, "gout_peric0_ipclk_11",
+	     "dout_peric0_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_11,
+	     21, 0, 0),
+
+	/* PCLK */
+	GATE(CLK_GOUT_PERIC0_PCLK_0, "gout_peric0_pclk_0",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_0,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_2, "gout_peric0_pclk_2",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_2,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_3, "gout_peric0_pclk_3",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_3,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_4, "gout_peric0_pclk_4",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_4,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_5, "gout_peric0_pclk_5",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_5,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_6, "gout_peric0_pclk_6",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_6,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_7, "gout_peric0_pclk_7",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_7,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_8, "gout_peric0_pclk_8",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_8,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_9, "gout_peric0_pclk_9",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_9,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_10, "gout_peric0_pclk_10",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_10,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_11, "gout_peric0_pclk_11",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_11,
+	     21, 0, 0),
+};
+
+static const struct samsung_cmu_info peric0_cmu_info __initconst = {
+	.mux_clks		= peric0_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(peric0_mux_clks),
+	.div_clks		= peric0_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(peric0_div_clks),
+	.gate_clks		= peric0_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(peric0_gate_clks),
+	.nr_clk_ids		= PERIC0_NR_CLK,
+	.clk_regs		= peric0_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(peric0_clk_regs),
+	.clk_name		= "dout_clkcmu_peric0_bus",
+};
+
 /* ---- CMU_PERIS ---------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_PERIS (0x10020000) */
@@ -1202,6 +1453,9 @@ static const struct of_device_id exynosautov9_cmu_of_match[] = {
 	}, {
 		.compatible = "samsung,exynosautov9-cmu-fsys2",
 		.data = &fsys2_cmu_info,
+	}, {
+		.compatible = "samsung,exynosautov9-cmu-peric0",
+		.data = &peric0_cmu_info,
 	}, {
 		.compatible = "samsung,exynosautov9-cmu-peris",
 		.data = &peris_cmu_info,
-- 
2.36.0


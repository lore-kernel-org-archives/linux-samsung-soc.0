Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A792FC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 May 2022 11:39:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234990AbiEWLj6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 May 2022 07:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234995AbiEWLjM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 May 2022 07:39:12 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E59CA50461
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 04:39:06 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220523113905epoutp021ac198c22f4752120afe526ca6bb2ac3~xuP9Yxe-51950919509epoutp02V
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 11:39:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220523113905epoutp021ac198c22f4752120afe526ca6bb2ac3~xuP9Yxe-51950919509epoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1653305945;
        bh=aMbUvdcCVZsG0aigTzkkVcrUQo32w6vT0Qx0XdCdkwo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Dw7Fme3P5yHquiSlN9ApWi0ufzrhDBABHHjbt+fDkcY5Ts3dFtpDzzW4QRqCcjYz9
         yfj2k9t0U+qb200mkfR/7trkeGMpAkApCyGJ522kj4FROCf+REKkED1QgCONVd6xQ7
         2jgxIirVCeqUEXXQWeFz1nU6I42fxATP7FcyH7co=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220523113904epcas2p3ac3fbc2df3d92c781669d791fa8cf290~xuP8qhT8A2403624036epcas2p3_;
        Mon, 23 May 2022 11:39:04 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.91]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4L6Fj15K1Hz4x9Pr; Mon, 23 May
        2022 11:39:01 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        8A.70.10028.5527B826; Mon, 23 May 2022 20:39:01 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220523113901epcas2p4f53c733b0cf740b0d5687895856f40b0~xuP5vr2Mi0575905759epcas2p4W;
        Mon, 23 May 2022 11:39:01 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220523113901epsmtrp2cd6da1304d4b26eef1388f7d6a318553~xuP5uxbcE0448504485epsmtrp2C;
        Mon, 23 May 2022 11:39:01 +0000 (GMT)
X-AuditID: b6c32a47-573ff7000000272c-c0-628b725510af
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        AD.F8.08924.4527B826; Mon, 23 May 2022 20:39:00 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220523113900epsmtip1dd61fd4cec0c064597e72e5c375b26fa~xuP5gNeot1284612846epsmtip1M;
        Mon, 23 May 2022 11:39:00 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/3] watchdog: s3c2410_wdt: support exynosautov9 watchdog
Date:   Mon, 23 May 2022 20:39:18 +0900
Message-Id: <20220523113919.59571-3-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220523113919.59571-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAJsWRmVeSWpSXmKPExsWy7bCmqW5oUXeSwYObahYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYu/rrewWM87vY7Jo3XuE3eJ53z4mB06PTas62TzuXNvD5tG3ZRWj
        x+dNcgEsUdk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6hpYW5koKeYm5qbZKLj4Bum6Z
        OUCnKCmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIKzAv0ihNzi0vz0vXyUkusDA0M
        jEyBChOyMw4cfcNWME2mYk1nP3sD433xLkZODgkBE4mOW1uYuhi5OIQEdjBKLHm+jg3C+cQo
        8erUPkaQKiGBz4wS/e9yYDquXz7EDlG0i1Gie/MJqPaPjBKvL79nBaliE9CV2PL8FVi3iEC8
        xPk3jSwgRcwCC5kkJpzaDVYkLOAjsfPWLSYQm0VAVWLztX4gm4ODV8BOov1EFcQ2eYkN83uZ
        QWxOAXuJ9/d+gZXzCghKnJz5hAXEZgaqad46mxlkvoTAR3aJaXOXsEA0u0i0rNvECGELS7w6
        voUdwpaS+PxuLxuEXSyxdNYnJojmBkaJy9t+QSWMJWY9a2cEOYhZQFNi/S59EFNCQFniyC2o
        vXwSHYf/skOEeSU62oQgGtUlDmyfDnWBrET3nM+sELaHxOXvj5khYTWJUeL968XMExgVZiF5
        ZxaSd2YhLF7AyLyKUSy1oDg3PbXYqMAYHsPJ+bmbGMFJU8t9B+OMtx/0DjEycTAeYpTgYFYS
        4d2e2JEkxJuSWFmVWpQfX1Sak1p8iNEUGNYTmaVEk/OBaTuvJN7QxNLAxMzM0NzI1MBcSZzX
        K2VDopBAemJJanZqakFqEUwfEwenVAPT5m9hZ352SYe45x5unNYqfu/EspqQE5kTJvv/bVX4
        +U7VxFt77mcB2QAjjo2rVH+JTNpWesFb4Owf6eS23+3Wb0Mdi5608KxlduOc2NZbYVFwPplr
        OWPsDvfYaPaVZUbFV/50CMapnZROSvcqWcZfcvXD0tXqTS8OFfxvnjlLJfKzwo65al39f6bM
        3T9f6+1LhqL9/7eXrVmxbs+OwM0fO041XVqXyuXdFtLfYHwqvCLwi/LF9feLn20J/+fpqFOn
        8E9lydrfc78ubNo3JeH269+hqi7e5qeM3swPtr/cO7Vybu9az6Xiqmff206etWG7hOGK8iXz
        VwdN25T11Nq8hJ+TxXTZkYK5H7V7/RdmKbEUZyQaajEXFScCAKpeUv0jBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFLMWRmVeSWpSXmKPExsWy7bCSnG5oUXeSwS0tiwfztrFZXN6vbXH9
        y3NWi/lHzrFa9L14yGyx9/VWdosZ5/cxWbTuPcJu8bxvH5MDp8emVZ1sHneu7WHz6NuyitHj
        8ya5AJYoLpuU1JzMstQifbsErowDR9+wFUyTqVjT2c/ewHhfvIuRk0NCwETi+uVD7F2MXBxC
        AjsYJQ5/u8QCkZCVePZuBzuELSxxv+UIK0TRe0aJS1dvM4Ik2AR0JbY8fwVmiwjESyw994MF
        pIhZYCmTxPrV7UwgCWEBH4mdt26B2SwCqhKbr/UD2RwcvAJ2Eu0nqiAWyEtsmN/LDGJzCthL
        vL/3C6xcCKjkefMCsDivgKDEyZlPwI5jBqpv3jqbeQKjwCwkqVlIUgsYmVYxSqYWFOem5xYb
        FhjlpZbrFSfmFpfmpesl5+duYgQHt5bWDsY9qz7oHWJk4mA8xCjBwawkwrs9sSNJiDclsbIq
        tSg/vqg0J7X4EKM0B4uSOO+FrpPxQgLpiSWp2ampBalFMFkmDk6pBiab3FLP6AMWgsx95lm8
        oa/36lU5PTnRJsKW+MPplU5ON8f+e/2PdKon/778v+T64YcKG9yYZWsf9Sy+dYnx1/WVGlc/
        /DlzWTFv0SfNtdUtz2K+vPx3cPrjPfOC96/ekbZ+utYvpaMhQRm/HPcLyc3weaXzS1jqhU3W
        4cTtkuekdlSZGf7U2fSldGOWWgtXluqlTiHTn0Ef9i1rN7sjynNiap2oZcaGmMMKL26f8Gdw
        bd+3eb/Mwh88DDfYXRZ1WaV38rOslcrq1D/Edk7b3I2jU7Yi9aeUlPHJ7osbubqPvAx6OMX7
        eOz9peZroiL5LUINupKl73xbIxdzcOqJb/ynv7Vv0WXMtWdZv+lsSoQSS3FGoqEWc1FxIgDD
        ZIvL3QIAAA==
X-CMS-MailID: 20220523113901epcas2p4f53c733b0cf740b0d5687895856f40b0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220523113901epcas2p4f53c733b0cf740b0d5687895856f40b0
References: <20220523113919.59571-1-chanho61.park@samsung.com>
        <CGME20220523113901epcas2p4f53c733b0cf740b0d5687895856f40b0@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Like exynos850, exynosautov9 SoC also has two cpu watchdogs.
Unfortunately, some configurations are slightly different so we need to
add samsung,exynosautov9-wdt and separate drv data for those watchdogs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 41 ++++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 6db22f2e3a4f..0dbb3ec9c29c 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -60,9 +60,13 @@
 #define EXYNOS850_CLUSTER0_NONCPU_INT_EN	0x1244
 #define EXYNOS850_CLUSTER1_NONCPU_OUT		0x1620
 #define EXYNOS850_CLUSTER1_NONCPU_INT_EN	0x1644
+#define EXYNOSAUTOV9_CLUSTER1_NONCPU_OUT	0x1520
+#define EXYNOSAUTOV9_CLUSTER1_NONCPU_INT_EN	0x1544
 
 #define EXYNOS850_CLUSTER0_WDTRESET_BIT		24
 #define EXYNOS850_CLUSTER1_WDTRESET_BIT		23
+#define EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT	25
+#define EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT	24
 
 /**
  * DOC: Quirk flags for different Samsung watchdog IP-cores
@@ -236,6 +240,30 @@ static const struct s3c2410_wdt_variant drv_data_exynos850_cl1 = {
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
 };
 
+static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl0 = {
+	.mask_reset_reg = EXYNOS850_CLUSTER0_NONCPU_INT_EN,
+	.mask_bit = 2,
+	.mask_reset_inv = true,
+	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT,
+	.cnt_en_reg = EXYNOS850_CLUSTER0_NONCPU_OUT,
+	.cnt_en_bit = 7,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
+};
+
+static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
+	.mask_reset_reg = EXYNOSAUTOV9_CLUSTER1_NONCPU_INT_EN,
+	.mask_bit = 2,
+	.mask_reset_inv = true,
+	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT,
+	.cnt_en_reg = EXYNOSAUTOV9_CLUSTER1_NONCPU_OUT,
+	.cnt_en_bit = 7,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
+};
+
 static const struct of_device_id s3c2410_wdt_match[] = {
 	{ .compatible = "samsung,s3c2410-wdt",
 	  .data = &drv_data_s3c2410 },
@@ -249,6 +277,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
 	  .data = &drv_data_exynos7 },
 	{ .compatible = "samsung,exynos850-wdt",
 	  .data = &drv_data_exynos850_cl0 },
+	{ .compatible = "samsung,exynosautov9-wdt",
+	  .data = &drv_data_exynosautov9_cl0 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
@@ -630,8 +660,9 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev)
 	}
 
 #ifdef CONFIG_OF
-	/* Choose Exynos850 driver data w.r.t. cluster index */
-	if (variant == &drv_data_exynos850_cl0) {
+	/* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster index */
+	if (variant == &drv_data_exynos850_cl0 ||
+	    variant == &drv_data_exynosautov9_cl0) {
 		u32 index;
 		int err;
 
@@ -644,9 +675,11 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev)
 
 		switch (index) {
 		case 0:
-			return &drv_data_exynos850_cl0;
+			return variant;
 		case 1:
-			return &drv_data_exynos850_cl1;
+			return (variant == &drv_data_exynos850_cl0) ?
+				&drv_data_exynos850_cl1 :
+				&drv_data_exynosautov9_cl1;
 		default:
 			dev_err(dev, "wrong cluster index: %u\n", index);
 			return NULL;
-- 
2.36.1


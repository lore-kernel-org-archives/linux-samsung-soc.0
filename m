Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35085EE49B4
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 19 Aug 2023 03:18:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244763AbjHSDSA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 18 Aug 2023 23:18:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244775AbjHSDRj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Aug 2023 23:17:39 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D166D421B
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Aug 2023 20:17:36 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3a3efebcc24so1136212b6e.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Aug 2023 20:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692415056; x=1693019856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMfSbR3cbUtK1t9P7HTJ1o0YtexgiyQjwWLXVl1eo+4=;
        b=R1oYs//GweGSuLHWZvieqmFIKZokIJNVu6kKiyyCR+v3XpEl+LwHyWvwQHu81u13i/
         3j/Ea0kzS/DbnyreA9JPGAXk3IN/ni2AaiC2Gbz+L156hgkS4zxg41Ehil/SIyz1WS/O
         maWlg3waegRxlGFrryWqUbDrUXyYF5862m6t0ZLn/TNzW7YN8FQ5CcYRjYh8v3DICpvp
         vyzwOvmCDPUEUD2zyiUqPWtAsGl/2LzFHdTe7JsB6jJow3E7ZYTz0VU7UldLeNsQOl8/
         HDMpPfErCco4bRtreAxqdT77dEll6KCcbwsnwRiJt5dqh06ypbFHJEDKXQdq4m3nZlBg
         ykFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692415056; x=1693019856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMfSbR3cbUtK1t9P7HTJ1o0YtexgiyQjwWLXVl1eo+4=;
        b=TLpN4dMggYOsJ8lBEWU2GMQCwBZiOu5O83N6pmkBD2BU7zXA+434gOXLuP/MmI/C+2
         CkCNhIpgA3wEaXKO9GLNqrr4XCLM1+MlRBsyK5ccWLGD1wVwTFiIkaTMVUxusTPY0XvG
         cR+ARdaRhl/zF+0d74AcqyjDV6msT2JT9D0GKtZl0L0jtRuhnTXyv9+Cdzdzt4hj5yYu
         s2CufqMBRVe8c7Qboeqnn7MARtv++QUfy+QN0557WNeuP2f6KPOQ040O3c9/ROQOI32A
         xyQc+RCW41IeVdu0/VCm7SA1g98zA0zfpqjadBNPojQb1n7t8Z3+aJ3dqnCMekFQTY2i
         ByYA==
X-Gm-Message-State: AOJu0Yw0Ea4ZiDE0QMBliNZFg934gfz+ZRCaS9Evu/N6z8DwTln3S8XR
        NRmvbXjSmCuWeU9popkcWer5ew==
X-Google-Smtp-Source: AGHT+IHMezewFkPEpP1PsJ5iCy1VGV0ZRdzuuxqt+6DEqaPEIdltoIxCBbgMsOnpKi6JElgySWsWJw==
X-Received: by 2002:a54:4490:0:b0:3a4:a87:bea1 with SMTP id v16-20020a544490000000b003a40a87bea1mr1346404oiv.21.1692415056236;
        Fri, 18 Aug 2023 20:17:36 -0700 (PDT)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id g2-20020a0568080dc200b003a1dfa93903sm1501235oic.12.2023.08.18.20.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 20:17:35 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     JaeHun Jung <jh0801.jung@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 4/8] phy: exynos5-usbdrd: Make it possible to pass custom phy ops
Date:   Fri, 18 Aug 2023 22:17:27 -0500
Message-Id: <20230819031731.22618-5-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230819031731.22618-1-semen.protsenko@linaro.org>
References: <20230819031731.22618-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Provide a way to use different PHY ops for different chips. Right now
all chips are using exynos5_usbdrd_phy_ops, but it won't always be the
case. For example, Exynos850 has very different USB PHY block, so there
will be another PHY ops implementation for that chip.

No functional change.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 06484abb5705..1ece4a1a1a6e 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -165,6 +165,7 @@ struct exynos5_usbdrd_phy_config {
 
 struct exynos5_usbdrd_phy_drvdata {
 	const struct exynos5_usbdrd_phy_config *phy_cfg;
+	const struct phy_ops *phy_ops;
 	u32 pmu_offset_usbdrd0_phy;
 	u32 pmu_offset_usbdrd1_phy;
 	bool has_common_clk_gate;
@@ -779,6 +780,7 @@ static const struct exynos5_usbdrd_phy_config phy_cfg_exynos5[] = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
+	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.pmu_offset_usbdrd1_phy	= EXYNOS5420_USBDRD1_PHY_CONTROL,
 	.has_common_clk_gate	= true,
@@ -786,12 +788,14 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos5250_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
+	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.has_common_clk_gate	= true,
 };
 
 static const struct exynos5_usbdrd_phy_drvdata exynos5433_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
+	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.pmu_offset_usbdrd1_phy	= EXYNOS5433_USBHOST30_PHY_CONTROL,
 	.has_common_clk_gate	= false,
@@ -799,6 +803,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5433_usbdrd_phy = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos7_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
+	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.has_common_clk_gate	= false,
 };
@@ -906,8 +911,8 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 	dev_vdbg(dev, "Creating usbdrd_phy phy\n");
 
 	for (i = 0; i < EXYNOS5_DRDPHYS_NUM; i++) {
-		struct phy *phy = devm_phy_create(dev, NULL,
-						  &exynos5_usbdrd_phy_ops);
+		struct phy *phy = devm_phy_create(dev, NULL, drv_data->phy_ops);
+
 		if (IS_ERR(phy)) {
 			dev_err(dev, "Failed to create usbdrd_phy phy\n");
 			return PTR_ERR(phy);
-- 
2.39.2


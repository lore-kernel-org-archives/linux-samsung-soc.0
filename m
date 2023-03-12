Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDE0C74A4B
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 12 Mar 2023 13:11:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbjCLNLW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 12 Mar 2023 09:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbjCLNLW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 12 Mar 2023 09:11:22 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C40946159
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 06:11:16 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id t11so12450387lfr.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 06:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678626676;
        h=cc:to:subject:date:from:in-reply-to:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cPk/h023+CvWv4LEM2Nr7aafr5OCIjbP3l84sbGJHt4=;
        b=UwWx9FfaR9UfQHV5kPOfoGa752XR8HvWOZ7x5Tdo/Isf+ufoTqgRAPcWb0a+XpXuyg
         MEVW4usdQlHYlT8RlnrfHnv2KxMk5+zel7V1z+3tsKP59o2jKLDGV09wnoSf77w+l/8Z
         aXYaZqw74nb6iGCIHKBHJy3gaVvs6j8WhpIYS1Izppa70jxQ92RWnHOHyKenYrADJCc4
         t2U6cefuek+N0to/rkFjsPC/oC8PDyd5xUtuC7/s037jZngtJ05iXzqIqsu/VXrt5x5W
         uUnCgfBKWvRzCYvmVkbx52q6Y1sDrksOe8l8QV/Y2xkUvLm9eDpPNQ/6nW94dGLE6arP
         xW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626676;
        h=cc:to:subject:date:from:in-reply-to:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cPk/h023+CvWv4LEM2Nr7aafr5OCIjbP3l84sbGJHt4=;
        b=WYBq5S0f/vmqEV/8XprYgy9rNYxSHkOxfJyMruire5JEntcswKXnioMB3IUEN7Zqyf
         CqCe0MSsWmvwrjHIQnZNVX5KxzP1aGNnwEjMCqcgKXX0RDbB0GtCNGZJ0gKZCMN2sShr
         xg6cE1NNfpMslNLOC03/SjhE7obeMtnuxkgIkc5illtEtvtUn1wUK2enHG8PCfJ/16tw
         aq/prSNjVS6pnsrsJ8Zsk2JVYuFjUpklccaghy1iYqAsjCTkPznKoA7COEUArAk7o4OC
         chU9i2riaj81Im7Np19dgD9cPRJNpJy1GvJ8wPjtRyVri1n06qIy+iw0e8zLJ968Zbd0
         jz2g==
X-Gm-Message-State: AO0yUKUlEQPIdF4zWr1xZgF81xx06m2f/B719BnWkwv33S+JlZCjrWTB
        kSmRZsLzG4BJNQUeHrQ3zGFWnqvoUSCZLO32
X-Google-Smtp-Source: AK7set+HZcg1IjDCKKNWm/Vhpp/G9QIlj0wf13z5bW19MtxW8oSCbxAEsP6/OpIQi+7doUBzDl3xmA==
X-Received: by 2002:a05:6512:21d:b0:4e0:2b8f:6004 with SMTP id a29-20020a056512021d00b004e02b8f6004mr8476865lfo.4.1678626675540;
        Sun, 12 Mar 2023 06:11:15 -0700 (PDT)
Received: from 0002-mmc-dw_mmc-add-an-option-to-force-32-bit-access-to-6.patch (46-138-144-249.dynamic.spd-mgts.ru. [46.138.144.249])
        by smtp.gmail.com with ESMTPSA id b24-20020ac24118000000b004db250355a2sm647535lfi.103.2023.03.12.06.11.15
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:11:15 -0700 (PDT)
Message-Id: <1678626510.1783316-2-sleirsgoevy@gmail.com>
In-Reply-To: <1678626510.1783316-0-sleirsgoevy@gmail.com>
From:   Sergey Lisov <sleirsgoevy@gmail.com>
Date:   Sun, 12 Mar 2023 16:03:15 +0300
Subject: [PATCH v3 2/2] mmc: dw_mmc: add an option to force 32-bit access to
 64-bit FIFO
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jaehoon Chung <jh80.chung@samsung.com>
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Some Samsung Exynos boards using the arm64 architecture have DW MMC
controllers configured for a 32-bit data bus but a 64-bit FIFO. On these
systems the 64-bit FIFO registers must be accessed in two 32-bit halves.
---
 drivers/mmc/host/dw_mmc-exynos.c |  41 ++++++++++-
 drivers/mmc/host/dw_mmc.c        | 122 ++++++++++++++++++++++++++++++-
 drivers/mmc/host/dw_mmc.h        |   2 +
 3 files changed, 162 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/dw_mmc-exynos.c b/drivers/mmc/host/dw_mmc-exynos.c
index 9f20ac524..768774f22 100644
--- a/drivers/mmc/host/dw_mmc-exynos.c
+++ b/drivers/mmc/host/dw_mmc-exynos.c
@@ -28,6 +28,8 @@ enum dw_mci_exynos_type {
 	DW_MCI_TYPE_EXYNOS5420_SMU,
 	DW_MCI_TYPE_EXYNOS7,
 	DW_MCI_TYPE_EXYNOS7_SMU,
+	DW_MCI_TYPE_EXYNOS78XX,
+	DW_MCI_TYPE_EXYNOS78XX_SMU,
 	DW_MCI_TYPE_ARTPEC8,
 };
 
@@ -70,6 +72,12 @@ static struct dw_mci_exynos_compatible {
 	}, {
 		.compatible	= "samsung,exynos7-dw-mshc-smu",
 		.ctrl_type	= DW_MCI_TYPE_EXYNOS7_SMU,
+	}, {
+		.compatible	= "samsung,exynos78xx-dw-mshc",
+		.ctrl_type	= DW_MCI_TYPE_EXYNOS78XX,
+	}, {
+		.compatible	= "samsung,exynos78xx-dw-mshc-smu",
+		.ctrl_type	= DW_MCI_TYPE_EXYNOS78XX_SMU,
 	}, {
 		.compatible	= "axis,artpec8-dw-mshc",
 		.ctrl_type	= DW_MCI_TYPE_ARTPEC8,
@@ -86,6 +94,8 @@ static inline u8 dw_mci_exynos_get_ciu_div(struct dw_mci *host)
 		return EXYNOS4210_FIXED_CIU_CLK_DIV;
 	else if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
 			priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+			priv->ctrl_type == DW_MCI_TYPE_EXYNOS78XX ||
+			priv->ctrl_type == DW_MCI_TYPE_EXYNOS78XX_SMU ||
 			priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 		return SDMMC_CLKSEL_GET_DIV(mci_readl(host, CLKSEL64)) + 1;
 	else
@@ -101,7 +111,8 @@ static void dw_mci_exynos_config_smu(struct dw_mci *host)
 	 * set for non-ecryption mode at this time.
 	 */
 	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS5420_SMU ||
-		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU) {
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS78XX_SMU) {
 		mci_writel(host, MPSBEGIN0, 0);
 		mci_writel(host, MPSEND0, SDMMC_ENDING_SEC_NR_MAX);
 		mci_writel(host, MPSCTRL0, SDMMC_MPSCTRL_SECURE_WRITE_BIT |
@@ -127,6 +138,12 @@ static int dw_mci_exynos_priv_init(struct dw_mci *host)
 				DQS_CTRL_GET_RD_DELAY(priv->saved_strobe_ctrl);
 	}
 
+	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS78XX ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS78XX_SMU) {
+		/* Quirk needed for certain Exynos SoCs */
+		host->quirks |= DW_MMC_QUIRK_FIFO64_32;
+	}
+
 	if (priv->ctrl_type == DW_MCI_TYPE_ARTPEC8) {
 		/* Quirk needed for the ARTPEC-8 SoC */
 		host->quirks |= DW_MMC_QUIRK_EXTENDED_TMOUT;
@@ -144,6 +161,8 @@ static void dw_mci_exynos_set_clksel_timing(struct dw_mci *host, u32 timing)
 
 	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
 		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS78XX ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS78XX_SMU ||
 		priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 		clksel = mci_readl(host, CLKSEL64);
 	else
@@ -153,6 +172,8 @@ static void dw_mci_exynos_set_clksel_timing(struct dw_mci *host, u32 timing)
 
 	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
 		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS78XX ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS78XX_SMU ||
 		priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 		mci_writel(host, CLKSEL64, clksel);
 	else
@@ -223,6 +244,8 @@ static int dw_mci_exynos_resume_noirq(struct device *dev)
 
 	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
 		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS78XX ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS78XX_SMU ||
 		priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 		clksel = mci_readl(host, CLKSEL64);
 	else
@@ -231,6 +254,8 @@ static int dw_mci_exynos_resume_noirq(struct device *dev)
 	if (clksel & SDMMC_CLKSEL_WAKEUP_INT) {
 		if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
 			priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+			priv->ctrl_type == DW_MCI_TYPE_EXYNOS78XX ||
+			priv->ctrl_type == DW_MCI_TYPE_EXYNOS78XX_SMU ||
 			priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 			mci_writel(host, CLKSEL64, clksel);
 		else
@@ -410,6 +435,8 @@ static inline u8 dw_mci_exynos_get_clksmpl(struct dw_mci *host)
 
 	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
 		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS78XX ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS78XX_SMU ||
 		priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 		return SDMMC_CLKSEL_CCLK_SAMPLE(mci_readl(host, CLKSEL64));
 	else
@@ -423,6 +450,8 @@ static inline void dw_mci_exynos_set_clksmpl(struct dw_mci *host, u8 sample)
 
 	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
 		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS78XX ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS78XX_SMU ||
 		priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 		clksel = mci_readl(host, CLKSEL64);
 	else
@@ -430,6 +459,8 @@ static inline void dw_mci_exynos_set_clksmpl(struct dw_mci *host, u8 sample)
 	clksel = SDMMC_CLKSEL_UP_SAMPLE(clksel, sample);
 	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
 		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS78XX ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS78XX_SMU ||
 		priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 		mci_writel(host, CLKSEL64, clksel);
 	else
@@ -444,6 +475,8 @@ static inline u8 dw_mci_exynos_move_next_clksmpl(struct dw_mci *host)
 
 	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
 		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS78XX ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS78XX_SMU ||
 		priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 		clksel = mci_readl(host, CLKSEL64);
 	else
@@ -454,6 +487,8 @@ static inline u8 dw_mci_exynos_move_next_clksmpl(struct dw_mci *host)
 
 	if (priv->ctrl_type == DW_MCI_TYPE_EXYNOS7 ||
 		priv->ctrl_type == DW_MCI_TYPE_EXYNOS7_SMU ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS78XX ||
+		priv->ctrl_type == DW_MCI_TYPE_EXYNOS78XX_SMU ||
 		priv->ctrl_type == DW_MCI_TYPE_ARTPEC8)
 		mci_writel(host, CLKSEL64, clksel);
 	else
@@ -633,6 +668,10 @@ static const struct of_device_id dw_mci_exynos_match[] = {
 			.data = &exynos_drv_data, },
 	{ .compatible = "samsung,exynos7-dw-mshc-smu",
 			.data = &exynos_drv_data, },
+	{ .compatible = "samsung,exynos78xx-dw-mshc",
+			.data = &exynos_drv_data, },
+	{ .compatible = "samsung,exynos78xx-dw-mshc-smu",
+			.data = &exynos_drv_data, },
 	{ .compatible = "axis,artpec8-dw-mshc",
 			.data = &artpec_drv_data, },
 	{},
diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index 581614196..9fe816c61 100644
--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -2575,6 +2575,119 @@ static void dw_mci_pull_data64(struct dw_mci *host, void *buf, int cnt)
 	}
 }
 
+/*
+  Some dw_mmc devices have 64-bit FIFOs, but expect them to be
+  accessed using two 32-bit accesses. If such controller is used
+  with a 64-bit kernel, this has to be done explicitly.
+
+  XXX: Is this issue specific to Exynos7?
+*/
+
+static inline uint64_t mci_fifo_readq_32(void __iomem *addr)
+{
+	uint64_t ans;
+	uint32_t proxy[2];
+
+	proxy[0] = mci_fifo_readl(addr);
+	proxy[1] = mci_fifo_readl(addr+4);
+	memcpy(&ans, proxy, 8);
+	return ans;
+}
+
+static inline void mci_fifo_writeq_32(void __iomem *addr, uint64_t value)
+{
+	uint32_t proxy[2];
+
+	memcpy(proxy, &value, 8);
+	mci_fifo_writel(addr, proxy[0]);
+	mci_fifo_writel(addr+4, proxy[1]);
+}
+
+static void dw_mci_push_data64_32(struct dw_mci *host, void *buf, int cnt)
+{
+	struct mmc_data *data = host->data;
+	int init_cnt = cnt;
+
+	/* try and push anything in the part_buf */
+	if (unlikely(host->part_buf_count)) {
+		int len = dw_mci_push_part_bytes(host, buf, cnt);
+
+		buf += len;
+		cnt -= len;
+
+		if (host->part_buf_count == 8) {
+			mci_fifo_writeq_32(host->fifo_reg, host->part_buf);
+			host->part_buf_count = 0;
+		}
+	}
+#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
+	if (unlikely((unsigned long)buf & 0x7)) {
+		while (cnt >= 8) {
+			u64 aligned_buf[16];
+			int len = min(cnt & -8, (int)sizeof(aligned_buf));
+			int items = len >> 3;
+			int i;
+			/* memcpy from input buffer into aligned buffer */
+			memcpy(aligned_buf, buf, len);
+			buf += len;
+			cnt -= len;
+			/* push data from aligned buffer into fifo */
+			for (i = 0; i < items; ++i)
+				mci_fifo_writeq_32(host->fifo_reg, aligned_buf[i]);
+		}
+	} else
+#endif
+	{
+		u64 *pdata = buf;
+
+		for (; cnt >= 8; cnt -= 8)
+			mci_fifo_writeq_32(host->fifo_reg, *pdata++);
+		buf = pdata;
+	}
+	/* put anything remaining in the part_buf */
+	if (cnt) {
+		dw_mci_set_part_bytes(host, buf, cnt);
+		/* Push data if we have reached the expected data length */
+		if ((data->bytes_xfered + init_cnt) ==
+		    (data->blksz * data->blocks))
+			mci_fifo_writeq_32(host->fifo_reg, host->part_buf);
+	}
+}
+
+static void dw_mci_pull_data64_32(struct dw_mci *host, void *buf, int cnt)
+{
+#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
+	if (unlikely((unsigned long)buf & 0x7)) {
+		while (cnt >= 8) {
+			/* pull data from fifo into aligned buffer */
+			u64 aligned_buf[16];
+			int len = min(cnt & -8, (int)sizeof(aligned_buf));
+			int items = len >> 3;
+			int i;
+
+			for (i = 0; i < items; ++i)
+				aligned_buf[i] = mci_fifo_readq_32(host->fifo_reg);
+
+			/* memcpy from aligned buffer into output buffer */
+			memcpy(buf, aligned_buf, len);
+			buf += len;
+			cnt -= len;
+		}
+	} else
+#endif
+	{
+		u64 *pdata = buf;
+
+		for (; cnt >= 8; cnt -= 8)
+			*pdata++ = mci_fifo_readq_32(host->fifo_reg);
+		buf = pdata;
+	}
+	if (cnt) {
+		host->part_buf = mci_fifo_readq_32(host->fifo_reg);
+		dw_mci_pull_final_bytes(host, buf, cnt);
+	}
+}
+
 static void dw_mci_pull_data(struct dw_mci *host, void *buf, int cnt)
 {
 	int len;
@@ -3367,8 +3480,13 @@ int dw_mci_probe(struct dw_mci *host)
 		width = 16;
 		host->data_shift = 1;
 	} else if (i == 2) {
-		host->push_data = dw_mci_push_data64;
-		host->pull_data = dw_mci_pull_data64;
+		if ((host->quirks & DW_MMC_QUIRK_FIFO64_32)) {
+			host->push_data = dw_mci_push_data64_32;
+			host->pull_data = dw_mci_pull_data64_32;
+		} else {
+			host->push_data = dw_mci_push_data64;
+			host->pull_data = dw_mci_pull_data64;
+		}
 		width = 64;
 		host->data_shift = 3;
 	} else {
diff --git a/drivers/mmc/host/dw_mmc.h b/drivers/mmc/host/dw_mmc.h
index 4ed81f94f..edd642b92 100644
--- a/drivers/mmc/host/dw_mmc.h
+++ b/drivers/mmc/host/dw_mmc.h
@@ -280,6 +280,8 @@ struct dw_mci_board {
 
 /* Support for longer data read timeout */
 #define DW_MMC_QUIRK_EXTENDED_TMOUT            BIT(0)
+/* Force 32-bit access to the FIFO */
+#define DW_MMC_QUIRK_FIFO64_32                 BIT(1)
 
 #define DW_MMC_240A		0x240a
 #define DW_MMC_280A		0x280a
-- 
2.38.3



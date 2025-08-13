Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2BB2FDC30
	for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Aug 2025 15:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755097310; cv=none; b=C9r20yM5s7m95muTwe6wWKzqOjvT/AI1JKpHgUPO8qZfwu8tYfZE4LtG8f15QRISk206d2uDQCUy1lvNjraFh77xJk6gs75nZlZ5uUBlVHPlFQ/XQPgFlbi57LzjAZwOg3zYn4Cts+igfv2orOmeTNXMdttnU48Jp6jgCTU8Yys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755097310; c=relaxed/simple;
	bh=e96e2uriLNE/91D1xcujNN0wWodE6fkJhlYuU4bmmm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R9fOQZdSLBX9RIhaHVCBqp1IJIfqeRKxT2DA3MuZnAvU9K7JuMv/mTYalgxRFmYsViOLVMJKIiq8HJ0cramBiW5tFr2sj/stpfROehp5VlCFFh9do2RTS6ZNrFa6CEd60sTYWxKDrmapxm20Wt1ADUBHTLS/WVxGKI2H3RZ1nHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tGmCig6Y; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tGmCig6Y"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b7825e2775so6134971f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Aug 2025 08:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755097306; x=1755702106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUnS6lFW/OouGAuKaDZ/jOVoVg2OpPkl5Y2+4hJYcHY=;
        b=tGmCig6Y2BFhIpvCUxqb1yikxnJ8yFjziGcOrFr6/gHLgy18odQkzcXWKjuZXUkFYc
         RboZ5rPrxchEv21Ybc2H3ZpHEHWzIpjxBC0gHDU2IYiYipJAjdWNDZ2PWezu2XjJGi9p
         FI6z+9ne/veBR9WwoBILHZ/8qTlzq2SQjVfTmYKutkBRC85yOeWynqZw2InWw0YgbEbH
         TiqNoUruIjvs3csb29MioOAJ3IE83WxNzcxDAZ2Uu0+oru9UZKt8Lmz0Y510wBkfFj6S
         9BkrLJVAExj7lxOcfsp/RECGfrPCp113d7JskbO2Fjqn8nr++SF2nbUG80R16b2Q1A8R
         zSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755097306; x=1755702106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUnS6lFW/OouGAuKaDZ/jOVoVg2OpPkl5Y2+4hJYcHY=;
        b=Dp3u0WSiu2TPmebdcpL0Md8qkL1r4ZBw0Mmgjlpm+gD0a0XxpD0shC2OmgNitKjfgJ
         8icD3rQRwB9OrlVfNp3y8Y/lJd1gNZ+axzp6VD0eZE2wjErvbOwPTOlTZVeXFSegoreW
         +1SOfF11h+v1TGpRhgPxVyngBfkmEA9oWUNldpsUrKyOssEwU4r49qmw2hYGnAgpH9a1
         9Wms/5XuOHeMdS6cahKTHebAnb0rqdI8kUWjOMBTH3pMpQDBySxtYUDiXOGW4IUa9Htv
         ZAcpxEQekg0BxMpUPt0jepItBUmDa99CsiHkhe7UJzEY6QQDtSKyUIEZfaKy5aXpRnPz
         ciWg==
X-Forwarded-Encrypted: i=1; AJvYcCX7ZQS3lWLYq5F99tB3CeGAcO479GirBhwpwyH/oqjg0RLQvW/v/4xd+uykg9BIVtadTAK997xfVOTLoQDGwvUq0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4AtuCgxWeHo+vNOgGp551v48zhz8Y+9WucnM9gTyN9wYm71cG
	a6u6cU7lMBLsC9GwoC+Z1PKS1KHeP1Wrai01v1B9woV2tg20Cd7L50tyV1G4IPhNWLg=
X-Gm-Gg: ASbGncukynfoBZTW5VOZzBvVQLOHuuZHCpcngLTnD9cKSL0xulsdp0WateaiY7TI957
	Yz34N1pg98CkyXb3mxOTwGQYk7Hsy+Z0dinWbEIyOyxE68fg+sDtyh+ob+mj0lbPlrwq3EZLMO8
	vOldgl4hBngt/YzAF1rXV8MT9EIiJRZYNuIeahR6GX35piv+mJqJeDPVxaK8ercic5oBQ9VUOQ9
	yOQtrZv1Z3s+fcK1TtAJr79xijz6LbUWZ8zi1pY34RDV3+5yiW/4o9HhVaiKhcLytJTCyvhoswT
	W4HzIICOF9y1kOSk3JlZauLojJQ3H6lDueca8a2Narsi9OQXrkGPF8c1kQRpoyMyf1jRW9jCfU/
	34agZj/eHU2xyBnWzTcECFtGX6lO1gMjkr87QOgu6o+/dtSRaxXV9
X-Google-Smtp-Source: AGHT+IHZf4R4qw8eeL2FWMX6E8ZtRfYmJiDx05re8iiNDmAHE0O5lU+KTt0U3hhJsJjVNN/RPYez2A==
X-Received: by 2002:a05:6000:1aca:b0:3b8:d082:41e with SMTP id ffacd0b85a97d-3b917edec2bmr2870312f8f.57.1755097306293;
        Wed, 13 Aug 2025 08:01:46 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4533f1sm48402964f8f.42.2025.08.13.08.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:01:45 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 13 Aug 2025 16:00:47 +0100
Subject: [PATCH v3 2/2] phy: samsung: gs101-ufs: Add .notify_phystate() &
 hibern8 enter/exit values
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-phy-notify-pmstate-v3-2-3bda59055dd3@linaro.org>
References: <20250813-phy-notify-pmstate-v3-0-3bda59055dd3@linaro.org>
In-Reply-To: <20250813-phy-notify-pmstate-v3-0-3bda59055dd3@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 kernel-team@android.com, William Mcvicker <willmcvicker@google.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, neil.armstrong@linaro.org, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5773;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=e96e2uriLNE/91D1xcujNN0wWodE6fkJhlYuU4bmmm4=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBonKjU3CQtLVFx27U59LnCkpBH9YabXSmsjLPrN
 KW1+UIG8c2JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaJyo1AAKCRDO6LjWAjRy
 ugP9D/9Zn4QpP77Upl4GTzZubiAEAWj7Qfp3gZqZq+elDTLue08D6g8EEvGmP5Rq2Ty0HHM4fw9
 XU4aNfHCfG72rtzgO4ORaSiPg/DLRRM8maAYqwXFImgMEfmq1hmHBDPmo+kJ7KWU81Xxd0+YKmR
 FbVQQscwmZ16PqYXfQBTxVRqOBuHH4CAqKuv9c4owuCsX6oQN1NcnIDMJzOZx7VkQeOJmZJo42X
 qvdux3cl+SZNDivkmQs36gRu2fNKwyHJqoI8+Sis0bl4eIqoRL9EDNw+B7vfQTfsasLGM/9AKuJ
 /XiyoRQW51eXBF32fnfHDfW6DpLJOEE8ZXjAT3J0L3hCCcaKp9m/ZKsFz5Gc2CXMoOQP0Mq9jrr
 zaSELrGgVFtPn8CZSU7HzhQi6TWoj7efg+cAOvvR4+cw2KtEmox5h2SdaSRPA+P+WtQi77u9NLw
 k8IrNLH/oE3Wul/VujbBsdYbHE8blT/v4gKpAsABTWslhMOTMP3igPVvXTf3PWAFK6oiz54ogA3
 7DBxvH6mhG0sXZ96FXsUh1seX1JyetLR+qWsYTPD73qu7pMuTDdJSH3de9eYAWQIMu5gKxDW3b+
 oJA7/QwxPGrsPv6x00YVmOzqSWaeQS+EjbfpIN1R5+XfukR80gxocZgGP2smhleUecGpXbzEoIZ
 yUMnyKRfWubBZhA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Implement the .notify_phystate() callback and provide the gs101 specific
phy values that need to be programmed when entering and exiting the hibern8
state.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/phy/samsung/phy-gs101-ufs.c   | 28 ++++++++++++++++++++++++++
 drivers/phy/samsung/phy-samsung-ufs.c | 38 +++++++++++++++++++++++++++++++++++
 drivers/phy/samsung/phy-samsung-ufs.h |  7 +++++++
 3 files changed, 73 insertions(+)

diff --git a/drivers/phy/samsung/phy-gs101-ufs.c b/drivers/phy/samsung/phy-gs101-ufs.c
index 17b798da5b5761f8e367599517d2d97bf0bb6b74..a15e1f453f7f3cecd6d3aa75217633ac4b6085d0 100644
--- a/drivers/phy/samsung/phy-gs101-ufs.c
+++ b/drivers/phy/samsung/phy-gs101-ufs.c
@@ -108,12 +108,39 @@ static const struct samsung_ufs_phy_cfg tensor_gs101_post_pwr_hs_config[] = {
 	END_UFS_PHY_CFG,
 };
 
+static const struct samsung_ufs_phy_cfg tensor_gs101_post_h8_enter[] = {
+	PHY_TRSV_REG_CFG_GS101(0x262, 0x08, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_GS101(0x265, 0x0A, PWR_MODE_ANY),
+	PHY_COMN_REG_CFG(0x1, 0x8,  PWR_MODE_ANY),
+	PHY_COMN_REG_CFG(0x0, 0x86,  PWR_MODE_ANY),
+	PHY_COMN_REG_CFG(0x8, 0x60,  PWR_MODE_HS_ANY),
+	PHY_TRSV_REG_CFG_GS101(0x222, 0x08, PWR_MODE_HS_ANY),
+	PHY_TRSV_REG_CFG_GS101(0x246, 0x01, PWR_MODE_HS_ANY),
+	END_UFS_PHY_CFG,
+};
+
+static const struct samsung_ufs_phy_cfg tensor_gs101_pre_h8_exit[] = {
+	PHY_COMN_REG_CFG(0x0, 0xC6,  PWR_MODE_ANY),
+	PHY_COMN_REG_CFG(0x1, 0x0C,  PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_GS101(0x262, 0x00, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_GS101(0x265, 0x00, PWR_MODE_ANY),
+	PHY_COMN_REG_CFG(0x8, 0xE0,  PWR_MODE_HS_ANY),
+	PHY_TRSV_REG_CFG_GS101(0x246, 0x03, PWR_MODE_HS_ANY),
+	PHY_TRSV_REG_CFG_GS101(0x222, 0x18, PWR_MODE_HS_ANY),
+	END_UFS_PHY_CFG,
+};
+
 static const struct samsung_ufs_phy_cfg *tensor_gs101_ufs_phy_cfgs[CFG_TAG_MAX] = {
 	[CFG_PRE_INIT]		= tensor_gs101_pre_init_cfg,
 	[CFG_PRE_PWR_HS]	= tensor_gs101_pre_pwr_hs_config,
 	[CFG_POST_PWR_HS]	= tensor_gs101_post_pwr_hs_config,
 };
 
+static const struct samsung_ufs_phy_cfg *tensor_gs101_hibern8_cfgs[] = {
+	[CFG_POST_HIBERN8_ENTER]	= tensor_gs101_post_h8_enter,
+	[CFG_PRE_HIBERN8_EXIT]		= tensor_gs101_pre_h8_exit,
+};
+
 static const char * const tensor_gs101_ufs_phy_clks[] = {
 	"ref_clk",
 };
@@ -170,6 +197,7 @@ static int gs101_phy_wait_for_cdr_lock(struct phy *phy, u8 lane)
 
 const struct samsung_ufs_phy_drvdata tensor_gs101_ufs_phy = {
 	.cfgs = tensor_gs101_ufs_phy_cfgs,
+	.cfgs_hibern8 = tensor_gs101_hibern8_cfgs,
 	.isol = {
 		.offset = TENSOR_GS101_PHY_CTRL,
 		.mask = TENSOR_GS101_PHY_CTRL_MASK,
diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/phy-samsung-ufs.c
index f3cbe6b17b235bb181b3fae628d75822f0c9183a..192ea408f787bb31912a2c7dd90cc1b61c4237c4 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.c
+++ b/drivers/phy/samsung/phy-samsung-ufs.c
@@ -217,6 +217,42 @@ static int samsung_ufs_phy_set_mode(struct phy *generic_phy,
 	return 0;
 }
 
+static int samsung_ufs_phy_notify_state(struct phy *phy,
+					union phy_notify state)
+{
+	struct samsung_ufs_phy *ufs_phy = get_samsung_ufs_phy(phy);
+	const struct samsung_ufs_phy_cfg *cfg;
+	int i, err;
+
+	if (!ufs_phy->cfgs_hibern8)
+		return 0;
+
+	if (state.ufs_state == PHY_UFS_HIBERN8_ENTER)
+		cfg = ufs_phy->cfgs_hibern8[CFG_POST_HIBERN8_ENTER];
+	else if (state.ufs_state == PHY_UFS_HIBERN8_EXIT)
+		cfg = ufs_phy->cfgs_hibern8[CFG_PRE_HIBERN8_EXIT];
+
+	for_each_phy_cfg(cfg) {
+		for_each_phy_lane(ufs_phy, i) {
+			samsung_ufs_phy_config(ufs_phy, cfg, i);
+		}
+	}
+
+	if (state.ufs_state == PHY_UFS_HIBERN8_EXIT) {
+		for_each_phy_lane(ufs_phy, i) {
+			if (ufs_phy->drvdata->wait_for_cdr) {
+				err = ufs_phy->drvdata->wait_for_cdr(phy, i);
+				if (err)
+					goto err_out;
+			}
+		}
+	}
+
+	return 0;
+err_out:
+	return err;
+}
+
 static int samsung_ufs_phy_exit(struct phy *phy)
 {
 	struct samsung_ufs_phy *ss_phy = get_samsung_ufs_phy(phy);
@@ -233,6 +269,7 @@ static const struct phy_ops samsung_ufs_phy_ops = {
 	.power_off	= samsung_ufs_phy_power_off,
 	.calibrate	= samsung_ufs_phy_calibrate,
 	.set_mode	= samsung_ufs_phy_set_mode,
+	.notify_phystate = samsung_ufs_phy_notify_state,
 	.owner          = THIS_MODULE,
 };
 
@@ -287,6 +324,7 @@ static int samsung_ufs_phy_probe(struct platform_device *pdev)
 	phy->dev = dev;
 	phy->drvdata = drvdata;
 	phy->cfgs = drvdata->cfgs;
+	phy->cfgs_hibern8 = drvdata->cfgs_hibern8;
 	memcpy(&phy->isol, &drvdata->isol, sizeof(phy->isol));
 
 	if (!of_property_read_u32_index(dev->of_node, "samsung,pmu-syscon", 1,
diff --git a/drivers/phy/samsung/phy-samsung-ufs.h b/drivers/phy/samsung/phy-samsung-ufs.h
index a28f148081d168344b47f2798b00cb098f0a8574..f2c2e744e5bae87c9cfcaa17f4a09456f134966a 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.h
+++ b/drivers/phy/samsung/phy-samsung-ufs.h
@@ -92,6 +92,11 @@ enum {
 	CFG_TAG_MAX,
 };
 
+enum {
+	CFG_POST_HIBERN8_ENTER,
+	CFG_PRE_HIBERN8_EXIT,
+};
+
 struct samsung_ufs_phy_cfg {
 	u32 off_0;
 	u32 off_1;
@@ -108,6 +113,7 @@ struct samsung_ufs_phy_pmu_isol {
 
 struct samsung_ufs_phy_drvdata {
 	const struct samsung_ufs_phy_cfg **cfgs;
+	const struct samsung_ufs_phy_cfg **cfgs_hibern8;
 	struct samsung_ufs_phy_pmu_isol isol;
 	const char * const *clk_list;
 	int num_clks;
@@ -124,6 +130,7 @@ struct samsung_ufs_phy {
 	struct clk_bulk_data *clks;
 	const struct samsung_ufs_phy_drvdata *drvdata;
 	const struct samsung_ufs_phy_cfg * const *cfgs;
+	const struct samsung_ufs_phy_cfg * const *cfgs_hibern8;
 	struct samsung_ufs_phy_pmu_isol isol;
 	u8 lane_cnt;
 	int ufs_phy_state;

-- 
2.51.0.rc0.205.g4a044479a3-goog


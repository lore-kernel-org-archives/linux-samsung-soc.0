Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DEA2E7640
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Jul 2025 13:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751547820; cv=none; b=Emk4AuYj7+EZ2t9c4X3a2D+1dSk8fl2VAq2dJQOEzfX4J88WCGtqH7Dkl+3UVmvTTo7USq8AKcwiUNqsWnvy/KrpHtss8XmwU0V9un9IBDG1AifnEntfi46uimCPwsijW4/0es9imrjCj2UCMThz7hB0UV+vIhgGQONR+NCHFE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751547820; c=relaxed/simple;
	bh=SGXL8vHpnOze8hCmwSTRKJn6StGn2XGnu+E5YVyfKLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aj2dWdXYvSm7eF+RRu1IXOoAkzObHgxVB+OHIEhW1yz1XrvFMUrKuUJPS1VjXLZKZPEehmhLTIKK8r9y4vXsaYiM00NOQRIwlr01JHHBhvfRjLgFuNDVKwpv+7GxZ8Eu4w/MYTTA/XkeYx78OpK/ZHSPaC6ErZ3616E1IiaCrpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nGJO7kMs; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nGJO7kMs"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a54700a463so565342f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Jul 2025 06:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751547814; x=1752152614; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zY+gmVQiaUnNp4jEFsxwLdll+E7uRUbUBQTVKPUvak0=;
        b=nGJO7kMsA8ZF/RhviXhjxWT9HrYlFc0eo6XzLyN9livaSXuDjpGzDC/USr5nsAaSh7
         vpzyq/Pe2CUPa2kQs6+lXIV/uooHhPjPj1D+u1MkMIlaO0FvYKj/ynV/9h0bnknEuMIr
         5GAV1CVNkVFLGrcWFRa4reNsKR+nXcO5TRQjGXu1DyMprD/gUSlOEIOPJ606wz5vCiAw
         baM7pNGSFcMZ7mMR3rNY/n4HzQ6/wvSmMNwjS1QFumUX//2zIXTFG3gSa+antIdg1M/+
         oWoo5O+j29t/YJL0mAUrfBZ+VRGd0itxI5Up3Mb2JuCHnP6+ScELu4MA683qa31wMvYt
         M0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751547814; x=1752152614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zY+gmVQiaUnNp4jEFsxwLdll+E7uRUbUBQTVKPUvak0=;
        b=JIzVNNxCZvAZ8QUEFjXKuCa+DPly0L7xtfcUKFJLvFc1nTerIPRzJv2Qft897SNJiV
         7V6aJ/Jm3azWQOhqV+LpoyonPsc2p/dFaCYWGez25iLOMy2w9NVnclwJ48pwbQDe0sjk
         kZ2UVDWYMQyfHu8lak4NpcQx3dpoLTaAFeR+/6zNwZiz1/ebidj06PV4OncT4V/4/3z2
         0DN65EUhItVJYxtJwePUt3nNOgGAhd/xhD1ofGrg8GelLRsf2FkBjxF2xb/y2Rs7Hp1y
         gqiv0PWdNlr386otYCN6Ft8hh7Q1kQLNyg6BOk/ML1wWMX1Q0jkcLxmgKQjG0THaXYie
         U6ow==
X-Forwarded-Encrypted: i=1; AJvYcCXGGVx6UbvI+aRj2/gdugwoVl/mOoGmBVvlPp4ysZqW49aULsbDE4QWy5VSEIWpjsxZ3C1MSdfbH+gIZIgzlITzqw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg6LlX1tS+BWD1enKQiNpGC/8LyKVnUWtTYrCtirIUS1EfV9Wa
	gqgQgeV67i9hHbEgbaB/mWqW956SAE/9i3FReYxw8j5gFfWhkWet6DxrUanJU94YSlM=
X-Gm-Gg: ASbGncsKVer5UpC9d35sRBOkR3meD6K0vc/epfa7BL54j+0pX5reWB2qpDTAC5d4Unq
	u/EWEJAx96Zb6tGns2pQWScpZkDVXOOm2kMPThMo03cVq4BI6HrwJ47F/UtFWupYjHgWIBHY52y
	tOhXupIyInE24i/eW7A1HNT3mrWtrpQD9ssm4sna8OO6GUhWP/v8mbAfb/2fYwO1Xg5NdHyk0qt
	qJMlkHWKVQUTFoTfA/NjOKxj8+y8fjkcqaFB85+0e9y0AXfkX60KYOyH4yfXgWFOLjpkD7DbKfs
	IoqJCMQIACs2zuCkR/ixx47MJ1ap8nDUiZ4afQy5DSq9RnTaC0CscSaU0yQZIZtusQHwEYRdoYx
	Bn6VYhi/V8lE81eTw
X-Google-Smtp-Source: AGHT+IFAmqbG8QwOKcAIIyFO7TCvSI5jKlQABIcoROoKfcTrDyTYY+J9CssjlH6HomYb2Z62O9WhbQ==
X-Received: by 2002:a5d:584d:0:b0:3a4:d685:3de7 with SMTP id ffacd0b85a97d-3b342a0e01cmr2543169f8f.8.1751547813693;
        Thu, 03 Jul 2025 06:03:33 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a99693fesm26170005e9.7.2025.07.03.06.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 06:03:33 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 03 Jul 2025 14:03:23 +0100
Subject: [PATCH v2 2/2] phy: samsung: gs101-ufs: Add .notify_pmstate() and
 hibern8 enter/exit values
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-phy-notify-pmstate-v2-2-fc1690439117@linaro.org>
References: <20250703-phy-notify-pmstate-v2-0-fc1690439117@linaro.org>
In-Reply-To: <20250703-phy-notify-pmstate-v2-0-fc1690439117@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 kernel-team@android.com, William Mcvicker <willmcvicker@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5752;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=SGXL8vHpnOze8hCmwSTRKJn6StGn2XGnu+E5YVyfKLw=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoZn+hg2HMRi/dl+2ECaqD6oA575YwGvtgGtYNE
 a8rLPZfkrOJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaGZ/oQAKCRDO6LjWAjRy
 uqLSD/95i0gIkM1wypk88hIX1bhKXhzKowe/VoMuslxo6MVrSw7Y4l4xm1z0vQWIUrRufoDx/98
 x2absM0xSUf+pWjyhyC8CzlV234TtH6nqszQ1ao4MothcZV2EhAvqCnHWkW0TWxwXrNIrnIy6hC
 oufEwLX+vNTKhI10Eu+8wcT7WCzeHYUKV4IsyqMmTulFArdz9elklPa/YJI4huDwz8sBbodHZBQ
 q1Mxc84zYAoNOZJC9BJvKW2rePssI8wec0zY0M5ly1T7sSSj1f8s3x+MgVkTUB/MnC0+/QJhlB7
 xR1+ZmH0jhhBn9pER6SRYfxy7z6+ixqtMqJZw0Xu3WPhqL0PfxS7iuhViZ+J1A4QeNejQbqHqNQ
 VoD4JMuDJi0EGzicc4Sqbe6rPfIptGjqXXX6wITSFlA7V1lDkLnpwkB1d7Ze01ywqnXpcBuQDMp
 PsxwoCbNQaEdw5ABh7dFiI10yAy/It6C68CU6UP0Wv1rx8BAhLm7gUStywVCdLTDXOvehDyyN5n
 qqnBR1/OpABHfCdzEPBm27g1NHE+Ku7ds+BjZOfvL2YeOuVf+OUzVbdFOz6n0by2nKLKuvfjLfB
 eejF8B4dpDU3uJvHna7IJJzIxt59I8YZD39gz0jQGfUdVuPEspFL0+E20ZBwxc9x84X4G+9pRb+
 +yzfMnPAdbiiIoA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Implement the .notify_pmstate() callback and provide the gs101 specific phy
values that need to be programmed when entering and exiting the hibern8 state.

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
index f3cbe6b17b235bb181b3fae628d75822f0c9183a..b0dc40c19d2ed85dbdb74aff768a24f03b4b3f49 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.c
+++ b/drivers/phy/samsung/phy-samsung-ufs.c
@@ -217,6 +217,42 @@ static int samsung_ufs_phy_set_mode(struct phy *generic_phy,
 	return 0;
 }
 
+static int samsung_ufs_phy_notify_pmstate(struct phy *phy,
+					  enum phy_linkstate pmstate)
+{
+	struct samsung_ufs_phy *ufs_phy = get_samsung_ufs_phy(phy);
+	const struct samsung_ufs_phy_cfg *cfg;
+	int i, err;
+
+	if (!ufs_phy->cfgs_hibern8)
+		return 0;
+
+	if (pmstate == PHY_UFS_HIBERN8_ENTER)
+		cfg = ufs_phy->cfgs_hibern8[CFG_POST_HIBERN8_ENTER];
+	else if (pmstate == PHY_UFS_HIBERN8_EXIT)
+		cfg = ufs_phy->cfgs_hibern8[CFG_PRE_HIBERN8_EXIT];
+
+	for_each_phy_cfg(cfg) {
+		for_each_phy_lane(ufs_phy, i) {
+			samsung_ufs_phy_config(ufs_phy, cfg, i);
+		}
+	}
+
+	if (pmstate == PHY_UFS_HIBERN8_EXIT) {
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
+	.notify_pmstate = samsung_ufs_phy_notify_pmstate,
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
2.50.0.727.gbf7dc18ff4-goog


Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0BB1E630D
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Dec 2024 12:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733228039; cv=none; b=AjJnCOModgusA4n7OS/wsQJd9rpsLFC/MpynrJwcSDpQ2SAmhipO1VaicFQHCsuLNXqrX5p03+gK3gQDiueJcPPyX6G2EHXcpSuRoX/Xz3SovGo0bLBmGCRx5L08siWMnvDyuxDOVwd4CrnwwzURtBLCWd9EdJOcsKxkvYlB7AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733228039; c=relaxed/simple;
	bh=SrNm479mfjveTEuZxmv854ReXQ1mRjzxwEH9dzh6qvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fTOOHL1Bq3vGjoP1lhzfpeATqyd1P/k4P83Ovp9aUu+iT8M1gKXYsprvgljQSlh6m+9+apAmWnY7Gna3fc8PcFy9CYLUX2XsJsGhr6h61WCWnnFLIIOKYnuKNhpxVS4o3Hc9eg0vtZkEeMXaWr3z7p9v1ZDohsB1yRuBE6LoL9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gs641nkH; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gs641nkH"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9e44654ae3so705483366b.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Dec 2024 04:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733228035; x=1733832835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFpsvHW8LAP7lW2ogoOJaMBxsAjFS0igr/BkJ+LMT9c=;
        b=gs641nkHF8juHLlYNo4pgnblNk59Ya97GAY9JsUTb0heOU15CAbO/5h67yhhY2CT0c
         BbKOOf0UY2zO1AgFp7vQrLghR2rMQJZujd1OCPIxCp5o/ns3xrrePCxHA3Mip3FoQpEi
         17NrUHHZ3PWl9GyfyLs9QQRds/+cCecIN7N1/Tq67hmTwM5po5L6zm8wC02jQhHgD0Bl
         IdTMueOIDisJNyiz4uZRqpqg1wLJ27dFNX6FKLqbGi/rsAA0zOf8UwzbNtv5jAcMOHud
         yxo8ZKFYiDBXFCLhzNd7owHMfAk/+GA1EcMwr36JCf8tsD387CSS3RwUka0IdhLUyXDB
         J5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733228035; x=1733832835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFpsvHW8LAP7lW2ogoOJaMBxsAjFS0igr/BkJ+LMT9c=;
        b=RXlM+FUDhXR93W+ZboJVjNqSkg8Ht8x9RERXrTGY7nOF+CV9HRI5G/GsZw7HykdoKO
         vmqLhy+vxcssxbd6NBGwBfynkpBCEFv18c2QgoCo3v80QiM699P2ZKaBpU1ZClmenmK6
         qwLnRmOsDkiFvaf6K8kMQAfT29vIGjEGPGAAVvDpJW+GFlQoQeEBez0lDkNvNFWXYj8d
         AXZ1hBbhpnmCXpY0dBMvaT19NzrNW3e0YQCf84JfBX6UC3dWsYBPbL2d7LQLM/ew9Kbb
         fhAGQ8ucl+LH8c0eNGasSvZjxhkYHB5wgYSmFXN0xGJUOQuzGvbt+iykp/f6xLnIw/ov
         RPtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSBm9LoPjIW+/mg+dM8CPfRLWuduXUkFW4mQUW2AEG96e0vM3JMHBrfVf1EODt7DhJZF6Rqp7X/mN0gNhpCtNVTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyW9mb8GNfzOwB+NKvgLy3gyZ9laxejEPpOQCGmHDRFyF22by7C
	QjL/go/hisUbTwmr420zp5+zYfXQUErZrZLVPQBZHPjD1f7vlJooq1v+3oSbAqY=
X-Gm-Gg: ASbGnctRs79ewTDDw3pi5QoM3/tsT+Ymqpi8t67UKGis4s5qhilqFAMbdnJey3Z/OOM
	aX5ds7N1rYPcsq8Nay93CnR18h3u5uG0ekq4gim0kLB/T/8pkpBasQ9gQSPGRYH6Hre8+FnWD2i
	HTx8DrDyoFU7oxKt/DYJA5Qjt4moCjnbiK4b/VZQljhNB4pNx0lUIoOmnADpjzkCD+uruIa8pTV
	S3gtezW33Audx7JdbHSD2Fp/pl8lI525o6FMy2fwzsnqv1QBwX+7JYNkxU9MCaf0xw7CZxKD4Cb
	sV2HJDlReVJ68uU+Tzt1bU+XGSLLTlQwGQ==
X-Google-Smtp-Source: AGHT+IGdrwALKg1GTwldZJOY7VYAVcWh5tQKqLrkKr8AXomCGAvvPrif7tTk5yapUjTCTN1a7cYNbg==
X-Received: by 2002:a17:906:4c1:b0:aa5:427e:6c76 with SMTP id a640c23a62f3a-aa5f7aaed08mr164681466b.0.1733228035286;
        Tue, 03 Dec 2024 04:13:55 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c245bsm607603766b.8.2024.12.03.04.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:13:54 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Dec 2024 12:13:56 +0000
Subject: [PATCH v2 8/8] phy: exynos5-usbdrd: allow DWC3 runtime suspend
 with UDC bound (E850+)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-gs101-phy-lanes-orientation-phy-v2-8-40dcf1b7670d@linaro.org>
References: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
In-Reply-To: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

To make USB runtime suspend work when a UDC has been bound, the phy
needs to inform the USBDRD controller (DWC3) that Vbus and bvalid are
gone, so that it can in turn raise the respective gadget interrupt with
event == DWC3_DEVICE_EVENT_DISCONNECT, which will cause the USB stack
to clean up, allowing DWC3 to enter runtime suspend.

On e850 and gs101 this isn't working, as the respective signals are not
directly connected, and instead this driver uses override bits in the
PHY IP to set those signals. It currently forcefully sets them to 'on',
so the above mentioned interrupt will not be raised, preventing runtime
suspend.

To detect that state, update this driver to act on the TCPC's
orientation signal - when orientation == NONE, Vbus is gone and we can
clear the respective bits. Similarly, for other orientation values we
re-enable them.

This makes runtime suspend work on platforms with a TCPC (like Pixel6),
while keeping compatibility with platforms without (e850-96).

With runtime suspend working, USB-C cable orientation detection now
also fully works on such platforms, and the link comes up as Superspeed
as expected irrespective of the cable orientation and whether UDC /
gadget are configured and active.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 53 +++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index b1914c6c806d..94e4f78340ff 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1137,13 +1137,15 @@ static void exynos850_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	reg |= LINKCTRL_BUS_FILTER_BYPASS(0xf);
 	writel(reg, regs_base + EXYNOS850_DRD_LINKCTRL);
 
-	reg = readl(regs_base + EXYNOS850_DRD_UTMI);
-	reg |= UTMI_FORCE_BVALID | UTMI_FORCE_VBUSVALID;
-	writel(reg, regs_base + EXYNOS850_DRD_UTMI);
-
-	reg = readl(regs_base + EXYNOS850_DRD_HSP);
-	reg |= HSP_VBUSVLDEXT | HSP_VBUSVLDEXTSEL;
-	writel(reg, regs_base + EXYNOS850_DRD_HSP);
+	if (!phy_drd->sw) {
+		reg = readl(regs_base + EXYNOS850_DRD_UTMI);
+		reg |= UTMI_FORCE_BVALID | UTMI_FORCE_VBUSVALID;
+		writel(reg, regs_base + EXYNOS850_DRD_UTMI);
+
+		reg = readl(regs_base + EXYNOS850_DRD_HSP);
+		reg |= HSP_VBUSVLDEXT | HSP_VBUSVLDEXTSEL;
+		writel(reg, regs_base + EXYNOS850_DRD_HSP);
+	}
 
 	reg = readl(regs_base + EXYNOS850_DRD_SSPPLLCTL);
 	reg &= ~SSPPLLCTL_FSEL;
@@ -1408,9 +1410,44 @@ static int exynos5_usbdrd_orien_sw_set(struct typec_switch_dev *sw,
 				       enum typec_orientation orientation)
 {
 	struct exynos5_usbdrd_phy *phy_drd = typec_switch_get_drvdata(sw);
+	int ret;
+
+	if (phy_drd->orientation == orientation)
+		return 0;
+
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
+	if (ret) {
+		dev_err(phy_drd->dev, "Failed to enable PHY clocks(s)\n");
+		return ret;
+	}
+
+	scoped_guard(mutex, &phy_drd->phy_mutex) {
+		void __iomem * const regs_base = phy_drd->reg_phy;
+		unsigned int reg;
+
+		if (orientation == TYPEC_ORIENTATION_NONE) {
+			reg = readl(regs_base + EXYNOS850_DRD_UTMI);
+			reg &= ~(UTMI_FORCE_VBUSVALID | UTMI_FORCE_BVALID);
+			writel(reg, regs_base +  EXYNOS850_DRD_UTMI);
+
+			reg = readl(regs_base + EXYNOS850_DRD_HSP);
+			reg |= HSP_VBUSVLDEXTSEL;
+			reg &= ~HSP_VBUSVLDEXT;
+			writel(reg, regs_base + EXYNOS850_DRD_HSP);
+		} else {
+			reg = readl(regs_base + EXYNOS850_DRD_UTMI);
+			reg |= UTMI_FORCE_VBUSVALID | UTMI_FORCE_BVALID;
+			writel(reg, regs_base +  EXYNOS850_DRD_UTMI);
+
+			reg = readl(regs_base + EXYNOS850_DRD_HSP);
+			reg |= HSP_VBUSVLDEXTSEL | HSP_VBUSVLDEXT;
+			writel(reg, regs_base + EXYNOS850_DRD_HSP);
+		}
 
-	scoped_guard(mutex, &phy_drd->phy_mutex)
 		phy_drd->orientation = orientation;
+	}
+
+	clk_bulk_disable(phy_drd->drv_data->n_clks, phy_drd->clks);
 
 	return 0;
 }

-- 
2.47.0.338.g60cca15819-goog


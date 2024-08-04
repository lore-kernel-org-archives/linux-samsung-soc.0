Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63112149C70;
	Sun,  4 Aug 2024 21:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722808563; cv=none; b=A9/H3nNAAf+1LShKyWZ7Gj2Yqnma5hmhVd0z/W3tIWQYG8Wov9sXzj2Jgj1+OHCIP9Gaw8i5OXuwakyWUt14d3mEq5/vtP8iZtQAm+XQagBEpn6wQ6uCPxql2wBQEJaffcRex8o4fcJDlhefUfVPr51yoq0GAXesws7sFjzCiLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722808563; c=relaxed/simple;
	bh=1xsKURzT8hkjZPvyA7SMPHfuIFkrXRkCBe12bxg1vAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dsmI2wo6sfFE3qcRSEXygqwyiGORWVB41iRKc1xvej2t66hJmO/fjDopNXLiWGpu8ThWPYARpKJiWQe8mxv/VER5uMO71KzqhiXX1ZtZhJEsnx9UiDPHdqoREpWaJGVxjhiUJF5SP6qMOSKiHm/1G1KQh6AosBlANDU5qWs6K6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hRinLTLG; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hRinLTLG"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-367963ea053so6581232f8f.2;
        Sun, 04 Aug 2024 14:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722808560; x=1723413360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4k5kEk4WdJ7BTyBcpyDwtCLf6kDcGSB5mtdTxdCNTM=;
        b=hRinLTLGpGo51NE7/kJAqOqFM/KN4YBSqae3TVKZvfcp153Ed3wXkiMzjKuo3diido
         A1kYNt0vQ0DL6neKLwSTxevGTlz+70xmDvUtqn3S0MPr0zY2vvcmFVEfXM3qIHHIdynB
         5Ro+6A6gWISobZeKKjCX41U0zaB8aIyaRmb6VIRLGWcL/DZrm3GBW5b+MCb8yF8+/0yq
         fbbAbS8BbrBk+aUM9ZICMEDEMYcyI6ZHE7xd0uoWqjpoC5Vs2VG0ZVCaZ1wH1SzFnwWr
         jJxTslIj6mhcUGY/VPtpZGK229bjue6gHpz7hYQJVpN+g3KGSQ+mtCS5Uiv5FbcmihGU
         sP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722808560; x=1723413360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4k5kEk4WdJ7BTyBcpyDwtCLf6kDcGSB5mtdTxdCNTM=;
        b=OkA2lcj+8J4jZ8hWBWi2WzkXwhDrKg3bNg42sUJyEutqsBfHX2lunVCJBH9NsSHkam
         3MclS+2tZgMr9wvCRv3upd3cr0uScHKR+scFnc8cIGVcmR5PCiQ6IMyQhJHCBuyFonOK
         f5xSpk63Smb4cqkcJJTwtGrnD8teVsHJzze2uyzCGCLg+YyUhD9qsL+6eiz5H3xenfcR
         5MzLaAUJuyCe8CzPfjP+Z1+KJ4pl5X673ESEnuq2yLMZkxBjVYChNoG1kox09Bhe5ZjH
         sCcHW7H6yqG5RXxK0OQfnKsb8fs5iJTeI/0tr+GnJziDQbrRnNN9uKZUZsgqMZ0yl/h/
         qhCg==
X-Forwarded-Encrypted: i=1; AJvYcCUM7Vvuq4oLn6ki4GoR7fdzQ+hzW45i5vQe1A7YOAe57UTNGQhcJh2Zu6g0lhU4N2iRLWFY8T1aseJl7bkpk+6+N0oQXA9GmWScq5TVyTWdkIqvNpk4PvV63iONFE/YDCKNDDX2exa8MBQCjkO8NGJ9zfPFTR95jYghLI+pCVU7FSaeMtm/8y8Dwgt6ZqEo+4ku/qtloy7hPeyZnPHRFx773cwiyVUK5rEsFkP94aP0xneisJ3+Cx6/09smhujSgZWE
X-Gm-Message-State: AOJu0YzLnbGm98kYFgQQANyf4aTQ4TejSS+MwJezx97d+0nVfV2YBxHZ
	aDRT+igjXe/pM5nw+ulTGoiTLjkryy+V0L7qJ7k7q2l3nZDdEyf3
X-Google-Smtp-Source: AGHT+IGf9W8CS+wMJJjKQCCJ+OVnp7SviYwepgVgg4+3B6dPNlrnF9LQx7EcXysSlGhIi1PQyxQyOw==
X-Received: by 2002:adf:f2ce:0:b0:368:3ef7:3929 with SMTP id ffacd0b85a97d-36bbc0ff3b8mr8121645f8f.22.1722808559625;
        Sun, 04 Aug 2024 14:55:59 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7dc9d45452sm370485066b.111.2024.08.04.14.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 14:55:59 -0700 (PDT)
From: David Virag <virag.david003@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	David Virag <virag.david003@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 11/13] phy: exynos5-usbdrd: support Exynos7885 USB PHY
Date: Sun,  4 Aug 2024 23:53:56 +0200
Message-ID: <20240804215458.404085-12-virag.david003@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240804215458.404085-1-virag.david003@gmail.com>
References: <20240804215458.404085-1-virag.david003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Exynos7885 SoC has an Exynos USB PHY that theoretically supports
USB3 SuperSpeed, but all known devices using it only have USB2 and the
vendor driver has USB3 function stubbed out, so we'll only support USB2.

Apart from this mysterius USB3 capability, it's the closest to Exynos850
out of those supported. Unlike other SoCs though, this one doesn't set
the reference clock by default, so we have to set it manually.
For this, create a set_ref_clk_rate property in drvdata that can be set
to a predefined value to set the clockrate to.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c    | 21 +++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h |  3 +++
 2 files changed, 24 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index df52b78a120b..466c72d8a93c 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -367,6 +367,7 @@ struct exynos5_usbdrd_phy_drvdata {
 	int n_clks;
 	const char * const *core_clk_names;
 	int n_core_clks;
+	u32 set_ref_clk_rate;
 	const char * const *regulator_names;
 	int n_regulators;
 	u32 pmu_offset_usbdrd0_phy;
@@ -1361,6 +1362,10 @@ static int exynos5_usbdrd_phy_clk_handle(struct exynos5_usbdrd_phy *phy_drd)
 		return dev_err_probe(phy_drd->dev, -ENODEV,
 				     "failed to find phy reference clock\n");
 
+	/* Exynos7885 SoC has reference clock unset by default */
+	if (phy_drd->drv_data->set_ref_clk_rate)
+		clk_set_rate(ref_clk, phy_drd->drv_data->set_ref_clk_rate);
+
 	ref_rate = clk_get_rate(ref_clk);
 	ret = exynos5_rate_to_clk(ref_rate, &phy_drd->extrefclk);
 	if (ret)
@@ -1460,6 +1465,19 @@ static const struct exynos5_usbdrd_phy_drvdata exynos7_usbdrd_phy = {
 	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
+static const struct exynos5_usbdrd_phy_drvdata exynos7885_usbdrd_phy = {
+	.phy_cfg                = phy_cfg_exynos850,
+	.phy_ops                = &exynos850_usbdrd_phy_ops,
+	.pmu_offset_usbdrd0_phy = EXYNOS7885_PHY_CTRL_USB20,
+	.clk_names		= exynos5_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
+	.core_clk_names		= exynos5_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
+	.regulator_names	= exynos5_regulator_names,
+	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
+	.set_ref_clk_rate       = 50 * MHZ,
+};
+
 static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos850,
 	.phy_ops		= &exynos850_usbdrd_phy_ops,
@@ -1663,6 +1681,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos7-usbdrd-phy",
 		.data = &exynos7_usbdrd_phy
+	}, {
+		.compatible = "samsung,exynos7885-usbdrd-phy",
+		.data = &exynos7885_usbdrd_phy
 	}, {
 		.compatible = "samsung,exynos850-usbdrd-phy",
 		.data = &exynos850_usbdrd_phy
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index ce1a3790d6fb..04ef93625eab 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -657,6 +657,9 @@
 #define EXYNOS5433_PAD_RETENTION_UFS_OPTION			(0x3268)
 #define EXYNOS5433_PAD_RETENTION_FSYSGENIO_OPTION		(0x32A8)
 
+/* For Exynos7885 */
+#define EXYNOS7885_PHY_CTRL_USB20				(0x674)
+
 /* For Tensor GS101 */
 #define GS101_SYSIP_DAT0					(0x810)
 #define GS101_SYSTEM_CONFIGURATION				(0x3A00)
-- 
2.46.0


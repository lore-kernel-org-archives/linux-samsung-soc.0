Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DB635082E
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2025 12:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756298547; cv=none; b=oVhtJ7fQIIC/Yjv2lXkZoY4rWVhsLA5CsFh2KjRe5P7eJnFG1stpQvk0xA8wPLEioxvKUkk/T+T0Tb8O/TAVHFUZqoN5M5FePV3y3OWgmMzv+DolzN6lgXD1N+NzedA+tB40Gw4JvgJxD0+SJH4FsW/QPTvs+sjDcoVRlN2LDyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756298547; c=relaxed/simple;
	bh=GciBv6TscMWoUL5NOWHvgdZWg70tQo2b5jzt+et6cck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kywaP1/kTpQW2qr/boMsAdhHFOly4e7RKg6jL9VeY+RszQBOhNiIG77KSzVYnh8yTf3F8bNWCPYrEwIZz25eclvvyNcC2YZ536NO6A+Y3V7XJgpolkpdzhlPYu+o0kOazp0ZBADAcXZRm7LKjpIKSZhR/I2oa05zf8N0xRxjZAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f7fV+XS1; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f7fV+XS1"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3cc3600e5d1so1454314f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2025 05:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756298539; x=1756903339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5cfSXL73LYNoY9rCDtAr6B+DOeIwLOhBdUm0HxsWgPY=;
        b=f7fV+XS1qOMMYmKM/w3Zv33LRHaUetSxAEK/bMdgNpikDVKGmqoPv7ti8cmOQk6pYj
         QSXWlCAPy6LkS4MwmLXCUjyxWXCFgZbtSDGY4D+P0q5hXYUqzKkOJIFD/kCBoKMDudTc
         6UP3zhh0HtKKBA2dWDGDnZcdY7/bl7YgyLNjcj5Vh4T0G0iIDHRR/8kaxJcPRMGqueu4
         Fdv/0NhVMp2IvQXkL9pUhBZijMoS4T+IzbHLJ75oq491EfHkOU0bbf8F0PDFBbeVrXRr
         VE0o6ZXtCa/5rAnHqNmjI1Ia1IncDskBRCjAW+5IXgX3bBKmy/1Gj/NjXEpb3IhgS7Yn
         yMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756298539; x=1756903339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5cfSXL73LYNoY9rCDtAr6B+DOeIwLOhBdUm0HxsWgPY=;
        b=cBVcdPTz2dQJaOw51VgAh1j+x44Fk0uIpQW2qNrOUjyJAn1AppvX5498WtEX049CW1
         DmwsbjCt3CEbBATMCdHItXXvhTzTMelPatRUDd8bXvrv2qZsVFUBd/idAbmoHeIfYZfF
         0nA+cVWa48o/D2eo86kitTDo+N3OKnUDhmMjzHusRpUh9PcTXQhsfa24y6M64sOs2a5N
         2J2TJogG4tA54eRgf+pyi8aeE6DrhZaFxI6CNjoXn30RKkf0KMtC0FjpLyPfH37XDcUa
         KlGwnVcN1aymKvqyNV2q3OOcYUSwOq0eu3TZQRACFtN6o6ZKLtKpp1ZzFlBQ6Ip1k4pR
         /OTA==
X-Forwarded-Encrypted: i=1; AJvYcCVU9ptpiu3N7nI4hSoE+w5hCr9OpGeI5xaJDmnwOf97kfFygtQM8zZ4L8IiV0u864tIZMN+3NPYP/GOPEPLGlsCWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd6ZZUqOXB4S1c0ynuZHoUOYe4+/S1QDjpZtB9FmRIZdDeO4a5
	asfbZn0kxjKplPrP9zw89cG7Vjpxeh5odCdwUgCPUb9J2dqt/hzDUUv0MrMr+gEuSqo=
X-Gm-Gg: ASbGncvza1cwyaefYDo813V3c5DdasZweOsZ0lky2tA0DQpikjOfvkG0efczbW7GtH5
	8eTY1Vqx/fdP17Ow6rJC4vhP8KCHT53maVBYyzJoZt8PPAz0JFlncprm4cYJ08tJOlARorqaIYt
	KHriRz+H4Fgv3I77wEMIzU7E4qGWx/+CxCKwqUQ2iP+wu5Wf0X2rJS5VT0fRkkzaESEYL7b+BWD
	LZcZhuUCMYlHAJZfKa11cfi27ASEgZD2QPcvS/vegXBkYvQVZ/h1F6oczmEQ1k+ORPiHtMCzU92
	rU6XOFhG2SN7hBupSG0bDlQqwOCvwYMS2L0yctoT25+eobnrMtZSsTdzxEO2J3gE+wjU8mdR469
	U984ONs1yvHcwsTtRjav+liI8iwlwxQyXJJw+Hx12KpuqyJgcZaZOwJ8OqEFeFrH8x5yLvk4oF4
	+rHQ==
X-Google-Smtp-Source: AGHT+IFlHa5emvmCKQfoDDkPRlNGe/uXhHgcv977YZ2vSKl+w8mC+U+AGdr8d85CmNa+TjSLH+q9Nw==
X-Received: by 2002:a05:6000:288a:b0:3a4:fea6:d49f with SMTP id ffacd0b85a97d-3c5dcc0dec3mr14394157f8f.49.1756298538987;
        Wed, 27 Aug 2025 05:42:18 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cbab3ead0dsm6439420f8f.29.2025.08.27.05.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 05:42:18 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 27 Aug 2025 12:42:14 +0000
Subject: [PATCH v2 4/5] firmware: exynos-acpm: register ACPM clocks dev
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-acpm-clk-v2-4-de5c86b49b64@linaro.org>
References: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
In-Reply-To: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756298535; l=5210;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=GciBv6TscMWoUL5NOWHvgdZWg70tQo2b5jzt+et6cck=;
 b=GS+9vzYJP6T4ggVpRCRv6J4WvF9fBE/H6F09fimItPewcc/1VJ9tRuthqg3yPNy+9zXnUVBvU
 ukecEb66+HWAfBZ7JoAEuzjmTBSm7Uw9ybIAmdsFdHdZYdNJKT/66XL
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Register by hand a platform device for the ACPM clocks.
The ACPM clocks are not modeled as a DT child of ACPM because:
1/ they don't have their own resources.
2/ they are not a block that can be reused. The clock identifying
   data is reduced (clock ID, clock name and mailbox channel ID)
   and may differ from a SoC to another.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 64 +++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 9fa0335ccf5db32892fdf09e8d4b0a885a8f8fb5..86a220a845d2934aa28e9bb8996cf914f65cdae6 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -24,10 +24,13 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
+#include <linux/platform_data/clk-acpm.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#include <dt-bindings/clock/google,gs101.h>
+
 #include "exynos-acpm.h"
 #include "exynos-acpm-dvfs.h"
 #include "exynos-acpm-pmic.h"
@@ -160,6 +163,7 @@ struct acpm_chan {
  * struct acpm_info - driver's private data.
  * @shmem:	pointer to the SRAM configuration data.
  * @sram_base:	base address of SRAM.
+ * @clk_pdev:	ACPM clocks platform device.
  * @chans:	pointer to the ACPM channel parameters retrieved from SRAM.
  * @dev:	pointer to the exynos-acpm device.
  * @handle:	instance of acpm_handle to send to clients.
@@ -168,6 +172,7 @@ struct acpm_chan {
 struct acpm_info {
 	struct acpm_shmem __iomem *shmem;
 	void __iomem *sram_base;
+	struct platform_device *clk_pdev;
 	struct acpm_chan *chans;
 	struct device *dev;
 	struct acpm_handle handle;
@@ -177,14 +182,39 @@ struct acpm_info {
 /**
  * struct acpm_match_data - of_device_id data.
  * @initdata_base:	offset in SRAM where the channels configuration resides.
+ * @acpm_clk_pdata:	ACPM clocks platform data.
  */
 struct acpm_match_data {
 	loff_t initdata_base;
+	const struct acpm_clk_platform_data *acpm_clk_pdata;
 };
 
 #define client_to_acpm_chan(c) container_of(c, struct acpm_chan, cl)
 #define handle_to_acpm_info(h) container_of(h, struct acpm_info, handle)
 
+#define ACPM_CLK(_id, cname)					\
+	{							\
+		.id		= _id,				\
+		.name		= cname,			\
+	}
+
+static const struct acpm_clk_variant gs101_acpm_clks[] = {
+	ACPM_CLK(CLK_ACPM_DVFS_MIF, "mif"),
+	ACPM_CLK(CLK_ACPM_DVFS_INT, "int"),
+	ACPM_CLK(CLK_ACPM_DVFS_CPUCL0, "cpucl0"),
+	ACPM_CLK(CLK_ACPM_DVFS_CPUCL1, "cpucl1"),
+	ACPM_CLK(CLK_ACPM_DVFS_CPUCL2, "cpucl2"),
+	ACPM_CLK(CLK_ACPM_DVFS_G3D, "g3d"),
+	ACPM_CLK(CLK_ACPM_DVFS_G3DL2, "g3dl2"),
+	ACPM_CLK(CLK_ACPM_DVFS_TPU, "tpu"),
+	ACPM_CLK(CLK_ACPM_DVFS_INTCAM, "intcam"),
+	ACPM_CLK(CLK_ACPM_DVFS_TNR, "tnr"),
+	ACPM_CLK(CLK_ACPM_DVFS_CAM, "cam"),
+	ACPM_CLK(CLK_ACPM_DVFS_MFC, "mfc"),
+	ACPM_CLK(CLK_ACPM_DVFS_DISP, "disp"),
+	ACPM_CLK(CLK_ACPM_DVFS_BO, "b0"),
+};
+
 /**
  * acpm_get_saved_rx() - get the response if it was already saved.
  * @achan:	ACPM channel info.
@@ -606,6 +636,7 @@ static void acpm_setup_ops(struct acpm_info *acpm)
 
 static int acpm_probe(struct platform_device *pdev)
 {
+	const struct acpm_clk_platform_data *acpm_clk_pdata;
 	const struct acpm_match_data *match_data;
 	struct device *dev = &pdev->dev;
 	struct device_node *shmem;
@@ -647,7 +678,30 @@ static int acpm_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, acpm);
 
-	return devm_of_platform_populate(dev);
+	acpm_clk_pdata = match_data->acpm_clk_pdata;
+	acpm->clk_pdev = platform_device_register_data(dev, "acpm-clocks",
+						       PLATFORM_DEVID_NONE,
+						       acpm_clk_pdata,
+						       sizeof(*acpm_clk_pdata));
+	if (IS_ERR(acpm->clk_pdev))
+		return dev_err_probe(dev, PTR_ERR(acpm->clk_pdev),
+				     "Failed to register ACPM clocks device.\n");
+
+	ret = devm_of_platform_populate(dev);
+	if (ret) {
+		platform_device_unregister(acpm->clk_pdev);
+		return dev_err_probe(dev, ret,
+				     "Failed to populate platform devices.\n");
+	}
+
+	return 0;
+}
+
+static void acpm_remove(struct platform_device *pdev)
+{
+	struct acpm_info *acpm = platform_get_drvdata(pdev);
+
+	platform_device_unregister(acpm->clk_pdev);
 }
 
 /**
@@ -744,8 +798,15 @@ const struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_acpm_get_by_node);
 
+static const struct acpm_clk_platform_data acpm_clk_gs101  = {
+	.clks = gs101_acpm_clks,
+	.nr_clks = ARRAY_SIZE(gs101_acpm_clks),
+	.mbox_chan_id = 0,
+};
+
 static const struct acpm_match_data acpm_gs101 = {
 	.initdata_base = ACPM_GS101_INITDATA_BASE,
+	.acpm_clk_pdata = &acpm_clk_gs101,
 };
 
 static const struct of_device_id acpm_match[] = {
@@ -759,6 +820,7 @@ MODULE_DEVICE_TABLE(of, acpm_match);
 
 static struct platform_driver acpm_driver = {
 	.probe	= acpm_probe,
+	.remove = acpm_remove,
 	.driver	= {
 		.name = "exynos-acpm-protocol",
 		.of_match_table	= acpm_match,

-- 
2.51.0.261.g7ce5a0a67e-goog


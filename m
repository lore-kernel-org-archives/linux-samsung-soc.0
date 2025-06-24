Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1682C15B5
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2025 13:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771172; cv=none; b=HURmPY3y16HCkWoZ6CU3PvdkPUfbEWwqi+zOwtsMrwg4L1nQZ3xn/qM2ahgz35MY+xRkdGmeeGb/ytPXedcvmeOnysHISGUiCkmrpMno25LVPjEqJzltvMFvi9bC9RlDiF7iABGTNr68cbboYyk3MYrHzT+SIGHB0L5IVFbzqCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771172; c=relaxed/simple;
	bh=xcORaGp9hp93QNoUi06xKHxtsVsUcT6kMZo7X4w0D+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cv4hZPcw27tUo1U5bc2TG5NDPmv+dHraVZ55FvR3wgrgZLB7MssGd/rlQisSITYRAQHA7XCN/gEWQBcnTE6uU1p2OfiFttWy+VYCT3OS3Na/mjc8vBbPHfrY7iSXR8H3Mhr3LHIcUBZyZKR5L8EqHYfjue+epb7BXzJ1q5m0hNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Q+MZ0kBL; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Q+MZ0kBL"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a6cdc27438so4543897f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2025 06:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771168; x=1751375968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cfA10XdOACRY/IrBcDZpDZb3kuGH97Dyb6S2+RQRG3Y=;
        b=Q+MZ0kBLc42vVDyBsIp4gD2hi0YvzK91yFBM4rLHNa4NPZpTo7xZvLVvS5sjq6XvcE
         KaxnKhaVzApbhBEOJ1qLT2Ps7SFgbPkAG76QcX2hsHdOad5KANp8HsZklKqxVl4xwHsu
         FhDHSOqfwUwQZNfD9G7ulK11cFxI2FfgMcNos5vzpOTbhVyw6MjomlRyPV3zkiL9P5Vn
         htq71puGm1JESEaPnuOZ9I2Ja8j7xQu3mv0tQAShFnxZuOHiWIOQlEvXEFD2rExEBCvR
         ry9ilBEP1OQ0OGur7/SqY9CmuQOWb6CbFb9Y+ueM2lxQwIxjLKWGUz28y7bZ+kEp9Y4G
         xhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771168; x=1751375968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfA10XdOACRY/IrBcDZpDZb3kuGH97Dyb6S2+RQRG3Y=;
        b=Lp85A2JYUGxRxflsCOUswHe+9AXJ/9FqKvSNVu77/9VucygM+Ui+KSK5bFZ8WM5bQT
         +/POBqGtzeFIyQNyZJpDhGIYHDImw3TuupfYJwmq3ttKk3NhCA14cY+Y9B4l+CqN1ruR
         LnVsfpU1p+8ZOcAxtxDvDYr7pBhLcVGqvjdJ8cw3BR8Sf0+zKjn274ZyjKThY3Zu35qs
         2NgFTahbmvN6fot0gjE3GZXi0BmkwFbX334Ur8R1sZHy7IOWTu1u8ZfR+uVFjdpI/CXE
         gY6QUu52i5GqAWULmTQ+4puqM+hSJ8E36PTtgzVbejoicSA05s/MF+RzZNwu2DtzRKl8
         LQEw==
X-Forwarded-Encrypted: i=1; AJvYcCXDFycoxZXyN2h6jMS0/JnKoE8IC8UYGdI17MlmLXcvAl64saxRsXO2UxKOqGS+59IVQNUMhYO+UC6ZDx9AA6dXDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHWOA8jkCZFzomXQrFHOVpoYO3vKgFtD3VH0iW69o6G3S6wLD4
	JFsWHNuBx3I2PIlOhqNTCzTcqkMq/iU5v4Lj+a2EO1qC9RH3zJUtpw1Buod+iFsmL0A=
X-Gm-Gg: ASbGncscwsVKRwnioqbMDtsNlOC/+jnGlng9Z0NqEJlNASSaQQCLSvhIhnqlaI4hsum
	CYkQnsE6WEV8hOZwJqKxy1ittSJbzxeS4n+xD+YRaGbkJ1cPJ95ZQXuCOaosa9rmD2jZ09skFl9
	sZ+fi+KyfQtsgWP7gDzmTIbIBrlOS9uNk/89DBUEVYgCclphtkZhrJJSxf7q6XK5e87tQ6B/OD6
	Ri2OkYA+kJmyglWKjKINAeYZa7xhn6BaRQ9S+f956aFgO9y6sUt84Yz4i2dkX3AxLDbE/LyDpzr
	okpcdoEc4a+0oDqR/+miUgp1LsOd/jBDfGn1a/caMwQlVM3IjPF4pYJy0mTW6GwYMw==
X-Google-Smtp-Source: AGHT+IFTifOhva4BdmUJzGwpovbRm2O4f8NWPXbDRvmJfySUXOoY/Vcz/no16JAPAVghSOGd/Bdvdw==
X-Received: by 2002:a05:6000:402a:b0:3a4:e740:cd72 with SMTP id ffacd0b85a97d-3a6d12e33b5mr14504534f8f.13.1750771167466;
        Tue, 24 Jun 2025 06:19:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd74asm141302195e9.22.2025.06.24.06.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:19:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:19:15 +0200
Subject: [PATCH RFT 4/6] ARM: omap1: ams-delta: use generic device
 properties for gpio-mmio
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-pdata-v1-4-a58c72eb556a@linaro.org>
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3651;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=gFSys3VgqjoqW4I00DJkRfiOOgkVrIw7F6KFiFLO89k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqXXnpvf/V8HRXBEddOjIKP61RqNuBN355+tm
 gJZnUsAYSeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFql1wAKCRARpy6gFHHX
 cmTxEADJSTbkm9nmIjrvON/4aWNZaOQWGwmERXenxDHo6azSSVxY0Vqu/df0cBANsdlJ0bQZ5kg
 GMeopmjkGkyzNMRfxcSoA3M1nZjPMObxMVCEW844SdxsJUg3D++QxcXspEi0HFmFmtuxrQx7SSE
 A2tP6ZP9pgxcZ5RJPc3CYvsZU7zECWTUTMpETHKjaA5Zva1cQZWsSRSNyN4btQPr5nIeL4qrrGw
 KzDvBxP+WD9/HRFx1OV5siWn3MjpUoTP0u4dr5AkuPCBqbSGsUbD1V0EOF+QzQ+1EoAuMTR6s3b
 hqH+ZOkMCnIaktBI+Josa8iHbdfffA8IQ25A6gn0cnJ3NKNrUSNMjptPYtOmcXPmGpaUKh5XVH9
 wMVLWjOzoStmxen9NcmFIahGkb5PNvcyVp+YhFEyMbikAjeBi1fh2b5H0N5RvcKEftV8mn2Ipti
 MONCVWkuAn/2f/fWUIXwvoyNOV0cHpcSCMu4yARrvbIX6hrz5eiSxtaDmEnL+bxo4wfHfAXFXn0
 6GOu0tHw84dy8Ny3+dB7XIXPoySiaFB4BS3cZH8X7SJxefYejQYp5+hy0xB0+nm5TLlQ1DmLHMa
 udtgNZ28WrAsW19CMj3wZ7MsAVJCgoIoaSwspXrXH0DdEyvbhCD93Bu6qkcZX7kHJOrKlcQXtqK
 XFxQ11pBw2aA3ug==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The two latch GPIO devices in ams-delta are registered with struct
bgpio_pdata passed as platform_data to the gpio-mmio driver. We want to
remove the bgpio_pdata from the kernel and the gpio-mmio driver is now
also able to get the relevant values from the software node. Set up
device properties and switch to using platform_device_info to register
the devices as platform_add_devices() doesn't allow us to pass device
properties to the driver model.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm/mach-omap1/board-ams-delta.c | 42 +++++++++++++++++------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index 0daf6c5b5c1cbcfd5bd15203cad119d39aa95f19..16392720296cd224732450c85419c35bbab506f6 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -19,6 +19,7 @@
 #include <linux/mtd/nand-gpio.h>
 #include <linux/mtd/partitions.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regulator/fixed.h>
 #include <linux/regulator/machine.h>
@@ -175,20 +176,18 @@ static struct resource latch1_resources[] = {
 
 #define LATCH1_LABEL	"latch1"
 
-static struct bgpio_pdata latch1_pdata = {
-	.label	= LATCH1_LABEL,
-	.base	= -1,
-	.ngpio	= LATCH1_NGPIO,
+static const struct property_entry latch1_gpio_props[] = {
+	PROPERTY_ENTRY_STRING("label", LATCH1_LABEL),
+	PROPERTY_ENTRY_U32("ngpios", LATCH1_NGPIO),
+	{ }
 };
 
-static struct platform_device latch1_gpio_device = {
+static const struct platform_device_info latch1_gpio_devinfo = {
 	.name		= "basic-mmio-gpio",
 	.id		= 0,
-	.resource	= latch1_resources,
-	.num_resources	= ARRAY_SIZE(latch1_resources),
-	.dev		= {
-		.platform_data	= &latch1_pdata,
-	},
+	.res		= latch1_resources,
+	.num_res	= ARRAY_SIZE(latch1_resources),
+	.properties	= latch1_gpio_props,
 };
 
 #define LATCH1_PIN_LED_CAMERA		0
@@ -213,20 +212,18 @@ static struct resource latch2_resources[] = {
 
 #define LATCH2_LABEL	"latch2"
 
-static struct bgpio_pdata latch2_pdata = {
-	.label	= LATCH2_LABEL,
-	.base	= -1,
-	.ngpio	= LATCH2_NGPIO,
+static const struct property_entry latch2_gpio_props[] = {
+	PROPERTY_ENTRY_STRING("label", LATCH2_LABEL),
+	PROPERTY_ENTRY_U32("ngpios", LATCH2_NGPIO),
+	{ }
 };
 
-static struct platform_device latch2_gpio_device = {
+static struct platform_device_info latch2_gpio_devinfo = {
 	.name		= "basic-mmio-gpio",
 	.id		= 1,
-	.resource	= latch2_resources,
-	.num_resources	= ARRAY_SIZE(latch2_resources),
-	.dev		= {
-		.platform_data	= &latch2_pdata,
-	},
+	.res		= latch2_resources,
+	.num_res	= ARRAY_SIZE(latch2_resources),
+	.properties	= latch2_gpio_props,
 };
 
 #define LATCH2_PIN_LCD_VBLEN		0
@@ -542,8 +539,6 @@ static struct gpiod_lookup_table keybrd_pwr_gpio_table = {
 };
 
 static struct platform_device *ams_delta_devices[] __initdata = {
-	&latch1_gpio_device,
-	&latch2_gpio_device,
 	&ams_delta_kp_device,
 	&ams_delta_audio_device,
 	&ams_delta_serio_device,
@@ -697,6 +692,9 @@ static void __init ams_delta_init(void)
 	omap1_usb_init(&ams_delta_usb_config);
 	platform_add_devices(ams_delta_devices, ARRAY_SIZE(ams_delta_devices));
 
+	platform_device_register_full(&latch1_gpio_devinfo);
+	platform_device_register_full(&latch2_gpio_devinfo);
+
 	/*
 	 * As soon as regulator consumers have been registered, assign their
 	 * dev_names to consumer supply entries of respective regulators.

-- 
2.48.1


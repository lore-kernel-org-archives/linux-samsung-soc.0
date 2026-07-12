Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24C7367B7E
	for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Jul 2026 02:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783822393; cv=none; b=Dwk2zwt2mqSd0K/VdaL7xGit6e/Sbyb+IjG11lmdy4WAeajeMGL0N1avdtLChJm3krSSdc2l8cO4IIwn+SbjC5Nxaz0iOLwoJLHnOM3j7+bsCRFmDByupVEJRiNIy+LKT5n04ubmEmchOZBePTmWyjS4MU0Q+BVcHrF3BHreba8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783822393; c=relaxed/simple;
	bh=o14WWo5qJFt+cooxn41hVY96/Zqncd1xZ05HOGgFc/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fjO4mASOhaVyN9TMWzuLLmDXpEn6B7zg9gaczUAGpqK0TNqApxArMUZqlTTE0iz/0LoLhSdAs3vkRH1eV8X+z8KdxOVEcdRK90geRoeqyuvbh4hh+VYqtD42OUKNRd/6F/fslomoK5KnXI76IaRtLvVTGdyPB/eiNhQK+1XBvKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dOoMgTjw; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOoMgTjw"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso1252668a12.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 11 Jul 2026 19:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783822391; x=1784427191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5FHjUZQYADUT6bCIy3JjzfiUR27NaQqxGvamZew7Xmw=;
        b=dOoMgTjw10WINSyMQDQpScfZNUm791DTIb1xvcHd1+Rx0zvGrG70Y6Zknmbo5TTcTl
         APkHatjg8/aoOYScAueBIBLoW7h4EYz9C+drZnspf3D42G4suXqoWziOrO5iNYhs6GvG
         +qF8BTnlvt3Au+K4bCLhmF+2PFszbX2IQHs1m9X78FRudn5B91QhIacq5i+sMZktUcs8
         UpqxZeiXf3bd30rfR8iBXtBg+WVIYOkU2r/ZjTMDnOzfrnYo9lYVMsS3b9mu+nSDiAkt
         nhGUqWEEAghrhNnKCtAEarcOpf5jbYRymKYcBN/JYcNPnwdBwZJZ2mK/O1zNGQkcRot7
         vj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783822391; x=1784427191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5FHjUZQYADUT6bCIy3JjzfiUR27NaQqxGvamZew7Xmw=;
        b=tWeVAx2RQdEd9UpFTyJbo+OXifsxxXIgOoU3PK8aAXGOXJjF6mDnF1DcqPUuCF9PoN
         pQlvReG2zYfEr+fQ47c1yp4SfzNzvLhjOwDhhSFmd1+RsSi0K0n0BWWFcUEW4dmF5imt
         2+fDIwkkZmIfJSDEFJ2lbXb2KCARWyiPqrY9zXO6sNqMDbR5OWDo2Kwo07Y9hnQt/q1L
         vf+koTZvHCE6VaZ4EUouuzV9tW/Z5yAdt6SW/TeArXhLiySsSOiGKh4lW48zrVdV0kYo
         xEZoWSNJ2cZ5bSwBZ0xQqSlEescmy6t7S84mPziYXhE3I3fGkeSjK3ppAssThYv0bcgb
         POJw==
X-Forwarded-Encrypted: i=1; AHgh+Rrf2hCqVVZI+ainh2DYxNlu5HVckhwX4hyDtIIbhHmrYq0zxZpqMrbw59VXL2upkELynzNZSTGSzEqVBoZp484fRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBSajSPkeGdGiP7tHml0ZyExCetT5nLhkFLmVDPKRLmv+dJ5b4
	D9DDPIxHaodzLggbO+11i7IgvPwf54v4ZqPafqDPy9vZXQULSiRX2mOp
X-Gm-Gg: AfdE7ckqGYGfWSv1x2VwHeFm2iiH7nwSvrKyZwEjZpnt6IFuuZBm5iEuImVRex7JwSk
	Zli4WRHh4kWBa260bzRH8wd601Yxb6A+Fd1TnXYNkSPc4YTYSr7Ix+LHpn87jC1cou1xEAgapsD
	95ZT2Rje2CWQcBzMZdnhkwpookYMAfxgAWTQMgd5HnhCKZIdpF6xjBj4hCjssciPaFOoih2YdrZ
	KRdETkih8MNSy8069DJW3rNhlFc/2eak2F+ugvLSJs4tokNMGDJ4XLuB0COSqJdyu5x/WlBVUFq
	haYHSmvlSH8OX4dV78vgqZnsEHcveoGQ9SESdp80I/BWgC9bjqepfKOupTmEPgAQ/IWnHcIcGm+
	XT5ZL6AjirUrH2CVTA8QbyyQUmdABpkWMgjWgqBJPZCFlGOG6ohkHxrT9RJ2VOO3ylHIlqwlkh7
	qCOWULRIQQ0UqwlNNk8Nkcwq4oXeCwQLawth/dqbWURx9wf35Whz+HHgph5TUmip5wZbvhWQAaL
	TI=
X-Received: by 2002:a05:6300:2290:b0:3b5:4fff:fa0f with SMTP id adf61e73a8af0-3c1109ecda0mr4245973637.14.1783822391326;
        Sat, 11 Jul 2026 19:13:11 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c63e:9756:a95c:c75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm54796692eec.18.2026.07.11.19.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 19:13:10 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 11 Jul 2026 19:12:47 -0700
Subject: [PATCH v3 06/10] ARM: s3c: crag6410: use software nodes/properties
 to set up GPIO keys
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-samsung-kp-v3-6-b2fcaba77aff@gmail.com>
References: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
In-Reply-To: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 patches@opensource.cirrus.com, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-b242f

Switch the gpio-keys device to use software nodes/properties to
describe the buttons and switches. This will allow dropping support
for platform data from the gpio-keys driver in the future.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/mach-crag6410.c | 79 ++++++++++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 21 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index c2df5dcb3368..757c0f383ff1 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -18,6 +18,7 @@
 #include <linux/input/matrix_keypad.h>
 #include <linux/gpio.h>
 #include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
 #include <linux/leds.h>
 #include <linux/delay.h>
 #include <linux/mmc/host.h>
@@ -228,32 +229,68 @@ static void __init crag6410_setup_keypad(void)
 		pr_err("failed to instantiate keypad device\n");
 }
 
-static struct gpio_keys_button crag6410_gpio_keys[] = {
-	[0] = {
-		.code	= KEY_SUSPEND,
-		.gpio	= S3C64XX_GPL(10),	/* EINT 18 */
-		.type	= EV_KEY,
-		.wakeup	= 1,
-		.active_low = 1,
-	},
-	[1] = {
-		.code	= SW_FRONT_PROXIMITY,
-		.gpio	= S3C64XX_GPN(11),	/* EINT 11 */
-		.type	= EV_SW,
-	},
+static const struct software_node crag6410_gpio_keys_node = {
+	.name = "crag6410-gpio-keys",
 };
 
-static struct gpio_keys_platform_data crag6410_gpio_keydata = {
-	.buttons	= crag6410_gpio_keys,
-	.nbuttons	= ARRAY_SIZE(crag6410_gpio_keys),
+static const struct property_entry crag6410_suspend_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_SUSPEND),
+	PROPERTY_ENTRY_GPIO("gpios",
+			    SAMSUNG_GPIO_NODE('L'), 10,	/* EINT 18 */
+			    GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_BOOL("wakeup-source"),
+	{ }
 };
 
-static struct platform_device crag6410_gpio_keydev = {
-	.name		= "gpio-keys",
-	.id		= 0,
-	.dev.platform_data = &crag6410_gpio_keydata,
+static const struct software_node crag6410_suspend_key_node = {
+	.parent = &crag6410_gpio_keys_node,
+	.properties = crag6410_suspend_key_props,
+};
+
+static const struct property_entry crag6410_prox_sw_props[] = {
+	PROPERTY_ENTRY_U32("linux,input-type", EV_SW),
+	PROPERTY_ENTRY_U32("linux,code", SW_FRONT_PROXIMITY),
+	PROPERTY_ENTRY_GPIO("gpios",
+			    SAMSUNG_GPIO_NODE('N'), 11,	/* EINT 11 */
+			    GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node crag6410_prox_sw_node = {
+	.parent = &crag6410_gpio_keys_node,
+	.properties = crag6410_prox_sw_props,
 };
 
+static const struct software_node *crag6410_gpio_keys_swnodes[] = {
+	&crag6410_gpio_keys_node,
+	&crag6410_suspend_key_node,
+	&crag6410_prox_sw_node,
+	NULL
+};
+
+static void __init crag6410_setup_gpio_keys(void)
+{
+	struct platform_device_info keys_info = {
+		.name	= "gpio-keys",
+		.id	= 0,
+	};
+	struct platform_device *pd;
+	int err;
+
+	err = software_node_register_node_group(crag6410_gpio_keys_swnodes);
+	if (err) {
+		pr_err("failed to register gpio-keys software nodes: %d\n", err);
+		return;
+	}
+
+	keys_info.fwnode = software_node_fwnode(&crag6410_gpio_keys_node);
+
+	pd = platform_device_register_full(&keys_info);
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create gpio-keys device: %d\n", err);
+}
+
 static struct resource crag6410_dm9k_resource[] = {
 	[0] = DEFINE_RES_MEM(S3C64XX_PA_XM0CSN5, 2),
 	[1] = DEFINE_RES_MEM(S3C64XX_PA_XM0CSN5 + (1 << 8), 2),
@@ -397,7 +434,6 @@ static struct platform_device *crag6410_devs0[] __initdata = {
 	&samsung_device_pwm,
 	&s3c64xx_device_iis0,
 	&s3c64xx_device_iis1,
-	&crag6410_gpio_keydev,
 };
 
 static struct platform_device *crag6410_devs1[] __initdata = {
@@ -909,6 +945,7 @@ static void __init crag6410_machine_init(void)
 
 	gpiod_add_lookup_table(&crag_leds_table);
 	crag6410_setup_keypad();
+	crag6410_setup_gpio_keys();
 
 	platform_add_devices(crag6410_devs1, ARRAY_SIZE(crag6410_devs1));
 	gpio_led_register_device(-1, &gpio_leds_pdata);

-- 
2.55.0.795.g602f6c329a-goog


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792904607;
	b=S6P475kc1HK4fFkC5l3Cun3Pievixk8qDmMdSc1YEDykOCOEhh6fOyn5rwc+3Dn7RbAq
	 knNzZ98do86L9tgiWa0SSqoLHr/JeBZAI0C/afgBKDQTRMTpDEAp59TILwEaumZy2cF3+
	 XAi8qmZ1IRYzb2Ww7NUtYRegGydLIntzd33Rz3Que7AhHFqIlV+4K++bRKhPwEGHTID3v
	 mF7YsIzKRmfrQANKLAqJe0G/6/fbQKSVflX+tdH4tULDAcGg7BEMOWAXzjrnymK0Cfpuc
	 N/wEre1S+WG/5ZnXQi8bfe/TuSwPfE5n6fuKTO6xx18BN03e1KMsDTvgPVUXjgZ6eZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792904607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=XvlUBd9t253/XOnBgnu6wcIP+Rj8CczN5W7bxz4QbhY=;
	b=h67GAqv9lyzvliztMHRPfZ4JumSiIgbuIrA8D1+ZHnsTt0z6cvofbnny9VNZDLWHsNg+
	 sRkLQp24j2bGpYJx8T/M7RAt2mXyCqovSqo/FJvVffNzfEA95sPFzi5zsa9kNtNB2UndY
	 w1sPVEtXjJVSmNvDUUn5g7LoOZRY+W/hFefef2SeIK/qzCKOiNuTf8OQzo1X5BF385IyA
	 TUPUbUWABb3k/rlCx/lmsjUQLK4Fs2ia9ReF8lYEyJed2ZQsZ9ZuTar3o03Oi+BYgSwbY
	 QDNFIN9bhwOC0nPO8odb0qfg+/XYNxy1qx7CkuZQVJKtG9ZkUHzA89AJVvIkx7hu5pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bqo6732h;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692A0606A31E
	for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Oct 2026 05:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 692A0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bqo6732h
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3956850eec.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 24 Oct 2026 22:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792904605; x=1793509405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XvlUBd9t253/XOnBgnu6wcIP+Rj8CczN5W7bxz4QbhY=;
        b=Bqo6732hop10KAX6KynAJtJ+tX0d1pujIN3l7rGbHFEBE7GIQGEffm4Q89kRghzAhn
         1u8i3+Vo5wgffheGroKsmkk8Upf6qiZH3yEgqmGB/YCdClD8wTHjml5iVN+3ZdNczz6c
         +Dvg8vDEgy6OYv49NWGqV4jPOmhNr2HbFJSIaQseHIMtInni4+le7U6Mwd7fsu3UNlax
         YXjnhk+sOx3L5+Z5ZPe0T6xlp99hnofjvuMQ5ddtQ3hMAf8x+mwIzTWjSH3GFn5CLFGg
         6lc8WiS8bMP6qCQ8OhARBJR/A6BmOiep/8KYd0vuu1wUQjsefGRTAqfAessbPKuw9z6M
         15WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792904605; x=1793509405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XvlUBd9t253/XOnBgnu6wcIP+Rj8CczN5W7bxz4QbhY=;
        b=kG5cvZ/G566RDx9zv2qQ7eDVMF4d8RuIlF7lv4j3OXIhRHnT4amh1EomHgS0AoX8Tq
         HukdPO6+J+8C8ug2zHEumUepQZGKE+Nj9GwI2IcUi5swO+VVS+Xy/kJk3Vm0UpwIPW0L
         md3hXhO6A6pkI4zjPUijrZ1/5BKq6W7GtFEqQSBAy/qlg6cmHYgvsiLNDtkhVtoJ1KrG
         UItPc8pzQPtQmutW+6KGuDcnuNND2i/M03g8MeI/sfYwnuqtnP+mm0BcMALDZxgGIGuq
         1FeYT6Wm2x+cbzBvvuAfy19IIk59oHpL3fezkHE+pbG3yC6v/GxlD5+bH4wMdYabkMOK
         9P0g==
X-Forwarded-Encrypted: i=1; AKwUvBwEbL+s7j92wkj85MohVhaYVNn0nUfrUFrEloi2m7UUhbZu1aj5sf1jxSr+Ai5iqwMTUeqxIzV4FoNR2htwNei3Lw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJIOIwGGIaCLFFyd0BNyQCvXx+38u6m5oO3NVZTjOhwrE0N7g5U
	0XgaKOjV4eNKplvuf5V6VUNlM2O/Jhkrp6Us1K63vuVz31MqT8Uishd8fIHJLw==
X-Gm-Gg: AYBFou1dlRQPc7KQeRWPD8c41p1UTKohb1mfabinsK7rJsK1J7umzzZ1/EKWjX60MjI
	qM9fA8qasE1uJ0PfLV/EF2Ab5lXHrpT7NQGsimXNGMOKExZxB1Eu2VPJAvDzhn9jxzWYXCWMq4M
	IzmHr8UhmqJYWZJFufsuNcy+eUzZqTU0I8+q8Dhnhf+l+GsWvoPzZDFlsU1EvuX2dYN99PcPUsc
	S1YkR6Pr8WGU+dOE5ZLhqb4uMKE8KKF2SLy3mS65Sp3fiDBZTFqWTLtPWqN+HiAz1LzruHgYqYM
	nr533P/oV+kqCnVNwrIP9yms0jAQj/hVOrFf+VU1XVr9mZ1g/zCt6a4ezNafNF7gzrsPh97KCYX
	dvuU4Mm++CU93RW8lBbOdpipCv61CnfwqsCeXIqjNooEL4l6574RJVKGmPBEg9VE08F6o3b4x0a
	zo+VsBDH72NM9ygJMX9f3GsGNtqqPMEKo3limXXneCJ7AcK3MLuCgWLl+KiDKZQjpIUuUPd8r+a
	SpmG3Smcj5+JegOHQ6ct82fesiDhqMHfKz5lh+tkoJ6rAp9IISpF/pRV4/dy1HVmiJ50CfRyV4p
	bjPfcw6VxEdGeF7x1/f+4i7RVJ7Q1lpMvonUCZleN3c=
X-Received: by 2002:a05:7301:e0c1:b0:35c:85fa:5a61 with SMTP id 5a478bee46e88-369e865e4e6mr5016953eec.38.1792904605444;
        Sat, 24 Oct 2026 22:03:25 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm4710287eec.15.2026.10.24.22.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 22:03:24 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 22:03:15 -0700
Subject: [PATCH v4 4/4] ARM: s3c: crag6410: convert WM1250 and SPI0 GPIO
 lookup tables to property entries
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-samsung-kp-v4-4-e21253295e68@gmail.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
In-Reply-To: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-e56a4

Static property entries support defining GPIOs and are more similar to
device tree properties and are not prone to losing link between device
and a lookup table because of changes in device name. Convert the board
to use them for WM1250 and SPI0 devices.

This also fixes issue with recent conversion to GPIO descriptors
where GPIO lookup tables were specifying incorrect GPIO chip name
("GPIO<N>" vs "GP<N>").

Fixes: 10a366f36e2a ("ASoC: wm1250-ev1: Convert to GPIO descriptors")
Fixes: a45cf3cc72dd ("spi: s3c64xx: Convert to use GPIO descriptors")
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/devs.c          | 35 -----------------
 arch/arm/mach-s3c/devs.h          |  1 -
 arch/arm/mach-s3c/mach-crag6410.c | 83 ++++++++++++++++++++++++++++-----------
 3 files changed, 59 insertions(+), 60 deletions(-)

diff --git a/arch/arm/mach-s3c/devs.c b/arch/arm/mach-s3c/devs.c
index 35b98a9a9237..7c8dc29b994b 100644
--- a/arch/arm/mach-s3c/devs.c
+++ b/arch/arm/mach-s3c/devs.c
@@ -335,38 +335,3 @@ void __init dwc2_hsotg_set_platdata(struct dwc2_hsotg_plat *pd)
 		npd->phy_exit = s3c_usb_phy_exit;
 }
 #endif /* CONFIG_S3C_DEV_USB_HSOTG */
-
-#ifdef CONFIG_S3C64XX_DEV_SPI0
-static struct resource s3c64xx_spi0_resource[] = {
-	[0] = DEFINE_RES_MEM(S3C_PA_SPI0, SZ_256),
-	[1] = DEFINE_RES_IRQ(IRQ_SPI0),
-};
-
-struct platform_device s3c64xx_device_spi0 = {
-	.name		= "s3c6410-spi",
-	.id		= 0,
-	.num_resources	= ARRAY_SIZE(s3c64xx_spi0_resource),
-	.resource	= s3c64xx_spi0_resource,
-	.dev = {
-		.dma_mask		= &samsung_device_dma_mask,
-		.coherent_dma_mask	= DMA_BIT_MASK(32),
-	},
-};
-
-void __init s3c64xx_spi0_set_platdata(int src_clk_nr, int num_cs)
-{
-	struct s3c64xx_spi_info pd;
-
-	/* Reject invalid configuration */
-	if (!num_cs || src_clk_nr < 0) {
-		pr_err("%s: Invalid SPI configuration\n", __func__);
-		return;
-	}
-
-	pd.num_cs = num_cs;
-	pd.src_clk_nr = src_clk_nr;
-	pd.cfg_gpio = s3c64xx_spi0_cfg_gpio;
-
-	s3c_set_platdata(&pd, sizeof(pd), &s3c64xx_device_spi0);
-}
-#endif /* CONFIG_S3C64XX_DEV_SPI0 */
diff --git a/arch/arm/mach-s3c/devs.h b/arch/arm/mach-s3c/devs.h
index 2737990063b1..90a86ade3570 100644
--- a/arch/arm/mach-s3c/devs.h
+++ b/arch/arm/mach-s3c/devs.h
@@ -27,7 +27,6 @@ extern struct platform_device *s3c24xx_uart_src[];
 
 extern struct platform_device s3c64xx_device_iis0;
 extern struct platform_device s3c64xx_device_iis1;
-extern struct platform_device s3c64xx_device_spi0;
 
 extern struct platform_device s3c_device_fb;
 extern struct platform_device s3c_device_hsmmc0;
diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index 2855d6d32fa3..330e8cf12ddc 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -443,7 +443,6 @@ static struct platform_device *crag6410_devs0[] __initdata = {
 
 static struct platform_device *crag6410_devs1[] __initdata = {
 	&crag6410_dm9k_device,
-	&s3c64xx_device_spi0,
 	&crag6410_lcd_powerdev,
 	&crag6410_backlight_device,
 	&speyside_device,
@@ -777,17 +776,22 @@ static struct wm831x_pdata glenfarclas_pmic_pdata = {
 	.disable_touch = true,
 };
 
-static struct gpiod_lookup_table crag_wm1250_ev1_gpiod_table = {
-	/* The WM1250-EV1 is device 0027 on I2C bus 1 */
-	.dev_id = "1-0027",
-	.table = {
-		GPIO_LOOKUP("GPION", 12, "clk-ena", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("GPIOL", 12, "clk-sel0", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("GPIOL", 13, "clk-sel1", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("GPIOL", 14, "osr", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("GPIOL", 8, "master", GPIO_ACTIVE_HIGH),
-		{ },
-	},
+static const struct property_entry crag_wm1250_ev1_properties[] = {
+	PROPERTY_ENTRY_GPIO("clk-ena-gpios",
+			    SAMSUNG_GPIO_NODE('N'), 12, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("clk-sel0-gpios",
+			    SAMSUNG_GPIO_NODE('L'), 12, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("clk-sel1-gpios",
+			    SAMSUNG_GPIO_NODE('L'), 13, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("osr-gpios",
+			    SAMSUNG_GPIO_NODE('L'), 14, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("master-gpios",
+			    SAMSUNG_GPIO_NODE('L'), 8, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node crag_wm1250_ev1_swnode = {
+	.properties = crag_wm1250_ev1_properties,
 };
 
 static struct i2c_board_info i2c_devs1[] = {
@@ -800,7 +804,8 @@ static struct i2c_board_info i2c_devs1[] = {
 	{ I2C_BOARD_INFO("wlf-gf-module", 0x24) },
 	{ I2C_BOARD_INFO("wlf-gf-module", 0x25) },
 	{ I2C_BOARD_INFO("wlf-gf-module", 0x26) },
-	{ I2C_BOARD_INFO("wm1250-ev1", 0x27), },
+	{ I2C_BOARD_INFO("wm1250-ev1", 0x27),
+	  .swnode = &crag_wm1250_ev1_swnode, },
 };
 
 static struct s3c2410_platform_i2c i2c1_pdata = {
@@ -904,15 +909,48 @@ static void __init crag6410_setup_leds(void)
 
 static struct dwc2_hsotg_plat crag6410_hsotg_pdata;
 
-static struct gpiod_lookup_table crag_spi0_gpiod_table = {
-	.dev_id = "s3c6410-spi.0",
-	.table = {
-		GPIO_LOOKUP_IDX("GPIOC", 3, "cs", 0, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("GPION", 5, "cs", 1, GPIO_ACTIVE_LOW),
-		{ },
-	},
+static const struct software_node_ref_args crag6410_spi0_gpio_refs[] = {
+	SOFTWARE_NODE_REFERENCE(SAMSUNG_GPIO_NODE('C'), 3, GPIO_ACTIVE_LOW),
+	SOFTWARE_NODE_REFERENCE(SAMSUNG_GPIO_NODE('N'), 5, GPIO_ACTIVE_LOW),
+};
+
+static const struct property_entry crag6410_spi0_properties[] __initconst = {
+	PROPERTY_ENTRY_REF_ARRAY("cs-gpios", crag6410_spi0_gpio_refs),
+	{ }
+};
+
+static const struct resource crag6410_spi0_resource[] __initconst = {
+	[0] = DEFINE_RES_MEM(S3C_PA_SPI0, SZ_256),
+	[1] = DEFINE_RES_IRQ(IRQ_SPI0),
+};
+
+static const struct s3c64xx_spi_info crag6410_spi0_platform_data __initconst = {
+	.num_cs = 2,
+	.cfg_gpio = s3c64xx_spi0_cfg_gpio,
 };
 
+static const struct platform_device_info crag6410_spi0_info __initconst = {
+	.name		= "s3c6410-spi",
+	.id		= 0,
+	.res		= crag6410_spi0_resource,
+	.num_res	= ARRAY_SIZE(crag6410_spi0_resource),
+	.data		= &crag6410_spi0_platform_data,
+	.size_data	= sizeof(crag6410_spi0_platform_data),
+	.dma_mask	= DMA_BIT_MASK(32),
+	.properties	= crag6410_spi0_properties,
+};
+
+static void __init crag6410_setup_spi0(void)
+{
+	struct platform_device *pd;
+	int err;
+
+	pd = platform_device_register_full(&crag6410_spi0_info);
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create spi0 device: %d\n", err);
+}
+
 static void __init crag6410_machine_init(void)
 {
 	/* Open drain IRQs need pullups */
@@ -941,18 +979,15 @@ static void __init crag6410_machine_init(void)
 
 	software_node_register(&crag_dcdc1_swnode);
 	i2c_register_board_info(0, i2c_devs0, ARRAY_SIZE(i2c_devs0));
-	gpiod_add_lookup_table(&crag_wm1250_ev1_gpiod_table);
 	i2c_register_board_info(1, i2c_devs1, ARRAY_SIZE(i2c_devs1));
 
-	gpiod_add_lookup_table(&crag_spi0_gpiod_table);
-	s3c64xx_spi0_set_platdata(0, 2);
-
 	pwm_add_table(crag6410_pwm_lookup, ARRAY_SIZE(crag6410_pwm_lookup));
 	platform_add_devices(crag6410_devs0, ARRAY_SIZE(crag6410_devs0));
 	platform_device_register_full(&crag6410_mmgpio_devinfo);
 
 	crag6410_setup_keypad();
 	crag6410_setup_gpio_keys();
+	crag6410_setup_spi0();
 
 	platform_add_devices(crag6410_devs1, ARRAY_SIZE(crag6410_devs1));
 	crag6410_setup_leds();

-- 
2.56.0.257.gf7497c7d27-goog


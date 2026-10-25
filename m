Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792904605;
	b=aQvNEwbE65OqdTsDDvKjFU1iPJ9Dq3ySHOSoFFAy5gtEg4J0avUVAqfjyv5Q5f3/OidL
	 XCeOWEt7BEa/Stkd1XG0urHgl/Ns3r0Jcp8xcuRKMfq/kE5WQEqoggx5ROEdNFuJzflmZ
	 L8iBm20kR0WjqleuHPZ/7b3nnLwYcj3eYdse6ucDSHa8cZbqWWvPaR8H5xdU8N39s0Znw
	 S0YNnxXYUDyA1Qg+uBTj46qAocqhONwzIF09NCSHsOVMX00CcPLfOksZXBrjrUaGSU4Au
	 sRBc+qOs+LuK0MRIAbZRGuRm7XPmM3iDMr86a6AnCgk1kwJ2hlnLA3jSHdZv8PRhiqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792904605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vg3iWXsq+9LQItsbYMV41+h+b+1SR3dvuRxMlkyE2es=;
	b=mNDniqn1KCDPXD0lh/DfwHHZcYo0FDNGxWyxhtFKU64B6bnqfOSKcaRW6Wyfdpp6+Kk9
	 mK4ML/DT/M+Iq7mKtXH40LdbWdw6IEUbIX1NZbDotLKnsuVrTZaAjlIh8wmIf4DFsGuh2
	 0agxV06WmJQindgfV1RzkN9fGkw1kFsNbqnBACHfGe7fkRr1vXOHKSfNv8GbERCeEqfRz
	 Z5YoDofW9wacppk8CsfwQGVZXUKMedsSO6X6/jZVh/My2pfSFcFEetiyWvYVPvpOgSkqG
	 jSWuP9KBXZ36qvWkfSRxOTtdzAOIgNyFjLR9g9M5adTB87IGV7gsb0aaLDUNsv5k5dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OmCdv2PJ;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4447606A32A
	for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Oct 2026 05:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4447606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OmCdv2PJ
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35943f55c06so2738060eec.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 24 Oct 2026 22:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792904604; x=1793509404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vg3iWXsq+9LQItsbYMV41+h+b+1SR3dvuRxMlkyE2es=;
        b=OmCdv2PJ98em17T1vz9qLSnw9CtEtpayphvyuCK8Pkaz6pU6nUU+VxVZTmjcABelq/
         QeiDXMvVZLqLNhP+e8Uc6dVneJTX6YAyTqnSKXZv7Rq37yxGK74LQOeVT6gFzEdr0hAT
         loHLT9jw5GdkEiZtIVErhzA4cWDWTLtDVsGmOpVF7rP7HR/qMMKsa9DEv41VZ179Hr8V
         JFInU7NmUTzae+dO3wOYM198XPq5woAbFOZRZl8LDDumyhk+VgX0BkTllYc+XkM1X1br
         R+cwhl4hTWahRgiUwmdggs54CZcc9fpvWJjdE1aZQXvV4upyC0JucbKt/hpvDOIJ8a0G
         J+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792904604; x=1793509404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vg3iWXsq+9LQItsbYMV41+h+b+1SR3dvuRxMlkyE2es=;
        b=i3aY5OtPxcHhQKPDwbBdQXlq9jy49uB5Snn0knIIJNFkzzZtYJVBo2msurU7Xpl2iS
         u6jXek3vSktuZv/l1MwqIDPa3cah4hWxYrvfd0F1BlCFoZboXZkBT3OfwfblpdCwAt/2
         2FOXIteXMl6ZnLwsM2gInPNEOXJyAy5AMR9DVm8OyjK9mIlz1NDiHqUaIJePl/j+srNw
         h7PKSdHUR11AChHC27r2tjwin0EA7yS5ISpFAdl0O+9uLwfqE5uKeoctE9gwBzj7jA31
         KeLw4L+pOw+5Ku36oy0WZg5ezX+CvRDhB3cNPafTdaPfzi0igcHS/lB4ovMDHI5wQxrs
         zn2A==
X-Forwarded-Encrypted: i=1; AKwUvBxT2hTaou9BHHWN3/OEyBwwy2McjmDEvTL3gYhRKJT7Vbg1QcsRg+LQOMTJKP075gvpqTkJa5fLJ0rSROy6KWYT1Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYJO39NGiFzfaBWsfDD98F3KA9n+lFEBwl+IYyF42gnQ2lDpkjHa
	EL8WG/u3WpARIrhTAPfw2pb6TV5d9y9DU/BZZt3YYXvrBL0BuFPHDXhd1ro9mA==
X-Gm-Gg: AYBFou3NPIgLqEIsGnuS5VgYyNE5bhfXi14TUa1Dnv2AZfV2XNrdHhvcszSK6iaTQJx
	7OPwhSUqISGHOqiIk/rQN5vcHCtyWnQPZRRUMI0Mn/+2f9iNl59yxIcp4Xa8LOlHkhVB+jkDqcY
	/uzeMRryZ/MsvTcYrAoWSaelbBs3n2K3v+rXg/dFVPDOPQORshfINJtYBmpM9PlSV4VlqxnjRkh
	iV+bfN88SDnbOgiAXJjBdpE6e+HLgP36Kx06iQfTfgDODEq8Tzd0xeDhKDGzIXEGIUNYBVLixOE
	DWwgNYfda9s47qTaoitj5w/sgKAGK4M0i/1CP1Dk63pJmpUzX+f1qJk01p8er8AN6+gamQOgEw7
	S6zxvJ8JJbHPcba4g8jmV+aS/jRz3COTbkh3QvdB+PqICPa/GxsL2y3BIOpBG4dmcbyiRDRtsV2
	UXBJ73S5VgiWWo3nerkrVEm35/8PTfkh/Dcwwd33nXamzlDRb/7GjHSVImeif9hIQ83rWpMHYTA
	EeKXRxM3TXrXBu6XjjPvO4BtUS4nzzG9Lq0a3ej2fy5/uKMyHo1ujv0WggeZ7/tqgi2ODlnWbc6
	sPCM/kumfvJAjIi1iuq0UnhL7zz5xuDz2xF+G7W69uo=
X-Received: by 2002:a05:7301:5808:b0:369:dc59:7a6f with SMTP id 5a478bee46e88-369e866b781mr8368007eec.1.1792904603687;
        Sat, 24 Oct 2026 22:03:23 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm4710287eec.15.2026.10.24.22.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 22:03:23 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 22:03:14 -0700
Subject: [PATCH v4 3/4] ARM: s3c: crag6410: convert basic-mmio-gpio and
 LEDs to software properties
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
Message-Id: <20261024-samsung-kp-v4-3-e21253295e68@gmail.com>
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

Convert the basic-mmio-gpio device and the GPIO-controlled LEDs on the
Cragganmore 6410 board to use software nodes/properties. This allows
removing the crag_leds_table GPIO lookup table.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/mach-crag6410.c | 117 +++++++++++++++++++++-----------------
 1 file changed, 64 insertions(+), 53 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index d0ec7697f366..2855d6d32fa3 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -319,12 +319,17 @@ static const struct property_entry crag6410_mmgpio_props[] = {
 	{ }
 };
 
+static const struct software_node crag6410_mmgpio_node = {
+	.name		= "basic-mmio-gpio",
+	.properties	= crag6410_mmgpio_props,
+};
+
 static struct platform_device_info crag6410_mmgpio_devinfo = {
 	.name		= "basic-mmio-gpio",
 	.id		= -1,
 	.res		= crag6410_mmgpio_resource,
 	.num_res	= ARRAY_SIZE(crag6410_mmgpio_resource),
-	.properties	= crag6410_mmgpio_props,
+	.swnode		= &crag6410_mmgpio_node,
 };
 
 static struct platform_device speyside_device = {
@@ -835,61 +840,68 @@ static struct s3c_sdhci_platdata crag6410_hsmmc0_pdata = {
 	.host_caps		= MMC_CAP_POWER_OFF_CARD,
 };
 
-static const struct gpio_led gpio_leds[] = {
-	{
-		.name = "d13:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d14:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d15:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d16:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d17:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d18:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d19:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d20:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
+static const struct software_node crag6410_leds_node = {
+	.name = "leds-gpio",
 };
 
-static struct gpiod_lookup_table crag_leds_table = {
-	.dev_id = "leds-gpio",
-	.table = {
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 0, "cs", 0, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 1, "cs", 1, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 2, "cs", 2, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 3, "cs", 3, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 4, "cs", 4, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 5, "cs", 5, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 6, "cs", 6, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 7, "cs", 7, GPIO_ACTIVE_LOW),
-		{ },
-	},
-};
+#define CRAG6410_LED_NODE(_idx, _name)					\
+static const struct property_entry crag6410_led##_idx##_props[] = {	\
+	PROPERTY_ENTRY_STRING("label", _name),				\
+	PROPERTY_ENTRY_GPIO("gpios", &crag6410_mmgpio_node,		\
+			    _idx, GPIO_ACTIVE_LOW),			\
+	PROPERTY_ENTRY_STRING("default-state", "on"),			\
+	{ }								\
+};									\
+static const struct software_node crag6410_led##_idx##_node = {	\
+	.parent = &crag6410_leds_node,					\
+	.properties = crag6410_led##_idx##_props,			\
+}
 
-static const struct gpio_led_platform_data gpio_leds_pdata = {
-	.leds = gpio_leds,
-	.num_leds = ARRAY_SIZE(gpio_leds),
+CRAG6410_LED_NODE(0, "d13:green:");
+CRAG6410_LED_NODE(1, "d14:green:");
+CRAG6410_LED_NODE(2, "d15:green:");
+CRAG6410_LED_NODE(3, "d16:green:");
+CRAG6410_LED_NODE(4, "d17:green:");
+CRAG6410_LED_NODE(5, "d18:green:");
+CRAG6410_LED_NODE(6, "d19:green:");
+CRAG6410_LED_NODE(7, "d20:green:");
+
+static const struct software_node *crag6410_leds_swnodes[] = {
+	&crag6410_leds_node,
+	&crag6410_led0_node,
+	&crag6410_led1_node,
+	&crag6410_led2_node,
+	&crag6410_led3_node,
+	&crag6410_led4_node,
+	&crag6410_led5_node,
+	&crag6410_led6_node,
+	&crag6410_led7_node,
+	NULL
 };
 
+static void __init crag6410_setup_leds(void)
+{
+	struct platform_device_info leds_info = {
+		.name	= "leds-gpio",
+		.id	= PLATFORM_DEVID_NONE,
+	};
+	struct platform_device *pd;
+	int err;
+
+	err = software_node_register_node_group(crag6410_leds_swnodes);
+	if (err) {
+		pr_err("failed to register leds software nodes: %d\n", err);
+		return;
+	}
+
+	leds_info.fwnode = software_node_fwnode(&crag6410_leds_node);
+
+	pd = platform_device_register_full(&leds_info);
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create leds-gpio device: %d\n", err);
+}
+
 static struct dwc2_hsotg_plat crag6410_hsotg_pdata;
 
 static struct gpiod_lookup_table crag_spi0_gpiod_table = {
@@ -939,12 +951,11 @@ static void __init crag6410_machine_init(void)
 	platform_add_devices(crag6410_devs0, ARRAY_SIZE(crag6410_devs0));
 	platform_device_register_full(&crag6410_mmgpio_devinfo);
 
-	gpiod_add_lookup_table(&crag_leds_table);
 	crag6410_setup_keypad();
 	crag6410_setup_gpio_keys();
 
 	platform_add_devices(crag6410_devs1, ARRAY_SIZE(crag6410_devs1));
-	gpio_led_register_device(-1, &gpio_leds_pdata);
+	crag6410_setup_leds();
 
 	regulator_has_full_constraints();
 

-- 
2.56.0.257.gf7497c7d27-goog


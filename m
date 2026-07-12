Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119DC3672B8
	for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Jul 2026 02:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783822402; cv=none; b=UbtYubtj9FiPpeE027U8eqiv80his8CJWHyMxHIvRYtvi+PlySdAm095eL7F5kkeftPl3YCTkgbOqWKab9ke+Ssvixsc0xqGGJVic5/LOhYEQsjj1z6EOZ74avSE3Dbnk2dM7ZA6tHjOfFFgSyih+AsFvqSRAhB5kMW2RHzz96k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783822402; c=relaxed/simple;
	bh=pmB1LThOcInNAZpQUCAtiEt2zBXBXKrElnYapsWXDNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oYfHTEBNtP1bhEWH51izYMHUyFI9IpimG63EXDxx/YFMV6caqUbzxDk+h+lYJoGB+DffkiIqTr8TwFk42eilCUXoTwRbHT3jKcaqrb1Es52st6KJgw9COO44yM0VsqvIH5jIA0L1IQ7Vj4n0wfi/wrVP4ybEwD9nxJDqFppWwU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qkr8Kl8f; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qkr8Kl8f"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3847e8b0f3aso1820623a91.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 11 Jul 2026 19:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783822397; x=1784427197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D66XWjgtUCsx9ojkNcJlPyxMEJV2A88EMZ1xU4Y6xY8=;
        b=Qkr8Kl8ft7bX78aIbXcFrAflWLjsCDAiBl6Rg8CcpRAYdgbrN1AFXIkUxtWay4IbBk
         ML8139CccmJ+wldJBul2daIBhjIpLDAZ8ZmvOwaAhv2u61SF4FShKKLc9Kc4GFKAMWyV
         3yGdapoi8DV2fM2PPQs4dRQ8K6KfWfJ4TYF+XPTorrXZ6WY3dyY4w2X0UUn1pVietQrp
         o7nkDEbRNmD+/3PQ4k7Kl8vHdLvry9CCutVP7B7ICv4Zx7pxWO95U8z/5/rdZx3G9ol3
         MQiVwCX6oxvQhgI+22pgyIUvhrUvMwujVyZ3C4zsNVXPmwa4NOOTOOC5CPg2tztUZU+z
         wRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783822397; x=1784427197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D66XWjgtUCsx9ojkNcJlPyxMEJV2A88EMZ1xU4Y6xY8=;
        b=IoPDCh0mmtLR34KZH49cEoNtMkqLo0JsPqE4WXMvyENu8bYItQ6FpFgEiWnO1THnuB
         WqeVZv1XPGazP0sgMuPI6Gq0gqQCxk+XnCA+jgKUx3ROXtxS3eq8IafvLReGBzoJV3nq
         aSDYkeQZWTxwwxyIwa1B6RN3mgClBKMR+3KnEDKYRM/fOOs1C60mNFeB08V4ThnafudA
         K667HfOjRrdl6CXaCD09P6d/mZgqtjFtLTo0UwLa9wEnEFxru+v6HrEVHwveLQFCUNkx
         VjAZnJaeo0W/Y+pNjUEDcQjAFUU9mT7+L/5B52RxMosYpc25bttBsskP9IfCZqRGyPoL
         CJ0Q==
X-Forwarded-Encrypted: i=1; AHgh+RqXjT9P25JmROfHqdJ8JoA3TLpz1r5DzQZFE/SyM7hCp8QUYQcZkF/moic4xNuvRnZ30qrQenHtPR9aSwIkYK2fAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzP/qR+C7Y3vaPDnw2dRCSx+VN5UZPilRnVblevqT68esz/tPq/
	Ckv6Mh9dNp2BFNN8ud7pSltD4Djr9uGpIL501pKBJwvMli0ZsdKusY0g
X-Gm-Gg: AfdE7cnupaVWeKVkzvyJh+RJ2F3Q34tKPO+bBhlsIHC63QODCvbWZUI6jzLIKljaUqa
	6TfVxLfwCxAO0DUUEJQOnXFxG8Qr6UnG7zoqt+06t+D5t46mSqtgEO9OEQzz0b/piCzGHxvmzIx
	AG3Yq8V3aWLv/wcCQ4HyeGfc+kxeskDHfQeFfJbqBB1+pLtQsdJJKC+eQxhh39o+LfadOqUqeKm
	fI9fEAPXLHWJEvDEkdKQFsucKQTmN7bVtUFps10BeLag+A+r3+JrX1q2OqVLm7To491M/bzGaqx
	DUMncH7CksSFDbOIOB6L/T82+4MJzEmxPpkpwONt91RMZGxcHUaG6S4G/tt341b7H6U2MxS78bA
	+FD29BzF6+VPDNdUJWZqpXzO2aLc7FNPNo5iF43sxc6Jo4sYfxc4hDhm9RdV+MYYuI6tElk/3ub
	bPor8/FWchv6spjeq6sftZDSVEa95F08qv5lzWUJhOnmAgvVFW9OevOxjI84ezN58c1sqgOqR5k
	cI=
X-Received: by 2002:a17:90b:5686:b0:37f:9ce1:cdb3 with SMTP id 98e67ed59e1d1-38dc77993ecmr4169672a91.33.1783822397411;
        Sat, 11 Jul 2026 19:13:17 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c63e:9756:a95c:c75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm54796692eec.18.2026.07.11.19.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 19:13:16 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 11 Jul 2026 19:12:50 -0700
Subject: [PATCH v3 09/10] ARM: s3c: crag6410: convert basic-mmio-gpio and
 LEDs to software properties
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-samsung-kp-v3-9-b2fcaba77aff@gmail.com>
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
 patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-b242f

Convert the basic-mmio-gpio device and the GPIO-controlled LEDs on the
Cragganmore 6410 board to use software nodes/properties. This allows
removing the crag_leds_table GPIO lookup table.

Assisted-by: Antigravity:gemini-3.5-flash
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/mach-crag6410.c | 117 +++++++++++++++++++++-----------------
 1 file changed, 64 insertions(+), 53 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index 1abf08fdb543..1ba3d47d85b7 100644
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
2.55.0.795.g602f6c329a-goog


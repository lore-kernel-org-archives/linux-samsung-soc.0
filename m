Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7EF3A63FB
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jul 2026 04:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783572799; cv=none; b=iXdQwrhF8P/F+oSi6rS++4DJH97df0QDuCUJiADVbaGxXNcyBxPe4ak3nkUT7RmP3qCbNnRgOleOTAAYemQYnYNoanZfncot1Tf/Sqn3MJopGpJQofqZH0aJy//ZiTXaZyI0iRjevFKm8Y3vGQqfb51WTA3oacijRAgdXGCln/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783572799; c=relaxed/simple;
	bh=9RZLgjDE2ZgFKwEU/deeEVTnk74v+Mua72aOBzyuDBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=haodDGnASz4DTPkXy84cDytgzuN5nNVWMqgKyIOdqxadfkMeShyupuxELVno9CHwXHDzIjABA8qZIiyvoN+hPIenESzxrvhjO7MJJM4xuoa6YS9++RSnT7tQlQbkOIx0hlflQ7go5f36C7AjWfrxDk3QdxYRXseb7zzvHTt00R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MfrsQLYt; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfrsQLYt"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso828019a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Jul 2026 21:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783572797; x=1784177597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g68sAzI9q3vaKyqY3YH6kGACv1PDnX+8oCrf0C6vpMw=;
        b=MfrsQLYt6XGaSyEhAQliK3jcgAA+iGsvviB26QWS1y+WcVhfpRdJOrUmcXJpiB4BlN
         MBFZeAwKQ4jaSUeZqv39BCRKXYntpBw4WGOyo7Ceg8aRmK+Juvf33IW4V/MGNL8duaTW
         CpkJ0G4tFJoQJcBMq7IPuB02ffMKXZ/dYSQ3ss1z2g1x5SPMwjvfNS1rduww6hAjIOcb
         q8kSXlifh27EEJuWMxC2UUk4lMd2S2k8vHCdQmhC+lmj944ODNF5fobdHCH9h6UB6Clf
         FqYER4Xhw68leJrOr2mtFwJNULotxP1KqoOUqrRfgO4Y7g0rVXvYQwuOz/OYhxWOW+GL
         YdaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783572797; x=1784177597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g68sAzI9q3vaKyqY3YH6kGACv1PDnX+8oCrf0C6vpMw=;
        b=CkgPUfH/M1GTzjOaXorLmBao9PiZNstkrA+0ptAcgDnddPQHCJHx+PlOam+1pL42aN
         nRX8h7ZQlXs6QPm1ZaB7PH5GBazxiUW1aUde19xHCl+ROE+88BMzj6ksgbkUtFGOri/F
         dbb4c2JJcHNAgpGGZZbtB3SmzPoA3W1AEivrEPDNl3b3jiy99hcqP3XXCwlJEgchl+Zx
         EHzkuC/ZI2H9uumBieEdDKA48q1sHEeN6V5tD/ha+ZHlZXkpmSsEQDFv2/Bv7Puk/oSo
         0Bhj43m/H9kFxWYAyJR3yUb0+tMqK8oKSrk4tQFRCzpNoQKaV6DLdv+Lexmvm40QWCw8
         U6hA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1vP8mr5ZBk1TQAVHThicQ9sTt+y9F73wkaEkGa5vfIxZAIkO9ZawFXFxZkJtDFRjVljK21NPa9muxbZRoiayM2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzceUTNdgMyKPPN6rhY/lfZl9hGFNdaAWEHYjtio+hNrwgSRL/z
	2xTh4xnF4IM0mgcqfPyFroESQb51VX+SJvxCZVlTAbKq+ypf4v6YsQQ1
X-Gm-Gg: AfdE7clP0woWql58iW4kFPTpqP/UTydd4pGop5G3zJMLw3RuMybQoTsTswaU755eop7
	h4+i40fM1b9f+gyBHD6ym9tSgQDQ39Dc6dchWsRAjRRojMRwyVjMxoDKbbgGoGiNhEgCBJW9vcV
	kIqOoyAnONMmgTyxNONyHpiWr4mBISPtykmAc+3C/8yzodf0AObpqYm5f2oHck3dAm7A5+YnxPo
	sLLQ4Ou3jHDpSCJ1tu8wQNUrdsQYxz7JixCgISIKeGFRxozu+9aPW6zQ9tsT74s1gYRSQnyQZLN
	rz8jbikFI+CttwP/LIkNOYMq8q7ARAhXOqZmtths2BJhE/e0+g5uVvIZP1qmieT9NnayovViFyh
	mJbF0X2C7RaTHULtHGgHqN6M27HO6AVnPeKIpYV7PIsXwjowlNABcWqm+7B+8IGDgbPosu+Rb6G
	M7lVSMYZXC/o1xowfhXEkKx5z5VIKSemx2VzrVq3mXbERaRza+v5pBc7hzZP7vHimuWo2TdgFek
	ncs
X-Received: by 2002:a05:6a20:431f:b0:3bf:6c05:ac with SMTP id adf61e73a8af0-3c0bcc26ademr6559980637.59.1783572797080;
        Wed, 08 Jul 2026 21:53:17 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e229:88c8:fd09:9a39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm26559252c88.0.2026.07.08.21.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:53:16 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 08 Jul 2026 21:53:04 -0700
Subject: [PATCH v2 06/11] ARM: s3c: crag6410: use software nodes/properties
 to set up GPIO keys
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-samsung-kp-v2-6-3c6ed4c9b3b6@gmail.com>
References: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
In-Reply-To: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
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

Switch the gpio-keys device to use software inodes/properties to
describe the buttons and switches. This will allow dropping support
for platform data from the gpio-keys driver in the future.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/mach-crag6410.c | 79 ++++++++++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 21 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index 6354fc2a49b8..9682ef67b866 100644
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
 		pr_err("failed to instantiate keypad device");
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


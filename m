Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677F73A7D74
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jul 2026 04:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783572794; cv=none; b=j9zLhbJVkJ56WutYuteZK+7kOWub0QMpqQAxWReRoIHFbMmAahEcEseRaYhRezBLzSO/s3Au/MbVlCj9Iu1PhT+7Wtt8TSfRQaK13aUDXuaR9mEJZkJ51d7MciXHiWAvG0waunVyOhiRDOHhdVl6ue8k2qeTK3VIiLx60PTBmMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783572794; c=relaxed/simple;
	bh=Aa8/tCM1ApLXKZkJcKryWFnh2SHR/kivNvljiBKqaVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B7VTg5BE9CUKDl4mooUrzExsaOSgEZ/Rv9MzduRb6A3SpTLlOhSlPztnfein3EqFK2iaP+v2NHbpherWbF1e6qRm2XV5h0P38oehcw6uc9aEmrHd0MzZ9HGGrY4AqjGD5uvlFQwAJMAntXwx2/bGUFO0VCHv/pQQclbV9t1MBNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYzlboLp; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYzlboLp"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8482074a000so1210144b3a.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Jul 2026 21:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783572791; x=1784177591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8VrzxACgA2dOPOHl6AhU6CQRJ0KF6yC3uD65WRmQ9s=;
        b=aYzlboLpg0OHTX+M06h7O6C1EeEfHvOW1mwgKK7m05rC5kxZ15YRjohT2MrLxETARy
         mPIXjkxmU5Tu08f8dI/faol9b/Jd1i3KWfEOHRyVQHN/6PsoQ7unJD11FJCOG1Dih+tu
         /iYuhaQQj8TWUBM0zo0VDDtOoLr5t2JxTJyDswWDZhWGGYmM1Xl5qsrwCUKNO5TVygAt
         Vp4Rk3gt/i9thd/9c/5CH2/D6awG04pRDFHfMtJG+CPwj6VmwCnt3SDS4ypO+OHWVnPi
         tN4JpbpFHbAl/+BHw3f0GxQo2vClGhfYvZGCDxrjxUxS3xP6HxIGZn33ocRLYX5mo2zD
         NO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783572791; x=1784177591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8VrzxACgA2dOPOHl6AhU6CQRJ0KF6yC3uD65WRmQ9s=;
        b=JLUOTcrYq8T8OsCc0vJxQKq80Iw3guVBgGqE1d456ef1oi9CaybVvbq9SWPzc3uWSl
         kM6HAdwM7mjDahgY6SnJ0ukD3ITfNXRz66PERsfipwwg7GAb1w6shfZ3/GnpdkTenksS
         UtoRczst/FlAJYf54p5KFuQTwPq8s05CnZU2zOd0Cx6tSNzIJiDDUgkomgF82qx5Tbxi
         znGCGPCBbBoQ3j7+f0wU7Z9BW6Gf/DLEkBD/PksmX/oaQgRXaPzcpb9DpxW3wnxaa+6Q
         ztn9yWjRNt6ljFAgDEd4wh+85twEyWUQv7P3DdaWa/SwHWtJg/AM/jg4fEMlOr++C+Z4
         ZxdQ==
X-Forwarded-Encrypted: i=1; AHgh+RqqQAT/Zf6r0kazUKeZt79UAAl8pqkcARhOmJhGqNsTmLoncX0nWulyIdjCVaFgZK0t+ysTPIFelVlBuI72nubNHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ7/OKmNKHRxpZKk9wrvzmvvcFkSruGMcii1VLmKauJZ2oGA10
	MQkqqcrlqk6DC1D3QDzzHgciuK3/uyqtSXl9d8vYqDXaf24TkcqRF43P
X-Gm-Gg: AfdE7cnNVcnXqIBCCFUnRqWg8pe24ViV57GkvUEn8axbIWA773ZunXr2q29K/Ayllxd
	mDAnHem7lOM2/YRkRk0NpMYxZrPDb5XuUzgzMRSvDlOpfDaRdTfYdlZpqeO4Jiu4tOiXiZFel+6
	nL13tMZPoBiPwNV4NVcaDXSmZn6SduQtkjW8Oc7AE1SbV7Zm4iT5EY39hsoeNuxetjv9KAcBDk8
	EIdquAAYYDBlMZEH2yX1sgdBKPSoX+nAmFQKtWlLjpgc0yXCQmiOvtAGLyGaDLtq3hXfBnqouME
	1eMlXX67/iB1yr9jaduT4WV+9KyHW3vQUsPXv4EVqc6e7udJJEsb/KmAS5NhX9kssJrnk1Md2vr
	Zwxlh083k7uP6c9KqOnnO8aIZGjHSB/+jOoeUGsh3qKnh8p3slaPniJXeQULfucjqSkqMID/DcR
	mtuNUz/zPcegDPeKBieKx+sAolCaqV55vY7SAdDh1gRs5qWxAx7EJDPXfhH+6sfLIVRRFLuGKo+
	dXN
X-Received: by 2002:a05:6a21:d82:b0:3bf:bde7:d66f with SMTP id adf61e73a8af0-3c0bc8aa661mr6031384637.2.1783572790764;
        Wed, 08 Jul 2026 21:53:10 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e229:88c8:fd09:9a39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm26559252c88.0.2026.07.08.21.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:53:09 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 08 Jul 2026 21:53:01 -0700
Subject: [PATCH v2 03/11] ARM: s3c: register and attach software nodes for
 Samsung gpio_chips
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-samsung-kp-v2-3-3c6ed4c9b3b6@gmail.com>
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
 patches@opensource.cirrus.com
X-Mailer: b4 0.16-dev-b242f

Define and register software nodes for the Samsung GPIO chips on legacy
(non-DT) platforms.

Attach the matching software node to each gpio_chip's fwnode during
registration, using the bank label to calculate the index.

This provides the infrastructure for converting board files and drivers
to use software nodes/properties instead of legacy platform data or GPIO
lookup tables.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/gpio-core.h            |  3 ++
 arch/arm/mach-s3c/gpio-samsung-s3c64xx.h |  5 +++
 arch/arm/mach-s3c/gpio-samsung.c         | 72 ++++++++++++++++++++++++--------
 3 files changed, 63 insertions(+), 17 deletions(-)

diff --git a/arch/arm/mach-s3c/gpio-core.h b/arch/arm/mach-s3c/gpio-core.h
index 6801c85fb9da..464b0d02f102 100644
--- a/arch/arm/mach-s3c/gpio-core.h
+++ b/arch/arm/mach-s3c/gpio-core.h
@@ -14,6 +14,8 @@
 #include "gpio-samsung.h"
 #include <linux/gpio/driver.h>
 
+struct software_node;
+
 #define GPIOCON_OFF	(0x00)
 #define GPIODAT_OFF	(0x04)
 
@@ -66,6 +68,7 @@ struct samsung_gpio_cfg;
  */
 struct samsung_gpio_chip {
 	struct gpio_chip	chip;
+	const struct software_node *swnode;
 	struct samsung_gpio_cfg	*config;
 	struct samsung_gpio_pm	*pm;
 	void __iomem		*base;
diff --git a/arch/arm/mach-s3c/gpio-samsung-s3c64xx.h b/arch/arm/mach-s3c/gpio-samsung-s3c64xx.h
index 8ed144a0d474..fc21d3f50ce9 100644
--- a/arch/arm/mach-s3c/gpio-samsung-s3c64xx.h
+++ b/arch/arm/mach-s3c/gpio-samsung-s3c64xx.h
@@ -13,6 +13,8 @@
 
 #ifdef CONFIG_GPIO_SAMSUNG
 
+#include <linux/property.h>
+
 /* GPIO bank sizes */
 #define S3C64XX_GPIO_A_NR	(8)
 #define S3C64XX_GPIO_B_NR	(7)
@@ -89,6 +91,9 @@ enum s3c_gpio_number {
 /* define the number of gpios we need to the one after the GPQ() range */
 #define GPIO_BOARD_START (S3C64XX_GPQ(S3C64XX_GPIO_Q_NR) + 1)
 
+extern const struct software_node samsung_gpiochip_nodes[];
+#define SAMSUNG_GPIO_NODE(node)	(&samsung_gpiochip_nodes[(node) - 'A'])
+
 #endif /* GPIO_SAMSUNG */
 #endif /* GPIO_SAMSUNG_S3C64XX_H */
 
diff --git a/arch/arm/mach-s3c/gpio-samsung.c b/arch/arm/mach-s3c/gpio-samsung.c
index 81e198e5a6d3..b35cf62a9157 100644
--- a/arch/arm/mach-s3c/gpio-samsung.c
+++ b/arch/arm/mach-s3c/gpio-samsung.c
@@ -37,6 +37,28 @@
 #include "gpio-cfg-helpers.h"
 #include "pm.h"
 
+const struct software_node samsung_gpiochip_nodes[] = {
+	SOFTWARE_NODE("GPA", NULL, NULL),
+	SOFTWARE_NODE("GPB", NULL, NULL),
+	SOFTWARE_NODE("GPC", NULL, NULL),
+	SOFTWARE_NODE("GPD", NULL, NULL),
+	SOFTWARE_NODE("GPE", NULL, NULL),
+	SOFTWARE_NODE("GPF", NULL, NULL),
+	SOFTWARE_NODE("GPG", NULL, NULL),
+	SOFTWARE_NODE("GPH", NULL, NULL),
+	SOFTWARE_NODE("GPI", NULL, NULL),
+	SOFTWARE_NODE("GPJ", NULL, NULL),
+	SOFTWARE_NODE("GPK", NULL, NULL),
+	SOFTWARE_NODE("GPL", NULL, NULL),
+	SOFTWARE_NODE("GPM", NULL, NULL),
+	SOFTWARE_NODE("GPN", NULL, NULL),
+	SOFTWARE_NODE("GPO", NULL, NULL),
+	SOFTWARE_NODE("GPP", NULL, NULL),
+	SOFTWARE_NODE("GPQ", NULL, NULL),
+};
+
+#define NUM_SAMSUNG_GPIOCHIPS ARRAY_SIZE(samsung_gpiochip_nodes)
+
 static int samsung_gpio_setpull_updown(struct samsung_gpio_chip *chip,
 				unsigned int off, samsung_gpio_pull_t pull)
 {
@@ -491,6 +513,16 @@ static __init void s3c_gpiolib_track(struct samsung_gpio_chip *chip)
 }
 #endif /* CONFIG_S3C_GPIO_TRACK */
 
+static void __init samsung_setup_gpiochip_nodes(void)
+{
+	const struct software_node *group[NUM_SAMSUNG_GPIOCHIPS + 1] = { 0 };
+
+	for (unsigned int i = 0; i < NUM_SAMSUNG_GPIOCHIPS; i++)
+		group[i] = &samsung_gpiochip_nodes[i];
+
+	software_node_register_node_group(group);
+}
+
 /*
  * samsung_gpiolib_add() - add the Samsung gpio_chip.
  * @chip: The chip to register
@@ -506,12 +538,16 @@ static void __init samsung_gpiolib_add(struct samsung_gpio_chip *chip)
 	struct gpio_chip *gc = &chip->chip;
 	int ret;
 
+	gc->label = chip->swnode->name;
+
 	BUG_ON(!chip->base);
 	BUG_ON(!gc->label);
 	BUG_ON(!gc->ngpio);
 
 	spin_lock_init(&chip->lock);
 
+	gc->fwnode = software_node_fwnode(chip->swnode);
+
 	if (!gc->direction_input)
 		gc->direction_input = samsung_gpiolib_2bit_input;
 	if (!gc->direction_output)
@@ -659,49 +695,49 @@ static struct samsung_gpio_chip s3c64xx_gpios_4bit[] = {
 		.chip	= {
 			.base	= S3C64XX_GPA(0),
 			.ngpio	= S3C64XX_GPIO_A_NR,
-			.label	= "GPA",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('A'),
 	}, {
 		.chip	= {
 			.base	= S3C64XX_GPB(0),
 			.ngpio	= S3C64XX_GPIO_B_NR,
-			.label	= "GPB",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('B'),
 	}, {
 		.chip	= {
 			.base	= S3C64XX_GPC(0),
 			.ngpio	= S3C64XX_GPIO_C_NR,
-			.label	= "GPC",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('C'),
 	}, {
 		.chip	= {
 			.base	= S3C64XX_GPD(0),
 			.ngpio	= S3C64XX_GPIO_D_NR,
-			.label	= "GPD",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('D'),
 	}, {
 		.config	= &samsung_gpio_cfgs[0],
 		.chip	= {
 			.base	= S3C64XX_GPE(0),
 			.ngpio	= S3C64XX_GPIO_E_NR,
-			.label	= "GPE",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('E'),
 	}, {
 		.base	= S3C64XX_GPG_BASE,
 		.chip	= {
 			.base	= S3C64XX_GPG(0),
 			.ngpio	= S3C64XX_GPIO_G_NR,
-			.label	= "GPG",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('G'),
 	}, {
 		.base	= S3C64XX_GPM_BASE,
 		.config	= &samsung_gpio_cfgs[1],
 		.chip	= {
 			.base	= S3C64XX_GPM(0),
 			.ngpio	= S3C64XX_GPIO_M_NR,
-			.label	= "GPM",
 			.to_irq = s3c64xx_gpiolib_mbank_to_irq,
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('M'),
 	},
 };
 
@@ -711,25 +747,25 @@ static struct samsung_gpio_chip s3c64xx_gpios_4bit2[] = {
 		.chip	= {
 			.base	= S3C64XX_GPH(0),
 			.ngpio	= S3C64XX_GPIO_H_NR,
-			.label	= "GPH",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('H'),
 	}, {
 		.base	= S3C64XX_GPK_BASE + 0x4,
 		.config	= &samsung_gpio_cfgs[0],
 		.chip	= {
 			.base	= S3C64XX_GPK(0),
 			.ngpio	= S3C64XX_GPIO_K_NR,
-			.label	= "GPK",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('K'),
 	}, {
 		.base	= S3C64XX_GPL_BASE + 0x4,
 		.config	= &samsung_gpio_cfgs[1],
 		.chip	= {
 			.base	= S3C64XX_GPL(0),
 			.ngpio	= S3C64XX_GPIO_L_NR,
-			.label	= "GPL",
 			.to_irq = s3c64xx_gpiolib_lbank_to_irq,
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('L'),
 	},
 };
 
@@ -740,43 +776,43 @@ static struct samsung_gpio_chip s3c64xx_gpios_2bit[] = {
 		.chip	= {
 			.base	= S3C64XX_GPF(0),
 			.ngpio	= S3C64XX_GPIO_F_NR,
-			.label	= "GPF",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('F'),
 	}, {
 		.config	= &samsung_gpio_cfgs[7],
 		.chip	= {
 			.base	= S3C64XX_GPI(0),
 			.ngpio	= S3C64XX_GPIO_I_NR,
-			.label	= "GPI",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('I'),
 	}, {
 		.config	= &samsung_gpio_cfgs[7],
 		.chip	= {
 			.base	= S3C64XX_GPJ(0),
 			.ngpio	= S3C64XX_GPIO_J_NR,
-			.label	= "GPJ",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('J'),
 	}, {
 		.config	= &samsung_gpio_cfgs[6],
 		.chip	= {
 			.base	= S3C64XX_GPO(0),
 			.ngpio	= S3C64XX_GPIO_O_NR,
-			.label	= "GPO",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('O'),
 	}, {
 		.config	= &samsung_gpio_cfgs[6],
 		.chip	= {
 			.base	= S3C64XX_GPP(0),
 			.ngpio	= S3C64XX_GPIO_P_NR,
-			.label	= "GPP",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('P'),
 	}, {
 		.config	= &samsung_gpio_cfgs[6],
 		.chip	= {
 			.base	= S3C64XX_GPQ(0),
 			.ngpio	= S3C64XX_GPIO_Q_NR,
-			.label	= "GPQ",
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('Q'),
 	}, {
 		.base	= S3C64XX_GPN_BASE,
 		.irq_base = IRQ_EINT(0),
@@ -784,9 +820,9 @@ static struct samsung_gpio_chip s3c64xx_gpios_2bit[] = {
 		.chip	= {
 			.base	= S3C64XX_GPN(0),
 			.ngpio	= S3C64XX_GPIO_N_NR,
-			.label	= "GPN",
 			.to_irq = samsung_gpiolib_to_irq,
 		},
+		.swnode	= SAMSUNG_GPIO_NODE('N'),
 	},
 };
 
@@ -803,6 +839,8 @@ static __init int samsung_gpiolib_init(void)
 		return 0;
 
 	if (soc_is_s3c64xx()) {
+		samsung_setup_gpiochip_nodes();
+
 		samsung_gpiolib_set_cfg(samsung_gpio_cfgs,
 				ARRAY_SIZE(samsung_gpio_cfgs));
 		samsung_gpiolib_add_2bit_chips(s3c64xx_gpios_2bit,

-- 
2.55.0.795.g602f6c329a-goog


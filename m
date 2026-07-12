Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6943367B89
	for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Jul 2026 02:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783822388; cv=none; b=QsPM98IZK0eKhgfVY7cVnxmJEC1hYXoxnH9CyZNPcMwAt9NsBnSnxInehdYjY1Qqf4kFZyU4Cxr/3h7MNiz0AfDLzIyq9DT2zk5bUqsoxih76npz841FUWWk+cxmNpvdnPFYZ2NYNNtEod53XksnC7vrOk4wElG07bunl2rQhiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783822388; c=relaxed/simple;
	bh=GE6WrGfyy9P4IMx6v0tVdKrd6b48cdMay86cwwuTjQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p7KlUjf0FnjWbWHr0btRUIeAhrEzRzLOgFPZ7vfJaObibNnjokUUoVisAOhq9BkoXtgwm53vowRcttN6yk9Jwmm62xd63WRKTBGrTYvlQPmNXzaabP0/paGB1iC67l5FuQFCXsG2H14uH7kWQt74ucu8a0myGjylNWxwumjv+FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3d5yAXE; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3d5yAXE"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso2470829a91.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 11 Jul 2026 19:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783822385; x=1784427185; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/De877qrc3LI5SOFOCYuqXrG3akE0R4KYm/cFtv2XA=;
        b=l3d5yAXEOdoK4Rf5RQZsGeNxFD2OcNxclnTiw6Wf/xQhikng1+0LB7qlbcGd7F0l8Y
         +cQXK+TjV3+vFYQhRgw5cxXaVS0wcPl2XkhptBS6rgeLaVJrdQ+NmFbFvDEuFEPfRalv
         ZrCZUAiHjIbWZA8hs12Gw0nNHSH7F2UA5mPlUEiw79RP9ejP1znyAIA4pVaWjUvIc0W0
         fdqaTL0ZNYqTJURVWagtS2Zm5w61NIg74vZ9P3jNdN1gqcfvwkufHTJA7nWHHLyDKn/U
         eyKMz+Xjg6CxJjCmFcmr8CGsYZsJs7uDY3dSkcFvGYthqAxrFaXFTSGPcdfyLRfRbwR4
         Pcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783822385; x=1784427185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n/De877qrc3LI5SOFOCYuqXrG3akE0R4KYm/cFtv2XA=;
        b=YYkS9v6bP/18ZXwVUaga02UBLV+mMk6xvsE0F+rgC/9/j65z4kgZcJrzTISz2g9sEF
         q6vSTTlxr4LzdFyN65nTb5lhdFLtg/m1xAIwWIsumZ/3G477KZeLMywuyH9rhlcF1yAW
         nXl2FglpHvdUfrXD3zMvy50kSl1/myKY9sklf+7H4J7nD6owFR63G6lZUnvrBCNRvDoG
         7FgC04w6kgwN0ZT78HpyEbrDnmNGkSuwM3X2OXKgU5RLbE+gMDmOqSRl7OrZ3Vaig3yF
         6F6GTzioZV+fXTocq7HlXZxwt9DAU9WnLN/x4Vy2mh5Z9Vs+RlVrAQbyKpO7RBgQcos/
         fvfw==
X-Forwarded-Encrypted: i=1; AHgh+RrosOtUUak4Vl4mhokqyLMcpw7qtmMUjsU+YOqDTXURUr8CNUCUTIk1GtoDyAU7Ym1bryi2D0sOFEHkljG71HTtJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/2M0k9L7QdCSJKtinu7G1KLFrSiFd4mqWsVU2rkWsoLwZ1tdw
	jiWoOscaQAwRxHDqcAQNKYCr27PAoUSjkKOkJvt+UqdYZGw18cyK26Do
X-Gm-Gg: AfdE7cmEPxQqJdBy5YIP5h7jQGoXe9+yWjDgsDw+EIfO7fladGJ5b23Xk9KL1fnnpJ0
	JFvZ68i5/nqg++trHRCvsqNUSAabTOTISiWm3LggprUH0ZihZMHyDXGv7c2m3eXniEB2Y3JEkWn
	lB791ij7tz9ZdoElZAoIAov5qx+/O8/STo9DJWMSb2qqskG5Qqnz3FAHT5ebFz92BiHeK6GpNNZ
	OOLSs+EegALfhMUOop8+AGEHE2FLYeFeCuGJ/u34+witM2f1XP+d5qdX3Aff/NA5BJBr6w3YQRR
	62hdyBPrEGNBSIQWKSAxwiYjvbcoyqPEfA9b7aaubSpulVRHigHKCjbViaW6QR1dFLd4XZhqsmq
	Kx4bEICP6rluEgG1pKUjZBnDf6DxrGtlXy9HR+Y00UMOmxR8Jdfn2Bxcj2CKaM53f9j/6hMCKJp
	kXjDrVEGroETMPF2OQ/24ItexfcCcJ2w85V0tRavmOcHi3wRO5pzOaxx2Est5qy5csxS2Al32K0
	Vc=
X-Received: by 2002:a17:90b:3908:b0:384:a641:3fe with SMTP id 98e67ed59e1d1-38dc7737215mr4573280a91.21.1783822385166;
        Sat, 11 Jul 2026 19:13:05 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c63e:9756:a95c:c75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm54796692eec.18.2026.07.11.19.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 19:13:04 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 11 Jul 2026 19:12:44 -0700
Subject: [PATCH v3 03/10] ARM: s3c: register and attach software nodes for
 Samsung gpio_chips
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-samsung-kp-v3-3-b2fcaba77aff@gmail.com>
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

Define and register software nodes for the Samsung GPIO chips on legacy
(non-DT) platforms.

Attach the matching software node to each gpio_chip's fwnode during
registration, using the bank label to calculate the index.

This provides the infrastructure for converting board files and drivers
to use software nodes/properties instead of legacy platform data or GPIO
lookup tables.

Assisted-by: Antigravity:gemini-3.5-flash
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
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


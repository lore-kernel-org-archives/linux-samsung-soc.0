Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8D520FABA
	for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Apr 2025 08:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745483750; cv=none; b=pyCgKzhy4vFOz+te9lmKIk1HOxXnz9v48r+jxqsN1Su3NCOvEsOA1m+HDViFBtgqSkutxeaW25RXf+knZJDe7JmoxGYZW7UwxmiRzBjOukq3u84vZ+WOiWrDyr0vGObgKSWbuAKf5zZu9y17Y/mCZfnHlAlMH0NfWP5hs9TO94c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745483750; c=relaxed/simple;
	bh=ovjQNuF7R1QswkZHk1xWWMofsRGkvHDmqTWp1n+FvO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jbmz+3trwrOo1UkevfaWm95EsCab+MnbTxD6SHoz3RFgliCsNMcHpdRpG9EIAyDkmFPd46wJXa5ojr59Wa2/hIu2B+gYXQ3eYcurFRRtsGHqQz/6dxGDPKimf0rErotnEzu6pHAjrNF0IhIssQ77+DG/65zJG7vaCfVEfJJ37g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=v9mj6HaX; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="v9mj6HaX"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so763704f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Apr 2025 01:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483746; x=1746088546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7xB0NSx1H7vCCe+l6ESBPVP9pl7qaey136eLZ31dwo=;
        b=v9mj6HaX1XqjG3QpNjwVMjQ5Bwln8IoQEz71KdhSysh0OeFDXmWpTXrOhmVBH1L/ag
         I3ksDwHu7WmPuzzmN7xJLMKeFgIShKzyzlJo921MVt4H3hcH7R5R0F2OKXbLOUsqIuhP
         jDzvbKvSqKKetglBD9/5VuHEJ70e0g1Hwka68Ej3FhvYsN6rB+0wQXKb9NbVonKyvj2R
         8q//+pxSII3cKA9GOWub4lDfIsUKf2Cr9zRHMt8DlyG3DMSdYvozLHl6lIkPkbO8YOUV
         iguU1CzMYvHr0fV+tKa/5uCG7fSB9wL/8yaMGxnRpJ2KcFkweS8kzYk7zSsMLjVMoLPd
         cz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483746; x=1746088546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7xB0NSx1H7vCCe+l6ESBPVP9pl7qaey136eLZ31dwo=;
        b=Liknzu7vJZD5xB6NciQLDR2FByff1caNvyK9qckpTs8fGcPy51x8QvBkp7bnZ24m0a
         qwAS9hi1c3b48HqZexpO5flLSBv7fbuvJgt6QvvNTGm33Gt9ESW/YZELDkK3QeJIsKXs
         D5YMv3cRRLo5KMbRMJNlq1Rvc0FguxRUhJh02dsMhQwS95Ph8UGfKL8EznyyvNZcbhqY
         BYFKQNDx4FVtgv6aajNP6ZZD00We4xHAK1RpiT2YcK5VCJB+DI0be5CG8S2Sy+0k4InG
         Z/1LwxUzNRLUpe+Uh/K0Fg9zYlHuoQe8V5c4d0eHkd3kCKATDl1S4jfQhkgLnnJnWg5Q
         aLyw==
X-Forwarded-Encrypted: i=1; AJvYcCUjbe22AsdcgjvHThhrQtqYrUNjV5qnGKozwFr1ZnU2I39PszWNAG/uIWhrkWBmCRrFmbgaWPWzlULnThriV6dCfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd9j8UsrpDgZqF1XCZ8m70ITqv9mYeeGdlHmUwgvwQjwKhGnPx
	sT95YbXVLcrc8YaeDPL/vBQUn1qh2lFWP4zuWDJPcGySlSxukKCPyneq8WWy7uY=
X-Gm-Gg: ASbGncuZ2+7qckzUxaq0JpDZkdr+cjetiAbrUEG5CHb4dT6ldpGkvXlYeOcBObYf8lz
	dAiCh+Bm8DuYMiAbhI9aKNbGnThOL+J4J9pk2CLSN4TgA0n513Za7T2WT/hlsyCv1pdw1c53NFd
	j0lF5rejGUGdLPzUTdHAK6AQSsBIM3MJDBSyTdWYf2xbKTML1WzVqt4ccPbplSvLU1/BQ2Hf7TN
	41DFbh+39/+2noDB2V8Aiw5GFX3dQxr19jOoRGHMogW06ukB7vWOL0+QoqbM6eRifLvEVGXh3hs
	d07mKSgPHDL0/CqvcQlaRcfMVj6KjGtggT0JBLp0l8k0
X-Google-Smtp-Source: AGHT+IFSD6M5XIauG5i+d/G86hFhT7OFRGq6PzYxSsoMAu4S54uAZ/T5Wwmoogoet09ubvq4IMvYRA==
X-Received: by 2002:a05:6000:40d9:b0:39c:1257:ccb0 with SMTP id ffacd0b85a97d-3a06cfc5660mr1453719f8f.59.1745483746115;
        Thu, 24 Apr 2025 01:35:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:35:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:25 +0200
Subject: [PATCH 02/12] pinctrl: axp209: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-2-504f91120b99@linaro.org>
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2498;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=MgZVjd8Gr19iJhQk6NvM15O47jgqGqaBw/RcQkb1G5I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffbYYgK3T3LpUSxYaTlg1RQUUtOaeq8+GZ/u
 B4TY1aYiK6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn32wAKCRARpy6gFHHX
 cvwwD/40PM8MvPIIjKYdoBuWnigqXm5J9mOEAwo0IpSBLk+1NrZtxCDfCUtfG8qnkKxEdr1VqG4
 6mrNRSEHCZifkUpZsd9j1/qqvkSUckanWm+w39DVs4zsSka65n9Bs7dnA1+SGrLrp+/n9+P9MtA
 lM34+iNO1T+9KusL6PqVvKAu6DGfaqw0bjecp2sfpta2zPtHwxq5lXFxGkHaVkPW3j242bQVJMo
 OxU8NDepqb+WL0fZbMQ5rqRKhws/pmHzh0pc5fdiELlPOWlqNBOETuyxmgi82zYE16/chG6xgPg
 216JJsncREoy4zCWFVBbrBbv9L02v3bDLnPh1zhIKESQaoINtG8bkwtev6qRPVd+uStU/2JCH1h
 f/3D4RxLWdmhByFfRbHoUjmxn3VBuJUSKbeUzyaGHvZVssXog9TpvfZNQRiD8Nkuywe92KjurAL
 x4uNTJbbQg2fqiGNI/E4uyxLmL6I36TMhM4sdLblDwJOg+3+tre10Bw+4Q4tLTdpFA8bKBEGGIy
 Dt7XbALdrhuOWIk+0uCG26vCYBKMQ1+0mx1U0lFdEYq41NBloLCpS8vfdFqZJHUAvS1fmmQxdhM
 YEp5REgnyY8mU7MnN+hxKUIp8gS/se+notLxKNO4OGMY/MQYx0CS6yrgP/3P85WACR2SXZyoMLs
 4yNJiAOsNG12c6A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-axp209.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-axp209.c b/drivers/pinctrl/pinctrl-axp209.c
index 2b4805e74eed..28ff846d263a 100644
--- a/drivers/pinctrl/pinctrl-axp209.c
+++ b/drivers/pinctrl/pinctrl-axp209.c
@@ -192,34 +192,31 @@ static int axp20x_gpio_get_direction(struct gpio_chip *chip,
 static int axp20x_gpio_output(struct gpio_chip *chip, unsigned int offset,
 			      int value)
 {
-	chip->set(chip, offset, value);
-
-	return 0;
+	return chip->set_rv(chip, offset, value);
 }
 
-static void axp20x_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			    int value)
+static int axp20x_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct axp20x_pctl *pctl = gpiochip_get_data(chip);
 	int reg;
 
 	/* AXP209 has GPIO3 status sharing the settings register */
 	if (offset == 3) {
-		regmap_update_bits(pctl->regmap, AXP20X_GPIO3_CTRL,
-				   AXP20X_GPIO3_FUNCTIONS,
-				   value ? AXP20X_GPIO3_FUNCTION_OUT_HIGH :
-				   AXP20X_GPIO3_FUNCTION_OUT_LOW);
-		return;
+		return regmap_update_bits(pctl->regmap, AXP20X_GPIO3_CTRL,
+					  AXP20X_GPIO3_FUNCTIONS,
+					  value ?
+						AXP20X_GPIO3_FUNCTION_OUT_HIGH :
+						AXP20X_GPIO3_FUNCTION_OUT_LOW);
 	}
 
 	reg = axp20x_gpio_get_reg(offset);
 	if (reg < 0)
-		return;
+		return reg;
 
-	regmap_update_bits(pctl->regmap, reg,
-			   AXP20X_GPIO_FUNCTIONS,
-			   value ? AXP20X_GPIO_FUNCTION_OUT_HIGH :
-			   AXP20X_GPIO_FUNCTION_OUT_LOW);
+	return regmap_update_bits(pctl->regmap, reg, AXP20X_GPIO_FUNCTIONS,
+				  value ? AXP20X_GPIO_FUNCTION_OUT_HIGH :
+					  AXP20X_GPIO_FUNCTION_OUT_LOW);
 }
 
 static int axp20x_pmx_set(struct pinctrl_dev *pctldev, unsigned int offset,
@@ -468,7 +465,7 @@ static int axp20x_pctl_probe(struct platform_device *pdev)
 	pctl->chip.owner		= THIS_MODULE;
 	pctl->chip.get			= axp20x_gpio_get;
 	pctl->chip.get_direction	= axp20x_gpio_get_direction;
-	pctl->chip.set			= axp20x_gpio_set;
+	pctl->chip.set_rv		= axp20x_gpio_set;
 	pctl->chip.direction_input	= pinctrl_gpio_direction_input;
 	pctl->chip.direction_output	= axp20x_gpio_output;
 

-- 
2.45.2


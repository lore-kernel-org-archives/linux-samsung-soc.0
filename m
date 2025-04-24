Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44008222575
	for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Apr 2025 08:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745483761; cv=none; b=WSWPuwI8cEp3TOS6H8cJClCosd4hs4v/yoqNTr3w7hvunnL7F1rRcYntYexBhIrqZTYpWvX3dH4H4Dpg3BGm2D5KCoxmv4Fh4/2Cz58XyE1vhL33tgvPFgXRAwDusrkHtYLQEK5DAU6ZJI15O+/juJwxI+tQKIWw4Vjq3osNqX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745483761; c=relaxed/simple;
	bh=SYc3DfZ394FHD/QXwKPPaydZv03IewUBNtQa05U07Ho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZpaDW9BPZSTJpW/ZXJmfkQghmbnLTLtKJgq5Cannddu70F5W3/NEb2zJijao13GBupFmdS7TUTQj86BM/nZ9k+TbC3QeyAXYkQ4STpfGZQ5ScHX1I3wXjC8/8IBIYvw7nwHvhL5pL2HK99RhYtVnKPtAQGW/lnBpH5eA7SwWGWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=02DpnRNC; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="02DpnRNC"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39d83782ef6so1343040f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Apr 2025 01:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483757; x=1746088557; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XaHaIgMkQszg4+Vg0zXH3vzF1A/P6OHY+YrBjGQv360=;
        b=02DpnRNCtokDaGA3vwAJeAcroshE5A7LW3mWC6XHuDt4WWoZ3rvTYCXqLQQnfiijwo
         1fSEaLQ1Op4cndvc5j9VGqWprYy3v4tIj6P557SePZOPZxus35fp7sZXYgNAeTH4YARM
         nEZ0HWTz/Ahw02dcVfXxf5j37ThQK1u3tM18xyxOakE/Q/WMrY7Pwf7dSnTBMc5pdqeM
         Yim/UVcDzUHI2BvE766QapYl2vRuciSx4a/K/70xurILUlI6GVCHd1nQLqoe0zNQMQKe
         +GEMNnG4bM+GQg7/0LUIogJc7jUg5af2d5XC6QygOgJ46E+XsaRJMJl0d3U0JiKLOsod
         l1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483757; x=1746088557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XaHaIgMkQszg4+Vg0zXH3vzF1A/P6OHY+YrBjGQv360=;
        b=mmViSqMP7qeVQQQJeb8+tRH/CjFCdJ0C+7Ifr97m2WkojLAJ8aS3VRA/BqHnhLJZfW
         SQIafIBYtQrfswH77hXhGH9eQe6H9BOOoHACnMoqPkTralWqfupimZ8RnR0fCEF+OTln
         gjLOx56wmTc9/GrrtfVaCkYCJB3aKA+D4aFvXT/P7zXws3VWDSlfUV3EMWTWEUWgBVSY
         9U7Fm7BjUctKORlGeXoAr8tkKDPQfqR63Hlkj8mV8pek0Yj9+Q2cI9YVCdSe6K8wSokb
         x3/6BOYVwwWHAGn2EVBT16LQMH4PkDMg3fX8orxsGrgSmIygf11hTLLTIz9cO2CUbC32
         GEzg==
X-Forwarded-Encrypted: i=1; AJvYcCU+qVnpWeRG1+N3vbfuSD4Igu6GDSePESWBT6Nr1ti9xRZ/KNkzFWP13AekjHshngeTXGgswFUkqH+TZ1ldPk9TdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyX/scOTgp2Ji8bGJGErM2DAHFYSapUW3aZ2NUIU19/SL3BDqC4
	rx9aZ+CUfcSHexPHxtTpkZjLoHkk/kl4yuXVViddV2cueV1pL2rej2yUxsb6a2k=
X-Gm-Gg: ASbGnct1uHV/e8o5uXeTI1jgqzFMg3qj/5hByzuPlWiZmhuqvXCc4IPJQtHKr6rM31R
	0P1a7hezrbXotg6sXvPaV/eRnBbV/GLNtHVkTrUWAVpCboaUMsv16xzlnFMZSbbzbczB8Ue8i68
	52vY5CfaaYjPwci0FZVu15K/xqarOQ4GajBVwnc45UO8GgEnH6P3nMbFIs2RXnrdIYhPrSdTEPp
	UGabLoD8WqHr4Ni7pyUZJ/3J01hnTie9PDLXF8maRVs880gTLOYJEKM18T7utN+cy+yYhs7jOqI
	eMyWKixA+TZus6qqYYspxsGFg7TEerG4ZQ==
X-Google-Smtp-Source: AGHT+IENaOXvdDwYvVzyNmm1O+wEFBO9qUA8eUmPoY2h2uvx0EEvGioW8nnYHrKcqYKrpStPrZphsQ==
X-Received: by 2002:a5d:5f45:0:b0:391:b93:c971 with SMTP id ffacd0b85a97d-3a06d6ccbf1mr1169019f8f.20.1745483757511;
        Thu, 24 Apr 2025 01:35:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:35:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:33 +0200
Subject: [PATCH 10/12] pinctrl: armada-37xx: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-10-504f91120b99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2277;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=W0QsCqlj8k41jahpfTRdRwpb75wjwAEccTgd/iB3NSg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffdShQB6dZ7am+8Zlg1v1xnScSWHPJ4AYGjK
 IuNEJ72zDqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn33QAKCRARpy6gFHHX
 cuhZEADgECrorArfyzL2QuJa6yQe9bYHLOnsa/SLqp+XLhf+MogYfB88ZBg52BGEy/260WhH3Ar
 TlDxqbNf7xbsDCEMp1QlhFb4S9VgmBKrttwkTGhgoD+3LRdby7tIt4OwKO0GaTXYE3EygwT/Iq4
 hrU6Se3dlBrraDvvMiQVItwNzzCJ5SvOHi8lE1jFQth6AVN9W6GZd7je8AWawFv9Wg+i96C71/A
 LL6g8qzLyWM1U7sLiXvQrnWtJb8cpWGNMce6jMz26KrCpwkGpSbuzMq3e2dUk1tv1p+UY0MPwi/
 vfA73gllbSX9IPwu2Av/fHUnl4unuBzzo0wEISM+lyZ8KnlWAqlrdIlHQErUpPBID7F5cyZvpih
 1BvJFjIXMf9xEMQTYWcV4ACfgEUhp6bG2VvvMX4L2/j/ZocIsseaEAYNaPIG+I0ZtApOV5Ne6+U
 5E3cMbN5dXT7ekyY/sIH2McA4ysuJK0KPhIYnYQTPu3McsIx5MqljY49PQMhiw+qVV+O4EfYUat
 IOA3xFTiPvKuoi5huSr1QFG7EpE85vSMix6o50VA4BcT/jlgxeoo7ufpgZmYtUTnM8aPSLgVucZ
 ReV5VoN8II+I+BwyBlmEBfbL8iiEwXA0A/4funmEKDVAplmX/KfHafRvfXnO/2PdS7n7YpqLW0L
 IeczklCyXpDVPJg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 335744ac8310..18419920c33d 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -424,15 +424,12 @@ static int armada_37xx_gpio_direction_output(struct gpio_chip *chip,
 	mask = BIT(offset);
 
 	ret = regmap_update_bits(info->regmap, reg, mask, mask);
-
 	if (ret)
 		return ret;
 
 	reg = OUTPUT_VAL;
 	val = value ? mask : 0;
-	regmap_update_bits(info->regmap, reg, mask, val);
-
-	return 0;
+	return regmap_update_bits(info->regmap, reg, mask, val);
 }
 
 static int armada_37xx_gpio_get(struct gpio_chip *chip, unsigned int offset)
@@ -449,8 +446,8 @@ static int armada_37xx_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return (val & mask) != 0;
 }
 
-static void armada_37xx_gpio_set(struct gpio_chip *chip, unsigned int offset,
-				 int value)
+static int armada_37xx_gpio_set(struct gpio_chip *chip, unsigned int offset,
+				int value)
 {
 	struct armada_37xx_pinctrl *info = gpiochip_get_data(chip);
 	unsigned int reg = OUTPUT_VAL;
@@ -460,7 +457,7 @@ static void armada_37xx_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	mask = BIT(offset);
 	val = value ? mask : 0;
 
-	regmap_update_bits(info->regmap, reg, mask, val);
+	return regmap_update_bits(info->regmap, reg, mask, val);
 }
 
 static int armada_37xx_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
@@ -513,7 +510,7 @@ static const struct pinmux_ops armada_37xx_pmx_ops = {
 static const struct gpio_chip armada_37xx_gpiolib_chip = {
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
-	.set = armada_37xx_gpio_set,
+	.set_rv = armada_37xx_gpio_set,
 	.get = armada_37xx_gpio_get,
 	.get_direction	= armada_37xx_gpio_get_direction,
 	.direction_input = armada_37xx_gpio_direction_input,

-- 
2.45.2


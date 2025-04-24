Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A36221FAD
	for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Apr 2025 08:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745483759; cv=none; b=A4JjkC50+sLCGdaADoZIW3cBPjqxHKPO/ZZ+ODoA7lN2oVxK+sVv2rF5sJLoLG6ZoZ6a+BIlb2pMKQDouzidVYuIQfWfeI484NKjIYe3uUj6fWsVGHRiFnDaN+bbrj2BSVd0R0KF/KuRMOURxAC1FnTUBpl0uYn6Uaqxv1D8KAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745483759; c=relaxed/simple;
	bh=sps6rFyEZor3eSy0kaZUAB/4WNPHFKflZMDwh7ZA41k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=syoRARD0nh7qB8RutrEV+sNXBEl7nYeJvPN8Y9QMe4rAeqv+EV98jFhoA4fJ2c5ylJcewT4Iks6TWCxIcUY/6wlImgOIKtlkO5vqTmZ3bGqK7+vgreYM6keX+KIBiZOysK9yuf50lalcQJsarWxiXcYNIV6eBcYMEAE4RPPmUZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wyG2foMz; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wyG2foMz"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39ac9aea656so906036f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Apr 2025 01:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483756; x=1746088556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rNkYr76mp1i7nVgGetDvEHtsIWDovRPdxkWR1fDzPxI=;
        b=wyG2foMzVNQlcNKu1gPoWSe8a/AFjO/m/3iGe/tHILXN6BJTc/7S6pp7VYqYFuz5/U
         vMDqGVXkDILY552OhMmHYGGmRBtJoRIndpY0glZWrkgJ7NFDSa41eVWYPD1aIh7QwesI
         kgmGzg3jeRZkt7NFFX2f0p5Qk0Jcb6jQ8Bn/1LoHrXWhP4boVFuBMyEDsDeK33c9aqLR
         +updUjclhI6J5Hve7iBlK0VK1KGNWtLekw67t9P6JczHIw5M6ZYDC2vga0EIqD0NMVP0
         ozubp8O7AYaz2xfAD7XJtFD1Y/5f53B+tHz2EtA8BxC14brLiKlQGowvex8AFOafwmvk
         gJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483756; x=1746088556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNkYr76mp1i7nVgGetDvEHtsIWDovRPdxkWR1fDzPxI=;
        b=O5f2HMzjP+v1euMFQ6bGriokjVg3SL0zGIwB+cmsnu8SK89swlxCINLzGbhG+7EbNS
         R0suSXB7hgtPiP5IuOt5mfskZ4UkHMKlm6+BiFcvrJD9/EplWNjqfPqOae4ek6H0lzV3
         BYvlFomQDQkwlP6tWhezSc/IV3uMUVZZV3zeXJoS66dkzRsVTtlWMJkSKvjiWiY9VKqa
         sFFB3qQ90FWiEDeE1eF+8Xqab9Y2dx0GrY3B1mQed57M3DkZfoyKTXRFJ2UkOCbU2J2s
         dhbbwcHlmpALZZc/PXjPdpPCtuThBdB3FAHNFKJuIXTTowyhSyVKpCGDtDMKTqzp9P6o
         TqEg==
X-Forwarded-Encrypted: i=1; AJvYcCU6yYcTfgPGEqdX2J0fLnv39X95wdnYRmGa5XHhb3DlrKkpbCN47PZfz51Q1gDd2SDRf+befcnjo0elkFLn8+QqbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwF+KEGt2GlsH9SMkuo7YHAJvvZj85JLwC+rdIf3WYHQC9iTkH9
	OygBBGA/LqiPpeSW9O+Jea2BSkepOaiEWpeSL0CzU8R2OTrdXp2uSde3GwJcujg=
X-Gm-Gg: ASbGnct5bqWWFtJoCwjmTT89CegZC8HCWm6hliSzpSup0DCVYBPsc6jQ0ZZG1pnmu7H
	dzDJHOuMnOEPPugtAXFZ1iVFM5GEKldZBwhsTKOuddWz8oASu+jBquEizQ2IjBDQi4IFDttSzeD
	24TVa8kLHqbbDLT0MmGZ7Tgg9JKPclqVF37hLxE/XvFoaHHxOy0Va7a8gSKUxEG1vRCqU8bbnrB
	qmxyJtnzrCwEJQisVUk26ZSUjRxaWCpmhdiV8pD59X87Wof7eRe9blaJWZa3DaugpU/UzkqMRxx
	IPcIvEn6lc0a8i4gG8ZtXHAeiHW4Gx4bZg==
X-Google-Smtp-Source: AGHT+IFjK2Ih7IwrcWu/Ekc2IScPqnu8LdiHaMHhLUAVC8NOSxem7de6NFgjnyJadaWki95xHXhVmg==
X-Received: by 2002:a05:6000:2285:b0:39c:dfa:d33e with SMTP id ffacd0b85a97d-3a06cf5ee26mr1184882f8f.23.1745483755990;
        Thu, 24 Apr 2025 01:35:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:35:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:32 +0200
Subject: [PATCH 09/12] pinctrl: at91: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-9-504f91120b99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=hJTZiBYt8YR30cOIobq85K3/2m9qesklwxGOmsQ9g+A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffcCq0GrDNjVi0FNEZfifP8+NRGD6rfnJWXk
 coBh3BYPZCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn33AAKCRARpy6gFHHX
 cmMXEACVIhPoysgXs4nu5CJDcrzmVOtI63aayA+4b79fBXpL+qGUHubLG3YzFMEjUXjHl85dd/6
 u+PbGSG++Td2UJwMOeToy/iU6XJeoDV9NcAv9A3+d8dEVceRGEzF/IV67jKmO1bygPVhxBTQQEi
 /zIZgPpE7lzaIM1OzDuiGntQ3w2gaNwTRpcs9IxS0hLmB692VjKRLywPkO4KAQ6q9XxoVl9VPXS
 6y9mHl3q73az6GnjjF/r1u9yfRMQGn6acO+aj5/Bvsi1Bw7qDow48UrYbXAEUc9uH8oeP0+uX9z
 tuMTPyg5d+3k7jv63X5OIb5daBS48MeRE6FPFo3VU7Xl+eeLSfRwF9frrll/O3vYGMOiqVLocU0
 AS+osCwUO7rZZ7QRq1GH3ALDM31j8aTOK2l4xXsXTYNZVUiiM4MOZR64Hyi4u7SYtPAN/RogT2u
 x8zcKpoXblnjfai77whaSsOXUmhkgQHJGCar4waLDSd7mIXtWlcj+ap1RzNka8B/uQtm/egMuOg
 PaPJQ7PYn/o98sUu7aCCG/LPHFkfjRDXXUjBLyjUit4Z1Dlc2FMLjn6CzlxwUbfR5TWF5eMkMlm
 Zq6DNWbNlbcPod4oxNbS/msyHUx8ZwDdf90kf1rF3IVNBsDxS2dnokrMcEc6lm/VrqVYt4ACLHc
 FUM8aDQrmoClWRg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-at91.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 93ab277d9943..442dd8c80b65 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1449,18 +1449,19 @@ static int at91_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return (pdsr & mask) != 0;
 }
 
-static void at91_gpio_set(struct gpio_chip *chip, unsigned offset,
-				int val)
+static int at91_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 {
 	struct at91_gpio_chip *at91_gpio = gpiochip_get_data(chip);
 	void __iomem *pio = at91_gpio->regbase;
 	unsigned mask = 1 << offset;
 
 	writel_relaxed(mask, pio + (val ? PIO_SODR : PIO_CODR));
+
+	return 0;
 }
 
-static void at91_gpio_set_multiple(struct gpio_chip *chip,
-				      unsigned long *mask, unsigned long *bits)
+static int at91_gpio_set_multiple(struct gpio_chip *chip,
+				  unsigned long *mask, unsigned long *bits)
 {
 	struct at91_gpio_chip *at91_gpio = gpiochip_get_data(chip);
 	void __iomem *pio = at91_gpio->regbase;
@@ -1472,6 +1473,8 @@ static void at91_gpio_set_multiple(struct gpio_chip *chip,
 
 	writel_relaxed(set_mask, pio + PIO_SODR);
 	writel_relaxed(clear_mask, pio + PIO_CODR);
+
+	return 0;
 }
 
 static int at91_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
@@ -1798,8 +1801,8 @@ static const struct gpio_chip at91_gpio_template = {
 	.direction_input	= at91_gpio_direction_input,
 	.get			= at91_gpio_get,
 	.direction_output	= at91_gpio_direction_output,
-	.set			= at91_gpio_set,
-	.set_multiple		= at91_gpio_set_multiple,
+	.set_rv			= at91_gpio_set,
+	.set_multiple_rv	= at91_gpio_set_multiple,
 	.dbg_show		= at91_gpio_dbg_show,
 	.can_sleep		= false,
 	.ngpio			= MAX_NB_GPIO_PER_BANK,

-- 
2.45.2


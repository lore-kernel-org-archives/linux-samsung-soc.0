Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B250F20D517
	for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Apr 2025 08:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745483750; cv=none; b=KZ1Q1hvEbsRT+C/JULv6BUyt1v3QUiCczcXSxUtrRQOzY9/Byl0GOHslD2rvz9ktbxjQuDMpBMi9e5TqfLRtP+oVE0NJKinbuMCQZw3u4mR8NCXJabirkrxm/W35wKlUTfEgtEGkM4lNw3SbbyvKlqX8lwjpNZoHAPaGR9wniKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745483750; c=relaxed/simple;
	bh=x2MqwhQHM5FA2wESk7cvU4VBhmYapBXwzXcbGWaXamw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A49Vtqy21Qo8Un1sd73F98Gvf01E7joUxbYG/TVh0oaoAv8e06tevQ8cqgUx3bddIhb16uF4TSYGk4vZLglCjO5aUr8pdOOeEMV4rdN3YpYOnG+D/+JtsFyw6DNFw1oqKUFWp+CZ0J+hnDeDw6z9qZfUqm0ilmaM/dWNWBrX5Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Jm55AMoc; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Jm55AMoc"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfe574976so4568635e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Apr 2025 01:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483745; x=1746088545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/KXYtsmkb+G7CfllxPwkWPMcOpxgtUmoLcYzM1m4O0=;
        b=Jm55AMocmFAhDiZHL/ihnsWvhlodvQvh6SMchSHXaB5YJEBU/xwFTCcDfw9bFyWt6Z
         fBdmE19tRSGH0v3pqpcL9nKWKf3lOn+g/37nQWg4/c4+mogoVn9Td+qc/zmybDfzVU1H
         1O98x9YwcxeC3DI/lGb5GbaLOdRp4P7X/Oo+3SE63m5E7O+s7xZ0LXS18s0rZb0aYTWG
         n2BDyR4hURQFsZ+I8w8wjuwtpRUCwpo4jPLxQrBWsI/7uli7xWEhc/tD2oM2JhSIca5M
         YuqBpfCALWTP1wmHVU57g7JxMhORs0QU8BoYffJ4sL/lCWcDjnJ//yL8ggzV/F4srSDN
         lRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483745; x=1746088545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/KXYtsmkb+G7CfllxPwkWPMcOpxgtUmoLcYzM1m4O0=;
        b=YT6O3gBbrj1r73WYXzTfCO7cCndPWOwaxhRrDCJ92B3s6ivFverjYMoM6zhveHeYhA
         eaQnuUqtyuoIj56C1p/swtaut+oAAsxvGgO4M4KkMznS/LJjo6NrRHB2IKQjN6+d/2vz
         B3+DMablL68ajpgVh1QvU+9MRTN4c7jkll/z1Bjr6xIYddxXhfFuR1oCQSrNmQ4zAJvK
         N32GImSkeWePWkHb3F242iJqh309A13y42iB1oIJilrKv/VuFuO884TluHXYUZHYxQzk
         aU1PIU4C5UDxZtHO+yH7O3vc0ChxgPc3p0u1A65nlvaBzQWAeeH9FeC81upmU5ZD8lb5
         m8lg==
X-Forwarded-Encrypted: i=1; AJvYcCWqqTVkfQE2dJAwD3E/pzn0ILj5eI4oFfu16FqRTOLNE4w82mTv5Ge6KmO2HzC2QN4q+zBzvOmMZqtGAvyIB11BxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx5QWKp42kTM0x6GdOtOnALoHektCjffITU0dPuQnEu/2FkXM9
	IXxwnISPpOEuvjunXDy5Kb1NMK4CvGFL8Sal9ijDdz4g5gZHBlzBO+LMdHz9BrY=
X-Gm-Gg: ASbGnctpHQ1SbfT9te+xrboS5S8wdm3dGTM0OVLLnyCqvskLO9cdK8pPSQOYO/sNotG
	DaXKZrUsULTiTv0zLYWlELTcKDj7Dw6oqFr0ssuqGohWLSjmHyjhCLaXihyW36UX8Tgyqrym/du
	mCltQOKLI+Xf3Pgte9JVpt3Pc5H4xonOtQ7YDkn0As/ywIz589Wwt+COMfHq3GRADBt5rTXF3+L
	CtvhZ+3VI4Py2aqdqv3CkUpKFul6RICcnyor1y8DgbL/XKbKhPaQxaTDAJQmhrmjOTtE9FwrM87
	q1oL/nopoLz0XEttgy/ln2G05GjG8jGeCg==
X-Google-Smtp-Source: AGHT+IFDVvKbqbQCc57anrhr3bH0NS/6VL2EdsqMYXAYy4mnb5bctdCFuHC/meZO5Slm/+f4y8xO+Q==
X-Received: by 2002:a5d:6dac:0:b0:394:d0c3:da5e with SMTP id ffacd0b85a97d-3a06cfa827cmr1289003f8f.47.1745483744837;
        Thu, 24 Apr 2025 01:35:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:35:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:24 +0200
Subject: [PATCH 01/12] pinctrl: amd: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-1-504f91120b99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=NXF8n4jsfSDUE1BwCGs8Wk+0RRESis4p2gxPAXy7zJ8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffaXhDusyvG2co2zg72Y3EMPUiJTRQhwls9L
 A4IcRn6OQuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn32gAKCRARpy6gFHHX
 cuVND/9nSgA0+zQ9BeJQXZoMGuPOSsTcd5ft47Rz+PFTWcCHc4gR74Yyz1JYlyFirhQukhrZAI9
 ayiFXnxz+DRmalcR1GNyRp4UmxjfYI1wfEW3L8y5MnQcO1xGJbk18AH+8RIGEJK5bRuv4fHUVrQ
 hV5ZOjao4hJlEt7td9YYxtgh4dx3OQtkph4SzY4kYggtKJNyiEdBhUt3yKo5X4vJsScfQFScAeZ
 9tBfdkSdQ7PY44zhvoxhHgelLEHGgOf7F4cXgDFND3fCFTV0jF9HvcFlkuW61NnQMA4hhPQSpes
 MUwQAS6ZnOwGhcqGhL/dWY0wHaDY/ywabZ2WxmMvLXd0rkXASERgtzoNx1/nzEm4XUa281iA9i+
 NeYK2GMkjsvHx5mn3iDvcOm56nmHsYYA+B3+lORaYVlfkBGZi7KWn9k6AMFlrRiGjlDI/DsTXMk
 L7kUkgUM2YFu/OzEVuRGfn6PsJaNRMPRd3j2oXyPU2Cy9/FdtR9PYoDUPawCqcNCW3PMrdBK3az
 aDqqARtQvzIv83kZ+SO2+LaxV71ruxStTfiG0t21+jh44hTZ8WLJ6Ouy7Nl0j2EGifuRrliEQRT
 YuPhpehkhllAQkPp0iKlVgp1BZIXa6TuItEJTbieLsPUNSHwLC6xaIXRprIiBc8Zg1V6/wlbzte
 W6EmpFQxkbAr0NA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-amd.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 1d7fdcdec4c8..9ab3a7fc3bdd 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -101,7 +101,8 @@ static int amd_gpio_get_value(struct gpio_chip *gc, unsigned offset)
 	return !!(pin_reg & BIT(PIN_STS_OFF));
 }
 
-static void amd_gpio_set_value(struct gpio_chip *gc, unsigned offset, int value)
+static int amd_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
+			      int value)
 {
 	u32 pin_reg;
 	unsigned long flags;
@@ -115,6 +116,8 @@ static void amd_gpio_set_value(struct gpio_chip *gc, unsigned offset, int value)
 		pin_reg &= ~BIT(OUTPUT_VALUE_OFF);
 	writel(pin_reg, gpio_dev->base + offset * 4);
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
+
+	return 0;
 }
 
 static int amd_gpio_set_debounce(struct amd_gpio *gpio_dev, unsigned int offset,
@@ -1128,7 +1131,7 @@ static int amd_gpio_probe(struct platform_device *pdev)
 	gpio_dev->gc.direction_input	= amd_gpio_direction_input;
 	gpio_dev->gc.direction_output	= amd_gpio_direction_output;
 	gpio_dev->gc.get			= amd_gpio_get_value;
-	gpio_dev->gc.set			= amd_gpio_set_value;
+	gpio_dev->gc.set_rv			= amd_gpio_set_value;
 	gpio_dev->gc.set_config		= amd_gpio_set_config;
 	gpio_dev->gc.dbg_show		= amd_gpio_dbg_show;
 

-- 
2.45.2


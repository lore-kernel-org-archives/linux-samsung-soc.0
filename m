Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39012147EE
	for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Apr 2025 08:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745483751; cv=none; b=f3TF1SR4vc061CLSuSjcQ+M8VI9BkfLmjLKaHnNL9LnoCKG+sxGgGQumVNcgU2v/NnLeg30xTBgU+WH5ETvdhZAhVu8xyH6MNdjX67SuDUdU06B//i4HgC8SCsol3Ytgyn+8E8inT7bylEj+0laGW7dxNaarzcNQRGTUlx5g9MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745483751; c=relaxed/simple;
	bh=tO3WEMa9YHzhEuRk8ZszwXNZM7RYI+ALMf6JfpftQRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WHOfp3bDJfUadMYrF8s2StPjlHcdgPwA/JgSN85fftRTB3zQfDKJDAxllAjwK1Q82OtQc9MK3xyQ1rcZ/Rj5QHk6ATD6urwBQs55DPA3HDcdbEBW95IaJAhhzeezmGjuVcyriNhDYOGlpMc9d6Gs9BgLxClJZj7/Dt0nFnLtR34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kKaznmsO; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kKaznmsO"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso442328f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Apr 2025 01:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483747; x=1746088547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mBwNaS+N09jQ7vb9rTgiq0CfSJO3DJXgU4YGfNreNo=;
        b=kKaznmsOjj5NNNn6qXsmhmwKCsoCKpKnAMmwPixSQgPiNJwKQlr0/lQOogsw2Y1p1r
         mWZaRljtjjskj7NZBz3XYwRXN/fuqyo5qvrBRrQUueJNxmbUJ7D0Vqz2Cyarb5eG2L55
         0Yn8D6aNb4vVUGbrFrFYMLMtlEYLt64EZu87G1ugdhxccxDJR/vvc6s3LceUEvD3+pjG
         U2/0lT2VfWY1ZezTZcETf7HMr9tJU0pkD0FLmW7W/IBYHr6nT63CHZVTrphiA28TaBbg
         YzBQR9wSe9rfwlDPwvMVYSDvhYX8vOBbk/eSpZPeJZrFnsrTrsJXRqqi6jmWbXZEVPX4
         wOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483747; x=1746088547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mBwNaS+N09jQ7vb9rTgiq0CfSJO3DJXgU4YGfNreNo=;
        b=nTcKK8Um4NB24zVO/9PxvLlRN7u8kyC9+2pKjW4MDq/WHotIVv+/sDhuqCrEXoY/Ms
         be6A1rx+h4KfBQRaiE0XCDjgwrenU0kadcEgnBJM9zA3vzipNDYYdipw2Qn0KC9rBUuq
         lpzLHwiKYFpR8tdvBuGXDumuzYNEPQKM6SwUqH4dPB2kXuKeKhKblrEmchvS+rSXE7Wk
         Y8bni8vaLdUGL6AncEgQCxxcCkH6OJ4Nr+JOcUhmHpeu2ZuAsOYr3kRLRtRG02nihjw5
         qoVkJ/igtRERTBgZEY04X5Yx8Y1pRwh72weX4VVQOdMR5LgBp2f2ogIrXSEJRpLwO1v5
         4zww==
X-Forwarded-Encrypted: i=1; AJvYcCXyBvqdTEEAO8rqt7ldb+tTtqpLK47F+H1q1lXrUBrI3S2+9kYaA75F+OtbWTIjpxC8WORulHGBYzyLKgXlTmnu0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YynInaUw8THl0HOOWZ2UGkVLdckPfSuC4bZqLUAL7DZVY1mqUzy
	toRxryC4V4mpvGvkhfO3QDREbCI95RQRjEFLZr4bbRM7i9qm9OJXfEp6mi350to=
X-Gm-Gg: ASbGncsJRkubgwy1b/1iJvlekQyfZbjkS9bcuJo1MVUJUYFI7r4TP0dMYAO3cbiyXrN
	zXfL0pfNPnYbXdtYcc9is/ZfraTcZwjmbqIZukpWe6m7JzrWgZ5mOdQWanNy35/j63xCmmq6RpA
	btUJBfsVGA+MOcPO5DYaZ6E5k72K2EIScpHNPUcriRVuoH6KBzYRvdTlap2XTeaSq0ODUIYzxzq
	QXHluvm6rqe71NzAWvy5CnHbbtiEeF8bMk2n9ruyD/ngQR9YavmPeFuvXzeJ+pNvXM3bB2YVTs5
	A27XvP3oZZdjnCCWWmF8WeB0xJkPE7trZg==
X-Google-Smtp-Source: AGHT+IFa84choTa1mcCVuQGvjjgEmdRH9HlvyIG+7lrhNevStMTJlm/OytKRYpi+e4zX9vxoz/GHOQ==
X-Received: by 2002:a05:6000:40de:b0:391:9b2:f48d with SMTP id ffacd0b85a97d-3a06cf62a28mr1355792f8f.33.1745483747375;
        Thu, 24 Apr 2025 01:35:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:35:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:26 +0200
Subject: [PATCH 03/12] pinctrl: stmfx: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-3-504f91120b99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2157;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=goHZgmT9yJTYnSgX1qwQQpFML/4BhFXlFKBeDD9aKZQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffbdnAxPhaJKaJSps/EzFiEC45gufsQ1Alt4
 qq09XNXIk+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn32wAKCRARpy6gFHHX
 cpC1EACk2t+HP6KYD9aJArx7fiGflDxgI1WbKJ6Fu14huQEvp7PuA5rPYehuFCH1Gk1QDZiNYCb
 hIqrsmivpsIMWt+466di/ih3PbJOoGk4rjDVWe2Qf0sqY2SSyk0oYMixfztP1SI70MxCaZAZCLG
 n7XU0j057krrx++3YTvqGY/wnGgasSZa+2xJrVPjtXCUskF7RzNG9UwabQwmLqR8bDl5s4OhV3F
 3tRo+1yN0XGFQ8j6AaSdu6FNQb6oINHNc51H1E7lINc6F8spGhgrPT5nm19hEt9+dv1AbIdyz30
 ttnBRghwa8jedtnbv7JtAgxm+xLqAUP1sRY9LmzRwIyiLPRA4stunNuD6uwOACJ+/vpVNT+h4C9
 kyZR3CgLau/uY40HKqBG8k83ViWJUOjusAidOeRoRBpxFSIXmMS9lP5jvdCW4mAmJoriymxiqrw
 a2APMc8TgoRAfpGJrXESk3Aj7DtBi2C0zeGD3qy9AVg65EJGerWP4D3+k37dDmU0qg/mw/ko3hh
 UTJ5C5+MiWj3lpqSlJrjKy2i+M0aq/dhVoeVdOG14BHS5bxsGyvl4D9LXYKos209SoLTEAWYVNR
 uYrXEShrPRGrtwapj/uZelp+xH24b9FTbitop+uLfFc4Si5GX8BfmJMnx7Wa24U0daHwd82lz8D
 KvP3120WxRcM19A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-stmfx.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index aae01120dc52..f4fdcaa043e6 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -115,14 +115,14 @@ static int stmfx_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return ret ? ret : !!(value & mask);
 }
 
-static void stmfx_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+static int stmfx_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct stmfx_pinctrl *pctl = gpiochip_get_data(gc);
 	u32 reg = value ? STMFX_REG_GPO_SET : STMFX_REG_GPO_CLR;
 	u32 mask = get_mask(offset);
 
-	regmap_write_bits(pctl->stmfx->map, reg + get_reg(offset),
-			  mask, mask);
+	return regmap_write_bits(pctl->stmfx->map, reg + get_reg(offset),
+				 mask, mask);
 }
 
 static int stmfx_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
@@ -161,8 +161,11 @@ static int stmfx_gpio_direction_output(struct gpio_chip *gc,
 	struct stmfx_pinctrl *pctl = gpiochip_get_data(gc);
 	u32 reg = STMFX_REG_GPIO_DIR + get_reg(offset);
 	u32 mask = get_mask(offset);
+	int ret;
 
-	stmfx_gpio_set(gc, offset, value);
+	ret = stmfx_gpio_set(gc, offset, value);
+	if (ret)
+		return ret;
 
 	return regmap_write_bits(pctl->stmfx->map, reg, mask, mask);
 }
@@ -694,7 +697,7 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
 	pctl->gpio_chip.direction_input = stmfx_gpio_direction_input;
 	pctl->gpio_chip.direction_output = stmfx_gpio_direction_output;
 	pctl->gpio_chip.get = stmfx_gpio_get;
-	pctl->gpio_chip.set = stmfx_gpio_set;
+	pctl->gpio_chip.set_rv = stmfx_gpio_set;
 	pctl->gpio_chip.set_config = gpiochip_generic_config;
 	pctl->gpio_chip.base = -1;
 	pctl->gpio_chip.ngpio = pctl->pctl_desc.npins;

-- 
2.45.2


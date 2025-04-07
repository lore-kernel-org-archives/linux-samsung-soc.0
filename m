Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442BF227BA9
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Apr 2025 07:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744009776; cv=none; b=us52HcKfONhg0G0IDUz6ekklkCljoO7mFkoNwYzPgqqbWFJaedbHXnK26P5/CYpOZJIdfdDdlsvhr36auo0Sd7hRAoLWpys9JMrpbmZXsBP612oPheCH01xAUm+AfJJkQTtdPndZ5gZE+PhapsidzasM717Gid1d616cF+C0/sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744009776; c=relaxed/simple;
	bh=Xs8kT13TgDgVr1qQQSggiPnN5GRLN0/V9PojPokFU8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JT/NQJaAX7BbF9pGLUcLDND2riaajQL6qNSRrDegWIoEsz3REBsxsF+VENSacYnt7NTUxNC1OGnhFrJKps8ubsemcRbjABJUTLzOSOSpJwCVYnsV8+TMW7H0e+gX3bZn1wlrsxRSBilNv87Cc6isRctbq+PclFvz4t+/zr9bYDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=y9qsAOZE; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="y9qsAOZE"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so25552705e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Apr 2025 00:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744009772; x=1744614572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HsaSC2HaVJRroJP0HwzWYTmvmXosq879cETOeyvqI4E=;
        b=y9qsAOZE3aXcGVeE+keirS7xSue1e0qBvX6PiZvBhYZ5MnHNWyETOlBiSah0TbqTzZ
         +aPBX2p+irUYpJUmgTd0GhOtp6GhjzgcU/409BQumWNt1/3lPu+NqkL2vy7l4WWKp99J
         BQ7IVAy1R6bCTbsUSJhzcfWfJKtedUrszE8IMZ2/k0Ips8k1/NBFhftdhilQWc09pwOa
         aywRrHm6qwqaHXfGiWQaeQlq5y2vUZMjtrX/02MdvgLpzk9TBquOg2lIVZyv5IYbncvo
         DjXmNapHLAptvOqew2jVZgtCAbHRRFGurCL48sAN8bKQ5kxSAaMFPLNuFmO0MkGGsumn
         JSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009772; x=1744614572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HsaSC2HaVJRroJP0HwzWYTmvmXosq879cETOeyvqI4E=;
        b=gMwvyutnjfK9FJZm1sol7+SmncLlq7jWYy0PLPOz0hLcg16lAtfQeM9zkZIUi4wejt
         L1Yp+o/KE+gGQHJFDqaBiOStElq45Ua0q4ymSPeBnl4NM30gEPh6SV4vh3itw3mdstA8
         iiGq64B9nI1Vp/s8Blq+br7VJFzyjaGebojpDF7YOsKHyTdf6fJEgETMILTnqUKgpNDI
         o5aIQE+2izTVSha/TEPwYqqUdp2XMEIj34dU4mCvVd9dZWcLYLT8EGCANh5MYhiKfrdQ
         pSVCdmT0+K4vE5W6xnLLtpVlJT75Lq5NN/YB6mBm5olxGtgxjMCxFmXK31V4PYnonkyw
         MnAA==
X-Forwarded-Encrypted: i=1; AJvYcCXItL6fPrg8bHP9RaFmWIqVZqc9kMsxdt5v7lpZb1aW+XHiv3Ape7KkEtbWJimeSnHa56ks7ETDgd6tczC7+yBQlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ+Qtw98quOrzGgNiUX4wG678+VJO3uHkSGDDF0Gx26g4jk698
	Go6dlF31CJzJI0M4bq1AX1fLRPrNCNXnFC+O8zoWbRglPI1vYLE0HPCP1fh9UeQ=
X-Gm-Gg: ASbGnct4Ur9DrVvB493+ho6Rno3OgxJB+qd1/u00CaurJNgr8gG8z8m9HKNLFlY4b4X
	kChb1mPWkEP6AUtXRqO2cYbKU7s1XLGf0cwXQ2fy9p55nwBbZlTyOn7pBW3aEYf7EIXFVxtGRiW
	hvYqbvKAvfzHN5rVpmc5WpzkVyeGF0MKmeAGR/ebWx+bYq0uY8cvXrWyuptJyej4aIhue4BdEms
	2/cq3jahqYMoox0Qa8yfl32gMVzbZ7qEPvRMprmxgDVNWgis/D0h+Ead//zMqi/Q61vNj92AxM2
	GqLcrcADmL/BgIbi80KaESRqXbAezdvfXxHUhg==
X-Google-Smtp-Source: AGHT+IFoq+Y3x3L+TzUAPfnpayxhMl0EXTH8ChvoeKZsiBjolFAg72wzCsqeqv6HGqtEWqKDzyAzpA==
X-Received: by 2002:a05:600c:5394:b0:43e:bdf7:7975 with SMTP id 5b1f17b1804b1-43ed0db4aa5mr81239825e9.32.1744009769231;
        Mon, 07 Apr 2025 00:09:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1663060sm124622795e9.14.2025.04.07.00.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:09:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:09:21 +0200
Subject: [PATCH 4/4] ARM: s3c/gpio: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-arm-v1-4-9e4a914c7fd4@linaro.org>
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1523;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=abv30zYA5XuyGwoeP1ru48ZEwjgixTtNG3nmu6YE3a4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83oktedBQx8pZUxbFWhdPQr1mhvAceAMNekvM
 eg9/SFm5bCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N6JAAKCRARpy6gFHHX
 cr4uD/920+W4HTn/DythHwMtCVrHef5JpB0YFglUyOJ4l+wrZNhV0VZcDRiw3F4l9uygDSEhyso
 biZUtfnWodZkYBVGq/dILl7oXl7vF8oWyBJBOzWK3dQxlFdzjiwjxS61wFDTiJtDqrwoHDBGvTP
 cdZzcOKwYrcWrxD1m8tsHEr4sYBaocCBaMA2DwOBsmTMuwLcnEhYE5HaoI7qjMdz+F5QjH+F5lT
 F4ogzhuGDbEZ6J5R06tmUkVr48izLrPyCCplJRhaREIq62mx+mTilrFqFpqxB2iDdfr46vmCzuJ
 7xIvHs5P4COrgPm6/I5bKr+h3+1VzO7HQFBoDKY2Xuzejttwa3sTTD2RzFuKJiHYYkQM0Oxw178
 Evb4gwQE/VxyQWocnlavibF52tIaBu3yLnHlf677OVaESjEllEOiw4lWfYVjj0vfVMDeR1OMO1/
 +KBoC+MsYFiv2hkzvDRonuAMQITxCp1ygc3x2w6s9X7KYWS1CkudDWlCs/NRSMobunZUcYUkspl
 nsvorsS0oxCLJ07Oetc1JL7Q7A9uln5YELWlRQEIIT8hUBtLX7zVdJtvH6QwPqg5flDaNLjrTz/
 O4tqaQq1mIozfl75z4Xn3k4+O6OudAZzvKN7VnXBJAK8HhrKrll2cDu2DajhxBcH61elXnqtFyn
 KFr7Ne2L2ryXdeA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm/mach-s3c/gpio-samsung.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s3c/gpio-samsung.c b/arch/arm/mach-s3c/gpio-samsung.c
index 87daaa09e2c3..ea496958f488 100644
--- a/arch/arm/mach-s3c/gpio-samsung.c
+++ b/arch/arm/mach-s3c/gpio-samsung.c
@@ -430,8 +430,8 @@ static int samsung_gpiolib_4bit2_output(struct gpio_chip *chip,
 	return 0;
 }
 
-static void samsung_gpiolib_set(struct gpio_chip *chip,
-				unsigned offset, int value)
+static int samsung_gpiolib_set(struct gpio_chip *chip, unsigned int offset,
+			       int value)
 {
 	struct samsung_gpio_chip *ourchip = to_samsung_gpio(chip);
 	void __iomem *base = ourchip->base;
@@ -447,6 +447,8 @@ static void samsung_gpiolib_set(struct gpio_chip *chip,
 	__raw_writel(dat, base + 0x04);
 
 	samsung_gpio_unlock(ourchip, flags);
+
+	return 0;
 }
 
 static int samsung_gpiolib_get(struct gpio_chip *chip, unsigned offset)
@@ -515,7 +517,7 @@ static void __init samsung_gpiolib_add(struct samsung_gpio_chip *chip)
 	if (!gc->direction_output)
 		gc->direction_output = samsung_gpiolib_2bit_output;
 	if (!gc->set)
-		gc->set = samsung_gpiolib_set;
+		gc->set_rv = samsung_gpiolib_set;
 	if (!gc->get)
 		gc->get = samsung_gpiolib_get;
 

-- 
2.45.2


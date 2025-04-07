Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE4B225403
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Apr 2025 07:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744009772; cv=none; b=UOLKm14plk+V09zebGulw2DtAKb7cKNmqF3Q8ZNQAF02JLvACFAa8lDqSfnulq6ko55YDfZ+t3QLyCBGyNSCE4AzwT9Hytsopnqmde6+q/lcZu1T6StVPy9I4yM6PQ0IcXuRPrWaXcWNDz/hAyHAaHX8dct51AFhPltX6nnoHpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744009772; c=relaxed/simple;
	bh=rI3gM6wyr+LS8B0fWYZHHkyFOI/0ZbvX5npXKPrWiT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IWZgXu3+eGXPOa237jOMT91RtnZCIaA2FNeQFc5zZRX37RFZCfOqYgQQ1Df4XjJKDKQs02PtzZmcLuLYymA+CgtLhypYTN/BeovbZqLgQLiTT0fX+O14Ii0HQZX2NcksLrbJL1AkWZVU/NP73+a+pzhEQxKtbR2BeDTnwcz0QYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KHgeipwt; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KHgeipwt"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so2168795f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Apr 2025 00:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744009768; x=1744614568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKHBQhlPmU3j6804TJoiY+lijz2sviuHoc3u/Cr+n0I=;
        b=KHgeipwtVFv3mYwiYWPvfhiHqpBJmAGyZfKFvXY8oZkzOgMy/QO2HRRh1+K18Qcfc5
         xdcoa1i4hh5T891v7nCR3UpuFpBuV0Y89WtlwTKBnL4XS+kkDE+BISts2656qHUN+kaS
         NHG+AAYXRyz/iLZ0EYtZbggOUdLNOfpyS2r9obCIGRnPa45IkwFLu2ej+wtMzu3Bu2Cd
         OzAJYNvP0ouX1784XnNg8UNuX3kDY2LpiOJvvVQ2H3ImA6yYdiDXmftsMG1m+gLXxWuo
         IXOzDijckEorrxQ+61Rvs6o59ij1qSc76q6+H5OcXzS5Sl0manicJrTdd4Wi3BtjSLK0
         OFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009768; x=1744614568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKHBQhlPmU3j6804TJoiY+lijz2sviuHoc3u/Cr+n0I=;
        b=ivLsTosiORDiygbgWxWeTBH0D/S59aP+E0xXUkMPOJPJrITaNAsuQzLnVsI8siqxse
         QB+7Xe1E/bKRZfwh9Mn0o95YDOzoFlU+OPJX0Db3IZaG+hSPx0W08+CKPU5snPNSdm2e
         XLXM0Vid3DaxLohYScr9XaBg5iHaD4OwB2NK5kKSFoeCXOJJE83TmFTcxXuGjgIyW/uS
         /XxavwjdQhm8L3Mg3+1WPZvS38ZzFLjrVpw3t/pPa+QMOHjLD3cpgfyFzA5RHQVylA7a
         rGei3EVYsN2vNlBlyUG+4yt0UfgeppfB2JVvZ3SAy/ehQVS/ymGOIho4phAf/bSyRPB1
         6M6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlAvmZsdKkWIozOWPCQjI2VehfidGVj3Xr043oVMDuEX+sS/jBP6ICi/+nbIExr6yZPCow1HfdWOBsqpUU7Edz3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVqmp45GpIieJtSpzn2LXLHVp+fdN0HrMSU8RnuI5+yN/Gszs/
	nSl33U7VPGaOr4FXZmmk1XjxewbzNz6O1x7GwxWHr27KuMLBJCEfgWK4ViGsr8w=
X-Gm-Gg: ASbGncsCHUC+uOwNsbH8yFVxn3tj/WHzLjkkrB2yw3qdT1eQhwu7TLdCc221NFgRpI7
	d2pMazVBSZRcTkeMMxRf2DarbGOgqBrk/XzkS+VAzSrNx2MBlikeY2nfxpQpKx7FaENXtCdSjPj
	bhct+8nX2FBNK3dlVVLChXUaLyOKuXNr8F2S/cpnlY2he17eQbY1LkLNB4m9Fu/uRZMtrPIfQ36
	BhatUWLVvClXubpmEVtGJfUNfRl3DEURJ0yCsjF8b1txDdm3iGaVDWnYGiN+XqrIAmidsWsZ2kB
	lLoMOfIFzE02UNWn3jZy2h4RI16S4EWIGBA1JyKdN2H/uTxn
X-Google-Smtp-Source: AGHT+IEOVwEvDvK/VaX877azSHwhGwB+qG3k0uZPl7enDJ5MXPhr/6Jl2r6haw04RdA5keAMOfMCAQ==
X-Received: by 2002:a05:6000:440d:b0:399:7f44:5c74 with SMTP id ffacd0b85a97d-39d6fd06920mr4321098f8f.55.1744009768449;
        Mon, 07 Apr 2025 00:09:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1663060sm124622795e9.14.2025.04.07.00.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:09:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:09:20 +0200
Subject: [PATCH 3/4] ARM: scoop/gpio: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-arm-v1-3-9e4a914c7fd4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1649;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ehKRyvYg5rUoJTMfe9/Qu0Sq86m2y/6ATgEJ9xwP4+c=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83ok4MKKf0abAA3OAYKfP6+RbRvjSZlJeEPjq
 onYoqwKNmOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N6JAAKCRARpy6gFHHX
 cg+gEACBTJJGVlRuVE35u0vd0TPLco/EUqtFuji2MMq9tgOsFcm+6EyEyHEQWYwVXELmtyi+pgs
 v47ssFCyjuUpRiTQuoDAiz+kNGhhbedC/Y81QS9HhmIiqRr7+4or1ntC0EF6w5bDaCJ8czd5b1u
 r+uHTdRr3K0PH7leknEkF03e2e8FaUoC6DfVhGDgiKSNujP+zHMI7CTLP1CCLMw6Vni4z5rnZ+B
 DTtwtPu/nStaMeYbGVVXdRHMfuzLqGHhT/vURx7RlT8x4ozmQCC+hRgjMeokIALearKmc9fxYGB
 6mLjyWbGDqlKg7ewiYLhs4/hVQqxrveH8fwxGUhqb9gu761NA6BXH6uqRGupXN1Yfb9bQBJDv0U
 8egk07IK/MjZ3r1pBfvICWR7mPPe+WPaiEIZYJdVU0FZr3n5qbj5Cvx3cxDbMawDkChProIlGKB
 La8MSZeeryoNdDhNqBCuTQDl5LzdUCQEZgr6a750ft2Lx8NJRckIBa9+xlwydt5/Sed6G5FqBtj
 mb8BBh21dARgYpr76EntXsciH5RifmwOuKMO8WhVzLwM920GOuBCc0KnVZjgE3BBSRyLZnjsLEj
 S6Uy6Iibd+lHLM8ACyvhERmG9VK2xhyBVzAKzEjp7D8UMlGaSjXznkrvHdePu3ybRMH4hftvDol
 VtUkDFktum4jREg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm/common/scoop.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/common/scoop.c b/arch/arm/common/scoop.c
index 0b08b6621878..2d3ee76c8e17 100644
--- a/arch/arm/common/scoop.c
+++ b/arch/arm/common/scoop.c
@@ -63,7 +63,8 @@ static void __scoop_gpio_set(struct scoop_dev *sdev,
 	iowrite16(gpwr, sdev->base + SCOOP_GPWR);
 }
 
-static void scoop_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int scoop_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 {
 	struct scoop_dev *sdev = gpiochip_get_data(chip);
 	unsigned long flags;
@@ -73,6 +74,8 @@ static void scoop_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	__scoop_gpio_set(sdev, offset, value);
 
 	spin_unlock_irqrestore(&sdev->scoop_lock, flags);
+
+	return 0;
 }
 
 static int scoop_gpio_get(struct gpio_chip *chip, unsigned offset)
@@ -215,7 +218,7 @@ static int scoop_probe(struct platform_device *pdev)
 		devptr->gpio.label = dev_name(&pdev->dev);
 		devptr->gpio.base = inf->gpio_base;
 		devptr->gpio.ngpio = 12; /* PA11 = 0, PA12 = 1, etc. up to PA22 = 11 */
-		devptr->gpio.set = scoop_gpio_set;
+		devptr->gpio.set_rv = scoop_gpio_set;
 		devptr->gpio.get = scoop_gpio_get;
 		devptr->gpio.direction_input = scoop_gpio_direction_input;
 		devptr->gpio.direction_output = scoop_gpio_direction_output;

-- 
2.45.2


Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BCD39AE7;
	Sun, 19 May 2024 08:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716106698; cv=none; b=Qtph4XBvcrbeHpX1kc3RVjTVUJ2HIsPIlT08fo8FIf0aCz81loLn1Hr+ke2C8aILAoMyLsZb9oK407MjnpgUMPfw+vHztToZnyveCfeGJ4zjOniU5Xp7WPa7WezeKXG4ahB14dePOrNOKofBmN5Uppr96QwJg1lsIj3aqE3Ohvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716106698; c=relaxed/simple;
	bh=zl7AH36vmygEV4JVzP5ZRpRVT0yrltHsi0L0sBPvpeI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NOOgnUFMWIkYxqSMbkl4bqV1xcvolkFy7gWfhGMiZI84mjF7d4hmBFASMpERovDPVay6sSLzUTlIo4A3cfOWntsg66Kp7AtWyLNJAhoMAu4czxoZglWY8vwE5ofF/icwSTPTjpxyjL77bz0tr9FATCuLxjwxOq5BL2zo/bgKVUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dG2EE7vh; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dG2EE7vh"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2e271acb015so43374041fa.1;
        Sun, 19 May 2024 01:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716106695; x=1716711495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eh0hh6ynZxtBGDzmGDI5+hS0xKp2HfOEvcy4GZsRfWo=;
        b=dG2EE7vho8VviEtgv3xrxG1DtNS1m1RJ8B9q14DQftkhNfbkUKpIo+07pdQ8PpVZij
         /oBXk92u7ns30efzXM4/xpk4PzJuALaJaRapKhs5iDFwFMdh/1nG3cyJ8g2fbRQsHE7+
         +JHgkhA1/ty4LeE/3A5an/GfS8FMyawcyxJhQOXeg4eDvye2t86u8qKwsa7Z7usROFT2
         pcA6tUr3+b738gGoDwFJNK0nz+/fk+jE6s8f3x5AcTDiF1GdJLiYhntTItee0UMkD8Rb
         klsWLNUgdS/2IdC+BUnyE32kdowqMWZUP/zY+MX42qOSv6JIAbyv7s6PoOhcxOOywopB
         Y+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716106695; x=1716711495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eh0hh6ynZxtBGDzmGDI5+hS0xKp2HfOEvcy4GZsRfWo=;
        b=SrANH86ndIbRAOj1NS5YL8xlYxEtH7x3Jv9YJsUDfyD7cJo49eln6nKWsdWTe5Eqvi
         n1ad51cWkNxhjh+n/T+7Idh1TDj1AcuJhgK4UDCJGKbo/13K+rC+zYXv/uombVMgJXjg
         sxudiUT/xZwdkPBcXMILDsGZ06M/687AJLprzFE8vKSU1+tVsSbPa0pW2ly6dXk4h7Ml
         +/anpPe/UpG7G8n7bg6WS3Y0ruygv9m196eaIdktQwgv5xCq/I00bxKi4KhrbyzaLJfM
         M4vUvvq6anSlbAO3lrBS6UY9XRnpzp9a5747nR2XlxKTan6fac2nOzlm9EzK2fA0mO16
         //Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVsFlxuKuNvN3KSIwlBbpk4Tn4K/LHWzAYvdK0nwWWqQcEVxPa6ED0lp5qderujRrxAeg8vnReSDPWldhS9+hj08u/m3IJNfcHe/Uy/9q/IUpumtHkvR1C0LfCOOmI/v52sw8fdW6wyDwhvbrNS1To2GFhrLLVkdplk439oOWI4vtSpwGqkQ25vSSqL9V7cK7wzAV/RI1EfxjfSBE+Gx8Ot2JHuf1agzR8=
X-Gm-Message-State: AOJu0Yy6hKJK/f7Sd7DwqztUcVoKApZLRlihnFAXolnizUU9iCMbDMgX
	+o4LxabC8Zq1guRtFxRvsy3iw8HiEbHvq2izoCXFqoab5sf6e+JE
X-Google-Smtp-Source: AGHT+IH1S6MZdqZnOCp1XHy0DROY6BRx/iUuxG5zGDEFD1Db54zL75jJp9OmheUmNZVBtKA5DxdCVw==
X-Received: by 2002:ac2:4c4e:0:b0:523:6a08:1c91 with SMTP id 2adb3069b0e04-5236a081d53mr12374237e87.26.1716106695408;
        Sun, 19 May 2024 01:18:15 -0700 (PDT)
Received: from hex.my.domain (83.8.125.62.ipv4.supernova.orange.pl. [83.8.125.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c34e5ccsm13698518a12.95.2024.05.19.01.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 01:18:15 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sun, 19 May 2024 10:17:51 +0200
Subject: [PATCH v3 5/8] ASoC: samsung: midas_wm1811: Use dev_err_probe
 where appropriate
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240519-midas-wm1811-gpio-jack-v3-5-0c1736144c0e@gmail.com>
References: <20240519-midas-wm1811-gpio-jack-v3-0-0c1736144c0e@gmail.com>
In-Reply-To: <20240519-midas-wm1811-gpio-jack-v3-0-0c1736144c0e@gmail.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716106686; l=2433;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=zl7AH36vmygEV4JVzP5ZRpRVT0yrltHsi0L0sBPvpeI=;
 b=jKKalLVKlQAPEmhIQI2igaYxc0WtyONvcwLUzap5etYn+mJu5GSY7yIvEUJ6368P+Mmy+lX56
 VqeGNgA6LPfDMjvQfhUv+tlIihN+MvC3f/eFreYYxCb0L35bl6GBcXg
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Since we're already using it in the newly-added GPIO requests for
jack detection, extend it to the previous checks as well.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v2:
- Added this commit
---
 sound/soc/samsung/midas_wm1811.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index ce94550ee32e..91f4be98723c 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -646,16 +646,14 @@ static int midas_probe(struct platform_device *pdev)
 	card->dev = dev;
 
 	priv->reg_mic_bias = devm_regulator_get(dev, "mic-bias");
-	if (IS_ERR(priv->reg_mic_bias)) {
-		dev_err(dev, "Failed to get mic bias regulator\n");
-		return PTR_ERR(priv->reg_mic_bias);
-	}
+	if (IS_ERR(priv->reg_mic_bias))
+		return dev_err_probe(dev, PTR_ERR(priv->reg_mic_bias),
+				     "Failed to get mic bias regulator\n");
 
 	priv->reg_submic_bias = devm_regulator_get(dev, "submic-bias");
-	if (IS_ERR(priv->reg_submic_bias)) {
-		dev_err(dev, "Failed to get submic bias regulator\n");
-		return PTR_ERR(priv->reg_submic_bias);
-	}
+	if (IS_ERR(priv->reg_submic_bias))
+		return dev_err_probe(dev, PTR_ERR(priv->reg_submic_bias),
+				     "Failed to get submic bias regulator\n");
 
 	priv->reg_headset_mic_bias = devm_regulator_get_optional(dev,
 							    "headset-mic-bias");
@@ -669,17 +667,15 @@ static int midas_probe(struct platform_device *pdev)
 	}
 
 	priv->gpio_fm_sel = devm_gpiod_get_optional(dev, "fm-sel", GPIOD_OUT_HIGH);
-	if (IS_ERR(priv->gpio_fm_sel)) {
-		dev_err(dev, "Failed to get FM selection GPIO\n");
-		return PTR_ERR(priv->gpio_fm_sel);
-	}
+	if (IS_ERR(priv->gpio_fm_sel))
+		return dev_err_probe(dev, PTR_ERR(priv->gpio_fm_sel),
+				     "Failed to get FM selection GPIO\n");
 
 	priv->gpio_lineout_sel = devm_gpiod_get_optional(dev, "lineout-sel",
 						    GPIOD_OUT_HIGH);
-	if (IS_ERR(priv->gpio_lineout_sel)) {
-		dev_err(dev, "Failed to get line out selection GPIO\n");
-		return PTR_ERR(priv->gpio_lineout_sel);
-	}
+	if (IS_ERR(priv->gpio_lineout_sel))
+		return dev_err_probe(dev, PTR_ERR(priv->gpio_lineout_sel),
+				     "Failed to get line out selection GPIO\n");
 
 	priv->gpio_headset_detect = devm_gpiod_get_optional(dev,
 				"headset-detect", GPIOD_IN);

-- 
2.45.0


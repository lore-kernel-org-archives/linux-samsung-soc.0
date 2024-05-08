Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A2181737;
	Wed,  8 May 2024 11:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715166088; cv=none; b=Yk7IQ8tDs2G6rg1VWpRmjcjGw1B8IsS/5xeLJxykB0JMvKb4LAYdg6rp2eAyki7uRYheDty8XgFy8Xkpc8KWlYdZBt8oLM/uf5wH1hNUAlXeAYgCzcwM4DD07eQApYwyLdS2m+q41Je4IE8KyO2IQqfwpPjPhipXXqL8PVsjl44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715166088; c=relaxed/simple;
	bh=zl7AH36vmygEV4JVzP5ZRpRVT0yrltHsi0L0sBPvpeI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O1iB1qO9BHXXfjsLi9GV+jmaA9GeukRH4r15lyW96SDJvlumyNV64x4outGu27X44DzA9JwBa3q0nRH2luYySoY6tQ2SHUmSv9ZNitthLORi/HT0B3qhhTuvE73/xDvDTzdhOM7RRmDd/yTs/fyt3anIqynZjQhB2c6co1Yom7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Woz09bxm; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Woz09bxm"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a59ece5e18bso488460966b.2;
        Wed, 08 May 2024 04:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715166085; x=1715770885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eh0hh6ynZxtBGDzmGDI5+hS0xKp2HfOEvcy4GZsRfWo=;
        b=Woz09bxmxV0eRRPaogpE6hUd13PDaEu+xsUC8rFVm4/kikbmScebDX2kQBsIu+FGtM
         KdSKKfTNxZwxA+EMrhP9cGtT7+OvMolJRgvrdtrNQnz00ei3MQOuDnYtwZ66UlNw/jL2
         ybkLA8uNez5lNI4jcT9FS8rPnEiF9VDaOJOT9Doq2QVy7o2vpRmedjyKGYqO6pcsxDW0
         JJj5rMZEIiIN3yTmXfmQmpfHswM6MQH3Uag89HaUZy+CTy4F+ISx6VDtqmKTBdRvIhxU
         hIywaieMPeQaCD0P773qmyM8gN2YAMeHy/AtTyuo2iDMNG175vKfZbF/IYlLSHYD0EL3
         sjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715166085; x=1715770885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eh0hh6ynZxtBGDzmGDI5+hS0xKp2HfOEvcy4GZsRfWo=;
        b=jKiOznZJpgXOESr7mVFvHM/SCT0PLUaCSvGdQ5jGOAOaQIXVZ845KYZaswppEmQrIb
         zfr4HEcKg3fqPHEIyiYoRj07ZYt/x7bW9KHIMUjHcMD68jxC7jtFwNyRq+NPCnnyTxkc
         9cO+wwh3a0XNz546ogs6tkG6rlLYVFinS6xtGOE/U2tvE4VUxtr2DOztc1zhmmLVADjB
         BP7sqcAZsD3+DDDJ3AaSeTBy/0ljYybcRJaHzSSnX+SW+HBUDuldfaQvA3f7kAW2WIgt
         h9ailwqRy0BxDWB5kaIXEGnksiQizCAQpmS19hfrkv/WuTwgp+Ux/4ZeXi0zBy2gBpmv
         o9Gw==
X-Forwarded-Encrypted: i=1; AJvYcCViF/i0QTo/zWfywI/iX/pjmJoNTWUfO0BOwTdiN7w47+t4fuvr4ECUn+QY5FDgIcEYCBVl48+SUuZp1aFV1qCM4Q2Q6zUtDF+pu7s5iCwwiwr2qdi0YQLyF98+feE58J/wyFPPX7gAlCFthEnaTEeMJNWmHUlpBsjwvkB1EazKSwdCaOgbd+an1uEAceKPrAP9GG69e8CIPieEBytpGMzJaGyeZ6rnovI=
X-Gm-Message-State: AOJu0Yz5E+QllFNTXACDGRmqDP5FThmcp2QDD1AXiHWIVgcUGWVVLoi/
	i62ee+bo7nOWZoaH+6y3eaAxNpRHTbiyurU4QyR1WfiiVjKf0BmwrVSZdg==
X-Google-Smtp-Source: AGHT+IEBwQsbB5ly9Co7wAOpW5LM6EH159oeIG9hfELSBdMplK0VTNfidDLRoB93iPYNNHuID+ms/g==
X-Received: by 2002:a50:d7db:0:b0:56e:7722:553 with SMTP id 4fb4d7f45d1cf-5731d9d9ecbmr1973462a12.24.1715166084426;
        Wed, 08 May 2024 04:01:24 -0700 (PDT)
Received: from hex.my.domain (83.8.126.253.ipv4.supernova.orange.pl. [83.8.126.253])
        by smtp.gmail.com with ESMTPSA id m6-20020a056402510600b005726b58a436sm7455793edd.30.2024.05.08.04.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 04:01:24 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 08 May 2024 12:58:53 +0200
Subject: [PATCH v2 5/7] ASoC: samsung: midas_wm1811: Use dev_err_probe
 where appropriate
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240508-midas-wm1811-gpio-jack-v2-5-b4d36cd02c6e@gmail.com>
References: <20240508-midas-wm1811-gpio-jack-v2-0-b4d36cd02c6e@gmail.com>
In-Reply-To: <20240508-midas-wm1811-gpio-jack-v2-0-b4d36cd02c6e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715166076; l=2433;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=zl7AH36vmygEV4JVzP5ZRpRVT0yrltHsi0L0sBPvpeI=;
 b=fe+pSCvp0hASloJ0sPUz+l38OVaL8jW3+JqL69/Fa0Vyl+oCbv43o8wgqeZZwlLvsGsOL8qOh
 to+MdKSo025DMN6qoynkF5EzPkUi5GX8nq5bbd2hLMj8pAZXpr+03D7
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


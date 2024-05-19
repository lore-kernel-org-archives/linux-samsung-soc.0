Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316F41C69A;
	Sun, 19 May 2024 08:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716106695; cv=none; b=cmQ7gkadgjDK9znC8xWLpstoMFlrv6E+GQfNbsh1Ba/rr0S87zG/3JG+n7IAPLO+VWTMj6wAq44Z0lcsOlOpDI+zSPvgZjEMc5pFfc3hYl/kHIEGip+rD8to7c/F/c+ibWT+DJC7aMgpDzz58VCBAIA+MxqeKvNIlglM7beKIBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716106695; c=relaxed/simple;
	bh=vuYNtCSoGcmTk8GfhvJhaoNcv6Dz56BFdGIefFxXzuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CYAy3QCQs8K9ryR9n8GyLMKOSnOFp/BxnOBuSW3d98oJlX9TkoxMcnSa+FaI8cq65J3GSZ2CuI+EFA5YRnNX3aV7geu22UnBdBYXUPejfEYlhFp30/jSsIz91DNCc7hdu2ybCso76cfOaRUm9z6Zx+Yl7IfZ9PUQxZWA6ihMWUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTgO4g6G; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTgO4g6G"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-574b3d6c0f3so6595772a12.0;
        Sun, 19 May 2024 01:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716106692; x=1716711492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EUmoS//RS/NzAGvmwPir69ysTLwZDq4qcPlEK/AGs3g=;
        b=hTgO4g6GT0QnsirkOYqVKhEqbRKqfTmvbh2e4uBw4Ooo+MOv43DDHyXattzXYZU1ss
         zv8lm5cWn0e0DBhb8+xblWyhot6LKTk9g+iE66xVbh9A5HqLzcL30iTHtBjn1oliv2C8
         thPvNIRYClShMg8wCQOA5d6fTlB/wfYb3s7RUGTq9McIsScB86Fz1uOay6OEoAPIjIH+
         y8i1TYGpuU/ugPe3xzqNe43jddEEs0cHWBskz/IHHbCK3Mvo0F55M8xADM1alxuulHGO
         haRr1AGw7OfyYtquxUhRr8GHrMIBrzGzzBMikARgYrc1vyVz775knFIFvEmLeYkuV5X2
         zu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716106692; x=1716711492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUmoS//RS/NzAGvmwPir69ysTLwZDq4qcPlEK/AGs3g=;
        b=jjUrbLaDwqOix6ERipRB1QTgOSzCg8I5R4Wt+csdopykPLlW8anIwoPTdmbLGwjWMX
         Vyqx0sfeI8F5AZznkQBSv0uE1U/aryyr+skgJidUDX3jasV8WhyP0sBEt1gq34o2S4Ev
         A4kwjzhGnURqRdUjtMDdlxwct5TTAVKKTX54im0lmzHDJ8C4lxF8EcETwfDqYVrnQqYP
         hx8T8oUImdYl6nAl4ZmvTMp6GFOGbZ1HOtTfwBj8tHNOmloi++isyT/Lmae7pTFiIxXX
         mBkYHR65T7miK1L0oZqyrD3ZRYYwGX9MLkjhMuILTAQmjifgdGcK8sgjds3iKsUcVtFl
         vrHw==
X-Forwarded-Encrypted: i=1; AJvYcCW6KHQd4hCeltZQauWcqIw06EACvtmNZZgD8lFbmdBvXqRqUwsL83EN5osrr9DJF/d+OYcIJrwgtcqtshXJSM3PsfiI5ICzyimQ93YW3NZ/8LX1+FvhNsXrDoV7arzOD/7at5fkUZYtoMydImxvESGWz17XKH2TMloQRMyS6v+wWiT0nSWNwI3nhsOlDZjq0R8vPgLFjAdzywhEI/jKrorFPjBhN+XfkxM=
X-Gm-Message-State: AOJu0Ywt/sxM03sVVAyVHlwGML6/IHzlUaos9QMqtzw3oh3noeTUH4ga
	naqA/8Fp7llAOumkWv61aTLbftbsX9fhKIrBoq02ye/iaRDS02/G
X-Google-Smtp-Source: AGHT+IFtA0Va8QiICPbaNatA5PVquOStRUtv//wy7zLyNNpUAzWXvwJve0s999PpRDl1QmQ8sDDadQ==
X-Received: by 2002:a50:8a84:0:b0:572:7280:89d6 with SMTP id 4fb4d7f45d1cf-5734d597a25mr18601319a12.7.1716106692558;
        Sun, 19 May 2024 01:18:12 -0700 (PDT)
Received: from hex.my.domain (83.8.125.62.ipv4.supernova.orange.pl. [83.8.125.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c34e5ccsm13698518a12.95.2024.05.19.01.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 01:18:12 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sun, 19 May 2024 10:17:49 +0200
Subject: [PATCH v3 3/8] ASoC: samsung: midas_wm1811: Add headset mic bias
 supply support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240519-midas-wm1811-gpio-jack-v3-3-0c1736144c0e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716106686; l=2705;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=vuYNtCSoGcmTk8GfhvJhaoNcv6Dz56BFdGIefFxXzuk=;
 b=Oph8hMfgjPv7+ASAJ6X81w2AItr7S+gGYQiA9lMJgDun4mT3Z8oy8+F7ihMMEw8x/x9MM0sTS
 JswKrd6RYJNAbRYAXVEkhrsO34yH4MtOXVYi+wgzHZq41rRJmRkYJWp
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Some devices use a headset mic bias supply (sometimes referred to as
"ear mic bias") to enable/disable the headset mic.

Add support for getting the supply from DT and setting it up
accordingly to the value of the Headset Mic switch.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v2:
- Added this commit
---
 sound/soc/samsung/midas_wm1811.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index f31244156ff6..ab0a4804b45e 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -29,6 +29,7 @@
 struct midas_priv {
 	struct regulator *reg_mic_bias;
 	struct regulator *reg_submic_bias;
+	struct regulator *reg_headset_mic_bias;
 	struct gpio_desc *gpio_fm_sel;
 	struct gpio_desc *gpio_lineout_sel;
 	unsigned int fll1_rate;
@@ -201,6 +202,25 @@ static int midas_submic_bias(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int midas_headset_mic_bias(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_card *card = w->dapm->card;
+	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
+
+	if (!priv->reg_headset_mic_bias)
+		return 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		return regulator_enable(priv->reg_headset_mic_bias);
+	case SND_SOC_DAPM_POST_PMD:
+		return regulator_disable(priv->reg_headset_mic_bias);
+	}
+
+	return 0;
+}
+
 static int midas_fm_set(struct snd_soc_dapm_widget *w,
 			struct snd_kcontrol *kcontrol, int event)
 {
@@ -271,7 +291,7 @@ static const struct snd_soc_dapm_widget midas_dapm_widgets[] = {
 	SND_SOC_DAPM_LINE("FM In", midas_fm_set),
 
 	SND_SOC_DAPM_HP("Headphone", NULL),
-	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", midas_headset_mic_bias),
 	SND_SOC_DAPM_MIC("Main Mic", midas_mic_bias),
 	SND_SOC_DAPM_MIC("Sub Mic", midas_submic_bias),
 };
@@ -455,6 +475,17 @@ static int midas_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->reg_submic_bias);
 	}
 
+	priv->reg_headset_mic_bias = devm_regulator_get_optional(dev,
+							    "headset-mic-bias");
+	if (IS_ERR(priv->reg_headset_mic_bias)) {
+		ret = PTR_ERR(priv->reg_headset_mic_bias);
+		if (ret == -ENODEV)
+			priv->reg_headset_mic_bias = NULL;
+		else
+			return dev_err_probe(dev, ret,
+				     "Failed to get headset mic bias regulator\n");
+	}
+
 	priv->gpio_fm_sel = devm_gpiod_get_optional(dev, "fm-sel", GPIOD_OUT_HIGH);
 	if (IS_ERR(priv->gpio_fm_sel)) {
 		dev_err(dev, "Failed to get FM selection GPIO\n");

-- 
2.45.0


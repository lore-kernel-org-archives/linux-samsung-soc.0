Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A896481C4;
	Wed,  8 May 2024 11:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715166085; cv=none; b=Lb9ad/Q/Z6SoLMCx0V2lfSUsHKkbr3DnlrHMRSKz3s7lRd6WnLCp7Ofh9fC0V5kjBJwWnTT/BRYhDoJvF6DlF7Z1vQ4ke0jZep7vmAi2Zf85BgGkxl08pJLZWpCZMCENsVhr75IP8WyqmH5dg8sQLTNi/s/IVD4HZL7g4ljPNjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715166085; c=relaxed/simple;
	bh=vuYNtCSoGcmTk8GfhvJhaoNcv6Dz56BFdGIefFxXzuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iXHdtTWPEnw6WS9s5icJs1aIh4E7UzqwoSHTpd3QSRiO3Gj7pCpa8zrtbs1kxO8QI+4QNS7b88kHVWVhWIlmlp84PSj0MOO+dXFH25Jh/VsBd51v2E7H3vtPRKni5cAtZ43U2VB7fIprZSep3+YfBEPssgR2E4LBobKMHnUjLJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlUqjYXZ; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlUqjYXZ"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-572af0b12b8so261283a12.2;
        Wed, 08 May 2024 04:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715166082; x=1715770882; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EUmoS//RS/NzAGvmwPir69ysTLwZDq4qcPlEK/AGs3g=;
        b=MlUqjYXZ8a1VEQdetSUdKWdtwGiiNvn+8bQd9aGzt8zoaQ1U2sgIcrCh0tXoaonyPf
         Uv7af8jhyef4rSf4SJtWEPMKA8bNkEs/4h8BCSyze8tkC5JkT3zFO+XOS2eRmfSP+r3w
         V0MQYISXqKUW/lT9X33P/2VMlS+iELQAAXMHeXi8RkgsreACJvffYbZ1bbmGbO9/k56D
         NmZ0rBCrTgQ30GA2PhmD0I2IHyPWBrud5v0OaSwXmoBlRObZOnU5m4bi1HkblQlnoH27
         MiPSylrAa7DGBrfA/8mI2p1+YVCEVs3VLom1iXjybD5i1uYjF4BzayYKQFfMd04wC05Z
         TyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715166082; x=1715770882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUmoS//RS/NzAGvmwPir69ysTLwZDq4qcPlEK/AGs3g=;
        b=ajmoXO6tJsHBqDlWI3yGr9qKg9PevmzXejXz/GIuMSGW4J05s7l4I9qfRxvosNS7Sl
         h65yMl8LZCS8WseME8M4vHNgOoLy1u/bFJ2zBpjxEUlpdzTjgNHFHHplh4mwi6T05Uqj
         M2XBnNolHaXWfEzBc8o6z3NB2c5Lz/NtKRMcXebTSKGOW0bbvz+Ui11ryhp6GiLarjsa
         qxB3o9hWNqw6v2cuGAfWMjHL3fV1rFOw4yn4PQxKhtIzAtL3pFJOIokkteVY2dMAWY47
         V3cSuSh8SEQRjgv/GwPGoT5HDLpj4RAljwnCGKoEPDBsXhhU4sId6VvnEflJi2B8lQlv
         luOA==
X-Forwarded-Encrypted: i=1; AJvYcCXV3moEzseoRBbQyWA6lLFKZbtGQzGf4ZD2P0pYaF1j9ngOK+BBUlCOEjAKzIRZ2Ms1nvLMS99hl9zQp99tICjYDThbu9wN9vVw82KV/oNCfIoBsTzpcsiXJ8B9J485zkuYrZ7eQd6Ht81znqWfaF/1neSyLDBJd6Gsr5g6x0DVTQI2pveDBZUHjHQZnBSyWpjpKnbQ+kp71UPDP/J3tKvYtpczDFmuQ0w=
X-Gm-Message-State: AOJu0YzCbeMU8tjk8yqlC81QzIkWp0O2tOIXghjNai6CT7cJlHuy15Nu
	TecnNVCSzaCUcGA9MAvaQ48X12OeujPuHD5BQd4DF3/4YX0LwRSq
X-Google-Smtp-Source: AGHT+IFpa08if4ZV9EcVB9Vu0FNL1rhqQENCxKWqxLruW9MtTmzQE21qpCft0G/5NCYFuAFYkQ7HKg==
X-Received: by 2002:a50:8e4f:0:b0:572:983e:4ff2 with SMTP id 4fb4d7f45d1cf-5731da6b398mr1572580a12.34.1715166081904;
        Wed, 08 May 2024 04:01:21 -0700 (PDT)
Received: from hex.my.domain (83.8.126.253.ipv4.supernova.orange.pl. [83.8.126.253])
        by smtp.gmail.com with ESMTPSA id m6-20020a056402510600b005726b58a436sm7455793edd.30.2024.05.08.04.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 04:01:21 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 08 May 2024 12:58:51 +0200
Subject: [PATCH v2 3/7] ASoC: samsung: midas_wm1811: Add headset mic bias
 supply support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240508-midas-wm1811-gpio-jack-v2-3-b4d36cd02c6e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715166076; l=2705;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=vuYNtCSoGcmTk8GfhvJhaoNcv6Dz56BFdGIefFxXzuk=;
 b=C9o5Z/2OQb6j2lE2jgdzRhl3b23clo+4hlUt1ZBA0i0TeRIuu/ycDQLUWV3DXOpmG7lS51aJt
 w5uuXAvDZEOCcAC2iAzkH1PZKsY/Se7deOh5m8oFoPnrXyEJypdVsxb
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


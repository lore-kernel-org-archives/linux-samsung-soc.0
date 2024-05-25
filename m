Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9405C57CBB;
	Sat, 25 May 2024 13:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716643695; cv=none; b=AJWgkH2ogg+C30ZmPctHVNZa4U8oj5gmiH8CmUEuJWLCQYaaKEELjkuPWM3xBODUouuNlt0qfLyNXr9BUS/a8BDvSArR6SUO/2x1PkDkYI/oQsO+2pOCk93ofRafwJsDzp4pfNUsXQxC1O2CZNFi80O2xqsc8VMEaTPb3irJKy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716643695; c=relaxed/simple;
	bh=SrwrcA8EO/kpCKyL39XjnsPTrNdBE58a73YIeAazdTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q2ozANAmJXcUPq4uGjkn2+PphU4aRSTcljdkJvMqqW5hgsCo+5Vd0mLmXpKdyawcfXwOR4WLTE0GBeAbvwsh3Z86n11KQywDMfB74XSYjBDhFQKL0BGst3AkgBeGeutH1UbpMwsE98P0Ydyb+GFkxytWOmILwN4ghXVod4gRLMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fnz+uVOl; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fnz+uVOl"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a5a5cce2ce6so1245053966b.3;
        Sat, 25 May 2024 06:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716643692; x=1717248492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BndYTHAhfTKZPUuhsQObxrH+e5h7zSrDvT6UBM9kSxU=;
        b=Fnz+uVOlu/QH2r9MLwhqCNOzzNtxCR2dAmDlQHgLiV8SiKvDZZWKJIoQUlv+YhgqyA
         1pZuFgVZa0yNmDu7LOG2G8uMx4snnEWUuY/oCeK5i3tkaXLtKhH9Q3v0gxdIcLt9AAqm
         WKtcEWsQhEs0tGKHanBAkmnUmzkUWYglVlpmVedx3ZG1148ZC2AG6wDsYQ/eVYAsp0Lc
         LCIZPBOC653bmuVVjkA5dExlXCel2eUmkVNL1NFQmNE+m3fg9Iu2VA5HQnE9FvXedjbC
         O1U40AKSuKiYhLQV1VptVCy8iYWkzjVdv6LfjOmakAiJFV6Nz8AA1/bPGkFrxqrMzE+m
         XjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716643692; x=1717248492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BndYTHAhfTKZPUuhsQObxrH+e5h7zSrDvT6UBM9kSxU=;
        b=LdWiD25TF7lQzK+OB8kSIPj1DZvWsHxfqswEky8858/RTr6Q1A6XoAkLeRwy2dd3uW
         yuy/MVkmBLuT6tBGMPwBq0GzwVnNn31d+I0n8haGso6b2fQTKqBGqdZe2YmuPrZb7YxX
         7jf1dzABK5AkYrJokWlcGpe9jCG1mpPp7BNATnH7swNEbCzy9EIwCC4NMsRUhJaJ961F
         53H8G0SHF0lfAwTh+09vpy/wGPoq3Vu7y0Haphzt/SV2zoeEZvpd8bKsBUAzGoledJkE
         D4w7IkLqDcHvMTNpIyDs5wQYGKIgfxyPCnyjGL/nmLqeVFhzA6m42b3jn1KXsiiINR/9
         Qidg==
X-Forwarded-Encrypted: i=1; AJvYcCW2wzMZ3V0oi5XEPnrIpsWyPjkZERExAwN8ydzH96ir02ALGg+BOvy628yqT1iTjewIhlAl/+9HszBr+a7aq0erTjyffL9eMQtM+1ihacNQo8Gk1NWkPi+xRT3JoOCFB/mUwhY1GfNn6NfhTBHIxyLSxWqLX/+OTEXgDgvNjNKfOa+USOnm56CzX26A3iBpkrZNTNuucdoVLjN9F7Eslj557HIFqQS1dJI=
X-Gm-Message-State: AOJu0YzUFx8slT1ERJ8YVolzH8/Bu1D4Bn/Ju9p3d9tFEpRtfA5tN02J
	SBc7AGn2F9L9x+w50dKs3dNcL4XFKNIGS4wLrLdhoYAAUvaTbjcY
X-Google-Smtp-Source: AGHT+IGnZd7WsivKWQF4T7VRJoyzWWWhjF8m2C3S/hvrEcSGj7gVML/vaSsvg/m9ubAfv5dSHplv5A==
X-Received: by 2002:a17:906:34c4:b0:a5d:1079:ae43 with SMTP id a640c23a62f3a-a62646cff2bmr303714966b.46.1716643691879;
        Sat, 25 May 2024 06:28:11 -0700 (PDT)
Received: from hex.my.domain (83.8.128.191.ipv4.supernova.orange.pl. [83.8.128.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cda46e1sm251842566b.196.2024.05.25.06.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 06:28:11 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 25 May 2024 15:28:08 +0200
Subject: [PATCH v4 4/9] ASoC: samsung: midas_wm1811: Add headset mic bias
 supply support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-midas-wm1811-gpio-jack-v4-4-f488e03bd8c7@gmail.com>
References: <20240525-midas-wm1811-gpio-jack-v4-0-f488e03bd8c7@gmail.com>
In-Reply-To: <20240525-midas-wm1811-gpio-jack-v4-0-f488e03bd8c7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716643685; l=1496;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=SrwrcA8EO/kpCKyL39XjnsPTrNdBE58a73YIeAazdTE=;
 b=aOb+rU2suanKpvf9j7yJWCC8tRfhD79vM2VGE9vwAf3aAdab1HBw88AGPfMZzkzES4TSFtHuM
 6DZtzJEPYveCOX4cpcoNbmRXsBVqaoVegYq+563CTSs9fB2kR85Cl6t
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Some devices use a headset mic bias supply (sometimes referred to as
"ear mic bias") to enable/disable the headset mic.

Add a REGULATOR_SUPPLY widget for this supply which gets the headset-
mic-bias supply and is routed to the Headset Mic switch similar to how
it's done for the other mic bias regulators.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Completely changed to adapt to SND_SOC_DAPM_REGULATOR_SUPPLY switch
Changes in v2:
- Added this commit
---
 sound/soc/samsung/midas_wm1811.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index 20b274734487..96cec8e9de98 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -237,6 +237,7 @@ static const struct snd_soc_dapm_widget midas_dapm_widgets[] = {
 
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_REGULATOR_SUPPLY("headset-mic-bias", 0, 0),
 	SND_SOC_DAPM_MIC("Main Mic", NULL),
 	SND_SOC_DAPM_REGULATOR_SUPPLY("mic-bias", 0, 0),
 	SND_SOC_DAPM_MIC("Sub Mic", NULL),
@@ -248,6 +249,7 @@ static const struct snd_soc_dapm_route midas_dapm_routes[] = {
 	/* Bind microphones with their respective regulator supplies */
 	{"Main Mic", NULL, "mic-bias"},
 	{"Sub Mic", NULL, "submic-bias"},
+	{"Headset Mic", NULL, "headset-mic-bias"},
 };
 
 static int midas_set_bias_level(struct snd_soc_card *card,

-- 
2.45.1


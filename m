Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5073581741;
	Wed,  8 May 2024 11:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715166083; cv=none; b=mROzzAssE/ppe5WK2X7/h7z2Ok0b+L/6k2L6E0z6wir6nlBLr7N4zVHJcI9oOTZxG7kCJUgcvotgyhAyp0qxfXqwGpIzZvm3In6TuNY2cLBEgMEMRayJp9aRyMXXD5PfjvPIb5+oVo5vRpRjTGtdgp+IYzVqNUCj6OaS+117Xls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715166083; c=relaxed/simple;
	bh=oxZAMqMqlKlTjZ/d/nZ7mM8CRcGM1aALJhSvZTlSCIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ceFSfyZt155okcy4qUhYRmmkoeL49mu6eQowI38rLT28YOHCduX11F44wbXHYErfY1JKagdu45CVi+IELm39XK12HR8R/SNWmAjiqOkf3UMgmpXLVluHnkGuzapGTUwkjXDMWQm/4hdddanBEeG8+rAeaucmoXHXwUir3BXfxZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h78NkUgx; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h78NkUgx"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a59d0810f59so667730566b.0;
        Wed, 08 May 2024 04:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715166079; x=1715770879; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GBQXsZU35VYhqiFUuzQSMRWlgIZsYX5osBGZyaRNZAc=;
        b=h78NkUgxCz+kmb7lsG+mBKYffgXZPh3lp16szijvyo7qkF1akBB6zDPniYo7SowA3k
         LAH/fqzMy/EnaSM2lexp+eMlhtoZBF4XojanaxXfNhQ7+KGxvoZHHpdmmgr/UdTdgVEB
         Wlr1euOluoYLKhx0c66M5wp9dbDyBoapmTUwPsDOLZDqiaJMfwIGJvRLgg6BC+/QcUpN
         HvrfN/Rl1k16N2yiV7lUMUzQ54fAZWT2oDb9EUvm2YfuxheX22u3L90p1/PSt6EA/zGZ
         LucAm++opS8bXUzQlFy5lxJEUrH9CV/O5zO3pLebN3EHdKMR9wshIONnGqTTY+UIfGxe
         Yy7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715166079; x=1715770879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBQXsZU35VYhqiFUuzQSMRWlgIZsYX5osBGZyaRNZAc=;
        b=YMeLMBkpMWt7Vsgw25tHpVmdNhhi0MNXqpM3C27PJSRJ/OSUg87KxFXztoEvmJPXzt
         f5KD8Y+MNNmcnAMq904/K9Xggxo62HA9x2HT7nd6iddYZ5oT2k4ABTQARmdlHK1Qx2vS
         01I5WJvL0bzBiJ4l6OgVr3jBso7JQudYBeOHaE+tLfqfTW0zhUzoZpqk0tF8njO4uLhd
         4s4X9XgOqWMPwXELMZ5cCgWPWsMvEVt2z/5jnYxk5ZMP3Mmd5B3H8oLgvCIHesXanm+G
         dLRufJQjKclwON7El4H38/abJthTERQByBpH71uuHhjE+ZtQYMF3+DnZ5BrPNxw/aOUE
         Jj2A==
X-Forwarded-Encrypted: i=1; AJvYcCWMOzcdzT4jzDtVDubP/UBvF0Rj7UwvBY1NBO8NabyB4/zQXlna1vX8MafgJf72aZtYnRuSh/vsAS9yxBWwluzf6XejTuh6fE0I5VNnfOvd3n6Goa8fmrfATMOzx06MZPbh/HAL4UI+9JF4lCQTZyOZyl9h4ZXfW2fejqPr+siTKGX920SeOfX5CA1WJieLnTTvXXJo0rkZILFBKH1Q0Bvay03dnXl97Mg=
X-Gm-Message-State: AOJu0YzryNBFYIbzozf64NatngSyuDUhguGz9BgAbhTitrNsX/5SGG1W
	bXi9mry6K8l2FGFQUB7OGnvwIP2IUzRqO26znLyP//brzpCub7F1
X-Google-Smtp-Source: AGHT+IFgeu/s+KC8rDn6htjx+jvP1Y3rc1ZlgtfjnZ0vURY07Nu9Xv35QHBlM4I/VNTBm/3YvoUPAA==
X-Received: by 2002:a50:ab59:0:b0:570:3b8:a990 with SMTP id 4fb4d7f45d1cf-5731da6977emr1667758a12.39.1715166079292;
        Wed, 08 May 2024 04:01:19 -0700 (PDT)
Received: from hex.my.domain (83.8.126.253.ipv4.supernova.orange.pl. [83.8.126.253])
        by smtp.gmail.com with ESMTPSA id m6-20020a056402510600b005726b58a436sm7455793edd.30.2024.05.08.04.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 04:01:18 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 08 May 2024 12:58:49 +0200
Subject: [PATCH v2 1/7] ASoC: dt-bindings: samsung,midas-audio: Add headset
 mic bias supply
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240508-midas-wm1811-gpio-jack-v2-1-b4d36cd02c6e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715166076; l=1024;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=oxZAMqMqlKlTjZ/d/nZ7mM8CRcGM1aALJhSvZTlSCIE=;
 b=K1veHz6hjzCU7royAnxjqrMCC0z9fIknAhe0rQDN3eWSJhF3ZkHUPxbS3lAcGY5M1qORpIsuP
 pD4Lape6OslD+fk6fUGab9UEaED1Tl0U0keF0AjW3Lq1k9isWgrReLQ
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Some devices use a separate mic bias supply (also referred to as
"ear mic bias") to enable/disable the headset mic.

Add the DT property headset-mic-bias-supply to allow for specifying
this supply.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
index 6ec80f529d84..6ed53dd0bb53 100644
--- a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
@@ -53,6 +53,9 @@ properties:
   submic-bias-supply:
     description: Supply for the micbias on the Sub microphone
 
+  headset-mic-bias-supply:
+    description: Supply for the micbias on the Headset microphone
+
   fm-sel-gpios:
     maxItems: 1
     description: GPIO pin for FM selection

-- 
2.45.0


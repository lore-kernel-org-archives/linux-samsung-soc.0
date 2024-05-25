Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEF24BAA6;
	Sat, 25 May 2024 13:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716643692; cv=none; b=XevwapaEi5UMzEp1TrOQoC4TSb6kYQnWhgybayOzwmk1JcIMD82yhjMncPWZG7zstMKNqKeGxj8TAjrspX+jwBNW6f/lPlrogbYEAnwuny8CTKiwX9yMbSap522tFyMmCOCQ5G/tj0jXqaOOhAuoiTEotrPWRaoyA81nStI3qjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716643692; c=relaxed/simple;
	bh=Rsl4K9dB39cIJFWh12QWC6byH17AfCNyG1AGcEHy56E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XhrIXtMtPKlWd9n0X/NujQRtZvmvUs9jRGAn85FT3FICubTc/1LTAvb8RqoWF6rkTKKi3SxuE30Z2ZHVze7dDMD2X73o9fSYnADKyuJ/KSh9JfV6POQFDsHI/c3k6ShprHmSAIsnl6vad48p0dWWDJ4/XsiEPEas+v8DaGAki9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5NEcIbP; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5NEcIbP"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a626ac4d299so179788666b.3;
        Sat, 25 May 2024 06:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716643689; x=1717248489; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaBTo72FFPQQpv6Vx/c6UOAp3vgYZvaAb8kpzvmiOq4=;
        b=b5NEcIbPAfGUb7WNNEVekhn0Um20jspQh7g+49S964xhNI/2fcEgv95l6uXhbxbWkB
         Bnlt8nN0sj0WfsJIv6Y+u08PR884GFCBVdwgxeJ75bGHahfDGSPMR3Ic/B/aueFiTkQd
         aWNFOhb1jWqW55uGOc0DEYxHMJbKE/y8XPbmP0IQ+xJXdiJk8skNqoBoVhiZSOEIMsmX
         ggErQ13BAanr25VJe0FZPl+htiOxa2yNMEHyQgbvGFAVoJwdmhRiH1KdSuQvHLKAgv3v
         7PcLnArkyhnnCLpP5EghZ04K3WDDY88dED/yUYXV5rn6meKmVQN67x62KOfGzF40Ttup
         qnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716643689; x=1717248489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GaBTo72FFPQQpv6Vx/c6UOAp3vgYZvaAb8kpzvmiOq4=;
        b=j7zHNet9nK5ZHp1piC0/4mFXqTcl54RQgyfdeVXQZFfjU1pL71LWK4Ola0MhaNqXOb
         khMik8C3MTOpyZ1fjxF2FETfGe5XzZUtN1Xoosi/RuKm8D8qsqk6h7WXiIeL6eLakIBk
         uTxL8zPjE0LAdanaXy9evfO8ZE4NM8V7TOm31huqhk7LXNqYg7Y3ZWHv1DLiDBf+iYH3
         HzXCPAsq5/8s0PZP8Jr4AVL1UURScT4vekqLOS10FMH8oGDL0gutviZp+37nR9MvY6K3
         v9H9UpntZGxhbQ9Hmc/8rQtUUZ30tpSuFUxd7T8K5/aB/01Wm9+VVS25RinoVBlcB6k9
         4y2A==
X-Forwarded-Encrypted: i=1; AJvYcCUjBrRHXBQ7IIY/S64vsEGah89YwAbdyxybOAdhyZCFa4gWUdu7yRdQzszHqGFfatd71qWS2/K0pi2cPvjkpqxk5vy6pyDpxzTd99Ao61jGwWmj4PPym8TpFiUF094ELBwCgxcCt0sazy4jyWHAIUm539iVB1tm3VbRWPcDXQX7SzxkNoYNBv02za3jqkzamixdXuEfjwM3Jl3fQPyN7luV/lDpzOaClsU=
X-Gm-Message-State: AOJu0Yyum6BMe8HmR5kLf6xKcyDdh3+bKGhE8vMLGJxyxA22lYOIVIai
	SCPzKq/CE8tA3JpuYr9/y6jD2smcA9uLEhzMWuFW8HvilXXPyTWI
X-Google-Smtp-Source: AGHT+IF4bGIOqG3W34z32lSukG6Ef5s1FlI9dkGFnxyKECa3N/yURT+cuvpIZ9OZEntCd4Ld2UdhcA==
X-Received: by 2002:a17:906:a0a:b0:a5a:4683:e961 with SMTP id a640c23a62f3a-a6264f0eeaemr311160366b.52.1716643689383;
        Sat, 25 May 2024 06:28:09 -0700 (PDT)
Received: from hex.my.domain (83.8.128.191.ipv4.supernova.orange.pl. [83.8.128.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cda46e1sm251842566b.196.2024.05.25.06.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 06:28:08 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 25 May 2024 15:28:06 +0200
Subject: [PATCH v4 2/9] ASoC: dt-bindings: samsung,midas-audio: Add
 GPIO-based headset jack detection
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-midas-wm1811-gpio-jack-v4-2-f488e03bd8c7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716643685; l=2328;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=Rsl4K9dB39cIJFWh12QWC6byH17AfCNyG1AGcEHy56E=;
 b=VNuxPjI5euL5nPUvXQhYTV/hpQPtChvapioTHtcSQs/+z/mENYr3KDtB+9gBSeEivCEerZK5p
 9DGuSbFHIJZAbOQ2gV7eXkUb/2PKxPzwrTr3VdIZIAQlJ3PaqU92shJ
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Some Samsung devices that share the midas-audio driver use a GPIO-based
approach to headset jack detection, as opposed to using the built-in
jack detection provided by the wm8994 driver. This setup uses two GPIOs
(one for jack detection and another for key detection) and an ADC
channel for determining the jack type or button pressed.

Add DT configuration values that allow for describing these setups.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v3:
- Re-added pipe (|) to description of samsung,headset-button-threshold-
  microvolt to prevent syntax error (otherwise the "in order: ..." part
  is interpreted as a list)
Changes in v2:
- Added vendor prefix to threshold properties
- Dropped pipe (|) character from description: field
---
 .../bindings/sound/samsung,midas-audio.yaml        | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
index 6ed53dd0bb53..69ddfd4afdcd 100644
--- a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
@@ -64,6 +64,36 @@ properties:
     maxItems: 1
     description: GPIO pin for line out selection
 
+  headset-detect-gpios:
+    maxItems: 1
+    description: GPIO for detection of headset insertion
+
+  headset-key-gpios:
+    maxItems: 1
+    description: GPIO for detection of headset key press
+
+  io-channels:
+    maxItems: 1
+    description: IO channel to read micbias voltage for headset detection
+
+  io-channel-names:
+    const: headset-detect
+
+  samsung,headset-4pole-threshold-microvolt:
+    minItems: 2
+    maxItems: 2
+    description:
+      Array containing minimum and maximum IO channel value for 4-pole
+      (with microphone/button) headsets. If the IO channel value is
+      outside of this range, a 3-pole headset is assumed.
+
+  samsung,headset-button-threshold-microvolt:
+    minItems: 3
+    maxItems: 3
+    description: |
+      Array of minimum (inclusive) IO channel values for headset button
+      detection, in order: "Media", "Volume Up" and "Volume Down".
+
 required:
   - compatible
   - cpu

-- 
2.45.1


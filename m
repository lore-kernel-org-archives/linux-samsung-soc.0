Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BD281730;
	Wed,  8 May 2024 11:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715166086; cv=none; b=gSrVSqvXSPL4+ebY9xVowEPN4KlX27jHx0yrpNCjklfr9BGmJD16vojxVIAX1lN8SUmufYNmV614psbr49bIDeCgMZ1n4m9LSkdzu5XMo1IG/ptSqAWF1bVvxnIzWa8OsRNeBnUTuvcmGwE12G2NZ6b35eEbp2Ya6N3LikC+xxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715166086; c=relaxed/simple;
	bh=x4CRj3HPQjjxV02Uhbn39jzTSMCqAM5BsNr5zZc40mM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OOBL7x1kpd6Gjvw4RjyjYUaV7unkoasMC1/mjAW83t7JbfiRmSQhAnwYtCu4iTcPvvp0EZcsV7/sPYDhK98suTG7uLbq9jw7KJESpSmWts991GZ9WiJmsebdPc3g0jqwjnpZRYsubrKI0q90cI7iaKEfI07PMdh1iTciAcvIk+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kM6UwXvN; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kM6UwXvN"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a59a0e4b773so1010678366b.2;
        Wed, 08 May 2024 04:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715166080; x=1715770880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bT4moxnFWMX+ROOOxuh3w595mSjqjEQ1yI4SN/pV6pw=;
        b=kM6UwXvNuw5K9E42LlZ/ucjlVwkIt2XzygZVBfDK23EGLoNdVkQGImfNz52x7DalxZ
         p9hIxofKeMt16xvaB7zJ54I7hhmdXZVHJOvCn1ofjrPYA2v+gVxzDhMdBOu5yHUNYOJT
         w+UDlR22UjsKkFx5zZ7cPRefCxafWmbAnR/Ttw2kL0udK3NoUkkCyi6Hyem4KSMmOgT7
         VcwsYIqyb5RBugNGv92Vmzurx3Mynp8MPmifpQp6vIpKYzYseJ9aNun+irxiC9FMauO5
         l0C8GLzkCjM8QEG2cGGLl7TyHbZR1Rp1MMIo4yPi8iSD1XZ/vtHzDajC0pwaZb1FRSNV
         wlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715166080; x=1715770880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bT4moxnFWMX+ROOOxuh3w595mSjqjEQ1yI4SN/pV6pw=;
        b=w3hjt59NFAuSLf4C29UWTA1vAwkQiW3UazyGgaGyM3zkrVqbpVeBOjzqjMciLmrdBx
         Gjz6uYGpggtCFiJokGZ6Rrq8sHV/zVvPoIc9eQKn/aaX0UP4lBvBqzVUJ3KbtCKqxRoM
         H8mjwcbgg/WRkE1WFBzjWkQGSb0PdXoQTNTpYuquGnUh33Q2RtdQKk6vrJlAv5cD6syE
         ocLT7DPmwAUqW1AjDJq8XRhgTTEILIeLEj7pcm1AT9yPAQP5aRWgD9iVgekmEcpbzAJA
         xpbVok+sk1w+nb2lxEaPEvQQjoVfIAjIJB08R43m1F1RKM9YQWRtnGrxMOcUCKjNyyVk
         u0jw==
X-Forwarded-Encrypted: i=1; AJvYcCXa4rhH+9uOwvehgGCA1jByfs9qlDWfFYeP5FOqTAAsJx7es0Vvtlb9WpYLiCy9qbwqkR2M7rqUVQbPouV7pCtkmI32zrzm9qtMExCzIqMU1zAUC8OwIDLvNtTaI3spPeBibITgfS5jNstGmvIZ/Ds5KLXjbwpe1GjKF70XqZDBdfjSP/IpUgC3Jot7xOX0zV6Of5lA4ksJ5faz/Qj8qtnLuFtry5yzCVM=
X-Gm-Message-State: AOJu0Yy+GWUiJw45DYvb/j+crggKEqFG16ndiMcgQrUJs/0J+ti7Xid6
	YEA/BlXjYA2VTbl65rZ8AoDBg8RyFZNcJC66DHY1XGhbbkTcAvGa
X-Google-Smtp-Source: AGHT+IGyZZH2dVq+LOe0zaf4rz7kDLtf4v4iLQC8umEfCOPDmCDuJtUXH0SpHIqe1/sL73DxJ3vqeQ==
X-Received: by 2002:a50:ab49:0:b0:570:1ea8:c50a with SMTP id 4fb4d7f45d1cf-5731d9cd410mr1935750a12.6.1715166080555;
        Wed, 08 May 2024 04:01:20 -0700 (PDT)
Received: from hex.my.domain (83.8.126.253.ipv4.supernova.orange.pl. [83.8.126.253])
        by smtp.gmail.com with ESMTPSA id m6-20020a056402510600b005726b58a436sm7455793edd.30.2024.05.08.04.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 04:01:20 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 08 May 2024 12:58:50 +0200
Subject: [PATCH v2 2/7] ASoC: dt-bindings: samsung,midas-audio: Add
 GPIO-based headset jack detection
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240508-midas-wm1811-gpio-jack-v2-2-b4d36cd02c6e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715166076; l=2135;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=x4CRj3HPQjjxV02Uhbn39jzTSMCqAM5BsNr5zZc40mM=;
 b=zsZQ0yeh7zg0Ep6m1GYQPRjfMq2PTI5dByvyZhsHCpPeLOEvFLhyar0/PfAzi8k6j4w1bXraj
 /eDPEpjzkwMAq1iMHceo6NnRRQvuVdZXpOxSY/0HEXQIzSIoLMG5QuW
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
Changes in v2:
- Added vendor prefix to threshold properties
- Dropped pipe (|) character from description: field
---
 .../bindings/sound/samsung,midas-audio.yaml        | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
index 6ed53dd0bb53..6b760a73e8bf 100644
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
+    description:
+      Array of minimum (inclusive) IO channel values for headset button
+      detection, in order: "Media", "Volume Up" and "Volume Down".
+
 required:
   - compatible
   - cpu

-- 
2.45.0


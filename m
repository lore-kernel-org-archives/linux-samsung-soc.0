Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A245723769;
	Sat, 25 May 2024 13:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716643690; cv=none; b=GhMEtaC+nbcFkuK5jTWNTuSOjEFrHMIHUq8LrxjXB5pn8twPMcNDBMsUL9m+wDlfifX6DkiQxqsysBUOF06its5wa/RzGLhaVVIs8ve034hhkKcb/JDbqNq7+EZjMeGyTEtGHxtosGcU/QLUgsFAEAUuyBldEMxgPgpiL393as4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716643690; c=relaxed/simple;
	bh=4zLRKryEPEhLxtkijn6RbgJhMMJkRIFlKDleLaNwm/A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TrCrVdME/w4ig5UtWla974ZvofScHp8f+SKpiXWILqWO1go742hV6z4qkTtHJCHR+0Oduk8sDUpTFcSc1XKUgwVXQJI+mZPEz5rTB1KGcBT1+N6++IwVa/RDGFJiNBp/lRI7Zc9ei9qxohCaKfZGGmNrKOuAa7IhItNuSyU0+Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MifxOLym; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MifxOLym"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57883b25b50so544910a12.2;
        Sat, 25 May 2024 06:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716643687; x=1717248487; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mo8+1mx/nA30VwrcIjP4AOPt1PugmzRzdV+Mta/P/KY=;
        b=MifxOLymWV9kdarKIMc7uFLR4LJIHGY93ZHy/Jk7IJO8cUyrhxEq2ZwghVZKYgycGu
         PRFXAj19Dq2ThBC461rKT1zPHbtiKzCDNLxEkdO/glWMe4MxrInWaYfuAX0WuL+WcTdT
         bXsdmFoNh2q6ZgaVShDSiR20pzGvgdu4z9tvOPOCbPLldFK6ForG5NPbJg0a1CKPcHXJ
         K63ekMRelAx61zRJKyDFu+ryW6nfsriaAv+FLyXEpbOqwbgUcXs/ePDCVtyrk2SKOlv5
         lOVN+wUyL5170LomeHbHhHKwXEKEhoY8D0JbaKFUVXxszFFtu9EgvE3WvDtjSZCAl5Gr
         VG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716643687; x=1717248487;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mo8+1mx/nA30VwrcIjP4AOPt1PugmzRzdV+Mta/P/KY=;
        b=FMUbD37jMfR+zXFkzDO7xTK8bbVqJZ+xbmUU+LbWB5AwCmHLSN1xyJ6kNS4PIw00qz
         Kymkx664t6GNeTVQIhKXoIR6nUCuiaU1Aip4E2UfyImIBmEdHG8pp8w8O7M2VNaXXdgp
         EfTd1xYW7gXl+d9RrDB4kfBzysBeJNurwgKLmOHs6hSh+cKErY6Uv8yGSNUbjHyUBWDS
         okBJ59m2dq0VYK4tNORRKpxJLusdVayQyqabo9scj2CRrvRsWRKc61GGxzHL3+somWha
         bE9QgympYAwZI06ThLqda4+YNUpHvBgZznDK1O8F0chfBFZeHwhypL8VhTA7Rg7ogmQV
         uzZg==
X-Forwarded-Encrypted: i=1; AJvYcCVBxNvvUxFNxHRjtEiFj4QvLM5XZBA9HaQvqeadANvz7RrvcFUWexZ+1fIMJlbWJVJwF1OCOW+anghKb/TikCwH7/qJMPQTJcGHdEIOdvcL+pZHKxLd1DLTAf46s4uXKOMaDLaVZPLP1hPWbztOSSJM7tHwpXh5OuM4ywXrCzrUm4zrXjR4vQEXt93NaCkmpGJb8REkbbqBWB70kpSYabclmJI9E0JCs2Y=
X-Gm-Message-State: AOJu0YwQKBfgu+g/jX7lUU2KmVQhSqHIJzRV7L+Vsiv8tg6BEDc5qNuV
	GKx6QdUArZm52mu3pE7bCyvbktdBHjBU1UF/lqq3AT89907+e16W
X-Google-Smtp-Source: AGHT+IE3gmJUIvul4S1O2zw/h8rOZCXQEQULnqDXXH8/XuEr0PvPCteVwNCcdD28vdmFGEI5XQNy4Q==
X-Received: by 2002:a17:906:48d8:b0:a59:a7b7:2b8e with SMTP id a640c23a62f3a-a62643e0787mr323899366b.29.1716643686789;
        Sat, 25 May 2024 06:28:06 -0700 (PDT)
Received: from hex.my.domain (83.8.128.191.ipv4.supernova.orange.pl. [83.8.128.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cda46e1sm251842566b.196.2024.05.25.06.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 06:28:06 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v4 0/9] ASoC: samsung: midas-audio: Add GPIO-based headset
 jack detection
Date: Sat, 25 May 2024 15:28:04 +0200
Message-Id: <20240525-midas-wm1811-gpio-jack-v4-0-f488e03bd8c7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGTnUWYC/3XNTQrCMBCG4atI1kYySUyrK+8hLppJ2o7aHxqpS
 undTQtCFbp8P5hnBhZ8Rz6w42Zgne8pUFPH0NsNwzKrC8/JxWZSSC32QvKKXBb4s4IUgBctNfy
 a4Y1bEFIaC4lHZPG47XxOrxk+X2KXFB5N957/9DCtX1KtkT1wwX2KzllnErT5qagyuu+wqdhE9
 nLJpKuMjIzVThl0QqLx/4xaMHBYZVRkBEKiDGiN4ocZx/EDd8zgKEoBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716643685; l=3607;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=4zLRKryEPEhLxtkijn6RbgJhMMJkRIFlKDleLaNwm/A=;
 b=lzS2mNI5ljRanb1yQ0vamjZSFmy4b2nQZa2vjTwXuGZWExrbMpjflCts+SmNj5dVCDUH3E5rg
 KYPnEJ0mCskCVn7yrDhQ8xurQgoxPydl+59q6OdsOXxiyIy1A3xjv1t
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Many of Samsung's Exynos 4 devices share the same midas-audio driver
to handle the codec setup. While most of these devices, including the
Midas itself, use the jack detection provided by the WM8994 driver,
other devices such as the Samsung Galaxy Tab 3 8.0 (lt01) use two GPIOs
and an ADC channel to determine jack insertion, the jack's type, and
button presses (for headsets with volume up/down/play buttons).

In the downstream kernel, this behavior is implemented in the sec-jack
driver[1], and the per-device settings are configured in *-jack.c files
in the mach folder (see e.g. the Tab 3's implementation[2]).

This patchset implements this mechanism in the midas_wm1811.c driver,
and adds new DTS options to allow for its configuration. It also
enables jack detection for the Samsung Galaxy Tab 3 8.0.

A very similar mechanism was already present in the aries_wm8994.c
driver[3]; this implementation heavily borrows from it, though there
are a few extra cleanups as well.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

[1] https://github.com/gr8nole/android_kernel_samsung_smdk4x12/blob/lineage-14.1/drivers/misc/sec_jack.c
[2] https://github.com/gr8nole/android_kernel_samsung_smdk4x12/blob/lineage-14.1/arch/arm/mach-exynos/tab3-jack.c
[3] https://github.com/torvalds/linux/blob/master/sound/soc/samsung/aries_wm8994.c

---
Changes in v4:
- Replaced manual regulator toggles with SND_SOC_DAPM_REGULATOR_SUPPLY,
  both for existing mic bias regulators and for the new headset mic bias
  regulator
- Link to v3: https://lore.kernel.org/r/20240519-midas-wm1811-gpio-jack-v3-0-0c1736144c0e@gmail.com

Changes in v3:
- Re-added pipe (|) character to samsung,headset-button-threshold-microvolt
  description to prevent it from being parsed as a mapping (fixes syntax
  error)
- Split out "ASoC: dt-bindings: samsung,midas-audio: Add GPIO-based headset
  jack detection" into two patches
- Link to v2: https://lore.kernel.org/r/20240508-midas-wm1811-gpio-jack-v2-0-b4d36cd02c6e@gmail.com

Changes in v2:
- Added vendor prefix to threshold properties
- Added separate headset mic bias regulator
- Changed some cases of dev_err + return with return dev_err_probe
- Added an extra patch to replace some previous dev_err + return cases
  with dev_err_probe
- Moved tab3 DTS wm1811 codec config changes to separate commit

---
Artur Weber (9):
      ASoC: dt-bindings: samsung,midas-audio: Add headset mic bias supply
      ASoC: dt-bindings: samsung,midas-audio: Add GPIO-based headset jack detection
      ASoC: samsung: midas_wm1811: Use SND_SOC_DAPM_REGULATOR_SUPPLY for bias regulators
      ASoC: samsung: midas_wm1811: Add headset mic bias supply support
      ASoC: samsung: midas_wm1811: Add GPIO-based headset jack detection
      ASoC: samsung: midas_wm1811: Use dev_err_probe where appropriate
      ARM: dts: samsung: exynos4212-tab3: Fix headset mic, add jack detection
      ARM: dts: samsung: exynos4212-tab3: Add MCLK2 clock to WM1811 codec config
      ARM: dts: samsung: exynos4212-tab3: Drop interrupt from WM1811 codec

 .../bindings/sound/samsung,midas-audio.yaml        |  33 ++
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi     |  31 +-
 sound/soc/samsung/Kconfig                          |   2 +-
 sound/soc/samsung/midas_wm1811.c                   | 348 +++++++++++++++++----
 4 files changed, 343 insertions(+), 71 deletions(-)
---
base-commit: a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
change-id: 20240502-midas-wm1811-gpio-jack-b10226b17ecc

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>


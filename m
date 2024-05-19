Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431D31BDC8;
	Sun, 19 May 2024 08:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716106691; cv=none; b=EQpxvtDdC0vG14zwjJshyIzo9Qe+BQrXUOgpqCDToYiRqN6y/2BI/YbIyknRlqh4RhA+YwWJqkMldxteMq78lXLegcThOeEV0PpnYIdpXCycjuFRhKfphSJrDq71WpCcLnFh2c3JCq76VXr+bgtHOoTOnTFBF4xBW1S1iTzIbNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716106691; c=relaxed/simple;
	bh=vOmrQBJAdvlGhlh3IQuJFC5nzf12tuwIUaUkDgVZRHA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qWUG3PC4g55XsLjiaYky/Ad0Qp8iRi43IsO+7cQQY1quIlPVZ7eAsBgcOI8ropeuM7s5WMOaRoTJyr4Znwo7A9QM3lLRkOK3X6gsv48FO6ZUe/RBQAqPMbAYmzB9AKKRhE2S06rveovgCuBVXJmlD96I2RdSU7X29VSSK58K6yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZPBDQltB; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPBDQltB"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-572baf393ddso8767985a12.1;
        Sun, 19 May 2024 01:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716106688; x=1716711488; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vw+eqC8qYyRv3MIYCjMkS6Jwy9w22sYSmCr6FUkRoZQ=;
        b=ZPBDQltBxIlhFAuXEborYx8tjZQnNV+IG5GuoTqdXPn7p9DLzgxRQnNQOhi/vEVe2b
         Un5SNc3xowkp6ZZkLuiOZ95eaE5RO2ROPR1RK0t5PAusJ++OET6NKLkORvfFT8LXS2be
         n2mi+LfH0vA4AlL80LbXtzfN0bB62RYL2qtUNwW1Wi+l9qPTQ19/BZT1voiVM/O5h2kA
         sE+KRy/+gf2F9y2rgTHdWIRJTFaoH5Tr+0dUHrtoj+Spx3Z5sbqfW3dHfYu6zpuCEQpZ
         1Fa+yHTXN9gh4RxkvmOxaa/XhcmH60L/MuxJsuIo/9gEmFgpcxFg26i/Ye3xXUJUKHzd
         RywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716106688; x=1716711488;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vw+eqC8qYyRv3MIYCjMkS6Jwy9w22sYSmCr6FUkRoZQ=;
        b=njhxOUwIYjO7uIvBz7DhPIczcaseFtBJBWgItbnZ9CKaQqndsA+tKPX+FTTXot5fFC
         WLZubhcV8Wpaz+mn2gDfy4hsEIxThxfb29XklXGYWpOp9iBjaf8q24iMok0xyyNJtDTm
         iXFbyJeEhYHLOWxO3oWykF6lF5rlX5xxrCn8nDYgNVMs6U7qn/9A8Y9v54WNxM9eKG+S
         cTZh6qDPUBORkeXPZa6dmhA/59zRC0BbjIic8VDL+Pp7Uqj3ia/miC/QKNAY0UI6Wa2t
         ZCI0hLF9vzv3MnIXXDodw6q7vCJxTF+jlGK7jMkgfNyOSdaeOXRkJ/JINO5do+2T760L
         wtJA==
X-Forwarded-Encrypted: i=1; AJvYcCX8HAK35xCuQxkYURspk1at4aWS1zeip28tXCDxmT9CW9JQxqVTrS33vDbjUvZA2L9M6xh7ijERmxidYoTv/k/CQ7u4ucISFYKThLeeQYAdVro0w8arl2QZRBqAaFR4sJVXnLVaIAbaZfV2amNNVwCVs2yU1lrFqr6kFIColdrAj0VkvG444cPPLAm62fKHO0pKLTfpmNUcyRZS0sp8da9rlxS/bpN1L3o=
X-Gm-Message-State: AOJu0YzIMLUa/qtLRZwoOSCofYytD1vETiMgNtqTyybAf52uvysTbdxN
	toZED/20lmWamIbhf9CcpBSwxRbn9lgdRfIAps+plYckLZCw9aJG
X-Google-Smtp-Source: AGHT+IFTKZlj4vaDpbFg3ISEA24rKauu3cUeaZy4+4egT5W58uNnkMk5KIUOqtmg4LEoq7V+gTWqYA==
X-Received: by 2002:a05:6402:2695:b0:575:2c30:fe60 with SMTP id 4fb4d7f45d1cf-5752c30ffa6mr2896233a12.10.1716106688326;
        Sun, 19 May 2024 01:18:08 -0700 (PDT)
Received: from hex.my.domain (83.8.125.62.ipv4.supernova.orange.pl. [83.8.125.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c34e5ccsm13698518a12.95.2024.05.19.01.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 01:18:07 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v3 0/8] ASoC: samsung: midas-audio: Add GPIO-based headset
 jack detection
Date: Sun, 19 May 2024 10:17:46 +0200
Message-Id: <20240519-midas-wm1811-gpio-jack-v3-0-0c1736144c0e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKq1SWYC/3XN0Q6CIBTG8VdxXEcDNHRd9R6tCzigngpx0Kjmf
 PfQrc0bL//fdn5nItEGtJGci4kEmzCiH3KUh4JAr4bOUjS5iWCiYicmqEOjIn073nBOuxE9vSt
 4UM2ZEFLz2gKQfDwG2+Jnha+33D3Glw/f9U/iy/onyz0yccqobcAYbWQNur10TuHzCN6RhUxiy
 zS7jMiMrkwpwTAB0m6ZeZ5/MwkqeAMBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716106686; l=3238;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=vOmrQBJAdvlGhlh3IQuJFC5nzf12tuwIUaUkDgVZRHA=;
 b=8XirlovSgTFuyZInY7Ney+LFvrii3NLSjBFIG6JDVzAN3bhN/OId1rINWfUWRG1PFIHDFLUdO
 lmlBKecojj/BNO4y0F+SmsaVzGnzByslst8HeezuK6mh6DPNsON2UNI
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
Artur Weber (8):
      ASoC: dt-bindings: samsung,midas-audio: Add headset mic bias supply
      ASoC: dt-bindings: samsung,midas-audio: Add GPIO-based headset jack detection
      ASoC: samsung: midas_wm1811: Add headset mic bias supply support
      ASoC: samsung: midas_wm1811: Add GPIO-based headset jack detection
      ASoC: samsung: midas_wm1811: Use dev_err_probe where appropriate
      ARM: dts: samsung: exynos4212-tab3: Fix headset mic, add jack detection
      ARM: dts: samsung: exynos4212-tab3: Add MCLK2 clock to WM1811 codec config
      ARM: dts: samsung: exynos4212-tab3: Drop interrupt from WM1811 codec

 .../bindings/sound/samsung,midas-audio.yaml        |  33 ++
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi     |  31 +-
 sound/soc/samsung/Kconfig                          |   2 +-
 sound/soc/samsung/midas_wm1811.c                   | 343 +++++++++++++++++++--
 4 files changed, 379 insertions(+), 30 deletions(-)
---
base-commit: e67572cd2204894179d89bd7b984072f19313b03
change-id: 20240502-midas-wm1811-gpio-jack-b10226b17ecc

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>


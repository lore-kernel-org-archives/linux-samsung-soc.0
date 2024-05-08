Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA15D81729;
	Wed,  8 May 2024 11:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715166083; cv=none; b=WA5JSc/ZoXyG8dg3t5lDMnvDECn6W1Gs/C29ouN/81USVvlG3r2m/LJoP3tEK6LajPLIdv3CFk/z6NElaEmSiEYzqQLoSM5NOHD+ffzb7FY7N/TH2HSFAN5bOBHXmpjl81FxIY9H3TRzqgkIIdVROzJbIypN2p1D+rDTA0UkUqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715166083; c=relaxed/simple;
	bh=r5VX4FkZssbN7CluXLWuH6JvBu0lDlmJiHnKY2yOe2I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bmBRWEZ2sl3yvAp55n3FZ/sbub15tiadcsFt0uQ1Q/tKus4ghyHijl0M6b78RA9cfOMa0xqnu6bgIpPqACGzlTqJVfCSH4NN69+1tgZzeODlLJimCYWI/UBT1J6u01wnQy2U8qTBrxEG0c1lBb+kY2a9/l9ytL+PSO4Rjz4uM9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DiZrZiHc; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DiZrZiHc"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a599a298990so1136409466b.2;
        Wed, 08 May 2024 04:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715166078; x=1715770878; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nLUfxm5MoMUpMeCDhK5Bz2fJOiPFk2NnRkp477QVdeE=;
        b=DiZrZiHcDaQMtrjjTnQfcgA1simWtdWIpeVRb5uC5N/iwhKmxyuevj6OuTacdaou2Z
         Vfeo4Apu6V+CZATp0kPDGuY6kZYp6kPULNH7rR8bxR4OSMp+OJ62+MCnXear690zV0Bm
         jPWLcm8S9yyZ9fgoqQuzESa9jsqwkA3/LUhvVb3geosY5TI+ZSkp53o4wKo9i/EsysgK
         bNXw2P+gwtmTvH0s/0V3X2wjUcKmP05DFTHS+I9Iq6H1phFEJzj7jMPWgdS8sA3DMs3l
         lJCmX6NfUQoL6odH8kJjx5GdIsOg3mww49+goSHmDOMoXCQ67mx3IZ1Zhx2+y7MxoRWu
         hxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715166078; x=1715770878;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLUfxm5MoMUpMeCDhK5Bz2fJOiPFk2NnRkp477QVdeE=;
        b=FAkqUZQBQjRCGWsE/h4qiI9VqoC/z7UfSoriicx/iF7BBHw7rRRlsN+3k5I9qln7tt
         SBjAYAgEk3r4Aqf2y6mOSmyUc151pLlW2NGT6ljadAAqakzF2l2ntJ8sT8QnxeuHsLYH
         k85RningKtxhPb4+pn2QABbehej1pu7h0z6RC9K/KP/Ginoz9aG3Smr/AjBeaszPP0SM
         Wd6hzG0pDPSWLTQzVPZgplfDoaAOvA3RiVHtqnnQs8sF3G3PQdA7IQupmxdDdSSeH+7j
         5Rri/LEgkfhFTIWzT7WBWsQZP/tLxHbCo/abzif9LKlwU093eNMdclXbk/KDu4mYm1PL
         XWcg==
X-Forwarded-Encrypted: i=1; AJvYcCX8c7gbZh1ZO7799J1L/wGPvM0Ixu3gz5ucxrV/R1P4LyoBD/oZCg2ebYyXiC1d+vh8KjzZOGcSr2A0aBM3wXxA+Fec1PSBA3EZFw/Cq4+f72lYDo9cHmY1RgWPGl+8aIalPVoL4mn9vmztW0D8j2idKAgn5VX+5FQudPmriHeykd5vqXbFf09ydzimcmEO9dLytRYJHSYoTwqCtdqt5MaYW7FXjloL+Po=
X-Gm-Message-State: AOJu0Yz4Kt0eIfkRR9rtrkBk4pS0H9e5dfCxdqxp4ZhiSOtGHiNZWanZ
	1deSrXH+b9yNBAG6hiF3PpkvdT+FcOcmC2rXYDzKCrwahjcNPqKE99H4ng==
X-Google-Smtp-Source: AGHT+IE8hv2zDJ3LkL3ncFxb3Ha6bL6EU12va4uVfT4eJ+Rn37xQs/HDgl9eOJT08amMnIDxyvOygA==
X-Received: by 2002:a50:d5da:0:b0:572:32e4:daca with SMTP id 4fb4d7f45d1cf-5731d9f1f1emr1431811a12.25.1715166077915;
        Wed, 08 May 2024 04:01:17 -0700 (PDT)
Received: from hex.my.domain (83.8.126.253.ipv4.supernova.orange.pl. [83.8.126.253])
        by smtp.gmail.com with ESMTPSA id m6-20020a056402510600b005726b58a436sm7455793edd.30.2024.05.08.04.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 04:01:17 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v2 0/7] ASoC: samsung: midas-audio: Add GPIO-based headset
 jack detection
Date: Wed, 08 May 2024 12:58:48 +0200
Message-Id: <20240508-midas-wm1811-gpio-jack-v2-0-b4d36cd02c6e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOhaO2YC/3WNQQ6CMBBFr0K6dkynKhBX3MOwaKcFRi0lrUEN4
 e5WEpcu30v++4tILrJL4lwsIrqZE4cxg9oVggY99g7YZhZKqqM8SQWerU7w9FgjQj9xgKumGxi
 USpUGK0ck8niKruPXFr60mQdOjxDf28+MX/tLHv4lZwQJriZrjS0rMl3Te833PQUv2nVdPxCQI
 ZG8AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715166076; l=2757;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=r5VX4FkZssbN7CluXLWuH6JvBu0lDlmJiHnKY2yOe2I=;
 b=efwB+kVCs/L/SZZaODuzZbKPTctk3zichDAOp2lR+DvHFC7GKEvMKy77JrMEeOY/zvUyB2G1z
 5nECFtfNyNpAk5lJ8jrkQdC6RykE44TaxW2X4Fe0ZihcEigyUe8jgwR
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
Changes in v2:
- Added vendor prefix to threshold properties
- Added separate headset mic bias regulator
- Changed some cases of dev_err + return with return dev_err_probe
- Added an extra patch to replace some previous dev_err + return cases
  with dev_err_probe
- Moved tab3 DTS wm1811 codec config changes to separate commit

---
Artur Weber (7):
      ASoC: dt-bindings: samsung,midas-audio: Add headset mic bias supply
      ASoC: dt-bindings: samsung,midas-audio: Add GPIO-based headset jack detection
      ASoC: samsung: midas_wm1811: Add headset mic bias supply support
      ASoC: samsung: midas_wm1811: Add GPIO-based headset jack detection
      ASoC: samsung: midas_wm1811: Use dev_err_probe where appropriate
      ARM: dts: samsung: exynos4212-tab3: Fix headset mic, add jack detection
      ARM: dts: samsung: exynos4212-tab3: Fix up wm1811 codec config

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


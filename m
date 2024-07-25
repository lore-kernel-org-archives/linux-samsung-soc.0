Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3586914D457;
	Thu, 25 Jul 2024 10:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721904045; cv=none; b=I9VaqDCVBGyRq0u0UnUygUXZ0OWEumV2t+1eTkmKT8J5T8fh54FLdMJrG9jru8qU7dR/AUBYWseUZxHYONDYZAp6qzRKo+m6vfJMsiEaMcKcuUXN+LuY+UU4jLAgSOYsQSUOTqBg4SN8us5Y10I3fIdYEi2vwvbHqhZCAXRMRCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721904045; c=relaxed/simple;
	bh=m21UR2Li9R6gN31puzH6uj0MqV+URXqK3uxeXiT+fVU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s+ad8KeGIbudClWF3lyiClW0ClSvhX56DTLgVpUzrF5lSjPdetEiMClSPug4IJHgZiLqndxwp3anLbAgM06Cj+MG66wrSMS7wBr1rgIa50HJyvD3tQ1G5XlMeI5prET9vix1HcmlNExBQygUD17dK5HloyXY5xitcmetRggOtsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c38b864k; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c38b864k"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a7ab76558a9so70303266b.1;
        Thu, 25 Jul 2024 03:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721904042; x=1722508842; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KYCkaTEvTDSyuZcCjBDH4ThgdC9LaZkN69s/l2hUZCI=;
        b=c38b864kacr65IeHUtHC5sV48TE33oIigtuYHhb6ccVXLbvGIkf5uP1mg/4ySDbudm
         qzOhAia/IdGVyl3ssvFfZqkAcbk5oJFY1z2O7W168oBO1BglTLkPYGjF85xi+P6Nd4yg
         KVx0d2PoiB2XmMT7B9BJ2LH3oQcC5hO/2yOPtlDFF60KsGLKBKE/4Drl+nghgIhXSUt0
         MlSkW9tg6mDoemqpB/RcQSeVeQqMqCrYFXCxI6mpOPsHNgrZ6INYeBJ5ZHnEJYakY66/
         OYDYiGk6iOeUzmTVoo8Ubhxz0rSOtmxPAKPoj6x04NB7pNrVKCdXP5SFifytNdEq6sSW
         Pbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721904042; x=1722508842;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYCkaTEvTDSyuZcCjBDH4ThgdC9LaZkN69s/l2hUZCI=;
        b=DtLR1sQb3KtQfXLX9aKp7yUHZx3Km/zK+OdT5SRbR9eYxHOot8iHwqua10NeyL4un4
         5y5zWHj1WDb1PTQUwPHEELiAIff8jUJwjcWVowagitZo2NVQQUVMp8yGZ/4plH996HsK
         TO1vijcKbAeiNElEkqHxcsT9UouHu3MWjXpsGLwU9fDkzhFH9TIyAMWEPSzKnElovdKn
         Fltr/HGFNPX4OeubwLE//U9towE3G0EYOoV4Q0ad0PWhTi/qZpdK9f34E58Vu/WcCC1e
         N0nezdT+pLcKCmjRx5+ZnwfT/Ofqronq0O7c0oAnBM7jjvM3PGAAoiGSLMZSqWKm1Z0A
         zdzA==
X-Forwarded-Encrypted: i=1; AJvYcCXZGsrI5Fvbr7g7s2NgPS9FGcOC9mI5aLVGOLaRBHPvFnNyr25tzU0jpxyXV7mqjjVQjZm9mOBbDI/ULV2HVXnPm0pX0sItxR5zo109z5hz4iAZZdgxUVOwoQgzza/GHIKP9MpEAjYXZ/bp7H+n3sfACpTHyT5sdKWK2LfHAkAgOGxou7HT0lFZy34x0A==
X-Gm-Message-State: AOJu0Yw5jqCDFhr75s6+h63dUV+puXLGHND/opgRCTdhdzpcfCZqGmmA
	H6XNPuX4c9uDMjphPVG6uoGZop60ZPIkLawQ9N8ZXcoISHLIdQh7
X-Google-Smtp-Source: AGHT+IHeoqNjf3cbZ6y+3Vz9f7hsQ+CfAAZqQdxnrSnI8eb+wbnp5LzKkmDTLaDJ3xyL7tjzktERdA==
X-Received: by 2002:a17:907:3fa4:b0:a7a:a138:dbc6 with SMTP id a640c23a62f3a-a7ac44dc5acmr292492866b.8.1721904042283;
        Thu, 25 Jul 2024 03:40:42 -0700 (PDT)
Received: from tablet.my.domain (83.25.114.69.ipv4.supernova.orange.pl. [83.25.114.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab23d56sm58342066b.38.2024.07.25.03.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 03:40:41 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v2 0/6] ASoC: samsung: midas_wm1811: Separate compatible
 for tab3 + fixes
Date: Thu, 25 Jul 2024 12:40:34 +0200
Message-Id: <20240725-midas-audio-tab3-v2-0-dbc055c27879@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKIromYC/2WNQQ6CMBBFr0Jm7ZgWaGtceQ/DYqQDTCLUtEg0h
 LtbSVy5fC/576+QOAonOBcrRF4kSZgylIcC2oGmnlF8ZihVWSunDY7iKSE9vQSc6VahdrXTlmt
 j9Qny7BG5k9eevDaZB0lziO/9YdFf+4vZ/9iiUSGZikk5Q52hSz+S3I9tGKHZtu0DNy//KrAAA
 AA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1970;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=m21UR2Li9R6gN31puzH6uj0MqV+URXqK3uxeXiT+fVU=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBmoiunumjzC2WQrYjAvaAYPWaKTf817wW3d/2Lq
 u4HjvhbE8uJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCZqIrpwAKCRCzu/ihE6BR
 aHIBD/9vrOZsdbgdZ+ev3QunNEqonKBSK0FHUVOml/7dHmFg2VU4dK7PneaCIRFXMGSPMFQTvoc
 S+U6oXR95Qho15XHn9qrG2WB2ox8f/mCD5DXTVqjefJ1m89oo7ZryWPtqjuNL9xJZA64plQceaj
 y6C7Aa1TCHmfJZGy6gWlWq0CFOU2o3bvOrw6gDH0RBlXL1alsBuw0d52h4iDyw0/Ua5ipZ5HQ+Q
 0wu2ltu73otbWVK5SPlGNVHkNgeIEmEw2xuZKLu3hXwSEgs7Qp/4EL898evWqtW6sPgcsezg+N0
 a2MqgdAAEm8l4ss2Laq/Tf0/8bbAuWDpWEthE+xyFWvE9QBc4qN2yIoPHW1pV/eS3ASEh6gfcWt
 eEthrjOmz4kni7NeiSiJuHYeHC1Y6Y89Ax2HrT1o8jK3DucmUin0YgKvtCs+gbkl/pgVfo0G1zb
 KkDRitbE0DxBKkJPJFTBfsLLnovl1adXV4Ibx5muwlc2QHyyI7uT442TI82px9DL3L4qZM940kj
 mXGx5ipcTMEhCX6MDBGOVvMgzHU2sKno0p54LyyEn3lMB5+w7BEAL6KJxo5YUxtpokSgFKS5VKR
 ENtSuvnalWcmIxndf+Vqa4u8wNLneVC3PXlh0Bzoqnz15ojbh1H43uvmsXiJuGkSIrxcvSaiBBO
 KEyUJ1unfJB5LbQ==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

This is a follow-up to "ASoC: samsung: midas-audio: Add GPIO-based
headset jack detection"[1]; it appears to have been silently merged
except for the DTS parts, this patchset is a resend of the DTS patches.

Besides the DTS changes necessary to enable headset jack detection
for the Samsung Galaxy Tab 3 8.0, it also adds a new compatible for
the Tab 3 (samsung,tab3-audio). This is done so that we can set up
different requirements in DT binding (Tab 3 does not have main/sub
bias regulators), and drop the main/sub mic bias dummy regulators
from the Tab 3 DTSI.

[1] https://lore.kernel.org/all/20240525-midas-wm1811-gpio-jack-v4-0-f488e03bd8c7@gmail.com/

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v2:
- Addressed review comments from Krzysztof (anyOf instead of oneOf in
  if: statement, fixed earmic_bias_reg node name to correct number,
  reorganized patches to move headset-mic-bias-supply property next to
  other headset properties in DTS)
- Link to v1: https://lore.kernel.org/r/20240716-midas-audio-tab3-v1-0-a53ea075af5a@gmail.com

---
Artur Weber (6):
      ASoC: dt-bindings: midas-audio: Declare required properties for GPIO jack det
      ASoC: dt-bindings: midas-audio: Add separate compatible for tab3 audio
      ARM: dts: samsung: exynos4212-tab3: Fix headset mic, add jack detection
      ARM: dts: samsung: exynos4212-tab3: Add MCLK2 clock to WM1811 codec config
      ARM: dts: samsung: exynos4212-tab3: Drop interrupt from WM1811 codec
      ARM: dts: samsung: exynos4212-tab3: Drop dummy mic bias regulators

 .../bindings/sound/samsung,midas-audio.yaml        | 59 +++++++++++++++++++---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi     | 39 ++++++++------
 2 files changed, 76 insertions(+), 22 deletions(-)
---
base-commit: 91e3b24eb7d297d9d99030800ed96944b8652eaf
change-id: 20240715-midas-audio-tab3-174716e45618

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>


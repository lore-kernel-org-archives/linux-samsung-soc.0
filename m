Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7191A239D;
	Sat, 15 Feb 2025 11:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739618848; cv=none; b=jmrAyiX4J8MloF7zjwRfm3pluqTOnOn5+BB280ApuVqKRNUk5COobJTTE+NBmMl5tGd4Lf4aLeHW5QAsYzpJLeybDPL7865Eak326Pvd7bO0ovEVK6VyGQrV7LOQOooiD5+IAZZDpSEmQYphjfOrR267MQMY/hweHClb23RXjss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739618848; c=relaxed/simple;
	bh=wVTyDbsmQoowJxwjm0tMIIltbOCFa4YRjIXh930fzMs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ppLwvvQb+K/N1Fd/94kNoHWzT93FL000c4iBS17watKSTFO2PsgzHpKvkIVfgajPOEH7aojZKQsbRPzRMqpWdGThfkT1Fbt+TNx6U0IQkh0uCjnkAEcUE8mMxFmRhhwXOxObRew1QXOGN7dSMbOgl/tSjHCe3rgcgBbk0YJWpBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WGY/yNb7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WGY/yNb7"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43967004304so11084425e9.2;
        Sat, 15 Feb 2025 03:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739618845; x=1740223645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yVS2DxvHD6yUudCrkjHs6rrK9Ytf0bOkYEFiIp/66CA=;
        b=WGY/yNb7lGiP5BR8O47jmx0u8G6bVh+OOZ2MgLAZkOHNr4Xve2YHIBFdzHYcNgndYR
         BTaZWayyGNmLY/Mftj6L6r5NPkKdreIk/IwKGRxB04IYgfOuTvukR26zNOjtVpe6d1sN
         L90V0K6LcV9r+g2ExfozROsgJWHJtSIQ9b9RtCoVExllIqKdyNZrLTSn5Y2nWUFQ/NM7
         XgGzvzL8hcfoUwiw3OEvRZ+thPAtAtfEteY3MeG0l2oEl6gDQpV6SP+Rju9l4luA/DuZ
         N1nQrcQ13MRNJ/Sd0G+7VH43Jy1Z7lCvogGQ9MJTLFWsNx326VHJDNt0z4d0CyRnaexu
         4qdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739618845; x=1740223645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVS2DxvHD6yUudCrkjHs6rrK9Ytf0bOkYEFiIp/66CA=;
        b=XNo5srxSw51RmlOJyqCLwUGtrY8GehE2xU+pnbW/Rc38SXDd5erKMY32vbts9I6UqE
         sgSell0TH4yu+cP4ikMwnkv7H1PlJsoAIuxPxb3DR3VYkzC1+NBqZWZW2cUMMECfKyPd
         4MHodZhnuFS2+SnyXm3ICuPx12TtB2rytKr38VYqNXbI11wedzwbvFYphEpqvNojoAtV
         k/BtaMZMCzVg1zWb9W9u4FkQmbPMG3S98HM5iVBPEuSBImUcHpIkkN8x2ExXMhqXfiDK
         8U2hOpmLfbHN56IUv4/AkuhdxHYJm75lt/pQ6lPS5lYQG53oruJZvxr386Mk4FfazR91
         vfXA==
X-Forwarded-Encrypted: i=1; AJvYcCUh+NlNSWDCP/7ytMU9U+zGuR3o9ctqJYHG63gVdz/vXesG75DDQeLhO9n8Rit0j8rvs7YX0K2FKcxbNf7g@vger.kernel.org, AJvYcCXqT9ZDC7qFk/qnEGky9zKCu/yhqMfR8R7bowWmYBmKb/ubGWaFH3dSsLhqi/N/yzlIhq7oNJ8eudFk@vger.kernel.org
X-Gm-Message-State: AOJu0YwoqyOJlKJYTr94gRg3BfLN2H6bqNauEtfrMbcditm5+jnI9JZn
	AyBGoz59wriHAl52RL5sZ0mnODsqkjSynIMTwZKBzgPhP3qngXRM
X-Gm-Gg: ASbGncuQAAIFi/uT96VgZzYqsbJW2M8sMIzlxQ/UcObZ43lauPg6TSW8+2+Et0vOygS
	IAId93dnv2h+75yAyMWXqcMKTdB9d2rtWdgec/t6L3K5VKNmpGULGmWXxf3F4o/+Iol1KUHUA4T
	TtqK+pv5ZyZbNnsECh68EQPadJDdXOAceYDyw36L9Dr81k3+G8DfR7u2gqvoG6M5Em/QUSaPngA
	3XYvoY9YSpmhQNBflogiAWmIDDAjKuKMU5lhqlt8kfQ9Ne2IuK4H9JvBTNHDR+15vo83YcKKxrK
	XxhoyPt086LZebuv98dZ+5zI0vYv//SWkHF5AJxK0v3PvlC6Fihr99563Sc2fuEKtFI=
X-Google-Smtp-Source: AGHT+IHqBZSYw3B766xIjrp2tq1OGtdCNjggCpIhHlT6iS+NJOby53CON5BZSmUwfo5u1sxNGPAgvA==
X-Received: by 2002:a5d:6da1:0:b0:38b:d824:df3 with SMTP id ffacd0b85a97d-38f33f2e90bmr2976717f8f.24.1739618845304;
        Sat, 15 Feb 2025 03:27:25 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b410dsm7018841f8f.5.2025.02.15.03.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 03:27:24 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] dt-bindings: soc: samsung: sysreg, pmu, chipid for 2200
Date: Sat, 15 Feb 2025 13:27:12 +0200
Message-ID: <20250215112716.159110-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This patchset adds support for chipid of Exynos 2200, as well as
documents sysreg, pmu and chipid compatibles for that SoC.

Best regards,
Ivaylo

Ivaylo Ivanov (4):
  dt-bindings: soc: samsung: exynos-sysreg: add sysreg compatibles for
    exynos2200
  dt-bindings: soc: samsung: exynos-pmu: add exynos2200 compatible
  dt-bindings: hwinfo: samsung,exynos-chipid: add exynos2200 compatible
  soc: samsung: exynos-chipid: add exynos2200 SoC support

 .../devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml    | 1 +
 .../devicetree/bindings/soc/samsung/exynos-pmu.yaml          | 1 +
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml          | 5 +++++
 drivers/soc/samsung/exynos-chipid.c                          | 1 +
 4 files changed, 8 insertions(+)

-- 
2.43.0


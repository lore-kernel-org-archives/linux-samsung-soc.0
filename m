Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297B11ABECF;
	Thu, 12 Dec 2024 21:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734037759; cv=none; b=cIXCwjOfbbhcq5y+5jXY60DgfdrkoOojNJcNv62M3Fz5qFujkfg0ReJW23/sBRmMWUDsm0VZEfihwMWVjahgynPphy/RB3OLLZf2Hejimi7+slsoRJISRlY0Uvx66Ukxfi6T7tr1qCO52g4mFHex5i4lID2HRyS0OmhNWJeHCcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734037759; c=relaxed/simple;
	bh=bXEP5QAwTbHywlDHiYHTSr5iNZb/Wdfp8n3pBOFQJCQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EDkIaoZt9GA8E95EwW3P4I4FSJIHA5IGOn9ewXJBvGthNYUJ1FMYFPlgZMFE9G48P1r/EwE86Qz23sef/U9VyJGE3rPKRUH7saFeCyyWO3ZHtT2jOMv25frlhnYgfgNSrlqhVoM4LXw4c4HG4qBiVHV4B7kYTTbNiIlIstSs1lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KjQmOjDU; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KjQmOjDU"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so1266488a12.2;
        Thu, 12 Dec 2024 13:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734037755; x=1734642555; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UO4ZpAmYWp4/F5rKGhPyqiik5BW8t5BEyIWB0ThHTVs=;
        b=KjQmOjDUmxuxf+SUR4zzql5PdqIi4R99tQ/0LjkY6r0MnJ8vxgB97nqMkhkO/Zaq4l
         gD7GCZXq35vfe60p/WjEZvyuLUVngLgM25/fp3cM7BMeuZBD99S4TIQKc45+J6Md+e2f
         uEjITneU/Kpo4laTPaFbyNbWy7iANyptOQ0E62oY2oNbf0uU4P7xYmRhqUlmy2cq7YUe
         ML6Ost48fyDeaRb6Q9dTkYSPslGsDNJLcrBoQMCCDIcuYaPtusOGk9x800quw3uQpEFr
         uUH8bsZdzL2RwXjsqJFRWtspSydHPAfZPGodvwRAnRfxGbNVBrpLoady5O7xKd6EPtrw
         ygzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734037755; x=1734642555;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UO4ZpAmYWp4/F5rKGhPyqiik5BW8t5BEyIWB0ThHTVs=;
        b=S45KFpwKuKzLPV+pmppJFynMvs9IREydzqh2n5Q5EUnO7PT4ws8F4Y/bUlSKQBXJ+Y
         KVp8CUuUPkYxJb5v7QNOtijCKBhob2Fjx3UGEKizAd13j//YFj6RBjkntaFJy2/QkOua
         fsBuXDw5jKcZIRGaai7CYI1cnurO/D/ScUMi8FBDh/f+BaYtrY00q5JABr3xtgUAbEka
         GT83ZHW/Ygx8YSSQkrJI4bBg9uCgyAFYlpd/HfgtJbG33qPIz73jYlOQ2zMsWSL/5Xf0
         uBXvN17ilgPbVX7xenlpQHRB3hZohL0S7iyj1694SaxSj/u8m8VQlsc1C9OnQ/PeTowF
         P20Q==
X-Forwarded-Encrypted: i=1; AJvYcCUODSh4LkEF2an0aQSBfrB4Hw2N0CAdAk1XxNkkSXRGoBwjyUdvwNev0daJCoOeR41Jk+FZMMosjurR@vger.kernel.org, AJvYcCVoC7iQtdbB7y+cFROqPThAPQ+pBRVB6BgyaWLp1KNzRMn7+hdcmuSBek9RZbD5HGkqq4GxGLDgTb3wwhhC@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx3La4QtUa81JaDYxAiA90Jy+xocXtxCeqcChboHSRMoia6Q1D
	ykmfdnZ/993esOQRl4yy2l3p8hn0GYBeWCgwkre3QOc08rLJlsrO
X-Gm-Gg: ASbGncty3QDKLPXy80cMYMmMAJX+jcKgV7Ijp6qxRRb0WCiufwhFaerP+S9d8li6785
	3j2PWPryYjeAl9byXbaiFpyrjZGRqI7lqnwvjiVuulPXqyVtLu2L4oVdqNWuMADvmEDP1E0ijC0
	MpIPS9REA9Y9i01QJLiEb4t0EaJYXMpTaAQPIeIshM66qngikp7LRldYsLRIXohUgNMfcMxdWSb
	Ty9Mblslw0bVsv8s1lKXsGvxKWlL8IfKIq7/KJhWBQysdvB+FBMvSCDZuv0Xhun7dwq
X-Google-Smtp-Source: AGHT+IHnM8IzLGyED4qOi3bw6Se1FbUPjGyUA3xQHZbzHTeWslI/cln+zbu2cuEwfHecYK6pZPZXbg==
X-Received: by 2002:a05:6402:254d:b0:5d2:7270:6128 with SMTP id 4fb4d7f45d1cf-5d633bb7db6mr3454905a12.25.1734037755187;
        Thu, 12 Dec 2024 13:09:15 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3d0f93d54sm9232348a12.68.2024.12.12.13.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 13:09:14 -0800 (PST)
From: Markuss Broks <markuss.broks@gmail.com>
Subject: [PATCH 0/3] Add Samsung SPEEDY serial bus host controller driver
Date: Thu, 12 Dec 2024 23:09:00 +0200
Message-Id: <20241212-speedy-v1-0-544ad7bcfb6a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOxQW2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0MD3eKC1NSUSt1UE+M005Q0oyTDFDMloOKCotS0zAqwQdGxtbUAAyh
 611gAAAA=
X-Change-ID: 20241210-speedy-e43f5df2b1d6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734037753; l=2587;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=bXEP5QAwTbHywlDHiYHTSr5iNZb/Wdfp8n3pBOFQJCQ=;
 b=Qqa5y+6+LpADpVtQzixuS2lfh4uSGGJiNsRJi2hz8K6t7nqieTFL3Z4fHoGqM5N3KIF61V2wE
 QZS9ce/cCGVAKXAMn2bMaLIMX/vZONzA6xrdE4aCE2oFzVluzcSbPlF
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Hey,

This series adds support for the Samsung SPEEDY serial bus host
controller. Samsung SPEEDY (actually an acronym) is a proprietary
Samsung 1 wire serial bus, which is used on various Samsung devices.

This driver adds support for the version of controller without the
IP_BATCHER block. It appears that block is a small MCU attached to
the SPEEDY controller to offload the SPEEDY I/O tasks from the AP.
IP_BATCHER is found on Exynos7885, but not found on Exynos9810 and
Exynos8895. This version of driver should still work on Exynos7885
though, but the IP_BATCHER is not supported at the moment.

On Exynos9810, SPEEDY controllers are also mapped into MMIO space
of other processors on the CPU. For example, APM also has a window
to the SPEEDY IP, and it uses it for power-management related things.
During testing however, it seems that if APM is not active the AP can
access the SPEEDY controller freely and without interference from APM
firmware.

Things to improve:

- SPEEDY host controller has an interrupt line to the AP, but current
implementation uses polling instead,
- add support for handling IP_BATCHER block,
- add support for bulk transfers,
- test on other SoCs (Exynos9820, 9830, 9840, ...).
- runtime PM

- Markuss

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
Markuss Broks (3):
      dt-bindings: soc: samsung: exynos-speedy: Document SPEEDY host controller bindings
      soc: samsung: Add a driver for Samsung SPEEDY host controller
      MAINTAINERS: Add entry for the Samsung Exynos SPEEDY host controller

 .../bindings/soc/samsung/exynos-speedy.yaml        |  78 ++++
 MAINTAINERS                                        |   7 +
 drivers/soc/samsung/Kconfig                        |  13 +
 drivers/soc/samsung/Makefile                       |   2 +
 drivers/soc/samsung/exynos-speedy.c                | 457 +++++++++++++++++++++
 include/linux/soc/samsung/exynos-speedy.h          |  56 +++
 6 files changed, 613 insertions(+)
---
base-commit: 1b2ab8149928c1cea2d7eca30cd35bb7fe014053
change-id: 20241210-speedy-e43f5df2b1d6

Best regards,
-- 
Markuss Broks <markuss.broks@gmail.com>


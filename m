Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71181B0F19;
	Sun,  4 May 2025 14:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746370769; cv=none; b=e+1DJY35r3gkUxLtMeung1zleR/ZjkHY3r7FJtK2K/xDRQkDHNkKqCHbPFLsSWC8hnhSMLcEK0+xCzQTFAhips7Y6BhVkCKtmZigpMH2cWs98DJ39AmF64zwpJ78kZPX2Ms7sQ7aB6ur9fVQ9zGihDOtbNDA8UDlwSk5iZaTz38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746370769; c=relaxed/simple;
	bh=YwOVVNPOsjxJnheEcJ43TxdldUrhEW+iI4+wfbbuQCU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZcOro/Sp/odYAPh/7nfW/eeCPtfyHbSbymZo7Kc+vwMUnIyAIaJR1705vCElFSnqAKW88+yiGhKtrXC1DOF2ahl1m2+L1L67iUO8K1WCF36M4Nm+Ihli7waqET+TU+lY0/rD8iTbp8/S3nwtl8A0zZlKwDl1blci/XTPI0ajWD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0x//dtR; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0x//dtR"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac3b12e8518so617301766b.0;
        Sun, 04 May 2025 07:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746370766; x=1746975566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZiY2b1FLpsy9r3AGKcw4zckDdyCiygN84DOUybmFlo=;
        b=N0x//dtRqUgGFOZS0O8CurrUk8R9e3tUAPqSWzDRDr/woqARPT5eY4X/sVCxutVRMH
         c5HvPyFPHUhIIdCaoI7aBrg2u7RcREafHzkKuLaK1aFPiFIN1dSUSIuC7BMewwO/iDQj
         kJ6LLNNq9XVJg6/5+GzDRLGRqqPV2drSxkym5zURRQRn5F3UmGuTg+7euso/9L6Pl+b7
         xOh6KTBycfl1e00QecBwqkk1u2DPmWrksegivxm6CfsmEmReTFO/DAENMWw2ZgKcNZoU
         V6cnl/o/8qxiGo7yysSBkp3VjdxDL4e61nyZdHFPvok4y05LcFRq0BaJ3X+UX0MfLs6L
         AgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746370766; x=1746975566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ZiY2b1FLpsy9r3AGKcw4zckDdyCiygN84DOUybmFlo=;
        b=aZBG1gxRgQ83wpCD7bsh7TWcqntsom7jjeMMpUGhj/senWEYODfhx2NmmDn/qy/8Iw
         xCB6b6YG+DTbiFwmgSYEqxA06y4ROzMq1Kk4k1hxDmrZeqWqY3OyBIv1zdem3FH2vNPQ
         Y3+QyhBW0UhC9fA0Rcti5lgJ1RZF7RKJRjqtyyQAqZ1ngcXGSx5qeUJLZEZhAiSNDadJ
         pcfAOMsK6+g0x+had01qlwn42YTX7YbHNovNn9GsInuXqnIJyQT1vgp83jNKi2BM8at5
         OHz4azVf7+gr9NyHlflQbTK/BuHUpTK3QD40gpzdE1QNcNZs7ZrmMalT7IMhRru1vZrj
         /7rA==
X-Forwarded-Encrypted: i=1; AJvYcCW+ysf4JIcMsGPGnptgmiLSG9U6LF2Hq/j85YnOerinek6CK7K3ub3H8PEbuY/nQK9osOC6rNh+KHnEyajs@vger.kernel.org, AJvYcCXx9U5yxiU4rWY39PvoEo/oX+jhw3IxtJ7hgaE2DSvCoBiMOlXSb9T2bW+RgaXfkn2Mk0yJ6nw1sGSW@vger.kernel.org
X-Gm-Message-State: AOJu0YxqmPxI3/48WjnrnY/PDoEajBonlbiSXX+NJXxSgP2dF8N3IZlK
	HRS4DzzkA18/S7WKViD5uq4I+yV8WvuCd5zl0QQ8ni4jAc8O9w0t
X-Gm-Gg: ASbGncuBuq7EaTkZDCA9trn7QAPou6dEtRu84dmpwHkb/72/lTNaWvlM7tH0Hm6QED4
	7rq5zwiewmNz9rIPiLafAv8aRw8IGjMYkvHPs6H2p4DDEoLrA6K6Tc1YWKpRzfmigih5r4abdSV
	/T5S1z52pT3dmUisJo4oQeP0hHYEE0gujCgUNQ8+jB6wW8KQ8lAMfXquopjc1Wz4tcklwM1nX76
	Tr0RM4ysDxDK7YrLFpj7oinDEM+aKmKfoCyLp8+kO3X2igNMF0p1zSgSV7uGbSMrMF0mhZbpyHQ
	rwIFLj645GXUnj79MuQX1yBiOra4SY3bkFqVmxdyDwre+7rQSx4httQ9tN2CX1QhJpBuElWOJdB
	saKQotWNx/tRHknYV
X-Google-Smtp-Source: AGHT+IH4wtKObtJgtR1AT9dmxZGZI8D1fxqQbvpRwTRDavVZf4FwcIKdlepre/v+4+c5U/zvyE1CRg==
X-Received: by 2002:a17:907:868e:b0:ac2:49b1:166f with SMTP id a640c23a62f3a-ad1a4b36f20mr356109066b.52.1746370765856;
        Sun, 04 May 2025 07:59:25 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189508cf4sm336614666b.138.2025.05.04.07.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:59:25 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] arm64: dts: exynos: add initial support for Samsung Galaxy S22+
Date: Sun,  4 May 2025 17:59:03 +0300
Message-ID: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This patchset adds device tree files for Exynos 2200 and Samsung
Galaxy S22+.

[1] is a dependancy on the aforementioned series for the usb phy drivers
and bindings.

Exynos 2200 SoC is an ARMv8 mobile SoC found in the Samsung Galaxy S22
(r0s), S22+ (g0s), S22 Ultra (b0s) Add minimal support for that SoC,
including psci, pmu, chipid, architecture timer and mct, pinctrl,
clocks and usb.

The devices using this SoC suffer from an issue caused by the stock
Samsung bootloader, as it doesn't configure CNTFRQ_EL0. Hence it's
needed to hardcode the adequate frequency in the timer node,
otherwise the kernel panics.

Another issue is that cpu2 and cpu3 fail to come up consistently, which
leads to a hang later in the boot process. As A510 cores are clustered
by two, it makes sense for both of these cpus to fail if there is a
power issue. Disable them until the problem is figured out.

Samsung Galaxy S22+ (SM-S906B), codenamed g0s, is a mobile phone from
2022. It features 8GB RAM, 128/256GB UFS 3.1, Exynos 2200 SoC and a
1080x2340 Dynamic AMOLED display.

Further platform support will be added over time.

Best regards,
Ivaylo

Changes in v4:
- account for compatible changes in usb phy patches
- use status fail instead of deleting cpu nodes
- add a-b tag in the 1/4 patch

Changes in v3:
- account for the usbdrd changes in the exynos2200 soc dtsi
- drop usbcon driver from the MAINTAINERS patch

Changes in v2:
- mention the board codename in the first patch's commit message
- make all reg values hex in device trees
- reorder usb_con above usb_dwc3
- drop regulators for usb_con
- remodel usb_con_phy to take usb_hsphy phandle
- include MAINTAINERS patch in this patchset

[1] https://lore.kernel.org/all/20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com/

Ivaylo Ivanov (4):
  dt-bindings: arm: samsung: document g0s board binding
  arm64: dts: exynos: add initial support for exynos2200 SoC
  arm64: dts: exynos: add initial support for Samsung Galaxy S22+
  MAINTAINERS: add entry for Samsung Exynos2200 SoC

 .../bindings/arm/samsung/samsung-boards.yaml  |    6 +
 MAINTAINERS                                   |   10 +
 arch/arm64/boot/dts/exynos/Makefile           |    1 +
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts |  169 ++
 .../boot/dts/exynos/exynos2200-pinctrl.dtsi   | 1765 +++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos2200.dtsi    |  561 ++++++
 6 files changed, 2512 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200.dtsi

-- 
2.43.0


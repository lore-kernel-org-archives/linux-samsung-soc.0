Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8B81E7678
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Dec 2024 12:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733229630; cv=none; b=GuK6yz3nfbzFm/EmGSqoO23xEyCS0AlaPa+mvc3zhzTmjQCvJ/Z0O3FlVYcNJUyThWWzzFPaYP17Ky7ccspROP8oLpr5nIbJfYZie0GGXZn0gxUKKMx67seXwJ5c39QNSGOBOPNO41z4NOfCjnBZgi6zFr3TlWQ0gru7Ven3VdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733229630; c=relaxed/simple;
	bh=xjq7GX6XBYQ1ztBrGduyhRQK8vyP1UVc/11WrT6pxzM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=McCtp8ct8Obrpz0lpCY/DchFjbnJSMwADmGV6nHlMtoCKv/a7c9VFAVWf4EWauiveK8DyMpT4w7TsBnDCRDGxxbZ9XfCLyil5BGv2mkjjCZOaGdVl8LM5ovtqSEUJaJ1lyZ40n0Vh4KDTXTjRW5g3VqVghsOLSI97moYiUz4PYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qU/IOEMT; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qU/IOEMT"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5cf6f804233so6383809a12.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Dec 2024 04:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733229625; x=1733834425; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KidvB40Fo4maqTRIu0iP08tZ2RUHssOz5eIQKLC5Snw=;
        b=qU/IOEMTZ6ag3D44Aer4wfalpMBF0/ufpuLC4OUcSi/zW6JC1pHy7d9YUv9KTYzu0q
         AyzKJ7mYHwpwjMtb/wnPvdk9zHqCE2sF+zFPn1uS50l+Xj5Xe/E6S52hEJEACrzdz7uL
         i5CKIwlY396Asuuoy3/zPvJKQpwdREF1GWlU/B3+7DjnkHqazC1d84xfMwZJ+vphLlM4
         36XuAoQH85PfvQjs60H4AhgxB/cJmJxqnZjKKz4ZvpdYGvsMlwiDHtGRjbtEzgs3Mnhv
         bdHCPxBnuxL9FczSTLgJgt0+T48eM4/9oSe7uKKyvE6mLsAJO8UDHGcMf8gTTct33ol+
         oiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733229625; x=1733834425;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KidvB40Fo4maqTRIu0iP08tZ2RUHssOz5eIQKLC5Snw=;
        b=tvPEWub53CzZvCN8NNLDxQGIl1oFDHjaFbE9601N0XNxP9GDOLPdzOwyuI3zASmPSS
         nTSTDeg4M48seQjRehXbHemnaJkw0I9nLZ6bF7t504a4OSguUuLMkzW8GqbjobJ5S9nL
         jNKK01PToc1q4q4GQ9/XXpJCPUhsb8tMQFOL4vyXARBeTi/D1dEWWD4zMu3T8TMlWDSa
         wqqJIpBH6EBLx0LTjchL0aIwRXw9MpF7ODa8L2noGyEkPwck3abk8Unv0DNDYm/AQVIC
         1TfmQ59cRG6G+N+wq1EFS8txcTB8u89T/IWW+RzdVdx3BxjAkusw8BrnnLKsI9QgiHej
         E7Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVmmhRZGJ0hh282+o79ALIZeFrHC3Q1wxaIYKkXr1w4dv+T9398nNXbWlEyhp75IpsKg0+LJio90ML5FJtoQi0n7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzhAeu9PH0O6L7c+V8/8udw9cKqWDUJKkvIac4Gmknw+2JZ13S
	yl7o8xgkb+jWwEK/ABdKynAnCqwFBR7OpLxaR6ps/U1ehCIoNwWSSSdmeZErEVk=
X-Gm-Gg: ASbGnctzNzb02Ovy+XpE7n4dLHIKRjNqB1grEQ1433t7LA/FbOUZRYydFKj1IObp3QM
	ZWYJOBmIeJZaABhrVuyNHneAFafQihO9yoFO4JNC3b/jHaJwwecHE/gDRZEBHuuzXIK+U0QePuq
	fa5fpoYEHD51KUwzvGglYKROloR0FRj8IPFb1ZuJgyvzKui/p+U2nav++R10DFbSGnGnhRsf8jX
	PP2r0MIp5h9Bwyq3p/P9IIN4IYwWEdM8tRCKLPE2y29/NC7ObQo2No35pXwxRfIPhNzbAFkhx4w
	4ZIog+73lEsdShgzxU6Mfe1MMQvODtdDPg==
X-Google-Smtp-Source: AGHT+IGhLdCxi2DbU4tBTCS3xMoJ+eN/NSNXdGYE86xU3cbMqxxR5/XeFJzbPPRvBrj5K6P11uTb2w==
X-Received: by 2002:a17:906:30c2:b0:aa4:fc7c:ea78 with SMTP id a640c23a62f3a-aa5f7d390bcmr168580266b.23.1733229625507;
        Tue, 03 Dec 2024 04:40:25 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e6a4csm616809466b.106.2024.12.03.04.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:40:25 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/5] Google Pixel 6 (oriole): TCPCI enablement & USB
 updates
Date: Tue, 03 Dec 2024 12:40:23 +0000
Message-Id: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADf8TmcC/42NQQqDMBBFryKz7pRkULRd9R7FRRqnOiCJZIJUx
 Ls39QRdvg//vR2Uk7DCvdoh8SoqMRSgSwV+cmFklKEwkKHaWmpxVGssLtOGswusGMs9ZJfLD4e
 seHOe29qRp8ZDsSyJ3/I5C8++8CSaY9rO4Gp/6//u1aLBhoiGrjHdq7WPWYJL8RrTCP1xHF8bp
 zQ6zwAAAA==
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Hi,

This series adds and enables the Maxim MAX77759 TCPCI for Google Pixel
6 (Oriole).

It relies on the bindings updates proposed as part of
https://lore.kernel.org/all/20241203-dtbinding-max77759-v3-1-e1a1d86aca8e@linaro.org/
and
https://lore.kernel.org/all/20241203-gs101-phy-lanes-orientation-phy-v2-2-40dcf1b7670d@linaro.org/

With these patches, we allow the usb phy to detect usb cable
orientation, and we make it possible for the USB DWC3 core to enter
runtime suspend upon cable disconnect.

To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>   
Cc: Roy Luo <royluo@google.com>
Cc: kernel-team@android.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>

Changes in v2:
- more appropriate dwc3 quirks to achieve reliable Vbus state detection (patch 3)
- drop patch 'dt-bindings: usb: max33359: add max77759 flavor' from
  this series as it should go via linux-usb (Krzysztof)
- max77759 tcpci compatible has changed
- Link to v1: https://lore.kernel.org/r/20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org

---
André Draszik (5):
      arm64: defconfig: enable Maxim TCPCI driver
      arm64: dts: exynos: gs101: phy region for exynos5-usbdrd is larger
      arm64: dts: exynos: gs101: allow stable USB phy Vbus detection
      arm64: dts: exynos: gs101-oriole: enable Maxim max77759 TCPCi
      arm64: dts: exynos: gs101-oriole: add pd-disable and typec-power-opmode

 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 104 +++++++++++++++++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |   5 +-
 arch/arm64/configs/defconfig                       |   1 +
 3 files changed, 109 insertions(+), 1 deletion(-)
---
base-commit: ed9a4ad6e5bd3a443e81446476718abebee47e82
change-id: 20241127-gs101-phy-lanes-orientation-dts-9ace74a2c25c

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001642DAFB0
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Jan 2026 14:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768400229; cv=none; b=Dm1AdZaZOyRId73malQ1r+0B4aH/ghEv4q+0WXCm2RFtGzU6A4DZDEjdOuK/qZ0udtZ5k/VMEqr8pGVA3UDBHdZDc9+lRqogS4txG/SFI4EWDwTIb5+65EPqSAAzbKUHJItkNd744/kDpl4uGL75T8wDTQ/n6JKjdIfzDHuTqUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768400229; c=relaxed/simple;
	bh=7iSVRaIrBvJwUyayWLQUtaaFeLqq1IG5ekXvTcN/l1c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OqCvaIq/rGOCLHzWuzaG1pc8k2rz3C7TiyLdf/0+YOJpHtCJfzdrkw8rlK1IzTo+9uO+2SJN1y9swRG2ChcIWfogin/4yv64Z4OA3fSA0jzta2+ZKsWikl4Nt82uoPfTTxfQy5GRvKkyoaTWvCar1AeA0v9/q0ZkCxjcVujVVew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z0z8lVLy; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z0z8lVLy"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47ee4539adfso7800785e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Jan 2026 06:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768400225; x=1769005025; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gOr0r09swBSNVjbYo9yz2YviIiFXOTNHaYP7I0YlkxY=;
        b=Z0z8lVLyQLeqDwuhkbZVuQ5++pZfrDPu2pxhe8lQIi0PmwOoRLwVMy9hgYGktPLShd
         H9bbJGJdsiCLbQX/nhQfaYMGEXjY5JeU/KVue6YJkUJgadVQgdTdeor1qQZ5hruzAbpz
         wdSt+BDSnxkskGNzePz4sO5+qHW0svzXAhiYV865Jy4W0Kud1Ex2oVAjrChyc+FjTdjj
         iKQSDInPMicx4dIhuyZ9PtZgHg08AcTTF5zvMe4gpnocKsiVIme0g4SxcPFEpiJw1e7G
         uoLfZza/1NyYLLg917wPHnSYLKbEGvkeExVtK9RAOJkrCaGEyQk4GMFK5U9NYChz9OKG
         KaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400225; x=1769005025;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOr0r09swBSNVjbYo9yz2YviIiFXOTNHaYP7I0YlkxY=;
        b=wjZZkrT94GictdEmrrV6LVVYbTaqEBHbA++6vLyMQ+bwWAUdOMd0bmjs0c+aoUeQWF
         XSifBdsG59hQcZRkDsHIw54E3ZXdjrBwyNuyPGdiDOM8e4y3KGzaFFIBCCLexQFCn5J7
         8r5hWJ1b2+JHVno/CSTTF3FAWXb7HnjpVoVQPRQA9atqiKQ4V7fc7t9Zgj5di/hCyOUp
         Wl37Z2E3JRhE7V8MSfPxlY5P+TMIwinXoYKkxU+TxXdVgmkGfYZyMCMggFrQV9hzgZBh
         pB+BA/3B/EBpfVi4PmQuo1GYpTK0iU42tJkIBn94xwFWiVt7D4tjfXCuKUbX4etpT2R1
         Mu9w==
X-Forwarded-Encrypted: i=1; AJvYcCUFWm7CG0MOnjyU6WwO/pm2/KMXGNgwkcinxLsdbkKiObPl7rIoRmfYLJhi8BELrS6hp9g06VHavVXbdX4ryx24Wg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy8efvI/Y9MyLtQ7RE4HHDUhg9smLNo237NxyyztzFLj++HuBU
	9whWlERNOhhzosuipWEAha1eLD+HAMdqap2h0JMIYY/HA5kkGlElWL01AGdqc2qPKaY=
X-Gm-Gg: AY/fxX4uyANO1By1ClFGv6Wa/nzqNsTnZuRdmg7xmM6ZWSrAevWPTgMvmV0it+caTIs
	cZZ63Q6TAI2P2poVgFgrzpsWjDEMazYL7BEsmCxTISrqEeMsc/LYp/5aOA9t+2ZLG9a6yVgwvOQ
	mGEtGd1VBJWV3c9iR2i58M/ZTLEyfzk9SN3HKtjmo1cB98Xc8yHbE3wJplwLoZHnnDh6CTKS47t
	/JBEPDf/iFs/VMvUlLrBOyn/fXzJBF4DrRnxWTLlQNAj8V0pGebfZKFEHt2VdhGrR3xjcPrc0qF
	YEt+aUJEkpOqsqhjPMiyPtntCv9G2GEnIBVBTcjQJ2npZWLrY/bOip8S8zRkMlhDQE+yIbKhAmB
	OG5k3vWhrLEDGRojVlYjGW0pfHhlipbgGnD6RDP49Xg79ob3CuH0SKLEO+uH++bzfCzTGqUR9Ib
	nDT8SEai8ruGRdevIr/SsBfqeYBXOWo1lXEhwlW6s0rAWHGIZeJlfhWib5t/tM8qnflBUiWw==
X-Received: by 2002:a05:600c:548c:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-47ee3371876mr36058035e9.17.1768400225203;
        Wed, 14 Jan 2026 06:17:05 -0800 (PST)
Received: from ta2.c.googlers.com (164.102.240.35.bc.googleusercontent.com. [35.240.102.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee57a2613sm29595445e9.6.2026.01.14.06.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 06:17:04 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/8] thermal: samsung: Add support for Google GS101 TMU
Date: Wed, 14 Jan 2026 14:16:28 +0000
Message-Id: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD2lZ2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0Nj3cTkglzdktxSXSPzVCPDNINUo2TjJCWg8oKi1LTMCrBR0bG1tQB
 +IQsDWgAAAA==
X-Change-ID: 20260113-acpm-tmu-27e21f0e2c3b
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768400224; l=4502;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=7iSVRaIrBvJwUyayWLQUtaaFeLqq1IG5ekXvTcN/l1c=;
 b=VldPEq1aLcmN8GvMlCPb3GSq97ZYIjYcVJ1HPKvNgmWuc/m5TOg/1yIYM3XuK7n87gKGGVHI9
 asGZcF9DEDIDlAGWAhUklMa+lXPxsoBl7nyIKO6JUw/CJxYJ3u7I4N9
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

This series adds support for the Thermal Management Unit (TMU) on the
Google GS101 SoC (Tensor).

The GS101 TMU implementation differs from previous Exynos generations.
It utilizes a hybrid architecture where control responsibilities are
split between the kernel and the Alive Clock and Power Manager (ACPM)
firmware.

Dependencies
============
1. The thermal driver patch (5) depends on the firmware helpers (4).
2. Typical dependency of the DT patch (7) depending on the bindings
   patches (1), (2) and (3) (to pass dtbs_check)
3. defconfig (8) logical dependency on (5).

The bindings patches (1-3) are independent of each other. They can be
applied in any order, though logical grouping (Firmware -> Thermal)
is still nice for reading.

The Firmware driver (4) is independent.

Given the dependencies, I'd suggest everything to go through the
Samsung SoC tree, with ACKs from the MFD and Thermal maintainers.

If the Thermal maintainers prefer to take patch 5 via their tree, an
immutable branch containing patch 4 (firmware) will be required from the
Samsung SoC tree to serve as a base.

Architecture Overview
=====================

1. Firmware Responsibility (ACPM):
   - Initializes the hardware.
   - Performs ADC conversions and temperature calibration.
   - Manages thermal thresholds and hysteresis configuration.
   - Exposes a high-level protocol for temperature reading and trip
     point configuration.

2. Kernel Responsibility:
   - Communicates with ACPM via the mailbox protocol to set thresholds
     and read temperatures.
   - Monitors the interrupt pending status registers directly via a
     syscon interface.
   - Maps physical hardware interrupts to logical thermal zones.

Sensor Mapping (One-to-Many)
============================

A key aspect of this hardware is the mapping between the logical "ACPM
Sensors" and the physical TMU sensors.

The SoC contains multiple physical temperature sensors scattered across
the die (e.g., near specific cores). However, the ACPM firmware abstracts
these into logical groups (Clusters).

- ACPM Sensor 0 (Big Cluster): Aggregates physical sensors 0, 6, 7, 8, 9.
- ACPM Sensor 1 (Mid Cluster): Aggregates physical sensors 4, 5.
- ACPM Sensor 2 (Little Cluster): Aggregates physical sensors 1, 2.

While ACPM reports a single temperature per logical sensor (likely the
max of the group), the thermal interrupts are raised by the physical
blocks individually.

Therefore, the driver is designed to map these physical interrupt bits
back to their logical parent. When an interrupt fires, the driver checks
the syscon register against the masks defined above. If any bit within
a group's mask is set, the corresponding logical thermal zone is updated.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (8):
      dt-bindings: thermal: Add Google GS101 TMU
      dt-bindings: firmware: google,gs101-acpm-ipc: Add TMU child node
      dt-bindings: mfd: Add Google GS101 TMU Syscon
      firmware: samsung: acpm: Add TMU protocol support
      thermal: samsung: Add support for GS101 TMU
      MAINTAINERS: Add entry for Samsung Exynos ACPM thermal driver
      arm64: dts: exynos: gs101: Add thermal management unit
      arm64: defconfig: enable Exynos ACPM thermal support

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |  17 +
 .../bindings/mfd/google,gs101-tmu-syscon.yaml      |  37 ++
 .../bindings/thermal/google,gs101-tmu-top.yaml     |  64 +++
 MAINTAINERS                                        |   8 +
 arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi   | 209 +++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  22 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/firmware/samsung/Makefile                  |   1 +
 drivers/firmware/samsung/exynos-acpm-tmu.c         | 212 +++++++
 drivers/firmware/samsung/exynos-acpm-tmu.h         |  33 ++
 drivers/firmware/samsung/exynos-acpm.c             |  12 +
 drivers/thermal/samsung/Kconfig                    |  16 +
 drivers/thermal/samsung/Makefile                   |   2 +
 drivers/thermal/samsung/acpm-tmu.c                 | 638 +++++++++++++++++++++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  24 +
 15 files changed, 1296 insertions(+)
---
base-commit: fefc12a70eb12e0b04f0b59b623965dd3ab1f4ba
change-id: 20260113-acpm-tmu-27e21f0e2c3b

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


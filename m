Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91F42AF10;
	Mon,  3 Feb 2025 20:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738615600; cv=none; b=TqaNGimi6atlg7gRA8DOcLxfiAr9mvIqQM3PP1LpTIrdRt3fTbpkVZXVziZiNAoE9QELa1P2nrXfBjLRfJX/+f2rPtQXz6t9txPvVdljcJfhB86LWuUSNzAeYWLhFEsE2qlbn1/xxlKeqSEuLEo6n6sn07tApizU9ciajyh6Ths=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738615600; c=relaxed/simple;
	bh=ch2sSufwQ9ybFmXz46vuGZ4BlSmI/UG2rPdI7UCO+uw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EQyG/02WmPjPRcgL64XMHivMLbSiIQY9WrVoITH7/Y4I0MsyxW+5LVp6KdPqGBBAnHIRVzM0ceXmAamRxW5gEtMN68JVa2LdQgJs6R0Cml1MJogT2XGUJujF0LE0LRnsylrRaKyVs0Uiz4NITuaCaVnSeeHtpdyKLaZDPmibyjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=EaYzPbJ8; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="EaYzPbJ8"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4F9C925BDA;
	Mon,  3 Feb 2025 21:46:37 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0Uzq6I7cQ6X; Mon,  3 Feb 2025 21:46:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615592; bh=ch2sSufwQ9ybFmXz46vuGZ4BlSmI/UG2rPdI7UCO+uw=;
	h=From:Subject:Date:To:Cc;
	b=EaYzPbJ8i9CmStJfpg5bLTGSb31LL4ihqugdR8jD3gZeIvJgDin+ReN9WrqDeBbx0
	 rBZWyoSK5KPmZw3DjFEBxbOQOxAuzKU0VNReVZNDDQ1aPQV/2g0JOLGEuXJa3S3GT4
	 uCxJ4vDmhpK2RlNmJfvMptlQtAqmMXxGSUkX47hayb/S6QEXqKl0M0U8VWIn137pYJ
	 tUdyBtjafP/0a1HTKlYuJ7ntuVGhRlg1vvp4F94VUVpzNAQPcRG4LrLJEo2q3rHXq9
	 Dsx10FJS0rFonAHgXW8n+kUk5nZYJ0iVSIKGoztn838HaG6YU4kdpsXnJrbfD6anUP
	 48GVv3oM9GyDQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v2 0/5] Add support for the Exynos7870 SoC, along with
 three devices
Date: Tue, 04 Feb 2025 02:16:08 +0530
Message-Id: <20250204-exynos7870-v2-0-56313165ef0c@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABAroWcC/03MQQqDMBCF4avIrJsyidHYrnqP4kKbic4mKYkER
 bx7U6HQ5f/gfTskikwJ7tUOkTInDr6EulTwmgc/kWBbGhSqBhVKQevmQzKdQYH61nSG9Gisg3J
 4R3K8ntizLz1zWkLcTjvL7/pj6n8mS4FCja112rRD7fBhOcUQlmuIE/THcXwAno6L2aYAAAA=
X-Change-ID: 20250201-exynos7870-049587e4b7df
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738615584; l=3581;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=ch2sSufwQ9ybFmXz46vuGZ4BlSmI/UG2rPdI7UCO+uw=;
 b=J+fEoP3qHxLg1PKSdLMmq+bK5SaF74eK/t+rxRkWiH4RHe753F1ESqnPBLAD+XNM6gbJ3LcU1
 0ACmCbqGBweCAHPLO9vqXIH9/XZ5xYTHy0mlUKBoII8rPitNNZ0oCCa
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Samsung Exynos 7870 (codename: Joshua) is an ARM-v8 system-on-chip that was
announced in 2016. The chipset was found in several popular mid-range to
low-end Samsung phones, released within 2016 to 2019.

This patch series aims to add support for Exynos 7870, starting with the
most basic yet essential components such as CPU, GPU, clock controllers,
PMIC, pin controllers, etc.

Moreover, the series also adds support for three Exynos 7870 devices via
devicetree. The devices are:
 * Samsung Galaxy J7 Prime	- released 2016, codename on7xelte
 * Samsung Galaxy J6		- released 2018, codename j6lte
 * Samsung Galaxy A2 Core	- released 2019, codename a2corelte

Additional features implemented in this series include:
 * I2C	- touchscreen, IIO sensors, etc.
 * UART	- bluetooth and serial debugging
 * MMC	- eMMC, Wi-Fi SDIO, SDCard
 * USB	- micro-USB 2.0 interface

The series has commits from me and Sergey, who has given me permission
to upstream their patches with proper attribution.

Here is a list of all sub-series:
 * bootmode	  	- https://lore.kernel.org/all/20250204-exynos7870-bootmode-v1-1-0f17b3033c2d@disroot.org/
 * chipid		- https://lore.kernel.org/all/20250204-exynos7870-chipid-v1-0-0bf2db08e621@disroot.org/
 * gpu			- https://lore.kernel.org/all/20250204-exynos7870-gpu-v1-1-0db4c163a030@disroot.org/
 * i2c	      		- https://lore.kernel.org/all/20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org/
 * mmc			- https://lore.kernel.org/all/20250204-exynos7870-mmc-v1-0-c87cfc72be4a@disroot.org/
 * pinctrl	  	- https://lore.kernel.org/all/20250204-exynos7870-pinctrl-v1-0-77b9800749b7@disroot.org/
 * pmic-regulators	- https://lore.kernel.org/all/20250204-exynos7870-pmic-regulators-v1-0-05adad38102c@disroot.org/
 * pmu-clocks		- https://lore.kernel.org/all/20250204-exynos7870-pmu-clocks-v1-0-a3030ae5bb53@disroot.org/
 * uart			- https://lore.kernel.org/all/20250204-exynos7870-uart-v1-0-06be6aa96284@disroot.org/
 * usb			- https://lore.kernel.org/all/20250204-exynos7870-usb-v1-0-a7753f8183a4@disroot.org/
 * usbphy		- https://lore.kernel.org/all/20250204-exynos7870-usbphy-v1-0-f30a9857efeb@disroot.org/
(Legend: [R]eviewed, [A]pplied)

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v2:
- Redo a few commit descriptions.
- Split patchsets into multiple sub-series, subsystem-wise.
- Link to v1: https://lore.kernel.org/r/20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org

---
Kaustabh Chakraborty (5):
      dt-bindings: arm: samsung: add compatibles for exynos7870 devices
      arm64: dts: exynos: add initial devicetree support for exynos7870
      arm64: dts: exynos: add initial support for Samsung Galaxy J7 Prime
      arm64: dts: exynos: add initial support for Samsung Galaxy A2 Core
      arm64: dts: exynos: add initial support for Samsung Galaxy J6

 .../bindings/arm/samsung/samsung-boards.yaml       |    8 +
 arch/arm64/boot/dts/exynos/Makefile                |    3 +
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |  619 ++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  606 ++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |  654 +++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi | 1035 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |  722 ++++++++++++++
 7 files changed, 3647 insertions(+)
---
base-commit: df4b2bbff898227db0c14264ac7edd634e79f755
change-id: 20250201-exynos7870-049587e4b7df

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


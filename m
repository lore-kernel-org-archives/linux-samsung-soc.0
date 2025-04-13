Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B1C1F3B8C;
	Sun, 13 Apr 2025 18:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744570767; cv=none; b=N0CjbUgilBeKTJCngaEJKGeo/VxKK14iVzkMqPWsjNeiQ+NYUFuOqTG0lTjguMeqL79jorZ0oKJHWfGgv5oTXOG03IEbCYjeTh2GRM+y1mpWEGKRGT1DJ+lHbqXcsq5qgzl6hTjiTyWcPEELy4CbXMyagBBoKMK2EDXgaxovEiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744570767; c=relaxed/simple;
	bh=1ZsSYHzcT6LpZjAKJqJ4rjXJkEP7wCJp41hedkkblMI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iwjwCy4PbUQ7dhzppLMumz3TFOubeqyXJzx32NByXDl7NsYhBQCCXJbx48gAujWMnknyqM0wmGWf7TWKqc4addVXRF6NKE+hWaknxYmZj4DQTAHvjP7BPPprLNRy0kRkTgmBBw9lXlV4PxvyViX/geruBHzNm48aw/1lTnWqY7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=KpCn4gPH; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="KpCn4gPH"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0AF0825FA0;
	Sun, 13 Apr 2025 20:59:16 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6_DBFs_r6gXb; Sun, 13 Apr 2025 20:59:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744570754; bh=1ZsSYHzcT6LpZjAKJqJ4rjXJkEP7wCJp41hedkkblMI=;
	h=From:Subject:Date:To:Cc;
	b=KpCn4gPHsCchiqQk/3yRBlkLzeUJqEZBzL4B+xOXXMRjaWzilMly5BaMQXUxNWjel
	 ZSR9FskLUPOOrNNUgAd6J8DuPCiAFXjPVvzTUQ+kcUg72s3YYAoekruPZVxJDBx6L+
	 MEAPFXUqC8J3R0BTkmy1oQTlUGge4I2JUVP7V2popOGPMwIhb7I6e2gjpK7CQFOywV
	 MIMDG01dTZzxWkv8NUkl4mnX9lLk6p3WJX9skYzHeJTTzCSYaexbUAtg7SdDaVlQFO
	 CiDfmK4q8X3nCnf/2ibx0gkpnCfrhTQeR0cvxsckBCYrh5IXRlzctArYjKqET1EWSu
	 yyI8f5dMKfzjg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v6 0/5] Add support for the Exynos7870 SoC, along with
 three devices
Date: Mon, 14 Apr 2025 00:28:41 +0530
Message-Id: <20250414-exynos7870-v6-0-039bd5385411@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGEJ/GcC/2XPzWoDIRSG4VsJrmtRjz9jVr2P0oWOx8TNWDRIQ
 ph7rxMoGZnlJzwvxyepWBJWcj49ScGWaspLH/rjROarWy5IU+ibCCYUE4xTvD+WXM1kGGXSqsm
 g9CZE0sFvwZjur9j3T9/XVG+5PF7txrfX/wzsM41TRoXXIUqjHUT2FVItOd8+c7mQLdTEHssBi
 46VBg5cK4xsPmLYYW4HDB0jTDJ6zdnswhHLN4bx901uZ1uhFJhovXBHrN5Y8hGrjrUHbh2CnkG
 PeF3XP19kOXOaAQAA
X-Change-ID: 20250201-exynos7870-049587e4b7df
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744570750; l=4855;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=1ZsSYHzcT6LpZjAKJqJ4rjXJkEP7wCJp41hedkkblMI=;
 b=oapeo+zXnxGmk2NN4/B/fUuPs05vEG1EbDs2EYFZItA5aLFXiQg4/5DKtaV9qSxlx+e5hxr1r
 JAUzfOTDf8LA2sFKF/dkYghRUBqXx/ekNM9UvGSJBwmDXYuAzMj+PJZ
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

Build dependencies are in these sub-series:
 * pmu-clocks		A https://lore.kernel.org/all/20250301-exynos7870-pmu-clocks-v5-0-715b646d5206@disroot.org/

Other related sub-series:
 * gpu			A https://lore.kernel.org/all/20250318-exynos7870-gpu-v1-1-084863f28b5c@disroot.org/
 * i2c	      		A https://lore.kernel.org/all/20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org/
 * mmc			A https://lore.kernel.org/all/20250219-exynos7870-mmc-v2-0-b4255a3e39ed@disroot.org/
 * pinctrl	  	A https://lore.kernel.org/all/20250301-exynos7870-pinctrl-v3-0-ba1da9d3cd2f@disroot.org/
 * pmic-regulators	A https://lore.kernel.org/all/20250301-exynos7870-pmic-regulators-v3-0-808d0b47a564@disroot.org/
 * uart			A https://lore.kernel.org/all/20250318-exynos7870-uart-v2-1-b9dcf145ae87@disroot.org/
 * usb			A https://lore.kernel.org/all/20250301-exynos7870-usb-v3-0-f01697165d19@disroot.org/
 * usbphy		A https://lore.kernel.org/all/20250410-exynos7870-usbphy-v2-0-2eb005987455@disroot.org/
(Legend: [R]eviewed, [A]pplied)

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v6:
- Append the following trailers:
  [v5 1/5] dt-bindings: arm: samsung: add compatibles for exynos7870 devices
    Acked-by: Rob Herring (Arm) <robh@kernel.org>
- Link to v5: https://lore.kernel.org/r/20250411-exynos7870-v5-0-6b319ae36c36@disroot.org

Changes in v5:
- Drop the exynos7870-bootmode patchset for now.
- Add card-detect-delay and cd-broken properties in sd-mmc nodes.
- Drop the following applied patches:
  [v4 1/7] dt-bindings: soc: samsung: exynos-pmu: add exynos7870-pmu compatible
  [v4 3/7] soc: samsung: exynos-chipid: add support for exynos7870
- Link to v4: https://lore.kernel.org/r/20250301-exynos7870-v4-0-2925537f9b2a@disroot.org

Changes in v4:
- Drop merged [PATCH v3 1/7].
- Explicitly mention sub-series having build dependencies.
- Include the following patch from the pmu-clocks series:
  - dt-bindings: soc: samsung: exynos-pmu: add exynos7870-pmu compatible
- Adjust clock header file name to match changes in pmu-clocks.
- Change regulator node names to match changes in pmic-regulators.
- Remove non-removable flag for the SDCard's mmc node.
- Link to v3: https://lore.kernel.org/r/20250219-exynos7870-v3-0-e384fb610cad@disroot.org

Changes in v3:
- Added patches from https://lore.kernel.org/all/20250204-exynos7870-chipid-v1-0-0bf2db08e621@disroot.org/
- Fix devicetree formatting according to the devicetree style guide.
- Take over ownership of patches by the co-author, upon their request.
- Link to v2: https://lore.kernel.org/r/20250204-exynos7870-v2-0-56313165ef0c@disroot.org

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
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |  630 ++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  618 ++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |  666 +++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi | 1022 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |  713 ++++++++++++++
 7 files changed, 3660 insertions(+)
---
base-commit: 29e7bf01ed8033c9a14ed0dc990dfe2736dbcd18
change-id: 20250201-exynos7870-049587e4b7df

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


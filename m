From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v4 0/5] ARM: EXYNOS: ODROID-XU DT and LEDs
Date: Sun, 15 Mar 2015 23:00:29 +0100
Message-ID: <1426456834-6308-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:53507 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750973AbbCOWAo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 15 Mar 2015 18:00:44 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, =?UTF-8?q?=EA=B9=80=ED=95=99=EC=A3=BC?= <ruppi.kim@hardkernel.com>, Tomasz Figa <tomasz.figa@gmail.com>, Humberto Naves <hsnaves@gmail.com>, Jan Kiszka <jan.kiszka@siemens.com>, Johann Pfefferl <johann.pfefferl@siemens.com>, Ben Gamari <bgamari.foss@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>

Hello,

This series adds a dedicated ODROID-XU device tree and enhances it with=
=20
LED configuration, to match the downstream 3.14 based behavior.

Regards,
Andreas

v3 -> v4:
* Rebased pinctrl (.label field dropped, const'ified, __initconst)
* Edited dts subjects to match Kukjin's preferred style

v2 -> v3:
* Actually rebased pinctrl (.svc, .{g,w}eint_{con,mask,pend} fields dro=
pped)
* Added wake-up IRQ controller node (Tomasz Figa)

v1 -> v2:
* Inserted needed Sobs from Hakjoo Kim

Andreas F=C3=A4rber (3):
  ARM: dts: Clean up exynos5410-smdk5410 indentation
  ARM: dts: Prepare exynos5410-odroidxu device tree
  ARM: dts: Add LEDs to exynos5410-odroidxu

Hakjoo Kim (2):
  pinctrl: exynos: add exynos5410 SoC specific data
  ARM: dts: add pinctrl support to Exynos5410

 .../bindings/pinctrl/samsung-pinctrl.txt           |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/exynos5410-odroidxu.dts          | 103 ++++++
 arch/arm/boot/dts/exynos5410-pinctrl.dtsi          | 406 +++++++++++++=
++++++++
 arch/arm/boot/dts/exynos5410-smdk5410.dts          |   6 +-
 arch/arm/boot/dts/exynos5410.dtsi                  |  36 ++
 drivers/pinctrl/samsung/pinctrl-exynos.c           | 103 ++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 9 files changed, 656 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos5410-odroidxu.dts
 create mode 100644 arch/arm/boot/dts/exynos5410-pinctrl.dtsi

--=20
2.3.1

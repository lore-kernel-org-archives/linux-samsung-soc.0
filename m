From: Simon Shields <simon@lineageos.org>
Subject: [PATCH v2 0/4] Add Exynos4412-based midas boards support
Date: Thu, 14 Dec 2017 23:50:11 +1100
Message-ID: <20171214125015.2611-1-simon@lineageos.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:44041 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752217AbdLNMu7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Dec 2017 07:50:59 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?q?Bart=C5=82omiej=20=C5=BBo=C5=82nierkiewicz?= <b.zolnierkie@samsung.com>, Simon Shields <simon@lineageos.org>

Hi,

This patch series adds support for a new set of boards, codenamed
"midas". These are the Galaxy S3 (m0/m3) and the Galaxy Note 2 (t0).
These boards are closely related to trats2 - m0 is a trats2 but with a
bootloader geared towards booting Android rather than a traditional Linux
distribution - and because of this, the dts files are largely based off
what is already in-place for trats2. Trats2 is modified to use
the dts files added by this series.

Patch #1 adds documentation for the bindings used by the boards.
Patch #2 splits the existing trats2 DTS into the common midas,
m0/m3/trats2-specific, and trats2-specific parts.
Patch #3 adds the device-tree files for the other boards.
Patch #4 enables cpuidle support for all added boards.

Changes since v1:
* Include trats2 in inheritance
* Add the new dtbs to the makefile
* Cleanup style per Krzysztof's comments

Cheers,
Simon

Simon Shields (4):
  dt-bindings: samsung: document bindings for Midas family boards
  ARM: dts: split trats2 dts in preparation for midas boards
  ARM: dts: add Samsung's exynos4412-based midas boards
  ARM: exynos: extend cpuidle support to midas boards

 .../bindings/arm/samsung/samsung-boards.txt        |    4 +
 arch/arm/boot/dts/Makefile                         |    3 +
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi        |  144 +++
 arch/arm/boot/dts/exynos4412-m0.dts                |   14 +
 arch/arm/boot/dts/exynos4412-m3.dts                |   19 +
 arch/arm/boot/dts/exynos4412-midas.dtsi            | 1291 ++++++++++++++++++
 arch/arm/boot/dts/exynos4412-t0.dts                |   50 +
 arch/arm/boot/dts/exynos4412-trats2.dts            | 1364 +-------------------
 arch/arm/mach-exynos/exynos.c                      |    2 +-
 9 files changed, 1532 insertions(+), 1359 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
 create mode 100644 arch/arm/boot/dts/exynos4412-m0.dts
 create mode 100644 arch/arm/boot/dts/exynos4412-m3.dts
 create mode 100644 arch/arm/boot/dts/exynos4412-midas.dtsi
 create mode 100644 arch/arm/boot/dts/exynos4412-t0.dts

-- 
2.15.1

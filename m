From: Simon Shields <simon@lineageos.org>
Subject: [PATCH v5 0/4] Add Exynos4412-based midas boards support
Date: Thu,  8 Feb 2018 11:01:33 +1100
Message-ID: <20180208000137.11264-1-simon@lineageos.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:44891 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750767AbeBHACH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Feb 2018 19:02:07 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?q?Bart=C5=82omiej=20=C5=BBo=C5=82nierkiewicz?= <b.zolnierkie@samsung.com>, Simon Shields <simon@lineageos.org>

Hi,

This patch series adds support for a new set of boards, codenamed
"midas". These are the Galaxy S3 (GT-I9300/GT-I9305)
and the Galaxy Note 2 (GT-N7100/GT-N7105).

These boards are closely related to trats2 - i9300 is a trats2 but with a
bootloader geared towards booting Android rather than a traditional Linux
distribution - and because of this, the dts files are largely based off
what is already in-place for trats2. Trats2 is modified to use
the dts files added by this series.

Patch #1 adds documentation for the bindings used by the boards.
Patch #2 splits the existing trats2 DTS into the common midas,
i9300/i9305/trats2-specific, and trats2-specific parts.
Patch #3 adds the device-tree files for the other boards.
Patch #4 enables cpuidle support for all added boards.

Changes since v1:
* Include trats2 in inheritance
* Add the new dtbs to the makefile
* Cleanup style per Krzysztof's comments

Changes since v2:
* Rebase on linux-next 20171218 (adds some fixes yet to land in mainline)
* Leave any changes to the DTS out of patch #2
* Minimise diff of exynos4412-midas.dtsi, using format-patch -B30%
  (thanks for the suggestion, Krzysztof)
* Leave original trats2 copyrights on midas and galaxy-s3 DTS files
* Preserve ABI for the cpuidle compatibility check
* Explain the m0/m3/t0 -> GT-I9300/GT-I9305/GT-N7100/GT-N7105 relationship
 in the DT binding docs.

Changes since v3:
* Abandon the m0/m3/t0 terminology in favour of model numbers (m0 =>
 i9300, m3 => i9305, t0 => n710x)
* Use SPDX on all files, and keep Samsung copyrights where needed
* Clean up unnecessary disables of devicetree nodes
* Correct s5c73m3 vdda regulator for n710x

Changes since v4:
* Remove unneeded status = "okay" lines in regulator definitions

Cheers,
Simon

Simon Shields (4):
  dt-bindings: samsung: document bindings for Midas family boards
  ARM: dts: split trats2 DTS in preparation for midas boards
  ARM: dts: add Samsung's exynos4412-based midas boards
  ARM: exynos: extend cpuidle support to midas boards

 .../bindings/arm/samsung/samsung-boards.txt        |    4 +
 arch/arm/boot/dts/Makefile                         |    3 +
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi        |  140 ++
 arch/arm/boot/dts/exynos4412-i9300.dts             |   22 +
 arch/arm/boot/dts/exynos4412-i9305.dts             |   20 +
 ...exynos4412-trats2.dts => exynos4412-midas.dtsi} |  119 +-
 arch/arm/boot/dts/exynos4412-n710x.dts             |   57 +
 arch/arm/boot/dts/exynos4412-trats2.dts            | 1441 +-------------------
 arch/arm/mach-exynos/exynos.c                      |    3 +-
 9 files changed, 281 insertions(+), 1528 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
 create mode 100644 arch/arm/boot/dts/exynos4412-i9300.dts
 create mode 100644 arch/arm/boot/dts/exynos4412-i9305.dts
 copy arch/arm/boot/dts/{exynos4412-trats2.dts => exynos4412-midas.dtsi} (91%)
 create mode 100644 arch/arm/boot/dts/exynos4412-n710x.dts
 rewrite arch/arm/boot/dts/exynos4412-trats2.dts (98%)

-- 
2.16.0

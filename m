From: Simon Shields <simon@lineageos.org>
Subject: [PATCH 0/3] Add Exynos4412-based midas boards support
Date: Wed, 13 Dec 2017 01:08:12 +1100
Message-ID: <20171212140815.28257-1-simon@lineageos.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:44753 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753052AbdLLOIf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 Dec 2017 09:08:35 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, Simon Shields <simon@lineageos.org>

Hi,

This patch series adds support for a new set of boards, codenamed
"midas". These are the Galaxy S3 (m0/m3) and the Galaxy Note 2 (t0).
These boards are closely related to trats2 - m0 is a trats2 but with a
bootloader geared towards booting Android rather than a traditional Linux
distribution - and because of this, the dts files are largely based off
what is already in-place for trats2.

Patch #1 adds documentation for the bindings used by the boards,
patch #2 adds the device-tree files themselves, and patch #3 enables
cpuidle support for the boards.

Cheers,
Simon

Simon Shields (3):
  dt-bindings: samsung: document bindings for Midas family boards
  ARM: dts: add Samsung's exynos4412-based midas boards
  ARM: exynos: extend cpuidle support to midas boards

 .../bindings/arm/samsung/samsung-boards.txt        |    4 +
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi        |  144 +++
 arch/arm/boot/dts/exynos4412-m0.dts                |   14 +
 arch/arm/boot/dts/exynos4412-m3.dts                |   19 +
 arch/arm/boot/dts/exynos4412-midas.dtsi            | 1291 ++++++++++++++++++++
 arch/arm/boot/dts/exynos4412-t0.dts                |   51 +
 arch/arm/mach-exynos/exynos.c                      |    3 +-
 7 files changed, 1525 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
 create mode 100644 arch/arm/boot/dts/exynos4412-m0.dts
 create mode 100644 arch/arm/boot/dts/exynos4412-m3.dts
 create mode 100644 arch/arm/boot/dts/exynos4412-midas.dtsi
 create mode 100644 arch/arm/boot/dts/exynos4412-t0.dts

-- 
2.15.1

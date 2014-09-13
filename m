From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH 0/4] Add initial support for pinctrl on Exynos7
Date: Sat, 13 Sep 2014 14:20:48 +0530
Message-ID: <1410598252-30931-2-git-send-email-a.kesavan@samsung.com>
References: <1410598252-30931-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:24661 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751447AbaIMIvD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 13 Sep 2014 04:51:03 -0400
In-reply-to: <1410598252-30931-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: kesavan.abhilash@gmail.com, linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com, robh@kernel.org, devicetree@vger.kernel.org, tomasz.figa@gmail.com, linus.walleij@linaro.org, thomas.ab@samsung.com

The following patches are tested based on Kgene's for-next tree.
https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/?h=for-next

Following patches are required for this series:
1- "tty/serial: fix config dependencies for samsung serial"
   https://www.mail-archive.com/linux-samsung-soc <at> vger.kernel.org/msg36208.html
2- "dts, kbuild: Implement support for dtb vendor subdirs" patchset 
   http://comments.gmane.org/gmane.linux.kbuild.devel/12131
3- "arch: arm64: enable support for Samsung Exynos7 SoC" patchset
   http://www.spinics.net/lists/linux-samsung-soc/msg36728.html

Abhilash Kesavan (2):
  pinctrl: exynos: Generalize the eint16_31 demux code
  pinctrl: exynos: Add irq_chip instance for Exynos7 wakeup interrupts

Naveen Krishna Chatradhi (2):
  pinctrl: exynos: Add initial driver data for Exynos7
  arm64: dts: Add initial pinctrl support to EXYNOS7

 .../bindings/pinctrl/samsung-pinctrl.txt           |    3 +
 arch/arm64/Kconfig                                 |    2 +
 arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi    |  560 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |   66 +++
 drivers/pinctrl/samsung/pinctrl-exynos.c           |  161 +++++-
 drivers/pinctrl/samsung/pinctrl-exynos.h           |    4 +
 drivers/pinctrl/samsung/pinctrl-samsung.c          |    2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |    1 +
 8 files changed, 788 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi

-- 
1.7.9.5

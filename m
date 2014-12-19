From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 0/2] Add pinctrl support for audio IPs on exynos7
Date: Fri, 19 Dec 2014 18:40:57 +0530
Message-ID: <1418994659-5222-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:53078 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752163AbaLSNSs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Dec 2014 08:18:48 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, linus.walleij@linaro.org, tomasz.figa@gmail.com, s.nawrocki@samsung.com

Audio interface IPs I2S, PCM and SPDIF on Exynos7 requires GPIOs
available on AUD and BUS0 pin controller blocks. So add support
for all. 

This patchset is dependent on BUS1 pin control support from Vivek
in the below link
https://patchwork.kernel.org/patch/5467321/

Padmavathi Venna (2):
  pinctrl: exynos: Add AUDIO pin controller for exynos7
  arm64: dts: Add pinctrl support for audio IPs on exynos7

 .../bindings/pinctrl/samsung-pinctrl.txt           |    1 +
 arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi    |   56 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |    7 +++
 drivers/pinctrl/samsung/pinctrl-exynos.c           |   10 ++++
 4 files changed, 74 insertions(+), 0 deletions(-)

-- 
1.7.4.4

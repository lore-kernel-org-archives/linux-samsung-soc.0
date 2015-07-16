From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v2 0/3] ARM: Enable NTC Thermistors and max77802 regulator drivers
Date: Thu, 16 Jul 2015 08:39:41 +0200
Message-ID: <1437028784-22189-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:53185 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751411AbbGPGkQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Jul 2015 02:40:16 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, Javier Martinez Canillas <javier@osg.samsung.com>

Hello Kukjin and Krzysztof,

This series enables support in exynos_defconfig and multi_v7_defconfig
for the NTC Thermistors found on the Exynos5 Peach Chromebooks and
also enables support for the max77802 regulators in multi_v7_defconfig.

This is the second version that address issues pointed out by Krzysztof
and adds his Reviewed-by tag.

The series is composed of the following patches:

Changes in v2:
- Better explanation why the max77802 regulator config option is needed.
- Add Krzysztof Kozlowski Reviewed-by tag in patch #1
- Add Krzysztof Kozlowski Reviewed-by tag in patch #2.
- Add Krzysztof Kozlowski Reviewed-by tag in patch #3.

Javier Martinez Canillas (3):
  ARM: multi_v7_defconfig: Enable max77802 regulator
  ARM: multi_v7_defconfig: Enable NTC Thermistors support
  ARM: exynos_defconfig: Enable NTC Thermistors support

 arch/arm/configs/exynos_defconfig   | 1 +
 arch/arm/configs/multi_v7_defconfig | 3 +++
 2 files changed, 4 insertions(+)

-- 
2.4.3

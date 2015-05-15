From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH 0/4] ARM: multi_v7_defconfig: Stuff for Exynos
Date: Fri, 15 May 2015 21:48:58 +0900
Message-ID: <1431694142-32141-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f180.google.com ([209.85.223.180]:36432 "EHLO
	mail-ie0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161018AbbEOMtx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 May 2015 08:49:53 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

Dear Kukjin,

The patchset enables various config options on multi_v7 config
for Exynos boards. The first two patches are actually resend.

Arnd suggested [0] that this can go through your tree.

Patchset is rebased on next-20150515 and Javier's patchset [1]
(to avoid conflicts around regulators and clocks).

Please let me know if this should be rebased on other commit.

[0] http://www.spinics.net/lists/kernel/msg1991518.html
[1] http://www.spinics.net/lists/kernel/msg1990767.html

Best regards,
Krzysztof


Krzysztof Kozlowski (4):
  ARM: multi_v7_defconfig: Enable CPU idle for Exynos
  ARM: multi_v7_defconfig: Enable PMIC and MUIC drivers for Exynos
    boards
  ARM: multi_v7_defconfig: Enable TMU for Exynos
  ARM: multi_v7_defconfig: Enable OHCI on Exynos

 arch/arm/configs/multi_v7_defconfig | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

-- 
2.1.4

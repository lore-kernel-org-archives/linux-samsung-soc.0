From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: [PATCH v3 0/2] Add mask-tpm-reset DT node to the exynos5
Date: Tue, 15 Jul 2014 16:01:32 +0530
Message-ID: <1405420294-9323-1-git-send-email-vikas.sajjan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:57992 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758723AbaGOKe3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jul 2014 06:34:29 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N8R00C6M1DFDI70@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Jul 2014 19:34:27 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, sajjan.linux@gmail.com, dianders@chromium.org, linus.walleij@linaro.org, swarren@wwwdotorg.org, olof@lixom.net, thomas.ab@samsung.com, Vikas Sajjan <vikas.sajjan@samsung.com>

Adds mask-tpm-reset DT node to the exynos5420 and exynos5800.

rebase on for-next branch of kgene tree
https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/

Tested on exynos5420 and exynos5800 based Chromebooks (both pit and pi).

changes since v2:
	- reordered the dt node based on gpio number
	- included the exynos5800-peach-pi patch in this series

changes since v1:
	- removed fixed regulator and used hogs instead.

Doug Anderson (1):
  ARM: dts: Add mask-tpm-reset to the device tree

Vikas Sajjan (1):
  ARM: dts: Add mask-tpm-reset DT node to the exynos5800-peach-pi

 arch/arm/boot/dts/exynos5420-peach-pit.dts |   12 ++++++++++++
 arch/arm/boot/dts/exynos5800-peach-pi.dts  |   12 ++++++++++++
 2 files changed, 24 insertions(+)

-- 
1.7.9.5

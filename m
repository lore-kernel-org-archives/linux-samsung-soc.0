From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung usb stuff for v3.5
Date: Thu, 17 May 2012 15:45:55 +0900
Message-ID: <0b1401cd33f8$b5aca930$2105fb90$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:57119 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758215Ab2EQGpy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 May 2012 02:45:54 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M4500D96MLJBYM0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 May 2012 15:45:52 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M4500G7TMSFHW40@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 May 2012 15:45:52 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: gregkh@linuxfoundation.org, balbi@ti.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>

Hi Greg and Felipe,

Please pull Samsung 's3c-hsotg' UDC support for EXYNOS4210 and S5PV210 from:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
v3.5-for-usb

Since it has a dependency on 'usb: hsotg: samsung ...' patches which have
been already in usb tree now, so would be better if you could pull this
series in your tree. Or this can be sent to upstream in the end of upcoming
merge window after pulling usb tree. But I think usb tree is better in this
case.

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 36be50515fe2aef61533b516fa2576a2c7fe7664:

  Linux 3.4-rc7 (2012-05-12 18:37:47 -0700)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
v3.5-for-usb

Joonyoung Shim (1):
      ARM: EXYNOS: Add s3c-hsotg device support for NURI board

Lukasz Majewski (3):
      ARM: EXYNOS: Add usb otg phy control for EXYNOS4210
      ARM: EXYNOS: Add s3c-hsotg device support for GONI board
      ARM: EXYNOS: Add s3c-hsotg device support for Universal C210 board

 arch/arm/mach-exynos/Kconfig                 |    3 +
 arch/arm/mach-exynos/include/mach/irqs.h     |    1 +
 arch/arm/mach-exynos/include/mach/map.h      |    4 +
 arch/arm/mach-exynos/include/mach/regs-pmu.h |    3 +
 arch/arm/mach-exynos/mach-nuri.c             |    9 ++-
 arch/arm/mach-exynos/mach-universal_c210.c   |   10 +++
 arch/arm/mach-exynos/setup-usb-phy.c         |  100
++++++++++++++++++-------
 arch/arm/mach-s5pv210/Kconfig                |    1 +
 arch/arm/mach-s5pv210/mach-goni.c            |    5 ++
 9 files changed, 107 insertions(+), 29 deletions(-)

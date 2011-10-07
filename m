From: Rajeshwari Shinde <rajeshwari.s@samsung.com>
Subject: [PATCH V2 0/2] Add a common macro for creating struct clk_lookup
 entries
Date: Fri, 07 Oct 2011 15:23:29 +0530
Message-ID: <1317981211-15745-1-git-send-email-rajeshwari.s@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:37907 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965051Ab1JGJ5Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Oct 2011 05:57:25 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSO00M46WZKL930@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Oct 2011 18:57:25 +0900 (KST)
Received: from rajeshwari-linux.sisodomain.com ([107.108.215.115])
 by mmp1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTPA id <0LSO00E5NWZHO450@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Oct 2011 18:57:24 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: khilman@ti.com, nsekhar@ti.com, hsweeten@visionengravers.com, rmallon@gmail.com, s.hauer@pengutronix.de, u.kleine-koenig@pengutronix.de, plagnioj@jcrosoft.com, amit.kucheria@canonical.com, kernel@pengutronix.de, hjk@hansjkoch.de, linux@arm.linux.org.uk, rajeshwari.s@samsung.com

This patchset consolidates the macro that creates 'struct clk_lookup'
entries by introducing a common macro 'CLKDEV_INIT' as suggested by
Russell King. Few of the platforms have been modified to use this new macro.

I have done the replacement by using python script. I have only build tested
for below platforms with existing defconfigs.

Changes since V1:
- Removed "&" and "," from the CLKDEV_INIT macro.
- Replaced the platform specific macros to use the new CLKDEV_INIT macro.
- Rebased the patches on the latest master branch of Linux-Next.

Rajeshwari Shinde (2):
  ARM: CLKDEV: Add Common Macro for clk_lookup
  ARM: Using CLKDEV_INIT for creating clk_lookup instance

 arch/arm/mach-davinci/board-dm646x-evm.c |    5 +-
 arch/arm/mach-davinci/clock.h            |    7 --
 arch/arm/mach-davinci/da830.c            |  101 ++++++++++----------
 arch/arm/mach-davinci/da850.c            |   95 ++++++++++----------
 arch/arm/mach-davinci/dm355.c            |   87 +++++++++---------
 arch/arm/mach-davinci/dm365.c            |  113 +++++++++++-----------
 arch/arm/mach-davinci/dm644x.c           |   77 ++++++++--------
 arch/arm/mach-davinci/dm646x.c           |   81 ++++++++--------
 arch/arm/mach-davinci/tnetv107x.c        |  133 +++++++++++++-------------
 arch/arm/mach-ep93xx/clock.c             |   61 ++++++-------
 arch/arm/mach-imx/clock-imx1.c           |   38 +++-----
 arch/arm/mach-imx/clock-imx21.c          |   91 +++++++++----------
 arch/arm/mach-imx/clock-imx25.c          |   79 +++++++---------
 arch/arm/mach-imx/clock-imx27.c          |  111 ++++++++++------------
 arch/arm/mach-imx/clock-imx31.c          |  103 ++++++++++-----------
 arch/arm/mach-imx/clock-imx35.c          |  117 +++++++++++------------
 arch/arm/mach-lpc32xx/clock.c            |   75 +++++++--------
 arch/arm/mach-mx5/clock-mx51-mx53.c      |  149 ++++++++++++++----------------
 arch/arm/mach-mxs/clock-mx23.c           |   39 +++-----
 arch/arm/mach-mxs/clock-mx28.c           |   71 +++++++--------
 arch/arm/mach-tcc8k/clock.c              |  107 ++++++++++-----------
 include/linux/clkdev.h                   |    7 ++
 22 files changed, 838 insertions(+), 909 deletions(-)

-- 
1.7.4.4

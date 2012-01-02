From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung devel-rtc for v3.3
Date: Mon, 02 Jan 2012 09:54:03 +0900
Message-ID: <037601ccc8e9$07e2c8e0$17a85aa0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:15146 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751328Ab2ABAyK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 Jan 2012 19:54:10 -0500
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LX500FVQBU1HQ60@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 02 Jan 2012 09:54:09 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LX500GPKBU3TR30@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 02 Jan 2012 09:54:08 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Alessandro Zummo' <a.zummo@towertech.it>

Hi Arnd and Olof,

Please pull Samsung devel-rtc for v3.3 from following.
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next-samsung-devel-rtc

It is including support rtc for S3C2443 and S3C2416 and got the ack from
Alessandro Zummo.

Since next-samsung-dt1 branch touch drivers/rtc, it has been made based on
next-samsung-dt1 branch.

If any problems please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 0561ceabd0f13871900d116278fe9268aeb714d1:

  ARM: dts: Add intial dts file for EXYNOS4210 SoC, SMDKV310 and ORIGEN
(2011-12-23 10:07:12 +0900)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next-samsung-devel-rtc

Heiko Stuebner (4):
      ARM: SAMSUNG: cleanup of rtc register definitions
      rtc-s3c: make room for more variants in devicetree block
      rtc-s3c: add variants for S3C2443 and S3C2416
      ARM: S3C2443/S3C2416: add s3c_rtc_setname and rename rtc devices

 arch/arm/mach-s3c2416/s3c2416.c               |    2 +
 arch/arm/mach-s3c2443/s3c2443.c               |    2 +
 arch/arm/plat-samsung/include/plat/regs-rtc.h |   81
+++++++++++++------------
 arch/arm/plat-samsung/include/plat/rtc-core.h |   27 ++++++++
 drivers/rtc/rtc-s3c.c                         |   71 ++++++++++++++++++----
 5 files changed, 131 insertions(+), 52 deletions(-)
 create mode 100644 arch/arm/plat-samsung/include/plat/rtc-core.h

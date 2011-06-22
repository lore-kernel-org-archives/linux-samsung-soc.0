From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 0/2] ARM: S5PV210: GONI board update for CIF camera support
Date: Wed, 22 Jun 2011 18:34:10 +0200
Message-ID: <1308760452-30676-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:15435 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754876Ab1FVQeR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jun 2011 12:34:17 -0400
Received: from spt2.w1.samsung.com ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LN700FMEA13CY20@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 22 Jun 2011 17:34:16 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LN7002DIA12KX@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 22 Jun 2011 17:34:14 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com, sw0312.kim@samsung.com, riverful.kim@samsung.com

This patchset adds platform data definition for NOON010PC30 camera sensor 
for GONI board and renames sclk_cam clocks on S5PV210 platform which is needed
for FIMC media device driver.

The whole patches converting s5p-fimc to media controller API can be found at:

http://git.infradead.org/users/kmpark/linux-2.6-samsung
branch: s5p-fimc-next

Sylwester Nawrocki (2):
  ARM: S5PV210: Rename sclk_cam clocks for FIMC media driver
  ARM: S5PV210: Add support for NOON010PC30 sensor on GONI board

 arch/arm/mach-s5pv210/Kconfig     |    1 +
 arch/arm/mach-s5pv210/clock.c     |    6 +---
 arch/arm/mach-s5pv210/mach-goni.c |   52 +++++++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+), 4 deletions(-)

Created against for-next branch at:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 

Regards,
--
Sylwester Nawrocki
Samsung Poland R&D Center

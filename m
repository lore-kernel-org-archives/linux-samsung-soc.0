From: Kamil Debski <k.debski@samsung.com>
Subject: [PATCH 0/3 v2] ARM: S5P: Add support for MFC device on S5PV210 and
 EXYNOS4
Date: Tue, 14 Jun 2011 18:38:57 +0200
Message-ID: <1308069540-24934-1-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:64129 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751181Ab1FNQjH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jun 2011 12:39:07 -0400
Received: from eu_spt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LMS008GAGX5W020@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Jun 2011 17:39:05 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LMS0078CGX4H4@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Jun 2011 17:39:04 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.debski@samsung.com, jaeryul.oh@samsung.com, jtp.park@samsung.com, kgene.kim@samsung.com

Hello,

Multi Format Codec is a device present in the S5PV210 and EXYNOS4 SoCs by Samsung.
This patch set adds platform and mach data for MFC. The new version contains
memory initialization code for MFC and support for DMA contig allocator.

The patches have been applied to this branch, it should become available in a couple of hours:
http://git.infradead.org/users/kmpark/linux-2.6-samsung/shortlog/refs/heads/mfc-for-kgene

The MFC driver can be found on this branch (it should also sync in a couple of hours):
http://git.infradead.org/users/kmpark/linux-2.6-samsung/shortlog/refs/heads/mfc-for-mauro
The driver has been sent today to the linux-media list.

Best regards,
Kamil Debski

Change log:

=================
 Changes since v1
=================
- support for DMA conitg allocator
- reserving memory for MFC

Patch summary:

Kamil Debski (3):
  ARM: Add support for MFC device to plat-s5p, mach-s5pv210 and
    mach-exynos4
  ARM: S5PV210: Enable MFC on Goni
  ARM: EXYNOS4: Enable MFC on universal_c210

 arch/arm/Kconfig                            |    2 +
 arch/arm/mach-exynos4/Kconfig               |    2 +
 arch/arm/mach-exynos4/clock.c               |   63 ++++++++++++++
 arch/arm/mach-exynos4/include/mach/map.h    |    2 +
 arch/arm/mach-exynos4/mach-universal_c210.c |   13 +++
 arch/arm/mach-s5pv210/Kconfig               |    1 +
 arch/arm/mach-s5pv210/clock.c               |    6 ++
 arch/arm/mach-s5pv210/include/mach/map.h    |    3 +
 arch/arm/mach-s5pv210/mach-goni.c           |   10 ++
 arch/arm/plat-s5p/Kconfig                   |    5 +
 arch/arm/plat-s5p/Makefile                  |    2 +-
 arch/arm/plat-s5p/dev-mfc.c                 |  125 +++++++++++++++++++++++++++
 arch/arm/plat-s5p/include/plat/mfc.h        |   28 ++++++
 arch/arm/plat-samsung/include/plat/devs.h   |    3 +
 14 files changed, 264 insertions(+), 1 deletions(-)
 create mode 100644 arch/arm/plat-s5p/dev-mfc.c
 create mode 100644 arch/arm/plat-s5p/include/plat/mfc.h

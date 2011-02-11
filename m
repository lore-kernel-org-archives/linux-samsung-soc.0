From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2] ARM: S5PV210: Add GONI board setup for CIF camera support
Date: Fri, 11 Feb 2011 18:27:50 +0100
Message-ID: <1297445273-3829-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:9664 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757157Ab1BKR17 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Feb 2011 12:27:59 -0500
Received: from eu_spt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LGG00IHXR6K5N@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Feb 2011 17:27:56 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LGG00IDRR6KS5@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Feb 2011 17:27:56 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com

Hello,

the following patch series introduces changes in GONI board setup file
required for the CIF camera sensor driver.
The first patch adds the I2C0 bus driver, the second one adds the regulator
supply definitions and the third one just increases virtual size
of the framebuffer window 0 to enable double-buffering.
The added regulator supplies are also a subset of the supplies of the high
resolution camera which that reference board is equipped with.

Changes since v1:
 - removed unnecessary "select CONFIG_S3C_DEV_I2C0"


The patch series contains:

[PATCH 1/3] ARM: S5PV210: Enable I2C0 bus on GONI board
[PATCH 2/3] ARM: S5PV210: Add supplies for CIF camera on GONI board
[PATCH 3/3] ARM: S5PV210: Change framebuffer window 0 size on GONI

Created against for-next branch at:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 


Regards,
--
Sylwester Nawrocki
Samsung Poland R&D Center

From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 0/4] ARM: S5P: Add platform support for MIPI-CSI2 devices
Date: Thu, 02 Dec 2010 17:37:38 +0100
Message-ID: <1291307862-8125-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:31283 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752829Ab0LBQiD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Dec 2010 11:38:03 -0500
Received: from eu_spt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LCT004PA7JCMR20@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 02 Dec 2010 16:38:00 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LCT007GK7JB26@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 02 Dec 2010 16:38:00 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com

Hello,

the following patch series adds S5P platform support for MIPI-CSI2 devices.
It has been rebased onto next-samsung branch at:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 

[PATCH 1/4] mach-s5pv210: Add platform definitions for mipi-csis
[PATCH 2/4] mach-s5pv310: Add resource definitions for mipi-csis
[PATCH 3/4] plat-s5p: Add platform support for MIPI-CSI2 devices
[PATCH 4/4] mach-s5pv210: Add MIPI-CSI DPHY clock definition


Thanks.

--
Sylwester Nawrocki
Linux Platform Group
Samsung Poland R&D Center

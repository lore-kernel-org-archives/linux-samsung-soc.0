From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH/RFC 0/3] ARM: S5P: Add common DPHY control code for
	MIPI-CSIS/MIPI-DSIM devices
Date: Wed, 02 Mar 2011 18:34:46 +0100
Message-ID: <1299087289-29926-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:54955 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753859Ab1CBRf2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Mar 2011 12:35:28 -0500
Received: from spt2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LHF00L32Y72SH@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 02 Mar 2011 17:35:26 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LHF004WBY70Q6@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 02 Mar 2011 17:35:25 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com, inki.dae@samsung.com

Hello,

the following patch series adds a common platform code to enable control 
of MIPI-CSI receiver's DPHY from within it's V4L2 subdev driver. The driver
is supposed to support possibly all S5P SoCs variants and the PHY handling
details need to be hidden in the platform code. The functionality behind
"dphy_csis" clocks is not exact a functionality of the clock, but they have 
common features. If the clock API rules are to strict to accept this kind 
of usage then I'm willing to create some intermediate layer that will finally
solve PHY handling for MIPI-CSI, MIPI-DSIM, USB, SATA.. devices, without issues
on a common kernel binary for multiple boards.


The patch series contains:
[PATCH 1/3] ARM: S5P: Rename MIPI-CSIS header and update Copyright
[PATCH 2/3] ARM: S5PV210: Add clock entries for MIPI DPHY control
[PATCH 3/3] ARM: EXYNOS4: Add clock entries for MIPI DPHY control

Rebased onto kgene-for-next branch at:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 


Regards,
--
Sylwester Nawrocki
Samsung Poland R&D Center

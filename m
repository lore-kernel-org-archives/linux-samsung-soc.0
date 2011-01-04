From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH/RFC 0/3] ARM: S5P: Add a common platform setup code for MIPI
 CSIS/DSIM
Date: Tue, 04 Jan 2011 16:09:21 +0100
Message-ID: <1294153764-25006-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:38600 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751702Ab1ADPJa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Jan 2011 10:09:30 -0500
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LEI008407FSIDA0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 04 Jan 2011 15:09:28 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LEI00M3T7FS24@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 04 Jan 2011 15:09:28 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com, inki.dae@samsung.com

Hello,

the following patch series adds the common platform code for configuration 
of the MIPI CSIS and MIPI DSIM PHYs on S5PV210 and S5PV310 SoCs.
The spinlock is used to avoid races while the common PHY control register
is accessed from within MIPI DSIM and MIPI CSIS drivers.
The common PHY enable bit is cleared only when both CSIS and DSIM devices
are not in use.


The patch series contains:

[PATCH/RFC 1/3] ARM: S5P: Add a platform callback for MIPI CSIS PHY control
[PATCH/RFC 2/3] ARM: S5PV310: Add a platform helper for MIPI DSIM/CSIS setup
[PATCH/RFC 3/3] ARM: S5PV210: Add a platform helper for MIPI DSIM/CSIS setup

Rebased onto kgene-for-next branch at:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 


Regards,
Sylwester


--
Sylwester Nawrocki
Samsung Poland R&D Center

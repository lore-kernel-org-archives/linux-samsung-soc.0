From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH/RFC] ARM: S5P: Add platform helpers for camera GPIO
	configuration
Date: Fri, 11 Feb 2011 19:07:44 +0100
Message-ID: <1297447665-19492-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:12603 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752200Ab1BKSHx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Feb 2011 13:07:53 -0500
Received: from eu_spt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LGG00LORT13KU70@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Feb 2011 18:07:51 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LGG000TCT12YD@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Feb 2011 18:07:51 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com

Hello,

the following patch introduces platform helpers for the peripheral 
parallel camera bus configuration in S5PV210 and S5PV310 SoCs.
In those SoCs multiple camera host interface IP's are available and
can be attached to any of two ITU-R parrallel bus for external sensor.
That's why I didn't try to pass any platform device as a pointer to those
helpers. This is an initial proposal and any comments are appreciated.


[PATCH] ARM: S5P: Add platform helpers for camera GPIO configuration

Created against for-next branch at:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 


Regards,
--
Sylwester Nawrocki
Samsung Poland R&D Center

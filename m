From: Anand Kumar N <anand.kn@samsung.com>
Subject: [PATCH 0/4] s3c-fb: Add support S5PV310 FIMD
Date: Fri, 10 Jun 2011 13:45:19 +0530
Message-ID: <1307693723-14971-1-git-send-email-anand.kn@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:56995 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754382Ab1FJIQS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jun 2011 04:16:18 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LMK003ZUEWY1CQ0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jun 2011 17:16:14 +0900 (KST)
Received: from anand-ubuntu.sisodomain.com (unknown [107.108.215.66])
 by mmp1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTPA id <0LMK009OSEYVA360@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jun 2011 17:16:14 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: lethal@linux-sh.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, jg1.han@samsung.com, jonghun.han@samsung.com, thomas.ab@samsung.com, anand.kn@samsung.com

This patch series is based on the latest
git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git for-next

This was originally submitted by Jonghun Han <jonghun.han@samsung.com>
http://www.spinics.net/lists/arm-kernel/msg101781.html
This patchset has been not picked up in the mainline due to the unavailibility
of cldev lookup. So it is being re-submitted rebased to 3.0.0-rc1 and tested 
over the clkdev patches.

This patch adds support FIMD(Fully Interactive Mobile Display) on S5PV310.
The 3rd patch is update s3c-fb for it and others are for platform data.

o To Kukjin Kim
[RE-SEND][PATCH 1/4] ARM: S5PV310: Add FIMD resource definition
[RE-SEND][PATCH 2/4] ARM: S5PV310: Add platform device and helper functions for FIMD
[RE-SEND][PATCH 4/4] ARM: S5PV310: Add platform data for S5PV310 FIMD and LTE480WV platform-lcd

o To Paul Mundt
[RE-SEND][PATCH 3/4] s3c-fb: Add support S5PV310 FIMD

Best Regards,
Anand Kumar N

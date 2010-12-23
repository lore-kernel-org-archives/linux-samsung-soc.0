From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/7] ARM: S5PV310: Add support CPUFREQ driver
Date: Thu, 23 Dec 2010 14:49:50 +0900
Message-ID: <1293083397-15969-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:56527 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751076Ab0LWGHt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Dec 2010 01:07:49 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patch adds support CPUFREQ for S5PV310(S5PC210) SoC.

Following 1st, 3rd, 4th, and 7th patches have been submitted several month ago
and already has been merged in my tree at that time, but I dropped because of
dependency of ARM localtimer and APLL.

Now, submitted MCT(Multi-Core Timer) which can prevent its problem and also other
localtimer patch for avoding same problem. Anyway so, I think, this can support
CPUFREQ of S5PV310(S5PC210).

Basically, I re-based old CPUFREQ driver and recent new CPUFREQ patch which has
been submitted by Mr. Kim, Sangbeom.

[PATCH 1/7] ARM: S5PV310: Update CMU registers for CPUFREQ
[PATCH V3 2/7] ARM: S5PV310: Define missing CMU register for CPUFREQ
[PATCH 3/7] ARM: S5PV310: Add DMC registers and map_desc
[PATCH 4/7] ARM: S5PV310: Add support CPUFREQ
[PATCH V3 5/7] ARM: S5PV310: Update CPUFREQ
[PATCH V3 6/7] ARM: S5PV310: Add FOUT APLL get rate function
[PATCH 7/7] ARM: S5PV310: Update Kconfig and Makefile for supporting CPUFREQ

Merry Christmas :-)
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

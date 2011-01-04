From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH V2 0/3] ARM: S5PV310: Add support Multi-Core Timer
Date: Tue,  4 Jan 2011 14:45:23 +0900
Message-ID: <1294119926-23189-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:39972 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750926Ab1ADGKa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Jan 2011 01:10:30 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

This patch adds support MCT, Multi-Core Timer for S5PV310 and S5PC210
and SYSTIMER IO address mapping and global timer interrupt definitinon.

Changes since v1:
- Addressed comments from Russell King
- Fixed small things

[PATCH 1/3] ARM: S5PV310: Add SYSTIMER IO Address mapping for MCT
[PATCH 2/3] ARM: S5PV310: Add irq definition for kernel global timer
[PATCH 3/3] ARM: S5PV310: Implement kernel timers using MCT

From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/3] rtc: rtc-s3c: Fix and Update s3c_rtc_setaie()
Date: Tue, 16 Nov 2010 09:02:51 +0900
Message-ID: <1289865774-31073-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:33024 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752906Ab0KPAOg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Nov 2010 19:14:36 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com
Cc: ben-linux@fluff.org, p_gortmaker@yahoo.com, a.zummo@towertech.it

This patch includes fixing s3c_rtc_setaie() function for Samsung SoCs.

[PATCH 1/3] rtc: rtc-s3c: Fix return type and argument of s3c_rtc_setaie
[PATCH 2/3] rtc: rtc-s3c: Add spin_lock_irq in s3c_rtc_setaie
[PATCH 3/3] rtc: rtc-s3c: Change set alarm interrupt method in s3c_rtc_setaie

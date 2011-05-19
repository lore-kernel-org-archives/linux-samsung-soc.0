From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH 0/2] serial: samsung: Remove redundant console initcalls
Date: Fri, 20 May 2011 02:20:00 +0530
Message-ID: <1305838202-1256-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:9985 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934077Ab1ESUm5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 May 2011 16:42:57 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LLG00J58MV0JYC0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 May 2011 05:42:55 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LLG00DHXMVF6Z@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 May 2011 05:42:55 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

The explicit console_initcall in Samsung's serial drivers leads to calls
to clk_get before the platform_device is registered. This is problematic
when adding support for clkdev and device tree. So the explicit calls
to console_initcall can be removed and let the driver's probe function
handle the console registration.

Thomas Abraham (2):
  serial: samsung: Fix unintended usage of uart port 0 as console
  serial: Remove redundant console_initcall from s3c and s5p console
    drivers

 drivers/tty/serial/s3c2400.c |    2 --
 drivers/tty/serial/s3c2410.c |    2 --
 drivers/tty/serial/s3c2412.c |    2 --
 drivers/tty/serial/s3c2440.c |    2 --
 drivers/tty/serial/s3c24a0.c |    2 --
 drivers/tty/serial/s3c6400.c |    2 --
 drivers/tty/serial/s5pv210.c |    7 -------
 drivers/tty/serial/samsung.c |    9 ++++-----
 drivers/tty/serial/samsung.h |   19 -------------------
 9 files changed, 4 insertions(+), 43 deletions(-)

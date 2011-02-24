From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 0/7] s5p-fimc driver fixes for 2.6.39
Date: Thu, 24 Feb 2011 15:33:47 +0100
Message-ID: <1298558034-10768-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:22005 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754769Ab1BXOjc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Feb 2011 09:39:32 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, s.nawrocki@samsung.com

Hello,

the following are a few bugfixes for s5p-fimc driver.
These patches correct fimc output DMA handling and locking in m2m driver,
so there is no issues in m2m multi-instance operation.
One of the patches adds missing g_fmt ioctl conversion to multiplanar API.

The patch series contains:

[PATCH 1/7] s5p-fimc: fix ISR and buffer handling for fimc-capture
[PATCH 2/7] s5p-fimc: Prevent oops when i2c adapter is not available
[PATCH 3/7] s5p-fimc: Prevent hanging on device close and fix the locking
[PATCH 4/7] s5p-fimc: Allow defining number of sensors at runtime
[PATCH 5/7] s5p-fimc: Add a platform data entry for MIPI-CSI data alignment
[PATCH 6/7] s5p-fimc: Use dynamic debug
[PATCH 7/7] s5p-fimc: Fix G_FMT ioctl handler


Regards,
--
Sylwester Nawrocki
Samsung Poland R&D Center

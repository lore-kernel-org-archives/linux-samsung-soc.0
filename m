From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 0/2(7)] s5p fimc driver fixes
Date: Wed, 09 Mar 2011 17:23:23 +0100
Message-ID: <1299687805-23525-1-git-send-email-s.nawrocki@samsung.com>
References: <1298558034-10768-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:35922 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753970Ab1CIQXl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Mar 2011 11:23:41 -0500
In-reply-to: <1298558034-10768-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com

Hello,

this is basically a resend of my previous s5p fimc driver bugfix change set
including altered 2 out of 7. It's a result of my further struggle with
the DMA engine and also a correction of the G_FMT ioctl function to return
proper bytesperline/sizeimage for all supported formats.

[PATCH 1/7] s5p-fimc: fix ISR and buffer handling for fimc-capture
[PATCH 7/7] s5p-fimc: Fix G_FMT ioctl handler

Following is the previous original change set summary.

---

the following are a few bugfixes for s5p-fimc driver.
These patches correct fimc output DMA handling and locking in m2m
driver so there is no issues in m2m multi-instance operation.
One of the patches adds missing g_fmt ioctl conversion to multiplanar
formats.

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

From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 0/6] s5p-fimc driver fixes for 2.6.37
Date: Thu, 25 Nov 2010 16:05:06 +0100
Message-ID: <1290697512-30563-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:58918 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752478Ab0KYPFT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Nov 2010 10:05:19 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, s.nawrocki@samsung.com

Hello,

the following are a few bugfix patches for s5p-fimc driver.
Two of them are related to recent BKL removal efforts and others 
are minor fixes for V4L2 API conformance and correct handling of
different IP revisions.

The patch series contains:

[PATCH 1/6] [media] s5p-fimc: BKL lock removal - compilation fix
[PATCH 2/6] [media] s5p-fimc: Fix vidioc_g_crop/cropcap on camera sensor
[PATCH 3/6] [media] s5p-fimc: Explicitly add required header file
[PATCH 4/6] [media] s5p-fimc: Convert m2m driver to unlocked_ioctl
[PATCH 5/6] [media] s5p-fimc: Use correct fourcc code for 32-bit RGB format
[PATCH 6/6] [media] s5p-fimc: Fix output DMA handling in S5PV310 IP revisions

It has been rebased onto linuxtv/staging-2.6.37-rc1 branch at
git://linuxtv.org/media_tree.git.

Thanks,
Sylwester

--
Sylwester Nawrocki
Linux Platform Group
Samsung Poland R&D Center

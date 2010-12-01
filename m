From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [RFC 0/4] Porting s5p-fimc m2m/capture driver to videobuf2
Date: Wed, 01 Dec 2010 15:35:49 +0100
Message-ID: <1291214153-6335-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:58013 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754969Ab0LAOgO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Dec 2010 09:36:14 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com

Hello,

The following patches are example of porting real v4l2 mem2mem and capture
driver onto new videobuf 2.
The first patch converts v4l2-mem2mem framework.
Patch 2/4 converts s5p-fimc, both m2m and camera capture interface drivers.
Except that it creates separate videobuf queue operation callback set for
the m2m and capture video nodes.
The third patch is na example of using in the driver the multiplane formats
extension, which was posted by Pawel Osciak some time ago.
The details of the multiplanar extension can be found here:
https://patchwork.kernel.org/project/linux-media/list/?=osciak&submitter=4290&state=*&q=v6&archive=both

The driver implements only *_mplane ioctl handlers so in case of
standard non-multiplane V4L2 application the buffers are converted on
the fly in v4l2 ioctl handling code.

The last patch just cleans up the driver by removing all locking from 
ioctl and file operation handlers and using v4l core lock.


The patch series contains:

[PATCH 1/4] v4l: mem2mem: port to videobuf2
[PATCH 2/4] [media] s5p-fimc: Porting to videobuf 2
[PATCH 3/4] [media] s5p-fimc: Conversion to multiplanar formats
[PATCH 4/4] [media] s5p-fimc: Use v4l core mutex in ioctl and file operations


Full source tree containing the above patches as well as videobuf2, multiplane 
extensions, CMA allocator and S5P MFC (video codec) driver will be available 
within few hours at:
http://git.infradead.org/users/kmpark/linux-2.6-samsung/shortlog/refs/heads/vb2-mfc-fimc
The tree is based on 2.6.37-rc4.


This is rather an initial version of vb2 and the drivers using it and 
we are expecting further (minor) changes in vb2. 
Nevertheless any comments at that point would be greatly appreciated.

Thanks,
Sylwester


--
Sylwester Nawrocki
Linux Platform Group
Samsung Poland R&D Center

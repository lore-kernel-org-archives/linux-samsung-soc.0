From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [RFC 0/4] drm: add generic KMS blob properties for image enhancement
Date: Thu, 06 Mar 2014 13:32:49 +0530
Message-ID: <1394092973-13423-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:34318 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751105AbaCFIEL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Mar 2014 03:04:11 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N20000AF92WSGC0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Mar 2014 17:04:08 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, inki.dae@samsung.com, prashanth.g@samsung.com, seanpaul@chromium.org, marcheu@chromium.org, joshi@samsung.com, linux-samsung-soc@vger.kernel.org, r.sh.open@gmail.com, ajaykumar.rs@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Patch set has following proposal.

1) Add writable KMS blob properties
	patch 1: drm: allow to create blank writable blob properties
	patch 2: drm: add ioctl to write into binary blob KMS properties

2) Add generic image enhancement properties. Added as per exynos hardware
	requirements (to start).
	patch 3: drm: add generic blob properties for image enhancement

3) Allow drivers to create writable blob properties
	patch 4: drm: export create and destroy function for blob properties

Initial discussion before preparing this RFC is at
http://comments.gmane.org/gmane.linux.kernel.samsung-soc/27278

This series is based on Dave's drm-next branch at
http://cgit.freedesktop.org/~airlied/linux/

Rahul Sharma (4):
  drm: allow to create blank writable blob properties
  drm: add ioctl to write into binary blob KMS properties
  drm: add generic blob properties for image enhancement
  drm: export create and destroy function for blob properties

 drivers/gpu/drm/drm_crtc.c  |  201 +++++++++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/drm_drv.c   |    1 +
 include/drm/drm_crtc.h      |   19 ++++
 include/uapi/drm/drm.h      |    1 +
 include/uapi/drm/drm_mode.h |   49 +++++++++++
 5 files changed, 265 insertions(+), 6 deletions(-)

-- 
1.7.9.5

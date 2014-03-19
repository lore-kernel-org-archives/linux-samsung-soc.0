From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [RFC 0/4] drm: exynos: Add drivers for MDNIE and IELCD
Date: Wed, 19 Mar 2014 19:52:51 +0530
Message-ID: <1395238975-24600-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:64744 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965253AbaCSOWi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Mar 2014 10:22:38 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N2O005U3T9OY070@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Mar 2014 23:22:36 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, sw0312.kim@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, marcheu@chromium.org, Ajay Kumar <ajaykumar.rs@samsung.com>

This series is based on exynos-drm-next-todo branch of Inki Dae's tree at:
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git

On Exynos SOC, FIMD supports various post processors
like MIE, MDNIE and IELCD for image enhancement purposes.
This patchset adds an infrastructure in exynos FIMD to support such
post procerssors and also adds support routines for MDNIE, and IELCD.

(1) For basic display output,
	-- MDNIE and IELCD should have same video timings as FIMD (mode_set)
	-- strict power_up/down sequence need to be followed between FIMD,
	   MDNIE, and IELCD (power_on, power_off)

(2) For enhanced display output,
	-- MDNIE needs image enhancement data from userspace
	   (set_property and set_gamma)

Rahul Sharma's patchset at:
http://comments.gmane.org/gmane.linux.kernel.samsung-soc/27642
The above patchset is needed to support the enhanced display output.

MDNIE and IELCD DT nodes are given as phandles to FIMD DT node.
SOC specific information like base address, clocks and other
configuration information are extracted via FIMD DT node.

Ajay Kumar, Shirish, Rahul Sharma (4):
  drm: exynos: Add infrastructure to support FIMD post processors
  drm: exynos: add MDNIE post processor
  drm: exynos: add IELCD post processor
  drm: exynos: add MDNIE and IELCD to FIMD pp list

 drivers/gpu/drm/exynos/Makefile            |   3 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 179 ++++++++
 drivers/gpu/drm/exynos/exynos_fimd_pp.h    |  54 +++
 drivers/gpu/drm/exynos/exynos_ielcd.c      | 295 ++++++++++++
 drivers/gpu/drm/exynos/exynos_mdnie.c      | 707 +++++++++++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_mdnie_regs.h | 154 +++++++
 include/video/samsung_fimd.h               |  49 +-
 7 files changed, 1439 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/exynos/exynos_fimd_pp.h
 create mode 100644 drivers/gpu/drm/exynos/exynos_ielcd.c
 create mode 100644 drivers/gpu/drm/exynos/exynos_mdnie.c
 create mode 100644 drivers/gpu/drm/exynos/exynos_mdnie_regs.h

-- 
1.8.1.2

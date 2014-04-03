From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 0/7] drm/exynos: fixes for hdmi related issues
Date: Thu, 03 Apr 2014 20:40:57 +0530
Message-ID: <1396537864-29291-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:10241 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752258AbaDCPML (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Apr 2014 11:12:11 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N3G00GIZNK95JC0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Apr 2014 00:12:09 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, r.sh.open@gmail.com, joshi@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Series is addressing various issues in the drm hdmi driver
for exynos Soc.

Based on Inki Dae's exynos-drm-next branch.

Daniel Kurtz (1):
  drm/exynos: hdmi: remove unnecessary memset

Paul Taysom (1):
  drm/exynos: check for null pointers in error handling

Rahul Sharma (1):
  drm/exynos: replace hdmi reset with hdmi disable

Sean Paul (3):
  drm/exynos: Don't reset hdmiphy on hdmi off
  drm/exynos: Debounce HDMI hotplug interrupts
  drm/exynos: Read hpd gpio in is_connected callback

Shirish S (1):
  drm/exynos: add hdmiphy power on/off sequence

 drivers/gpu/drm/exynos/exynos_hdmi.c |  115 ++++++++++++++++++++++------------
 drivers/gpu/drm/exynos/regs-hdmi.h   |    7 ++-
 2 files changed, 81 insertions(+), 41 deletions(-)

-- 
1.7.9.5

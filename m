From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [RFC V3 0/3] drm/bridge: panel and chaining
Date: Fri, 09 May 2014 20:22:59 +0530
Message-ID: <1399647182-20951-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:29430 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751270AbaEIOyT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 May 2014 10:54:19 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5B00BWLAQI7E10@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 May 2014 23:54:18 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: robdclark@gmail.com, seanpaul@chromium.org, a.hajda@samsung.com, inki.dae@samsung.com, daniel.vetter@ffwll.ch, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

This patchset is based on exynos-drm-next-todo branch of Inki Dae's tree at:
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git

Inital discussion can be found at:
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg30008.html

As Rob suggested, I have added few static-inline helpers for bridge chaining,
and as Sean suggested, I have moved the bridge chain creation to
encoder implementation(exynos_dp).

Ajay Kumar (3):
  [RFC V3 1/3] drm/bridge: add helper functions to support bridge chain
  [RFC V3 2/3] drm/bridge: add a dummy panel driver to support lvds bridges
  [RFC V3 3/3] drm: create and demonstrate bridge chaining using exynos_dp

 .../bindings/drm/bridge/bridge_panel.txt           |   45 ++++
 drivers/gpu/drm/bridge/Kconfig                     |    6 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/bridge_panel.c              |  217 ++++++++++++++++++++
 drivers/gpu/drm/bridge/ptn3460.c                   |   60 ++++--
 drivers/gpu/drm/exynos/exynos_dp_core.c            |   25 ++-
 include/drm/bridge/bridge_panel.h                  |   40 ++++
 include/drm/bridge/ptn3460.h                       |   15 +-
 include/drm/drm_crtc.h                             |   72 +++++++
 9 files changed, 453 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/drm/bridge/bridge_panel.txt
 create mode 100644 drivers/gpu/drm/bridge/bridge_panel.c
 create mode 100644 include/drm/bridge/bridge_panel.h

-- 
1.7.9.5

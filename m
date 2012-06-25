From: Subash Patel <subashrp@gmail.com>
Subject: [PATCH 0/2] Add return value checks in the drm-dmabuf
Date: Mon, 25 Jun 2012 11:22:55 -0700
Message-ID: <1340648577-28402-1-git-send-email-subash.ramaswamy@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:60715 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753449Ab2FYSXm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jun 2012 14:23:42 -0400
Received: by pbbrp8 with SMTP id rp8so6898621pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Jun 2012 11:23:42 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: olofj@chromium.org, inki.dae@samsung.com, airlied@redhat.com, Subash Patel <subash.rp@samsung.com>

From: Subash Patel <subash.rp@samsung.com>

This patch series is split and re-send of my original patch, after request
from Inki Dae.

Below two patches add the required error checks in drm dmabuf when the
system fails to allocate pages for the scatter-gather. This is very rare
situation, and occurs when the system is under memory pressure.

Scatter-gather asks for memory using sg_kmalloc() and this can return no
memory. Without below return value checks, the code will crash the system
due to invalid pointer access.

Subash Patel (2):
  DRM: Exynos: return NULL if exynos_pages_to_sg fails
  DRM: Exynos: check for null in return value of
    dma_buf_map_attachment()

 drivers/gpu/drm/exynos/exynos_drm_dmabuf.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
1.7.9.5

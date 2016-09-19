From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [RFC 0/2] drm/exynos: mixer: small optimisations
Date: Mon, 19 Sep 2016 15:53:01 +0200
Message-ID: <1474293183-9918-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:39263 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1756640AbcISNxO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Sep 2016 09:53:14 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Hello,

I had these two patches in my private tree for some time. Might as well ask if there is any interested in merging these.

The first is just some unification on how booleans are used in the mixer code. The second one reduces register manipulation by moving stuff to the atomic flush call. I think one could even move more code there, like e.g. mixer_cfg_scan() and mixer_cfg_rgb_fmt().

Anyway, feedback is appreciated a lot!

With best wishes,
Tobias

Tobias Jakobi (2):
  drm/exynos: mixer: convert booleans to flags in mixer context
  drm/exynos: mixer: configure layers once in mixer_atomic_flush()

 drivers/gpu/drm/exynos/exynos_mixer.c | 156 +++++++++++++++++++++-------------
 drivers/gpu/drm/exynos/regs-mixer.h   |   2 +
 2 files changed, 97 insertions(+), 61 deletions(-)

-- 
2.7.3

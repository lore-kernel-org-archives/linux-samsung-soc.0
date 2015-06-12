From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 0/9] drm/exynos: cleanups and small fixes for libdrm
Date: Fri, 12 Jun 2015 20:15:05 +0200
Message-ID: <1434132914-3150-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:50865 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754552AbbFLSPM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Jun 2015 14:15:12 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Hello,

I've split off the Exynos specific bits, so this is just some cleanups and small fixes. Everything can be reviewed without knowledge about the Exynos platform. My hope is that I can get at least some of the patches from my last series upstream.

With best wishes,
Tobias

Changes in v2:
- Made it clear that the error handling is currently 'unsatisfactory', but that this is going to be adressed in a later patch.
- Point out that removed code also wasn't used anywhere in the past (by inspection of git history).

Tobias Jakobi (9):
  exynos: fimg2d: fix return codes
  tests/exynos: replace return by break
  exynos/fimg2d: simplify g2d_fini()
  tests/exynos: clean struct connector
  tests/exynos: remove unused define
  tests/exynos: remove struct fimg2d_test_case
  tests/exynos: simplify drm_set_crtc
  tests/exynos: remove connector_find_plane
  tests/exynos: handle G2D_IMGBUF_COLOR in switch statements

 exynos/exynos_fimg2d.c            |  23 ++------
 tests/exynos/exynos_fimg2d_test.c | 112 +++++++-------------------------------
 2 files changed, 26 insertions(+), 109 deletions(-)

-- 
2.0.5

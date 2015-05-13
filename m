From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v4 0/9] drm/exynos: add async G2D execution to libdrm
Date: Wed, 13 May 2015 19:34:44 +0200
Message-ID: <1431538493-11431-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:55308 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S933842AbbEMRe6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 May 2015 13:34:58 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Hello,

this series exposes async execution of G2D command buffers to userspace. Also includes is a small performance analysis test, which can also be used to stress test the engine. The async operation is of course also tested.

Please review and let me know what I can improve.

v3: Rewrote handling of vendor-specific events. The series is now based on [1]. Also added two small fixes (error handling, break statement).

v4: Minor modification to the vendor-event handling code (drop opaque ptr). Series is based on this version [2] of the patch. Another two small fixes (buffer pixelformat, g2d_fini) added. The pixelformat issue surfaced after the recent changes to the Exynos mixer code. Also fixed a thread bug in the event test (application should always exit properly now).


With best wishes,
Tobias

[1] https://patchwork.kernel.org/patch/6262541/
[2] https://patchwork.kernel.org/patch/6391301/

Tobias Jakobi (9):
  exynos: Introduce exynos_handle_event()
  tests/exynos: add fimg2d performance analysis
  exynos/fimg2d: add g2d_config_event
  exynos: fimg2d: add g2d_exec2
  tests/exynos: add fimg2d event test
  exynos: fimg2d: fix return codes
  tests/exynos: replace return by break
  tests/exynos: use XRGB8888 for framebuffer
  exynos/fimg2d: simplify g2d_fini()

 exynos/exynos-symbol-check         |   3 +
 exynos/exynos_drm.c                |  28 ++++
 exynos/exynos_drm.h                |  12 ++
 exynos/exynos_drmif.h              |  26 +++
 exynos/exynos_fimg2d.c             |  65 +++++---
 exynos/exynos_fimg2d.h             |   8 +
 tests/exynos/Makefile.am           |  26 ++-
 tests/exynos/exynos_fimg2d_event.c | 326 +++++++++++++++++++++++++++++++++++++
 tests/exynos/exynos_fimg2d_perf.c  | 320 ++++++++++++++++++++++++++++++++++++
 tests/exynos/exynos_fimg2d_test.c  |   4 +-
 10 files changed, 793 insertions(+), 25 deletions(-)
 create mode 100644 tests/exynos/exynos_fimg2d_event.c
 create mode 100644 tests/exynos/exynos_fimg2d_perf.c

-- 
2.0.5

From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 0/9] drm/exynos: rewrite fimg2d error handling
Date: Tue,  8 Sep 2015 17:22:25 +0200
Message-ID: <1441725754-27555-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:34607 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755025AbbIHPWv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Sep 2015 11:22:51 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Hello,

during the discussion about the last patchset touching the
fimg2d code, it became apparent that the error handling for
the command submission is currently unsatisfactory.

This series rewrites the handling. All functions that submit
command buffers now first check if enough space is available
and only then proceed to build the command buffers.

In particular the command buffer is no longer left in a
half-finished state, since parameters passed to the functions
are now validated before command submission. For this some
validation functions are introduced.

This should also increase performance if the bottleneck is
the submission part, since adding commands to the buffer
is now more lightweight.

Last but not least some prefix was added to messages printed
by fprintf and printf, and the G2D context struct was moved
out of the public header.


Please review and let me know if I can improve anything!

With best wishes,
Tobias


Changes since v1:
- squashed some of the patches together (suggested by Inki)
- changed return value of validate functions (suggested by Inki)
- added some more explanatory comments (suggested by Emil)


Tobias Jakobi (9):
  exynos/fimg2d: fix empty buffer handling in g2d_flush()
  exynos/fimg2d: simplify base address submission in
    g2d_scale_and_blend()
  exynos/fimg2d: add g2d_check_space()
  exynos/fimg2d: add g2d_validate_xyz() functions
  exynos/fimg2d: remove default case from g2d_get_blend_op()
  exynos/fimg2d: remove superfluous initialization of g2d_point_val
  exynos/fimg2d: make g2d_add_cmd() less heavy
  exynos/fimg2d: add message prefix
  exynos/fimg2d: remove g2d_context from public header

 exynos/exynos_fimg2d.c | 376 ++++++++++++++++++++++++++++++-------------------
 exynos/exynos_fimg2d.h |  14 +-
 2 files changed, 231 insertions(+), 159 deletions(-)

-- 
2.0.5

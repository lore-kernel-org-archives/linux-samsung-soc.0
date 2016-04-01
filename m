From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: [PATCH v5 1/5] drm: add generic zpos property
Date: Fri, 1 Apr 2016 14:48:02 +0200
Message-ID: <CA+M3ks4cg3T_q9Ug1_Uc4yrZKsK97rK+QA0FijDUnUKCMkpcAg@mail.gmail.com>
References: <1453905883-6807-1-git-send-email-m.szyprowski@samsung.com>
	<1453905883-6807-2-git-send-email-m.szyprowski@samsung.com>
	<20160229151219.GW15993@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:33715 "EHLO
	mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752102AbcDAMsF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Apr 2016 08:48:05 -0400
Received: by mail-lf0-f46.google.com with SMTP id p188so53769052lfd.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Apr 2016 05:48:03 -0700 (PDT)
In-Reply-To: <20160229151219.GW15993@intel.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Vincent Abriou <vincent.abriou@st.com>, Fabien Dessenne <fabien.dessenne@st.com>

This patch adds support for generic plane's zpos property property with
well-defined semantics:
- added zpos properties to plane and plane state structures
- added helpers for normalizing zpos properties of given set of planes
- well defined semantics: planes are sorted by zpos values and then plane
  id value if zpos equals

Normalized zpos values are calculated automatically when generic
muttable zpos property has been initialized. Drivers can simply use
plane_state->normalized_zpos in their atomic_check and/or plane_update
callbacks without any additional calls to DRM core.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Compare to Marek's original patch zpos property is now specific to each
plane and no more to the core.
Normalize function take care of the range of per plane defined range
before set normalized_zpos.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
---
 Documentation/DocBook/gpu.tmpl      |  10 ++
 drivers/gpu/drm/Makefile            |   2 +-
 drivers/gpu/drm/drm_atomic_helper.c |   6 +
 drivers/gpu/drm/drm_blend.c         | 283 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_crtc_internal.h |   3 +
 include/drm/drm_crtc.h              |  25 ++++
 6 files changed, 328 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/drm_blend.c

diff --git a/Documentation/DocBook/gpu.tmpl b/Documentation/DocBook/gpu.tmpl
index 1692c4d..b7a5161 100644
--- a/Documentation/DocBook/gpu.tmpl
+++ b/Documentation/DocBook/gpu.tmpl
@@ -2147,6 +2147,16 @@ void intel_crt_init(struct drm_device *dev)
  the underlying hardware).</td>
  </tr>
  <tr>
+ <td valign="top" > "zpos" </td>
+ <td valign="top" >RANGE</td>
+ <td valign="top" >Min= driver dependent, Max= driver dependent</td>
+ <td valign="top" >Plane</td>
+ <td valign="top" >Plane's 'z' position during blending operation (0
for background, highest for frontmost).
+ If two planes assigned to same CRTC have equal zpos values, the
plane with higher plane
+ id is treated as closer to front. Can be IMMUTABLE if driver doesn't
support changing
+ planes' order. Exact value range is driver dependent.</td>
+ </tr>
+ <tr>
  <td rowspan="20" valign="top" >i915</td>
  <td rowspan="2" valign="top" >Generic</td>
  <td valign="top" >"Broadcast RGB"</td>
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 6eb94fc..18dc563 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -2,7 +2,7 @@
 # Makefile for the drm device driver.  This driver provides support for the

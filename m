From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v7 1/4] drm: add generic zpos property
Date: Thu, 28 Jul 2016 13:55:02 +0100
Message-ID: <CACvgo52ksB-42B55gr4u7buFi2J=pDi=-VjUQad91F=ohebdqw@mail.gmail.com>
References: <1469693270-24814-1-git-send-email-benjamin.gaignard@linaro.org> <1469693270-24814-2-git-send-email-benjamin.gaignard@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35383 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757578AbcG1MzE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Jul 2016 08:55:04 -0400
Received: by mail-wm0-f66.google.com with SMTP id i5so11025791wmg.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Jul 2016 05:55:03 -0700 (PDT)
In-Reply-To: <1469693270-24814-2-git-send-email-benjamin.gaignard@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>, Vincent Abriou <vincent.abriou@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, linaro-mm-sig@lists.linaro.org, Andrzej Hajda <a.hajda@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Hi Benjamin,

Just spotted a couple of small bits which, imho, should be fine with
squashing with follow up patch(es).

On 28 July 2016 at 09:07, Benjamin Gaignard
<benjamin.gaignard@linaro.org> wrote:

> +EXPORT_SYMBOL(drm_atomic_helper_normalize_zpos);
The symbols is internal only thus the EXPORT_SYMBOL notation isn't needed.
Rule of thumb - interfaces used by other modules are declared in
include/drm and the symbol(s) should be annotated with EXPORT_SYMBOL*

> +
> +int drm_plane_atomic_set_zpos_property(struct drm_plane *plane,
> +                                      struct drm_plane_state *state,
> +                                      struct drm_property *property,
> +                                      uint64_t val);
> +
> +int drm_plane_atomic_get_zpos_property(struct drm_plane *plane,
> +                                      const struct drm_plane_state *state,
> +                                      struct drm_property *property,
> +                                      uint64_t *val);
> +
Dead code/declarations ?

Cheers,
Emil

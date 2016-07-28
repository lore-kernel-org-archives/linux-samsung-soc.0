From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: [PATCH v7 1/4] drm: add generic zpos property
Date: Thu, 28 Jul 2016 17:21:23 +0200
Message-ID: <CA+M3ks6m0ekMUvCs4QbpYTXPyK3hw7oT4_5gms3qw+RryLRdCg@mail.gmail.com>
References: <1469693270-24814-1-git-send-email-benjamin.gaignard@linaro.org>
 <1469693270-24814-2-git-send-email-benjamin.gaignard@linaro.org> <CACvgo52ksB-42B55gr4u7buFi2J=pDi=-VjUQad91F=ohebdqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:34826 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932189AbcG1PVY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Jul 2016 11:21:24 -0400
Received: by mail-oi0-f49.google.com with SMTP id l72so67634310oig.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Jul 2016 08:21:24 -0700 (PDT)
In-Reply-To: <CACvgo52ksB-42B55gr4u7buFi2J=pDi=-VjUQad91F=ohebdqw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>, Vincent Abriou <vincent.abriou@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Linaro MM SIG Mailman List <linaro-mm-sig@lists.linaro.org>, Andrzej Hajda <a.hajda@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Marek Szyprowski <m.szyprowski@samsung.com>

2016-07-28 14:55 GMT+02:00 Emil Velikov <emil.l.velikov@gmail.com>:
> Hi Benjamin,
>
> Just spotted a couple of small bits which, imho, should be fine with
> squashing with follow up patch(es).
>
> On 28 July 2016 at 09:07, Benjamin Gaignard
> <benjamin.gaignard@linaro.org> wrote:
>
>> +EXPORT_SYMBOL(drm_atomic_helper_normalize_zpos);
> The symbols is internal only thus the EXPORT_SYMBOL notation isn't ne=
eded.
> Rule of thumb - interfaces used by other modules are declared in
> include/drm and the symbol(s) should be annotated with EXPORT_SYMBOL*
>
drm_blend.c is linked into drm.o while
drm_atomic_helper_normalize_zpos is used in
drm_atomic_helper.c linked within drm_kms_helper.o
so EXPORT_SYMBOL is need either I got linked error while compiling drm
as a module

>> +
>> +int drm_plane_atomic_set_zpos_property(struct drm_plane *plane,
>> +                                      struct drm_plane_state *state=
,
>> +                                      struct drm_property *property=
,
>> +                                      uint64_t val);
>> +
>> +int drm_plane_atomic_get_zpos_property(struct drm_plane *plane,
>> +                                      const struct drm_plane_state =
*state,
>> +                                      struct drm_property *property=
,
>> +                                      uint64_t *val);
>> +
> Dead code/declarations ?
>

yes dead code, I will remove it.

> Cheers,
> Emil

Thanks,
Benjamin

--=20
Benjamin Gaignard

Graphic Study Group

Linaro.org =E2=94=82 Open source software for ARM SoCs

=46ollow Linaro: Facebook | Twitter | Blog

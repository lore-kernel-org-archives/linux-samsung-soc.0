From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: [PATCH v5 0/4] Generic zpos property
Date: Tue, 12 Jul 2016 16:47:15 +0200
Message-ID: <CA+M3ks6JkY9JyFWcmdF3j63X=vk49PLxjd_p+a5y7Maz-7KSOg@mail.gmail.com>
References: <1467896484-5132-1-git-send-email-benjamin.gaignard@linaro.org>
 <577E609F.3000300@math.uni-bielefeld.de> <CA+M3ks4TQ4ER543rght3XxKY8No4z_n4M9S3V9YNyP0FvPBHoQ@mail.gmail.com>
 <577E7EA4.7010501@math.uni-bielefeld.de> <CA+M3ks789+7uqX8nWHV9-+nZdyvNYWsb0YmxKNyBcO1eyXYJVg@mail.gmail.com>
 <20160712140158.GK23520@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:33398 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752769AbcGLOrR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Jul 2016 10:47:17 -0400
Received: by mail-oi0-f42.google.com with SMTP id j185so19325759oih.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Jul 2016 07:47:16 -0700 (PDT)
In-Reply-To: <20160712140158.GK23520@phenom.ffwll.local>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Vincent Abriou <vincent.abriou@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, linux-samsung-soc@vger.kernel.org, Linaro MM SIG Mailman List <linaro-mm-sig@lists.linaro.org>, Inki Dae <inki.dae@samsung.com>, Ville Syrjala <ville.syrjala@linux.intel.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Gustavo Padovan <gustavo@padovan.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

What is the required tool to edit this .csv file ?

2016-07-12 16:01 GMT+02:00 Daniel Vetter <daniel@ffwll.ch>:
> On Fri, Jul 08, 2016 at 09:06:18AM +0200, Benjamin Gaignard wrote:
>> htmldocs get information directly from the comments in .h and .c fil=
es
>
> You're both correct: There's another table which is supposed to list =
_all_
> properties. It's a bit a mess, and should be split up/cleaned up, but
> that's a longer-term thing. Please add zpos there too.
>
> See Documentation/gpu/kms-properties.csv
>
> Cheers, Daniel
>>
>> 2016-07-07 18:09 GMT+02:00 Tobias Jakobi <tjakobi@math.uni-bielefeld=
=2Ede>:
>> > Benjamin Gaignard wrote:
>> >> zpos new fields are correctly documented in drm-kms.html after ru=
nning
>> >> make htmldocs.
>> > I'm not sure I understand. Where does htmldocs get the information=
 from
>> > then?
>> >
>> > - Tobias
>> >
>> >
>> >> Benjamin
>> >>
>> >> 2016-07-07 16:01 GMT+02:00 Tobias Jakobi <tjakobi@math.uni-bielef=
eld.de>:
>> >>> Hello Benjamin,
>> >>>
>> >>>
>> >>> Benjamin Gaignard wrote:
>> >>>> version 5:
>> >>>> rebased on drm-next where Documentation/DocBook/gpu.tmpl doesn'=
t
>> >>>> exist anymore.
>> >>> I think the documentation has just moved to Documentation/gpu, s=
o the
>> >>> zpos property should be documented there then.
>> >>>
>> >>>
>> >>> With best wishes,
>> >>> Tobias
>> >>>
>> >>>
>> >>>> rework sti patch because some plane functions have changed sinc=
e v4
>> >>>>
>> >>>> version 4:
>> >>>> make sure that normalized zpos value is stay in the defined pro=
perty
>> >>>> range and warn user if not.
>> >>>> Fix NULL pointer bug in rcar-du while setting zpos value.
>> >>>> No changes in the other drivers.
>> >>>>
>> >>>> version 3:
>> >>>> use kmalloc_array instead of kmalloc.
>> >>>> Correct normalize_zpos computation (comeback to Mareck original=
 code)
>> >>>>
>> >>>> version 2:
>> >>>> add a zpos property into drm_plane structure to simplify code.
>> >>>> This allow to get/set zpos value in core and not in drivers cod=
e.
>> >>>> Fix various remarks.
>> >>>>
>> >>>> version 1:
>> >>>> refactor Marek's patches to have per plane zpos property instea=
d of only
>> >>>> one in core.
>> >>>>
>> >>>> Benjamin Gaignard (2):
>> >>>>   drm: sti: use generic zpos for plane
>> >>>>   drm: rcar: use generic code for managing zpos plane property
>> >>>>
>> >>>> Marek Szyprowski (2):
>> >>>>   drm: add generic zpos property
>> >>>>   drm/exynos: use generic code for managing zpos plane property
>> >>>>
>> >>>>  drivers/gpu/drm/Makefile                  |   2 +-
>> >>>>  drivers/gpu/drm/drm_atomic.c              |   4 +
>> >>>>  drivers/gpu/drm/drm_atomic_helper.c       |   6 +
>> >>>>  drivers/gpu/drm/drm_blend.c               | 227 ++++++++++++++=
++++++++++++++++
>> >>>>  drivers/gpu/drm/drm_crtc_internal.h       |   4 +
>> >>>>  drivers/gpu/drm/exynos/exynos_drm_drv.h   |   2 -
>> >>>>  drivers/gpu/drm/exynos/exynos_drm_plane.c |  67 ++-------
>> >>>>  drivers/gpu/drm/exynos/exynos_mixer.c     |   6 +-
>> >>>>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c    |   2 +-
>> >>>>  drivers/gpu/drm/rcar-du/rcar_du_drv.h     |   1 -
>> >>>>  drivers/gpu/drm/rcar-du/rcar_du_kms.c     |   5 -
>> >>>>  drivers/gpu/drm/rcar-du/rcar_du_plane.c   |   9 +-
>> >>>>  drivers/gpu/drm/rcar-du/rcar_du_plane.h   |   2 -
>> >>>>  drivers/gpu/drm/sti/sti_cursor.c          |   4 +-
>> >>>>  drivers/gpu/drm/sti/sti_gdp.c             |   4 +-
>> >>>>  drivers/gpu/drm/sti/sti_hqvdp.c           |   4 +-
>> >>>>  drivers/gpu/drm/sti/sti_mixer.c           |   9 +-
>> >>>>  drivers/gpu/drm/sti/sti_plane.c           |  76 ++++------
>> >>>>  drivers/gpu/drm/sti/sti_plane.h           |   7 +-
>> >>>>  include/drm/drm_crtc.h                    |  30 ++++
>> >>>>  20 files changed, 324 insertions(+), 147 deletions(-)
>> >>>>  create mode 100644 drivers/gpu/drm/drm_blend.c
>> >>>>
>> >>>> Cc: Inki Dae <inki.dae@samsung.com>
>> >>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> >>>> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>> >>>> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
>> >>>> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
>> >>>> Cc: Andrzej Hajda <a.hajda@samsung.com>
>> >>>> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> >>>> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>> >>>> Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>> >>>> Cc: Gustavo Padovan <gustavo@padovan.org>
>> >>>> Cc: vincent.abriou@st.com
>> >>>> Cc: fabien.dessenne@st.com
>> >>>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> >>>>
>> >>>
>> >>
>> >>
>> >>
>> >
>>
>>
>>
>> --
>> Benjamin Gaignard
>>
>> Graphic Working Group
>>
>> Linaro.org =E2=94=82 Open source software for ARM SoCs
>>
>> Follow Linaro: Facebook | Twitter | Blog
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



--=20
Benjamin Gaignard

Graphic Working Group

Linaro.org =E2=94=82 Open source software for ARM SoCs

=46ollow Linaro: Facebook | Twitter | Blog

From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/exynos: use logical AND in exynos_drm_plane_check_size()
Date: Mon, 13 Jun 2016 08:34:36 +0200
Message-ID: <CAKMK7uFuAcyY3s7VN=V8=tARgWqv43J=5aJj9VDkE-EYjniMWg@mail.gmail.com>
References: <1464179407-9004-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <CGME20160610102416epcas1p42e4f3f3de00104a37b7c1e4caf503af9@epcas1p4.samsung.com>
 <575A9291.6020906@math.uni-bielefeld.de> <575E0DA0.3000204@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:36786 "EHLO
	mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964783AbcFMGei convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Jun 2016 02:34:38 -0400
Received: by mail-oi0-f65.google.com with SMTP id d132so23101493oig.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Jun 2016 23:34:38 -0700 (PDT)
In-Reply-To: <575E0DA0.3000204@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On Mon, Jun 13, 2016 at 3:34 AM, Inki Dae <inki.dae@samsung.com> wrote:
> Picked it up.

=46yi it's already in drm-misc too.
-Daniel

>
> Thanks,
> Inki Dae
>
> 2016=EB=85=84 06=EC=9B=94 10=EC=9D=BC 19:12=EC=97=90 Tobias Jakobi =EC=
=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>> Ping!
>>
>> - Tobias
>>
>> Tobias Jakobi wrote:
>>> The current bitwise AND should result in the same assembler
>>> but this is what the code is actually supposed to do.
>>>
>>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>>> ---
>>>  drivers/gpu/drm/exynos/exynos_drm_plane.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gp=
u/drm/exynos/exynos_drm_plane.c
>>> index b3f3c2c..e4a1a63 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
>>> @@ -226,7 +226,7 @@ exynos_drm_plane_check_size(const struct exynos=
_drm_plane_config *config,
>>>          state->v_ratio =3D=3D (1 << 15))
>>>              height_ok =3D true;
>>>
>>> -    if (width_ok & height_ok)
>>> +    if (width_ok && height_ok)
>>>              return 0;
>>>
>>>      DRM_DEBUG_KMS("scaling mode is not supported");
>>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-sams=
ung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch

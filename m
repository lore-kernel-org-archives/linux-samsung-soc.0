From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 14/22] drm/exynos: fimd: fix dma burst size setting for
 small plane size
Date: Fri, 11 Dec 2015 18:04:27 +0900
Message-ID: <566A919B.8000606@samsung.com>
References: <1448891617-18830-1-git-send-email-m.szyprowski@samsung.com>
 <1448891617-18830-15-git-send-email-m.szyprowski@samsung.com>
 <5669639C.9080701@samsung.com> <56697720.8000901@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:40951 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751805AbbLKJEs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Dec 2015 04:04:48 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NZ60118PRVLCC30@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Dec 2015 18:04:33 +0900 (KST)
In-reply-to: <56697720.8000901@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>



2015=EB=85=84 12=EC=9B=94 10=EC=9D=BC 21:59=EC=97=90 Marek Szyprowski =EC=
=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> Hello,
>=20
> On 2015-12-10 12:35, Inki Dae wrote:
>> Hi Marek,
>>
>> 2015=EB=85=84 11=EC=9B=94 30=EC=9D=BC 22:53=EC=97=90 Marek Szyprowsk=
i =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>>> This patch fixes trashed display of buffers cropped to very small w=
idth.
>>> Even if DMA is unstable and causes tearing when changing the burst =
size,
>>> it is still better than displaying a garbage.
>> It seems that this patch is different from above description. I thin=
k below patch is just cleanup,
>> which passes each member necessary instead of passing a drm_framebuf=
fer object.
>=20
> Please note the last chunk of this patch. After applying it width is
> taken from state->src.w instead of fb->width. If you want, I can spli=
t
> this patch into 2 parts - one cleanup without functional change, and
> second, replacement of fb->width with state->src.w.

Will just merge it.

Thanks,
Inki Dae

>=20
>=20
>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> ---
>>>   drivers/gpu/drm/exynos/exynos_drm_fimd.c | 24 +++++++++++--------=
-----
>>>   1 file changed, 11 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu=
/drm/exynos/exynos_drm_fimd.c
>>> index 70cd2681e343..2e2247126581 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>> @@ -487,7 +487,7 @@ static void fimd_commit(struct exynos_drm_crtc =
*crtc)
>>>       static void fimd_win_set_pixfmt(struct fimd_context *ctx, uns=
igned int win,
>>> -                struct drm_framebuffer *fb)
>>> +                uint32_t pixel_format, int width)
>>>   {
>>>       unsigned long val;
>>>   @@ -498,11 +498,11 @@ static void fimd_win_set_pixfmt(struct fimd=
_context *ctx, unsigned int win,
>>>        * So the request format is ARGB8888 then change it to XRGB88=
88.
>>>        */
>>>       if (ctx->driver_data->has_limited_fmt && !win) {
>>> -        if (fb->pixel_format =3D=3D DRM_FORMAT_ARGB8888)
>>> -            fb->pixel_format =3D DRM_FORMAT_XRGB8888;
>>> +        if (pixel_format =3D=3D DRM_FORMAT_ARGB8888)
>>> +            pixel_format =3D DRM_FORMAT_XRGB8888;
>>>       }
>>>   -    switch (fb->pixel_format) {
>>> +    switch (pixel_format) {
>>>       case DRM_FORMAT_C8:
>>>           val |=3D WINCON0_BPPMODE_8BPP_PALETTE;
>>>           val |=3D WINCONx_BURSTLEN_8WORD;
>>> @@ -538,17 +538,15 @@ static void fimd_win_set_pixfmt(struct fimd_c=
ontext *ctx, unsigned int win,
>>>           break;
>>>       }
>>>   -    DRM_DEBUG_KMS("bpp =3D %d\n", fb->bits_per_pixel);
>>> -
>>>       /*
>>> -     * In case of exynos, setting dma-burst to 16Word causes perma=
nent
>>> -     * tearing for very small buffers, e.g. cursor buffer. Burst M=
ode
>>> -     * switching which is based on plane size is not recommended a=
s
>>> -     * plane size varies alot towards the end of the screen and ra=
pid
>>> -     * movement causes unstable DMA which results into iommu crash=
/tear.
>>> +     * Setting dma-burst to 16Word causes permanent tearing for ve=
ry small
>>> +     * buffers, e.g. cursor buffer. Burst Mode switching which bas=
ed on
>>> +     * plane size is not recommended as plane size varies alot tow=
ards the
>>> +     * end of the screen and rapid movement causes unstable DMA, b=
ut it is
>>> +     * still better to change dma-burst than displaying garbage.
>>>        */
>>>   -    if (fb->width < MIN_FB_WIDTH_FOR_16WORD_BURST) {
>>> +    if (width < MIN_FB_WIDTH_FOR_16WORD_BURST) {
>>>           val &=3D ~WINCONx_BURSTLEN_MASK;
>>>           val |=3D WINCONx_BURSTLEN_4WORD;
>>>       }
>>> @@ -723,7 +721,7 @@ static void fimd_update_plane(struct exynos_drm=
_crtc *crtc,
>>>           DRM_DEBUG_KMS("osd size =3D 0x%x\n", (unsigned int)val);
>>>       }
>>>   -    fimd_win_set_pixfmt(ctx, win, fb);
>>> +    fimd_win_set_pixfmt(ctx, win, fb->pixel_format, state->src.w);
>>>         /* hardware window 0 doesn't support color key. */
>>>       if (win !=3D 0)
>>>
>=20
> Best regards

From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 14/22] drm/exynos: fimd: fix dma burst size setting for
 small plane size
Date: Thu, 10 Dec 2015 13:59:12 +0100
Message-ID: <56697720.8000901@samsung.com>
References: <1448891617-18830-1-git-send-email-m.szyprowski@samsung.com>
 <1448891617-18830-15-git-send-email-m.szyprowski@samsung.com>
 <5669639C.9080701@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:53376 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751271AbbLJM7T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Dec 2015 07:59:19 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NZ500EP882SVT50@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Dec 2015 12:59:16 +0000 (GMT)
In-reply-to: <5669639C.9080701@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

Hello,

On 2015-12-10 12:35, Inki Dae wrote:
> Hi Marek,
>
> 2015=EB=85=84 11=EC=9B=94 30=EC=9D=BC 22:53=EC=97=90 Marek Szyprowski=
 =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>> This patch fixes trashed display of buffers cropped to very small wi=
dth.
>> Even if DMA is unstable and causes tearing when changing the burst s=
ize,
>> it is still better than displaying a garbage.
> It seems that this patch is different from above description. I think=
 below patch is just cleanup,
> which passes each member necessary instead of passing a drm_framebuff=
er object.

Please note the last chunk of this patch. After applying it width is
taken from state->src.w instead of fb->width. If you want, I can split
this patch into 2 parts - one cleanup without functional change, and
second, replacement of fb->width with state->src.w.


>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   drivers/gpu/drm/exynos/exynos_drm_fimd.c | 24 +++++++++++---------=
----
>>   1 file changed, 11 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/=
drm/exynos/exynos_drm_fimd.c
>> index 70cd2681e343..2e2247126581 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> @@ -487,7 +487,7 @@ static void fimd_commit(struct exynos_drm_crtc *=
crtc)
>>  =20
>>  =20
>>   static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned=
 int win,
>> -				struct drm_framebuffer *fb)
>> +				uint32_t pixel_format, int width)
>>   {
>>   	unsigned long val;
>>  =20
>> @@ -498,11 +498,11 @@ static void fimd_win_set_pixfmt(struct fimd_co=
ntext *ctx, unsigned int win,
>>   	 * So the request format is ARGB8888 then change it to XRGB8888.
>>   	 */
>>   	if (ctx->driver_data->has_limited_fmt && !win) {
>> -		if (fb->pixel_format =3D=3D DRM_FORMAT_ARGB8888)
>> -			fb->pixel_format =3D DRM_FORMAT_XRGB8888;
>> +		if (pixel_format =3D=3D DRM_FORMAT_ARGB8888)
>> +			pixel_format =3D DRM_FORMAT_XRGB8888;
>>   	}
>>  =20
>> -	switch (fb->pixel_format) {
>> +	switch (pixel_format) {
>>   	case DRM_FORMAT_C8:
>>   		val |=3D WINCON0_BPPMODE_8BPP_PALETTE;
>>   		val |=3D WINCONx_BURSTLEN_8WORD;
>> @@ -538,17 +538,15 @@ static void fimd_win_set_pixfmt(struct fimd_co=
ntext *ctx, unsigned int win,
>>   		break;
>>   	}
>>  =20
>> -	DRM_DEBUG_KMS("bpp =3D %d\n", fb->bits_per_pixel);
>> -
>>   	/*
>> -	 * In case of exynos, setting dma-burst to 16Word causes permanent
>> -	 * tearing for very small buffers, e.g. cursor buffer. Burst Mode
>> -	 * switching which is based on plane size is not recommended as
>> -	 * plane size varies alot towards the end of the screen and rapid
>> -	 * movement causes unstable DMA which results into iommu crash/tea=
r.
>> +	 * Setting dma-burst to 16Word causes permanent tearing for very s=
mall
>> +	 * buffers, e.g. cursor buffer. Burst Mode switching which based o=
n
>> +	 * plane size is not recommended as plane size varies alot towards=
 the
>> +	 * end of the screen and rapid movement causes unstable DMA, but i=
t is
>> +	 * still better to change dma-burst than displaying garbage.
>>   	 */
>>  =20
>> -	if (fb->width < MIN_FB_WIDTH_FOR_16WORD_BURST) {
>> +	if (width < MIN_FB_WIDTH_FOR_16WORD_BURST) {
>>   		val &=3D ~WINCONx_BURSTLEN_MASK;
>>   		val |=3D WINCONx_BURSTLEN_4WORD;
>>   	}
>> @@ -723,7 +721,7 @@ static void fimd_update_plane(struct exynos_drm_=
crtc *crtc,
>>   		DRM_DEBUG_KMS("osd size =3D 0x%x\n", (unsigned int)val);
>>   	}
>>  =20
>> -	fimd_win_set_pixfmt(ctx, win, fb);
>> +	fimd_win_set_pixfmt(ctx, win, fb->pixel_format, state->src.w);
>>  =20
>>   	/* hardware window 0 doesn't support color key. */
>>   	if (win !=3D 0)
>>

Best regards
--=20
Marek Szyprowski, PhD
Samsung R&D Institute Poland

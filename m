From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH 3/5 v2] drm/exynos: allow mulitple layer updates per vsync
 for mixer
Date: Wed, 25 Jun 2014 16:12:36 +0530
Message-ID: <CAPdUM4OLCjCW-wiUEaN90eSjkNxJi--c4ThBb7fyKy_K2H_R9w@mail.gmail.com>
References: <1403501545-16482-1-git-send-email-rahul.sharma@samsung.com>
	<1403501545-16482-4-git-send-email-rahul.sharma@samsung.com>
	<53A90ADA.2040306@samsung.com>
	<53A9633D.4050800@suse.de>
	<CAAQKjZMkn4BCrJOPA793A5CBLpDfJLZ-4w85=TsZr0P3L0bAHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:49609 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753712AbaFYKmh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 06:42:37 -0400
Received: by mail-wg0-f42.google.com with SMTP id z12so1784661wgg.25
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jun 2014 03:42:36 -0700 (PDT)
In-Reply-To: <CAAQKjZMkn4BCrJOPA793A5CBLpDfJLZ-4w85=TsZr0P3L0bAHQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>

Thanks Inki,

One more thing. mixer_layer_update is only called on for mixer version;
MXR_VER_16_0_33_0, MXR_VER_128_0_0_184. This condition
should have taken care of Exynos4 scenarios. What you say?

Regards,
Rahul Sharma.

On 24 June 2014 20:20, Inki Dae <inki.dae@samsung.com> wrote:
> 2014-06-24 20:38 GMT+09:00 Andreas F=C3=A4rber <afaerber@suse.de>:
>> Am 24.06.2014 07:21, schrieb Inki Dae:
>>> On 2014=EB=85=84 06=EC=9B=94 23=EC=9D=BC 14:32, Rahul Sharma wrote:
>>>> Allowing only one layer update per vsync can cause issues
>>>> while there are update available for both layers. There is
>>>> a good amount of possibility to loose updates if we allow
>>>> single update per vsync.
>>>>
>>>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>>>> ---
>>>>  drivers/gpu/drm/exynos/exynos_mixer.c |    7 +------
>>>>  1 file changed, 1 insertion(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/d=
rm/exynos/exynos_mixer.c
>>>> index d359501..6773b03 100644
>>>> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
>>>> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
>>>> @@ -511,13 +511,8 @@ static void vp_video_buffer(struct mixer_cont=
ext *ctx, int win)
>>>>  static void mixer_layer_update(struct mixer_context *ctx)
>>>>  {
>>>>      struct mixer_resources *res =3D &ctx->mixer_res;
>>>> -    u32 val;
>>>> -
>>>> -    val =3D mixer_reg_read(res, MXR_CFG);
>>>>
>>>> -    /* allow one update per vsync only */
>>>> -    if (!(val & MXR_CFG_LAYER_UPDATE_COUNT_MASK))
>>>> -            mixer_reg_writemask(res, MXR_CFG, ~0, MXR_CFG_LAYER_U=
PDATE);
>>>> +    mixer_reg_writemask(res, MXR_CFG, ~0, MXR_CFG_LAYER_UPDATE);
>>>
>>> Rahul, it looks good to me and ok as is. But above codes don't cons=
ider
>>> Exynos4 series. In case of Exynos4xxx SoC,
>>> MXR_CFG_LAYER_UPDATE_COUNT_MASK and MXR_CFG_LAYER_UPDATE of MIXER_C=
=46G
>>> register are reserved fields. So can you work that patch to be
>>> considered for Exynos4xxx SoC? That patch would be additional one.
>>>
>>> Anyway, will apply it as is, and I will wait for the additional pat=
ch.
>>
>> If it's not too late, could you fix up "multiple" in the subject? :)
>
> Corrected. :)
>
> Thanks,
> Inki Dae
>
>>
>> Cheers,
>> Andreas
>>
>> --
>> SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, German=
y
>> GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG =
N=C3=BCrnberg
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-sams=
ung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v3 5/7] drm/exynos: mixer: refactor layer setup
Date: Fri, 18 Dec 2015 09:30:10 +0900
Message-ID: <56735392.4090408@samsung.com>
References: <1450268508-15028-1-git-send-email-m.szyprowski@samsung.com>
 <1450268508-15028-6-git-send-email-m.szyprowski@samsung.com>
 <567237D7.4020204@samsung.com> <5672DACA.2040404@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:57451 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752424AbbLRAaQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Dec 2015 19:30:16 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NZJ010CD2QE6P20@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Dec 2015 09:30:14 +0900 (KST)
In-reply-to: <5672DACA.2040404@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, =?UTF-8?B?67CV67O0656M?= <boram1288.park@samsung.com>

+Cc Boram Park,

On 12/18/2015 12:54 AM, Marek Szyprowski wrote:
> Hi Joonyoung,
> 
> On 2015-12-17 05:19, Joonyoung Shim wrote:
>> Hi Marek,
>>
>> On 12/16/2015 09:21 PM, Marek Szyprowski wrote:
>>> Properly configure blending properties of given hardware layer based on
>>> the selected pixel format. Currently only per-pixel-based alpha is possible
>>> when respective pixel format has been selected. Configuration of global,
>>> per-plane alpha value, color key and background color will be added later.
>>>
>>> This patch is heavily inspired by earlier work done by Tobias Jakobi
>>> <tjakobi@math.uni-bielefeld.de>.
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> ---
>>>   drivers/gpu/drm/exynos/exynos_mixer.c | 43 +++++++++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/exynos/regs-mixer.h   |  1 +
>>>   2 files changed, 44 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
>>> index c572e271579e..ae7b122274ac 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
>>> @@ -165,6 +165,16 @@ static const u8 filter_cr_horiz_tap4[] = {
>>>       70,    59,    48,    37,    27,    19,    11,    5,
>>>   };
>>>   +static inline bool is_alpha_format(unsigned int pixel_format)
>>> +{
>>> +    switch (pixel_format) {
>>> +    case DRM_FORMAT_ARGB8888:
>>> +        return true;
>>> +    default:
>>> +        return false;
>>> +    }
>>> +}
>>> +
>>>   static inline u32 vp_reg_read(struct mixer_resources *res, u32 reg_id)
>>>   {
>>>       return readl(res->vp_regs + reg_id);
>>> @@ -294,6 +304,37 @@ static void vp_default_filter(struct mixer_resources *res)
>>>           filter_cr_horiz_tap4, sizeof(filter_cr_horiz_tap4));
>>>   }
>>>   +static void mixer_cfg_gfx_blend(struct mixer_context *ctx, unsigned int win,
>>> +                bool alpha)
>>> +{
>>> +    struct mixer_resources *res = &ctx->mixer_res;
>>> +    u32 val;
>>> +
>>> +    val  = MXR_GRP_CFG_COLOR_KEY_DISABLE; /* no blank key */
>>> +    if (alpha) {
>>> +        /* blending based on pixel alpha */
>>> +        val |= MXR_GRP_CFG_BLEND_PRE_MUL;
>>> +        val |= MXR_GRP_CFG_PIXEL_BLEND_EN;
>>> +    }
>>> +    mixer_reg_writemask(res, MXR_GRAPHIC_CFG(win),
>>> +                val, MXR_GRP_CFG_MISC_MASK);
>> I think the priority of plane and whether vp layer exists should be
>> considered for blending setting. When priority of graphic layer0 is
>> lowest and vp layer is not, this will blend background layer.
>> It was not permitted to blend background layer until current.
> 
> Currently blending is hardcoded to following configuration:
> 1. Order: [top] Grp1 > Grp0 > Video [bottom]
> 2. Per-pixel alpha blending enabled unconditionally for Grp1 layer (regardless
>    of the selected pixel format for Grp1 layer).
> 3. Per-pixel alpha blending enabled for Grp0 layer when Video layer gets enabled
>    (regardless of the selected pixel format for Grp0 layer).
> 
> It is not very intuitive and it looks hardcoded for one particular use case.
> With the above patch application can configure blending for its needs.
> 

Sure, i'm not to oppose this patch.

> I really see no reason for special handling of the bottom layer (like
> disabling per-pixel alpha even if alpha-enabled format is selected). It is
> role of application to set proper pixel format (like XRGB8888 instead of
> ARGB8888) if the application is not interested in alpha blending. Per-pixel
> alpha blending is enabled only for formats which really support alpha.
> 

You mean this is role of application definitely, then it's reasonable to
me.

Thanks.

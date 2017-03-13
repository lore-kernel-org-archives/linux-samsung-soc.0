From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 03/12] drm/exynos/decon5433: fix vblank event handling
Date: Mon, 13 Mar 2017 15:33:03 +0900
Message-ID: <58C63D1F.3030701@samsung.com>
References: <1488985126-25288-1-git-send-email-a.hajda@samsung.com>
 <CGME20170308145902eucas1p24636df9b8eafd2b07f12a2c700c6bcea@eucas1p2.samsung.com>
 <1488985126-25288-4-git-send-email-a.hajda@samsung.com>
 <50f9ade8-4bb2-6071-6c2b-89ea8f525613@daenzer.net>
 <288be3ac-8274-b8e4-ff9f-03101af6bdec@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:53996 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750943AbdCMGdM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Mar 2017 02:33:12 -0400
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OMQ02I5YQ79GW80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 13 Mar 2017 15:33:09 +0900 (KST)
In-reply-to: <288be3ac-8274-b8e4-ff9f-03101af6bdec@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, =?UTF-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>



2017년 03월 09일 15:54에 Andrzej Hajda 이(가) 쓴 글:
> On 09.03.2017 04:54, Michel Dänzer wrote:
>> On 08/03/17 11:58 PM, Andrzej Hajda wrote:
>>> Current implementation of event handling assumes that vblank interrupt is
>>> always called at the right time. It is not true, it can be delayed due to
>>> various reasons. As a result different races can happen. The patch fixes
>>> the issue by using hardware frame counter present in DECON to serialize
>>> vblank and commit completion events.
>>>
>>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>>> ---
>>> v2:
>>>   - added internal decon_get_frame_count function,
>>>   - updated frame counter on flush,
>>>   - misc style fixes (thank Inki)
>> [...]
>>
>>> @@ -579,6 +636,23 @@ static const struct component_ops decon_component_ops = {
>>>  	.unbind = decon_unbind,
>>>  };
>>>  
>>> +static void decon_handle_vblank(struct decon_context *ctx)
>>> +{
>>> +	u32 frm;
>>> +
>>> +	spin_lock(&ctx->vblank_lock);
>>> +
>>> +	frm = decon_get_frame_count(ctx, true);
>>> +
>>> +	if (frm != ctx->frame_id) {
>>> +		if (frm > ctx->frame_id)
>>> +			drm_crtc_handle_vblank(&ctx->crtc->base);
>> This comparison isn't safe WRT the counter value returned by
>> decon_get_frame_count wrapping around.
> 
> And knowing that max framerate is 60fps it will happen after:
> 
> 0xffffffff / 60fps / 60sec / 60min / 24h / 365days = 2.3 years
> 
> So after 2.3 years of uninterrupted work of panel/TV we will lose one or
> two vblanks :) Highly improbable and even then low damage.
> 
>> If it goes all the way up to
>> 0xffffffff before wrapping around to zero, it can be handled e.g. by
>>
>> 		if ((s32)(frm - ctx->frame_id) > 0)
>>
>> otherwise it gets a bit more complicated.
>>
>>
> But the fix looks simple so I think it is worth to fix it. Thanks.

Andrzej, v3?

> 
> Regards
> 
> Andrzej
> 
> 
> 
> 
> 
> 

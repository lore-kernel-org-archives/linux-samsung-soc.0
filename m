From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: clean up description of exynos_drm_crtc
Date: Wed, 12 Apr 2017 11:12:16 +0900
Message-ID: <58ED8D00.7060109@samsung.com>
References: <CGME20170406012110epcas1p3b013a6c11a9df4b76070540d73355534@epcas1p3.samsung.com>
 <1491441669-5446-1-git-send-email-inki.dae@samsung.com>
 <f308d21f-2b72-031f-1d33-c458a006f7e3@math.uni-bielefeld.de>
 <58E7472C.3030503@samsung.com>
 <7f5ae31b-6ef1-5822-234e-a82b61506d25@math.uni-bielefeld.de>
 <CAAQKjZMtxoMHa4XQpVrNWDwPW7usQ-2308QaxVjy9o7DSp+bEg@mail.gmail.com>
 <6962262a-519b-dfbb-72f7-9b6143d4c9b8@math.uni-bielefeld.de>
 <58EC140E.3020301@samsung.com>
 <467c5c99-e86e-84e9-290c-05dc4c9db5ac@math.uni-bielefeld.de>
 <b238e162-45fe-f99e-2615-bc84964ca7f8@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:38868 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751951AbdDLCMT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 Apr 2017 22:12:19 -0400
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OO900VREY4HLZ90@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 12 Apr 2017 11:12:17 +0900 (KST)
In-reply-to: <b238e162-45fe-f99e-2615-bc84964ca7f8@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Inki Dae <daeinki@gmail.com>
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>



2017년 04월 11일 17:17에 Tobias Jakobi 이(가) 쓴 글:
> Another thing that I noticed. Why wasn't the v2 that ended up in your
> git ever submitted to the mailing list? Because it should have, in
> particular to spot these obvious errors.

Only comment about this.

This patch cleans up description of struct exynos_drm_clk - removed unnecessary descriptions and adds one missed before.
I think no problem to update the description without v2 because no code change and description enough.

If you want to update the description more then you can post it.
Ps. I am not a leisurely person to respond to every little thing.

Thanks,
Inki Dae

> 
> - Tobias
> 
> 
> Tobias Jakobi wrote:
>> Inki Dae wrote:
>>>
>>>
>>> 2017년 04월 10일 19:29에 Tobias Jakobi 이(가) 쓴 글:
>>>> Inki Dae wrote:
>>>>> 2017-04-07 20:40 GMT+09:00 Tobias Jakobi <tjakobi@math.uni-bielefeld.de>:
>>>>>> Hello Inki,
>>>>>>
>>>>>>
>>>>>> Inki Dae wrote:
>>>>>>> Hello Tobias,
>>>>>>>
>>>>>>>
>>>>>>> 2017년 04월 07일 02:10에 Tobias Jakobi 이(가) 쓴 글:
>>>>>>>> Hello Inki,
>>>>>>>>
>>>>>>>>
>>>>>>>> Inki Dae wrote:
>>>>>>>>> This patch removes unnecessary descriptions on
>>>>>>>>> exynos_drm_crtc structure and adds one description
>>>>>>>>> which specifies what pipe_clk member does.
>>>>>>>>>
>>>>>>>>> pipe_clk support had been added by below patch without any description,
>>>>>>>>>      drm/exynos: add support for pipeline clock to the framework
>>>>>>>> I would put the commit id here. That makes it easier to look up the
>>>>>>>> commit your refer to.
>>>>>>>>
>>>>>>>>
>>>>>>>>> Signed-off-by: Inki Dae <inki.dae@samsung.com>
>>>>>>>>> ---
>>>>>>>>>  drivers/gpu/drm/exynos/exynos_drm_drv.h | 6 ++----
>>>>>>>>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>>>>>>>>> index 527bf1d..b0462cc 100644
>>>>>>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
>>>>>>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>>>>>>>>> @@ -152,12 +152,10 @@ struct exynos_drm_clk {
>>>>>>>>>   *
>>>>>>>>>   * @base: crtc object.
>>>>>>>>>   * @type: one of EXYNOS_DISPLAY_TYPE_LCD and HDMI.
>>>>>>>>> - * @enabled: if the crtc is enabled or not
>>>>>>>>> - * @event: vblank event that is currently queued for flip
>>>>>>>>> - * @wait_update: wait all pending planes updates to finish
>>>>>>>>> - * @pending_update: number of pending plane updates in this crtc
>>>>>>>>>   * @ops: pointer to callbacks for exynos drm specific functionality
>>>>>>>>>   * @ctx: A pointer to the crtc's implementation specific context
>>>>>>>>> + * @pipe_clk: A pipe clock structure which includes a callback function
>>>>>>>>> +         for enabling DP clock of FIMD and HDMI PHY clock.
>>>>>>>> This is wrong/inconsistent with the rest of the documentation. pipe_clk
>>>>>>>> is not a struct, but a pointer.
>>>>>>>>
>>>>>>>> I would suggest to follow. Just document that we have a pointer to <add
>>>>>>>> escription> here (compare docu for 'ops' and 'ctx').
>>>>>>>> And then put the later bits ("...callback function for enabling DP
>>>>>>>> clock...") directly to the definition of 'struct exynos_drm_clk' (which
>>>>>>>> is currently lacking any kind of docu).
>>>>>>>
>>>>>>> Thanks for pointing it out. My mistake. :)
>>>>>>>
>>>>>>> How about this simply?
>>>>>>> "A pointer to exynos_drm_clk structure for enabling and disabling DP clock of FIMD and HDMI PHY clocks"
>>>>>> Not what I meant. You're describing 'struct exynos_drm_clk', and that
>>>>>> does not belong here. If you describe 'struct exynos_drm_clk', then this
>>>>>> should go in front of the struct's definition.
>>>>>>
>>>>>> How abouting something like this in front of the struct's definition::
>>>>>>> /*
>>>>>>>  * Exynos DRM pipeline clock structure.
>>>>>>>  *
>>>>>>>  * @enable: callback to enable/disable the clock.
>>>>>>>  *
>>>>>>>  * Used for proper clock synchronization of components belonging
>>>>>>>  * to the same pipeline. Used e.g. for enabling the DP clock of
>>>>>>>  * the FIMD or the HDMI PHY clock.
>>>>>>>  */
>>>>>>> struct exynos_drm_clk {
>>>>>>> <snip>
>>>>>>
>>>>>> For 'pipe_clk' I would just go with this:
>>>>>>> @pipe_clk: A pointet to the crtc's pipeline clock.
>>>>>
>>>>> More simple and looks better.
>>>> In this form (commit a07d468cb2efd347a9e279e4f68661f0f370d10f in
>>>> exynos-drm-next), the description is incomplete. Please read my mails again.
>>>
>>> Many patches in mainline used same form. Please git log | grep "commit-id" -n10.
>>> Sorry but no update and no comment anymore but will use the generic form later.
>> I'm not referring to your use of commit-id, but to you totally ignoring
>> the documentation bits for 'struct exynos_drm_clk'. Please be more
>> careful when reading my mails.
>>
>> - Tobias
>>
>>
>>
>>> Thanks,
>>> Inki Dae
>>>
>>>>
>>>> - Tobias
>>>>
>>>>
>>>>>
>>>>> Thanks,
>>>>> Inki Dae
>>>>>
>>>>>>
>>>>>> I hope this helps.
>>>>>>
>>>>>> - Tobias
>>>>>>
>>>>>>
>>>>>>> Thanks,
>>>>>>> Inki Dae
>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> - Tobias
>>>>>>>>
>>>>>>>>>   */
>>>>>>>>>  struct exynos_drm_crtc {
>>>>>>>>>     struct drm_crtc                 base;
>>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>
>>>>>> --
>>>>>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>>>>>> the body of a message to majordomo@vger.kernel.org
>>>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>>> --
>>>>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>>>>> the body of a message to majordomo@vger.kernel.org
>>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>>>
>>>>
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>>
>>>>
>>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> 
> 
> 
> 

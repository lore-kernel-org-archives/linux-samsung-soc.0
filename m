From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH V6 2/2] video: drm: exynos: Add device tree support
Date: Mon, 24 Sep 2012 21:35:46 +0900
Message-ID: <CAAQKjZMZBDpKinZkDUX7CU4yTXmu9GrP1+OiZJKW4Gx1BTno3Q@mail.gmail.com>
References: <1348226536-22899-1-git-send-email-l.krishna@samsung.com>
	<1348226536-22899-3-git-send-email-l.krishna@samsung.com>
	<505BF79A.8060802@wwwdotorg.org>
	<CAAQKjZN7B1spgoD+LJjDU=PDd9jFk6g7PekuiKEeKpXLT-X4UA@mail.gmail.com>
	<505C9072.2010204@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:43927 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754803Ab2IXMfr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Sep 2012 08:35:47 -0400
Received: by pbbrr4 with SMTP id rr4so7069678pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Sep 2012 05:35:46 -0700 (PDT)
In-Reply-To: <505C9072.2010204@wwwdotorg.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: kgene.kim@samsung.com, Leela Krishna Amudala <l.krishna@samsung.com>, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, laurent.pinchart@ideasonboard.com, linux-arm-kernel@lists.infradead.org

2012/9/22 Stephen Warren <swarren@wwwdotorg.org>:
> On 09/21/2012 01:22 AM, Inki Dae wrote:
>> 2012/9/21 Stephen Warren <swarren@wwwdotorg.org>:
>>> On 09/21/2012 05:22 AM, Leela Krishna Amudala wrote:
>>>> This patch adds device tree based discovery support for exynos DRM-FIMD
>>>> driver which includes driver modification to handle platform data in
>>>> both the cases with DT and non-DT, Also adds the documentation for bindings.
>>>
>>>> diff --git a/Documentation/devicetree/bindings/drm/exynos/fimd.txt b/Documentation/devicetree/bindings/drm/exynos/fimd.txt
>>> ...
>>>> + - samsung,fimd-display: This property should specify the phandle of the
>>>> +   display device node which holds the video interface timing with the
>>>> +   below mentioned properties.
>>>> +
>>>> +   - lcd-htiming: Specifies the horizontal timing for the overlay. The
>>>> +     horizontal timing includes four parameters in the following order.
>>>> +
>>>> +     - horizontal back porch (in number of lcd clocks)
>>>> +     - horizontal front porch (in number of lcd clocks)
>>>> +     - hsync pulse width (in number of lcd clocks)
>>>> +     - Display panels X resolution.
>>>> +
>>>> +   - lcd-vtiming: Specifies the vertical timing for the overlay. The
>>>> +     vertical timing includes four parameters in the following order.
>>>> +
>>>> +     - vertical back porch (in number of lcd lines)
>>>> +     - vertical front porch (in number of lcd lines)
>>>> +     - vsync pulse width (in number of lcd clocks)
>>>> +     - Display panels Y resolution.
>>>
>>> Should this not use the new videomode timings that are under discussion at:
>>>
>>> http://lists.freedesktop.org/archives/dri-devel/2012-July/024875.html
>>>
>>
>> ok, I agree with you. then the videomode helper is going to be merged
>> to mainline(3.6)? if so, this patch should be reworked based on the
>> videomode helper.
>
> I think the videomode helpers would be merged for 3.7 at the very
> earliest; 3.6 is cooked already. Given there are still some comments on
> the binding, perhaps it won't happen until 3.8, but it'd be best to ask
> on that thread so that people more directly involved with the status can
> answer.
>

as I mentioned before, it's better to use videomode helper instead but
for this, we should wait for that the videomode helper are merged to
mainline so I think it's better to merge it as is and then modify it
for videomode helper to be used later.

Thanks,
Inki Dae

> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

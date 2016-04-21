From: Inki Dae <daeinki@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: add exynos5420-fimd compatible
Date: Thu, 21 Apr 2016 22:11:01 +0900
Message-ID: <CAAQKjZNcZsNjWMPh4ZhawVVv=6RP74HYY8Ye_96xYoENyqjjvw@mail.gmail.com>
References: <1455283900-6913-1-git-send-email-chanho61.park@samsung.com>
 <1455283900-6913-3-git-send-email-chanho61.park@samsung.com>
 <56C12287.8050900@samsung.com> <56C14D18.1040508@samsung.com> <5718A62E.6020906@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f196.google.com ([209.85.161.196]:35517 "EHLO
	mail-yw0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751172AbcDUNLl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Apr 2016 09:11:41 -0400
Received: by mail-yw0-f196.google.com with SMTP id v81so10336247ywa.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Apr 2016 06:11:40 -0700 (PDT)
In-Reply-To: <5718A62E.6020906@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Chanho Park <parkch98@gmail.com>, Kukjin Kim <kgene@kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, Chanho Park <chanho61.park@samsung.com>

2016-04-21 19:06 GMT+09:00 Krzysztof Kozlowski <k.kozlowski@samsung.com>:
> On 02/15/2016 04:59 AM, Krzysztof Kozlowski wrote:
>> On 15.02.2016 09:57, Krzysztof Kozlowski wrote:
>>> On 12.02.2016 22:31, Chanho Park wrote:
>>>> This patch changes the compatible of exynos5420 fimd
>>>> to "exynos5420-fimd". To support mic bypass from display
>>>> path, the new compatible is introduced for exynos5420.
>>>>
>>>> Cc: Inki Dae <inki.dae@samsung.com>
>>>> Cc: Kukjin Kim <kgene@kernel.org>
>>>> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>>> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
>>>> ---
>>>>  arch/arm/boot/dts/exynos5420.dtsi | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>
>>> Looks okay to me and also looks independent from patch #1. I will apply
>>> it for late v4.6 if patch #1 got accepted by Inki.
>>>
>>> Anyway, for reference:
>>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>
>> Stupid me, of course it cannot go independently through my tree. Please
>> feel free to take it through drm-exynos with my reviewed-by tag.
>
> Inki did not pick it up, so applied now for late v4.7.
>

Forgot it. Sorry for this Chanho and Krzysztof.

Thanks,
Inki Dae

> Best regards,
> Krzysztof
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

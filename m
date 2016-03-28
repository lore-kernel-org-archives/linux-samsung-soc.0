From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2] ARM: exynos_defconfig: Enable Samsung media platform
 drivers as modules
Date: Mon, 28 Mar 2016 11:15:05 -0400
Message-ID: <56F94A79.4020808@osg.samsung.com>
References: <1458779208-6144-1-git-send-email-javier@osg.samsung.com>
 <56F33C46.8060501@samsung.com> <56F4AD53.2020307@osg.samsung.com>
 <56F8B2D0.9010609@samsung.com> <56F8BD99.9050907@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:58475 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752665AbcC1PPN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Mar 2016 11:15:13 -0400
In-Reply-To: <56F8BD99.9050907@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Kukjin Kim <kgene@kernel.org>

Hello Krzysztof,

On 03/28/2016 01:14 AM, Javier Martinez Canillas wrote:
> 
> On 03/28/2016 12:28 AM, Krzysztof Kozlowski wrote:
>> On 25.03.2016 12:15, Javier Martinez Canillas wrote:
>>>>
>>>> How about doing the same for multi_v7?
>>>>
>>>
>>> I didn't consider multi_v7 because media drivers aren't necessary for booting
>>> the boards and so it could increase build times for not real benefits in most
>>> machines. But I can enable it in multi_v7 as a follow-up if you think that it
>>> makes sense there too.
>>
>> I consider use cases of multi_v7 the same as exynos (except the
>> difference in policy: use always modules). This means that if it makes
>> sense to enable some media drivers on exynos (for build coverage, boot
>> testing and real usage) then it makes sense to do the same for multi_v7.
>>
> 
> Ok, thanks a lot for your suggestion. I'll post a patch for multi_v7 then.
>  
>> In ideal future we would move entirely from exynos-specific image to one
>> common image for testing: the multi_v7. It would make things simpler.
>>
>> Best regards,
>> Krzysztof
>>
> 

Tobias mentioned on IRC that the exynos4-is driver conflicts with the
Exynos DRM driver since both exynos_drm_fimc and exynos-fimc-is use
the FIMC block.

So I think we should just discard $SUBJECT and instead add a Kconfig
check to not allow both drivers to be built as suggested by Tobias.

Like is the case for the other components (G2D, GSC, Mixer, etc).

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America

From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: fix GIC using for EXYNOS5440
Date: Thu, 20 Dec 2012 11:04:03 +0900
Message-ID: <50D27213.9050403@samsung.com>
References: <030c01cdd672$cb1b6b40$615241c0$%kim@samsung.com>
 <50C545E8.8050301@samsung.com> <001501cddd98$9698dba0$c3ca92e0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:34128 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751851Ab2LTCEK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Dec 2012 21:04:10 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MFB008QF4DN6PE0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Dec 2012 11:03:46 +0900 (KST)
Received: from [10.90.51.60] by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MFB008894EAC300@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Dec 2012 11:03:46 +0900 (KST)
In-reply-to: <001501cddd98$9698dba0$c3ca92e0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 12/19/2012 12:26 PM, Kukjin Kim wrote:
> Joonyoung Shim wrote:
>> Hi,
>>
>> On 12/10/2012 10:07 AM, Kukjin Kim wrote:
>>> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>>> ---
>>>    arch/arm/mach-exynos/common.c |    3 ++-
>>>    1 files changed, 2 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-
>> exynos/common.c
>>> index 0eb3b9a..9ecda37 100644
>>> --- a/arch/arm/mach-exynos/common.c
>>> +++ b/arch/arm/mach-exynos/common.c
>>> @@ -684,7 +684,8 @@ void __init exynos5_init_irq(void)
>>>    	 * Theses parameters should be NULL and 0 because EXYNOS4
>>>    	 * uses GIC instead of VIC.
>>>    	 */
>>> -	s5p_init_irq(NULL, 0);
>>> +	if (!of_machine_is_compatible("samsung,exynos5440"))
>>> +		s5p_init_irq(NULL, 0);
>> How about remove to call s5p_init_irq() here because All exynos SoCs use
>> GIC instead of VIC?
>>
> NO, the current s5p_init_irq() is not only for VIC but also Timer which is
> used on EXYNOS SoCs, I know the name is strange...

I think timer can be selective by MCT on Exynos SoCs.

The patch(ARM: EXYNOS: remove static mapping of PWM memory) is for it.

>>>    	gic_arch_extn.irq_set_wake = s3c_irq_wake;
>>>    }
>

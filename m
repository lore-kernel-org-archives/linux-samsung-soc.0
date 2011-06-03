From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: S5P: Fix compilation error for exynos4_defconfig
Date: Fri, 03 Jun 2011 12:24:04 +0530
Message-ID: <4DE8850C.3050202@linaro.org>
References: <1307077639-18604-1-git-send-email-tushar.behera@linaro.org> <000001cc21b2$9366b9a0$ba342ce0$%szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:63386 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751256Ab1FCGyK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Jun 2011 02:54:10 -0400
Received: by pzk9 with SMTP id 9so735781pzk.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Jun 2011 23:54:10 -0700 (PDT)
In-Reply-To: <000001cc21b2$9366b9a0$ba342ce0$%szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linaro-dev@linaro.org, kgene.kim@samsung.com, nicolas.pitre@linaro.org, patches@linaro.org, jy0922.shim@samsung.com, linaro-dev@lists.linaro.org

Hi Marek,

Thanks for your review.

On Friday 03 June 2011 11:23 AM, Marek Szyprowski wrote:
> Hello,
>
> On Friday, June 03, 2011 7:07 AM Tushar Behera wrote:
>
>> EHCI requires that USB support be enabled in kernel config.
>> Selecting USB_SUPPORT with S5P_DEV_USB_EHCI fixes the problem.
>>
>> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
>> ---
>>   arch/arm/plat-s5p/Kconfig |    1 +
>>   1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
>> index e98f5c5..c7e7419 100644
>> --- a/arch/arm/plat-s5p/Kconfig
>> +++ b/arch/arm/plat-s5p/Kconfig
>> @@ -87,6 +87,7 @@ config S5P_DEV_CSIS1
>>
>>   config S5P_DEV_USB_EHCI
>>   	bool
>> +	select USB_SUPPORT
>
> IMHO this is not the best way to solve this issue. The main problem is
> the fact that usb-phy.c file depends on CONFIG_USB_SUPPORT not it's own
> Kconfig entry. Please check arch/arm/mach-exynos4/Makefile. To match the
> style of other helper functions, usb-phy.c should be renamed to
> setup-usb-phy.c and get it's own Kconfig entry like
> CONFIG_EXYNOS4_SETUP_USB_PHY. Also the machine that uses it should select
> this new entry. This is really not related to CONFIG_USB_SUPPORT at all
> (one might want to have a kernel without USB support for some reason).
>
>
Ok. I will re-submit the patch.
>>   	help
>>   	  Compile in platform device definition for USB EHCI
>>
>> --
>
> Best regards


-- 
Tushar Behera

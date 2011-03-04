From: Donghwa Lee <dh09.lee@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS4: enabled lcd and backlight in NURI board
Date: Fri, 04 Mar 2011 13:41:31 +0900
Message-ID: <4D706D7B.8020009@samsung.com>
References: <1299028671-9062-1-git-send-email-dh09.lee@samsung.com>
 <01ad01cbd961$40e69720$c2b3c560$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:38270 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758483Ab1CDEld (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Mar 2011 23:41:33 -0500
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHI004UPNP747A0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Mar 2011 13:41:31 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHI00FMHNP76K@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Mar 2011 13:41:31 +0900 (KST)
In-reply-to: <01ad01cbd961$40e69720$c2b3c560$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

 On 2011-03-03, Kukjin Kim wrote:
>
>>  #
>>  # Display device support
>> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
>> index 5bf00b9..1d0d222 100644
>> --- a/arch/arm/mach-exynos4/Kconfig
>> +++ b/arch/arm/mach-exynos4/Kconfig
>> @@ -135,6 +135,7 @@ config MACH_NURI
>>  	select EXYNOS4_SETUP_I2C1
>>  	select EXYNOS4_SETUP_I2C5
>>  	select EXYNOS4_SETUP_SDHCI
>> +	select HAVE_PWM
> Since Banajit's PWM backlight patches will be merged, should be following
> your next patch.
>
> +	select SAMSUNG_DEV_PWM
>
>

Dear Kukjin,
Thanks for your review.
I'm preparing next patch for your review including other modifications.
But, I cannot find committed patches of PWM backlight of Banajit.
Was it merged? If so, please tell me committed tree.

Thank you,
Donghwa Lee

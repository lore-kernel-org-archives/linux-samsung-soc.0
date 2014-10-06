From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 2/4] [media] exynos4-is: Remove optional dependency on
 PLAT_S5P
Date: Mon, 06 Oct 2014 15:05:41 +0200
Message-ID: <543293A5.1090506@samsung.com>
References: <1412586485.4054.40.camel@x220>
 <54328D18.2000606@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:27929 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751814AbaJFNFo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Oct 2014 09:05:44 -0400
In-reply-to: <54328D18.2000606@cogentembedded.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Paul Bolle <pebolle@tiscali.nl>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Valentin Rothberg <valentinrothberg@gmail.com>

On 06/10/14 14:37, Sergei Shtylyov wrote:
>> diff --git a/drivers/media/platform/exynos4-is/Kconfig b/drivers/media/platform/exynos4-is/Kconfig
>> index 77c951237744..775c3278d0eb 100644
>> --- a/drivers/media/platform/exynos4-is/Kconfig
>> +++ b/drivers/media/platform/exynos4-is/Kconfig
>> @@ -2,7 +2,7 @@
>>   config VIDEO_SAMSUNG_EXYNOS4_IS
>>   	bool "Samsung S5P/EXYNOS4 SoC series Camera Subsystem driver"
>>   	depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
>> -	depends on (PLAT_S5P || ARCH_EXYNOS || COMPILE_TEST)
>> +	depends on (ARCH_EXYNOS || COMPILE_TEST)
> 
>     Perhaps it's time to drop the useless parens?

Good point, let me prepare patches to clean that up.

--
Thanks,
Sylwester

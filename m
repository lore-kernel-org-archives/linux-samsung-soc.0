From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v4 11/12] ARM: EXYNOS: add support device tree enabled
 board file for EXYNOS5
Date: Wed, 14 Mar 2012 16:18:57 -0700
Message-ID: <4F612761.6050903@samsung.com>
References: <1331736138-28964-1-git-send-email-kgene.kim@samsung.com> <1331736138-28964-12-git-send-email-kgene.kim@samsung.com> <20120314223715.GA13872@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:49157 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756042Ab2CNXTE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Mar 2012 19:19:04 -0400
Received: by dadp12 with SMTP id p12so3682256dad.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Mar 2012 16:19:03 -0700 (PDT)
In-Reply-To: <20120314223715.GA13872@quad.lixom.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, arnd@arndb.de, linux-arm-kernel@lists.infradead.org

Olof Johansson wrote:
> On Wed, Mar 14, 2012 at 07:42:17AM -0700, Kukjin Kim wrote:
>> This patch adds a new EXYNOS5 compatible device tree enabled board
>> When using this, a corresponding device tree blob which describes the
>> board's properties should be supplied at boot time to the kernel.
>
> Hi,
>
Hi Olof,

> Sorry, missed this last time around:
>
No problem and thanks.

>> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
>> index a2ed05c..ac24386 100644
>> --- a/arch/arm/mach-exynos/Kconfig
>> +++ b/arch/arm/mach-exynos/Kconfig
>> @@ -362,7 +362,18 @@ config MACH_SMDK4412
>>   	  Machine support for Samsung SMDK4412
>>   endif
>>
>> -comment "Flattened Device Tree based board for Exynos4 based SoC"
>> +if ARCH_EXYNOS5
>> +
>> +comment "EXYNOS5250 Boards"
>> +
>> +config MACH_SMDK5250
>> +	bool "SMDK5250"
>> +	select SOC_EXYNOS5250
>> +	help
>> +	  Machine support for Samsung SMDK5250
>> +endif
>
>
> There's no board file for SMDK5250 in this series (and there shouldn't be since
> it should all be covered by MACH_EXYNOS5_DT. So the above config option can go
> away.
>
Yeah, you're right. I think, it seem that remained after just testing 
anyway, it will be fixed before sending pull request.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

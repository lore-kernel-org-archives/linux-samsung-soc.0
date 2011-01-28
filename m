From: Sylwester Nawrocki <snjw23@gmail.com>
Subject: Re: [PATCH 1/3] ARM: S5PV210: Enable I2C0 bus on GONI board
Date: Fri, 28 Jan 2011 23:18:21 +0900
Message-ID: <4D42D02D.2070601@gmail.com>
References: <1294419468-13700-1-git-send-email-s.nawrocki@samsung.com> <1294419468-13700-2-git-send-email-s.nawrocki@samsung.com> <02e001cbbecd$b9aee0d0$2d0ca270$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:64807 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752454Ab1A1OS2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Jan 2011 09:18:28 -0500
Received: by pzk35 with SMTP id 35so443568pzk.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Jan 2011 06:18:28 -0800 (PST)
In-Reply-To: <02e001cbbecd$b9aee0d0$2d0ca270$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com

Hi Kukjin,

On 01/28/2011 06:28 PM, Kukjin Kim wrote:
> Sylwester Nawrocki wrote:
>>
>> Add I2C0 bus platform device for camera sensors.
>>
>> Signed-off-by: Sylwester Nawrocki<s.nawrocki@samsung.com>
>> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
>> ---
>>   arch/arm/mach-s5pv210/Kconfig     |    1 +
>>   arch/arm/mach-s5pv210/mach-goni.c |    4 ++++
>>   2 files changed, 5 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
>> index 53aabef..b0aa462 100644
>> --- a/arch/arm/mach-s5pv210/Kconfig
>> +++ b/arch/arm/mach-s5pv210/Kconfig
>> @@ -75,6 +75,7 @@ config MACH_GONI
>>   	bool "GONI"
>>   	select CPU_S5PV210
>>   	select S5P_GPIO_INT
>> +	select S3C_DEV_I2C0
>
> NO...Where is S3C_DEV_I2C0?
> Basically, platform device of i2c0 which is in
> arch/arm/plat-samsung/dev-i2c0.c is always selected.

Oh, sorry about that omission. I'll resend that one corrected.

Thanks,
Sylwester

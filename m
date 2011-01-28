From: Sylwester Nawrocki <snjw23@gmail.com>
Subject: Re: [PATCH 2/3] ARM: S5PV210: Add supplies for CIF camera on GONI
 board
Date: Fri, 28 Jan 2011 20:49:15 +0900
Message-ID: <4D42AD3B.40005@gmail.com>
References: <1294419468-13700-1-git-send-email-s.nawrocki@samsung.com> <1294419468-13700-3-git-send-email-s.nawrocki@samsung.com> <02e101cbbece$55a77790$00f666b0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:52867 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754594Ab1A1LtV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Jan 2011 06:49:21 -0500
Received: by pxi15 with SMTP id 15so429443pxi.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Jan 2011 03:49:20 -0800 (PST)
In-Reply-To: <02e101cbbece$55a77790$00f666b0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com

On 01/28/2011 06:32 PM, Kukjin Kim wrote:
> Sylwester Nawrocki wrote:
>>
>> Add regulator supplies required for NOON010PC30 CIF sensor.
>>
>> Signed-off-by: Sylwester Nawrocki<s.nawrocki@samsung.com>
>> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
>> ---
>>   arch/arm/mach-s5pv210/mach-goni.c |   24 +++++++++++++++++++++---
>>   1 files changed, 21 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm/mach-s5pv210/mach-goni.c
> b/arch/arm/mach-s5pv210/mach-
>> goni.c
>> index fc34575..2051cee 100644
>> --- a/arch/arm/mach-s5pv210/mach-goni.c
>> +++ b/arch/arm/mach-s5pv210/mach-goni.c
>> @@ -273,6 +273,18 @@ static struct regulator_consumer_supply
>> goni_ldo5_consumers[] = {
>>   	REGULATOR_SUPPLY("vmmc", "s3c-sdhci.0"),
>>   };
>>
>> +static struct regulator_consumer_supply goni_ldo11_consumers[] = {
>> +	REGULATOR_SUPPLY("vddio", "0-0030"), /* "CAM_IO_2.8V" */
>> +};
> 
> Need array in goni_ldo11_consumers?
> 
> +static struct regulator_consumer_supply goni_ldo11_consumers =
> +	REGULATOR_SUPPLY("vddio", "0-0030"); /* "CAM_IO_2.8V" */
> 
>> +
... 
>> +
>>   static struct regulator_init_data goni_ldo2_data = {
>>   	.constraints	= {
>>   		.name		= "VALIVE_1.1V",
>> @@ -371,8 +383,10 @@ static struct regulator_init_data goni_ldo11_data = {
>>   		.min_uV		= 2800000,
>>   		.max_uV		= 2800000,
>>   		.apply_uV	= 1,
>> -		.always_on	= 1,
>> +		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
>>   	},
>> +	.num_consumer_supplies	= ARRAY_SIZE(goni_ldo11_consumers),
>> +	.consumer_supplies	= goni_ldo11_consumers,
> 
> If you modify as per my suggestion, then need to change this like following.
> 
> +	.num_consumer_supplies	= 1,
> +	.consumer_supplies	=&goni_ldo11_consumers,
> 
>>   };

Although the current state of this file is not reflecting it, there is
more devices sharing the regulators I've added supply definitions for,
e.g the second camera in the system.
So the arrays are really needed. If I modify it as you as you are
suggesting then it will have to be changed when the other supplies
are added.


Thanks,
Sylwester

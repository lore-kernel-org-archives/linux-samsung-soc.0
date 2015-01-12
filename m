From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v5 1/2] soc: samsung: add exynos chipid driver support
Date: Mon, 12 Jan 2015 14:59:23 +0530
Message-ID: <54B393F3.8070403@samsung.com>
References: <1418285264-21763-1-git-send-email-pankaj.dubey@samsung.com>
 <CAL_JsqKaf+w_D-xLCUizuTmxwT7uUHExA=qMpawQ+00G7uMcBg@mail.gmail.com>
 <548A9D27.1000504@samsung.com> <1521226.qVx3V7aJT6@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1521226.qVx3V7aJT6@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robherring2@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, =?windows-1252?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Thomas Abraham <thomas.ab@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Arnd,

Sorry for late reply.

On Friday 12 December 2014 05:01 PM, Arnd Bergmann wrote:
> On Friday 12 December 2014 13:15:43 Pankaj Dubey wrote:
>>>> +
>>>> +static void __iomem *exynos_chipid_base;
>>>> +
>>>> +struct exynos_chipid_info exynos_soc_info;
>>>> +EXPORT_SYMBOL(exynos_soc_info);
>>>
>>> The soc_device already has similar data.Why is this needed? Is it
>>> temporary for compatibility?
>>
>> struct soc_device_attribute can hold these two (product_id, and
>> revision) but they are defined as char * in soc_device_atttribute, and I
>> feel it's more specific for exposing via sysfs.
>> Also existing code in mach-exynos compares them via product_id/revision
>> macros, so I can say to keep compatibility.
>
> We had a similar discussion about the Marvell SoCs a while ago, and at
> the time we concluded that it would be best to create a platform-
> independent API to match the strings in soc_device_attribute against
> a list of strings in the driver, either by matching the start of the
> string, or using the glob_match() function. Would that work for you?
>

It might be useful, will you please point me to that discussion so that 
I can dig more and see how I can reuse it, or if required work on it.

Thanks,
Pankaj Dubey
> 	Arnd
>

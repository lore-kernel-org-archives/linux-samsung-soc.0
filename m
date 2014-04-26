From: Vikas Sajjan <sajjan.linux@gmail.com>
Subject: Re: [PATCH] ARM: dts: Remove mau_pd node for Exynos5420
Date: Sat, 26 Apr 2014 21:12:35 +0530
Message-ID: <CAGm_ybgLpnY8sofyoEODgFLzJYyVeGGCSE6h5beQPq65yQfA2Q@mail.gmail.com>
References: <1398145155-4615-1-git-send-email-tushar.behera@linaro.org>
	<CAGOxZ52CDOXyXDpy8h3NQ8=26Wn8jF=6_vzb+t370_GbPiHG0g@mail.gmail.com>
	<CAHbNUh2T8gOdGxDGm995vbj0oiJkyDwW9C9J7VV_o7mudfKjEw@mail.gmail.com>
	<03b001cf5edc$ae42e770$0ac8b650$@samsung.com>
	<5358D46F.2050303@linaro.org>
	<5358E243.7010004@samsung.com>
	<5358EF70.7070809@linaro.org>
	<535AEFFE.7020900@gmail.com>
	<CAGm_ybjepoovODOoWBr0f=3m=fhCThSQMPUqwz_PskCw2MqnuA@mail.gmail.com>
	<535BCE3C.7080502@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:37787 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751988AbaDZPmg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 26 Apr 2014 11:42:36 -0400
Received: by mail-oa0-f53.google.com with SMTP id j17so5389718oag.26
        for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Apr 2014 08:42:36 -0700 (PDT)
In-Reply-To: <535BCE3C.7080502@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Tushar Behera <tushar.behera@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Alim Akhtar <alim.akhtar@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, jhbird.choi@samsung.com

Hi Tomasz,

On Sat, Apr 26, 2014 at 8:48 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Vikas,
>
>
> On 26.04.2014 13:57, Vikas Sajjan wrote:
>>
>> Hi,
>>
>>
>> On Sat, Apr 26, 2014 at 5:00 AM, Tomasz Figa <tomasz.figa@gmail.com>
>> wrote:
>>>
>>>
>>>
>>> On 24.04.2014 13:03, Tushar Behera wrote:
>>>>
>>>>
>>>> On 04/24/2014 03:36 PM, Tomasz Figa wrote:
>>>>>
>>>>>
>>>>> On 24.04.2014 11:07, Tushar Behera wrote:
>>>>>>
>>>>>>
>>>>>> On 04/23/2014 03:43 PM, Kukjin Kim wrote:
>>>>>>>
>>>>>>>
>>>>>>> Tushar Behera wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> On 22 April 2014 13:08, Alim Akhtar <alim.akhtar@gmail.com> wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Hi Tushar
>>>>>>>>>
>>>>>>>>> On Tue, Apr 22, 2014 at 11:09 AM, Tushar Behera
>>>>>>>>> <tushar.behera@linaro.org> wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> MAU powerdomain provides clocks for Audio sub-system block. This
>>>>>>>>>> block
>>>>>>>>>> comprises of the I2S audio controller, audio DMA blocks and Audio
>>>>>>>>>> sub-system clock registers.
>>>>>>>>>>
>>>>>>>>>> Right now, there is no way to hook up power-domains with clock
>>>>>>>>
>>>>>>>>
>>>>>>>> providers.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> During late boot when this power-domain gets disabled, we get
>>>>>>>>>> following
>>>>>>>>>> external abort.
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> + Jonghwan Choi
>>>>>>>
>>>>>>> Well, this is not a perfect solution to support MAU power domain,
>>>>>>> it's true it is a problem right now though.
>>>>>>>
>>>>>>> In other words, this is just temporal fix for the problem.
>>>>>>>
>>>>>>> How about accessing clock stuff for audio sub-system with handling
>>>>>>> MAU power domain via generic IO power domain?
>>>>>>>
>>>>>>
>>>>>> + Tomasz Figa
>>>>>>
>>>>>> Existing power domain driver exynos4_pm_init_power_domain is
>>>>>> registered
>>>>>> with an arch_initcall whereas the clk-exynos-audss driver is
>>>>>> registered
>>>>>> with core_initcall. Hence even if add mau_pd node to clk-exynos-audss
>>>>>> node, the binding with power-domain doesn't happen.
>>>>>
>>>>>
>>>>>
>>>>> I'd say core_initcall is way too early for clk-exynos-audss driver. It
>>>>> should be at most subsys_initcall. As far as I can see, all users of
>>>>> clocks provided by this driver (i.e. i2s) are probed at device_initcall
>>>>> level anyway.
>>>>>
>>>>
>>>> It is also used by ADMA node, which gets probed.
>>>
>>>
>>>
>>> If I'm looking correctly, ADMA is handled by pl330 driver which is
>>> registered at device_initcall level and so it shouldn't make problems
>>> with
>>> clk-exynos-audss driver being probed at subsys_initcall level.
>>>
>>>
>>>>
>>>>>>
>>>>>> Alternately, if Tomasz's patches are applied [1], power-domain binding
>>>>>> is successful. But because of the init order, clk-exynos-audss defers
>>>>>> probe resulting in a kernel crash. Forcing clk-exynos-audss to
>>>>>> register
>>>>>> through arch_initcall() fixes this issue, but I am not sure if that is
>>>>>> okay.
>>>>>
>>>>>
>>>>>
>>>>> If the driver crashes on deferred probe, then it's a bug and it should
>>>>> be fixed.
>>>>>
>>>>
>>>> By the time clk-exynos-audss is getting called, mau_pd is already
>>>> disabled by power-domain driver. That is not getting enabled during
>>>> clk-exynos-audss probe. Am I missing something?
>>>
>>>
>>>
>>> Probably. The driver should enable runtime PM and call
>>> pm_runtime_get_sync()
>>> to make sure that power is supplied to the device it accesses.
>>>
>>> By the way, if defining MAU power domain in DT, then also all the devices
>>> inside of this domain should be bound to it, including ADMA and I2S, but
>>> I
>>> don't see neither of them having the "samsung,power-domain" property.
>>>
>>
>> According to UM of 5420, MAU has to be power gated is specific order
>> the SYS_PWR_CFG field of EXYNOS5_PAD_RETENTION_MAU_SYS_PWR_REG should
>> be set to 0, before actually power gating the MAU block.
>> I am NOT sure whether this is taken care in the mainline.
>> As per the current implementation in pm_domain.c, the
>> exynos_pd_power() just writes  __raw_writel(pwr, base);
>> based on bool power_on passed.
>> We dont have the provision in the generic power domain framework to
>> have something like pre_power_off() or post_power_on(). Correct me if
>> am wrong.
>>
>> Even for power gating of ISP block a certain specific order needs to
>> be followed.
>>
>> So I think there is a need ops like pre_power_off(), post_power_on()
>> in generic power domain framework.
>>
>> let me know your opinion.
>
>
> I don't think there is any need to handle this in high level code. IMHO just
> extending Exynos power domain initialization code and exynos_pd_power()
> should be enough.

Fair enough. Yes, I think we can extend the existing exynos power
domain Initialization code and exynos_pd_power() to have such support.


>
> Best regards,
> Tomasz

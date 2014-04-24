From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: dts: Remove mau_pd node for Exynos5420
Date: Thu, 24 Apr 2014 16:33:12 +0530
Message-ID: <5358EF70.7070809@linaro.org>
References: <1398145155-4615-1-git-send-email-tushar.behera@linaro.org> <CAGOxZ52CDOXyXDpy8h3NQ8=26Wn8jF=6_vzb+t370_GbPiHG0g@mail.gmail.com> <CAHbNUh2T8gOdGxDGm995vbj0oiJkyDwW9C9J7VV_o7mudfKjEw@mail.gmail.com> <03b001cf5edc$ae42e770$0ac8b650$@samsung.com> <5358D46F.2050303@linaro.org> <5358E243.7010004@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:50157 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753956AbaDXLDR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Apr 2014 07:03:17 -0400
Received: by mail-pa0-f46.google.com with SMTP id kp14so1791075pab.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Apr 2014 04:03:16 -0700 (PDT)
In-Reply-To: <5358E243.7010004@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, 'Alim Akhtar' <alim.akhtar@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, jhbird.choi@samsung.com

On 04/24/2014 03:36 PM, Tomasz Figa wrote:
> On 24.04.2014 11:07, Tushar Behera wrote:
>> On 04/23/2014 03:43 PM, Kukjin Kim wrote:
>>> Tushar Behera wrote:
>>>>
>>>> On 22 April 2014 13:08, Alim Akhtar <alim.akhtar@gmail.com> wrote:
>>>>> Hi Tushar
>>>>>
>>>>> On Tue, Apr 22, 2014 at 11:09 AM, Tushar Behera
>>>>> <tushar.behera@linaro.org> wrote:
>>>>>> MAU powerdomain provides clocks for Audio sub-system block. This
>>>>>> block
>>>>>> comprises of the I2S audio controller, audio DMA blocks and Audio
>>>>>> sub-system clock registers.
>>>>>>
>>>>>> Right now, there is no way to hook up power-domains with clock
>>>> providers.
>>>>>> During late boot when this power-domain gets disabled, we get
>>>>>> following
>>>>>> external abort.
>>>
>>> + Jonghwan Choi
>>>
>>> Well, this is not a perfect solution to support MAU power domain,
>>> it's true it is a problem right now though.
>>>
>>> In other words, this is just temporal fix for the problem.
>>>
>>> How about accessing clock stuff for audio sub-system with handling
>>> MAU power domain via generic IO power domain?
>>>
>>
>> + Tomasz Figa
>>
>> Existing power domain driver exynos4_pm_init_power_domain is registered
>> with an arch_initcall whereas the clk-exynos-audss driver is registered
>> with core_initcall. Hence even if add mau_pd node to clk-exynos-audss
>> node, the binding with power-domain doesn't happen.
> 
> I'd say core_initcall is way too early for clk-exynos-audss driver. It
> should be at most subsys_initcall. As far as I can see, all users of
> clocks provided by this driver (i.e. i2s) are probed at device_initcall
> level anyway.
> 

It is also used by ADMA node, which gets probed.

>>
>> Alternately, if Tomasz's patches are applied [1], power-domain binding
>> is successful. But because of the init order, clk-exynos-audss defers
>> probe resulting in a kernel crash. Forcing clk-exynos-audss to register
>> through arch_initcall() fixes this issue, but I am not sure if that is
>> okay.
> 
> If the driver crashes on deferred probe, then it's a bug and it should
> be fixed.
> 

By the time clk-exynos-audss is getting called, mau_pd is already
disabled by power-domain driver. That is not getting enabled during
clk-exynos-audss probe. Am I missing something?


> Best regards,
> Tomasz


-- 
Tushar Behera

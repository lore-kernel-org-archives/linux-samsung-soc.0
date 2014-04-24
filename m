From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: dts: Remove mau_pd node for Exynos5420
Date: Thu, 24 Apr 2014 14:37:59 +0530
Message-ID: <5358D46F.2050303@linaro.org>
References: <1398145155-4615-1-git-send-email-tushar.behera@linaro.org> <CAGOxZ52CDOXyXDpy8h3NQ8=26Wn8jF=6_vzb+t370_GbPiHG0g@mail.gmail.com> <CAHbNUh2T8gOdGxDGm995vbj0oiJkyDwW9C9J7VV_o7mudfKjEw@mail.gmail.com> <03b001cf5edc$ae42e770$0ac8b650$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:59844 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752605AbaDXJIE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Apr 2014 05:08:04 -0400
Received: by mail-pa0-f46.google.com with SMTP id kp14so1715318pab.33
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Apr 2014 02:08:03 -0700 (PDT)
In-Reply-To: <03b001cf5edc$ae42e770$0ac8b650$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Alim Akhtar' <alim.akhtar@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, jhbird.choi@samsung.com, Tomasz Figa <t.figa@samsung.com>

On 04/23/2014 03:43 PM, Kukjin Kim wrote:
> Tushar Behera wrote:
>>
>> On 22 April 2014 13:08, Alim Akhtar <alim.akhtar@gmail.com> wrote:
>>> Hi Tushar
>>>
>>> On Tue, Apr 22, 2014 at 11:09 AM, Tushar Behera
>>> <tushar.behera@linaro.org> wrote:
>>>> MAU powerdomain provides clocks for Audio sub-system block. This block
>>>> comprises of the I2S audio controller, audio DMA blocks and Audio
>>>> sub-system clock registers.
>>>>
>>>> Right now, there is no way to hook up power-domains with clock
>> providers.
>>>> During late boot when this power-domain gets disabled, we get following
>>>> external abort.
> 
> + Jonghwan Choi
> 
> Well, this is not a perfect solution to support MAU power domain, it's true it is a problem right now though.
> 
> In other words, this is just temporal fix for the problem.
> 
> How about accessing clock stuff for audio sub-system with handling MAU power domain via generic IO power domain?
> 

+ Tomasz Figa

Existing power domain driver exynos4_pm_init_power_domain is registered
with an arch_initcall whereas the clk-exynos-audss driver is registered
with core_initcall. Hence even if add mau_pd node to clk-exynos-audss
node, the binding with power-domain doesn't happen.

Alternately, if Tomasz's patches are applied [1], power-domain binding
is successful. But because of the init order, clk-exynos-audss defers
probe resulting in a kernel crash. Forcing clk-exynos-audss to register
through arch_initcall() fixes this issue, but I am not sure if that is okay.

[1] http://www.spinics.net/lists/kernel/msg1728566.html

>>> ?? which abort?? Can you please mention it here?
>>>>
>>
>> Thanks Alim for spotting this ... I somehow missed adding this.
>>
>> <<<<
>> Unhandled fault: imprecise external abort (0x1406) at 0x00000000
>> Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000007
>>>>>>
>>
>> Kukjin,
>>
>> Let me know if I need to resend the patch.
> 
> - Kukjin
> 


-- 
Tushar Behera

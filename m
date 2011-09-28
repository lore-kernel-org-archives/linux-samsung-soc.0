From: Subash Patel <subashrp@gmail.com>
Subject: Re: boot failure of exynos4 on 3.1.0-rc7
Date: Wed, 28 Sep 2011 12:10:51 +0530
Message-ID: <4E82C173.60208@gmail.com>
References: <4E82BFC5.2020409@gmail.com> <CAH9JG2XqW+A1Y6US5TaavSt7vmkXWEMpiftH7fnOU5jnuNaJmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:54330 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751682Ab1I1Gk4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Sep 2011 02:40:56 -0400
Received: by iaqq3 with SMTP id q3so6558167iaq.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Sep 2011 23:40:56 -0700 (PDT)
In-Reply-To: <CAH9JG2XqW+A1Y6US5TaavSt7vmkXWEMpiftH7fnOU5jnuNaJmA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: linux-samsung-soc@vger.kernel.org

On 09/28/2011 12:07 PM, Kyungmin Park wrote:
> On Wed, Sep 28, 2011 at 3:33 PM, Subash Patel<subashrp@gmail.com>  wrote:
>> Hello,
>>
>> I am attempting to boot linux version in subject on SMDKV310 board[EVT0].
>> The booting stops after "Uncompressing Linux... done, booting the kernel."
>> After some debugging I found that the timer initialization fails.
>> exynos4_mct_frc_start() calls exynos4_mct_write(lo, EXYNOS4_MCT_G_CNT_L)
>> which fails to write to the register, which should have asserted
>> G-CNT_WSTAT[0] to 1. Hence panic() will be called which halts booting.
>>
>> I have booted 3.0.0-rc1 before this, which used PWM. I found a related
>> thread for C210, which I couldnt make head-tail out of it :(
>> http://www.spinics.net/lists/arm-kernel/msg140431.html
>>
>> Can anyone let me know if this is known issue and if there is a solution
>> available for this.
> Need to wait for sched_clock patch are merged. Before that, you need a
> workaround patch as universal_c210 does.
> Note that de-select the MCT timer since EVT0 doesn't have it.
This code is available in arch/arm/mach-exynos4/Kconfig

config EXYNOS4_MCT
         bool
         default y
         help
           Use MCT (Multi Core Timer) as kernel timers

Which I think is wrong, if EVT0 doesnt have the hardware. It should have 
had condition to check the silicon revision isn't it?

Regards,
Subash


>
> Thank you,
> Kyungmin Park
>>
>> Regards,
>> Subash
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
>> in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>

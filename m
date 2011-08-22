From: Amit Kachhap <amit.kachhap@linaro.org>
Subject: Re: [RFC PATCH 3/4] ARM: EXYNOS4: Add support AFTR mode cpuidle state
 on EXYNOS4210
Date: Mon, 22 Aug 2011 22:25:03 +0530
Message-ID: <CAK44p21rEqj=JL5PLmFQe0L62UUUJb_ogRpp-vdA3HjwK_+XHQ@mail.gmail.com>
References: <1313759340-31319-1-git-send-email-amit.kachhap@linaro.org>
	<1313759400-31347-3-git-send-email-amit.kachhap@linaro.org>
	<20110821171851.GG28546@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yi0-f46.google.com ([209.85.218.46]:38078 "EHLO
	mail-yi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751636Ab1HVQzE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Aug 2011 12:55:04 -0400
Received: by yie30 with SMTP id 30so3711906yie.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Aug 2011 09:55:03 -0700 (PDT)
In-Reply-To: <20110821171851.GG28546@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org, linux-arm-kernel@lists.infradead.org, patches@linaro.org

On 21 August 2011 22:48, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Fri, Aug 19, 2011 at 06:39:59PM +0530, Amit Daniel Kachhap wrote:
>> +ENTRY(exynos4_enter_lp)
>> + =A0 =A0 stmfd =A0 sp!, { r3 - r12, lr }
>> +
>> + =A0 =A0 adr =A0 =A0 r0, sleep_save_misc
>> +
>> + =A0 =A0 mrc =A0 =A0 p15, 0, r2, c15, c0, 0 =A0@ read power control=
 register
>> + =A0 =A0 str =A0 =A0 r2, [r0], #4
>> +
>> + =A0 =A0 mrc =A0 =A0 p15, 0, r2, c15, c0, 1 =A0@ read diagnostic re=
gister
>> + =A0 =A0 str =A0 =A0 r2, [r0], #4
>> +
>> + =A0 =A0 ldr =A0 =A0 r3, =3Dresume_with_mmu
>> + =A0 =A0 bl =A0 =A0 =A0cpu_suspend
>> +
>> + =A0 =A0 mov =A0 =A0 r0, sp
>> + =A0 =A0 bl =A0 =A0 =A0exynos4_cpu_lp
>> +
>> + =A0 =A0 /* Restore original sp */
>> + =A0 =A0 mov =A0 =A0 r0, sp
>> + =A0 =A0 add =A0 =A0 r0, r0, #4
>> + =A0 =A0 ldr =A0 =A0 sp, [r0]
>> +
>> + =A0 =A0 mov =A0 =A0 r0, #0
>> + =A0 =A0 b =A0 =A0 =A0 early_wakeup
>
> This is based upon old kernel code. =A0Clearly hasn't been tested wit=
h
> anything later than 3.0.
>
You are right. I will rebase it to the latest tree in the next
version. The main intention of the patch series (mostly patch 4) is to
collect information or issues on samsung platform with the new common
cpuidle framework.

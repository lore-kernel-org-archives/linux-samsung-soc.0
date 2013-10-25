From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 1/2] ARM: s3c64xx: cpuidle: convert to platform driver
Date: Sat, 26 Oct 2013 00:23:39 +0200
Message-ID: <526AEF6B.2000404@linaro.org>
References: <1382685074-16502-1-git-send-email-daniel.lezcano@linaro.org> <6431720.IUjkN7MGOG@thinkpad> <526AC2DF.2020904@linaro.org> <1953577.TBW5ixuUM5@thinkpad>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f54.google.com ([74.125.82.54]:36460 "EHLO
	mail-wg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751328Ab3JYWXn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Oct 2013 18:23:43 -0400
Received: by mail-wg0-f54.google.com with SMTP id c11so4457671wgh.33
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Oct 2013 15:23:42 -0700 (PDT)
In-Reply-To: <1953577.TBW5ixuUM5@thinkpad>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 10/25/2013 10:52 PM, Tomasz Figa wrote:
> On Friday 25 of October 2013 21:13:35 Daniel Lezcano wrote:
>> On 10/25/2013 12:39 PM, Tomasz Figa wrote:
>>> Hi Daniel,
>>>
>>> [Sending again, without HTML part. Sorry for the noise.]
>>>
>>> On Friday 25 of October 2013 09:11:13 Daniel Lezcano wrote:
>>>> The driver is tied with the pm low level code making difficult to
>>>> split
>>>> the driver into a more arch independent code. The platform driver
>>>> allows
>>>> to move the standby callback into the platform data field and use =
a
>>>> simple driver with no more dependency on the low level code.
>>>>
>>>> The standby callback has a portion of code to set the standby meth=
od
>>>> and
>>>> the effective cpu_do_idle switching the cpu to the right mode. As =
this
>>>> code is redundant in the cpu suspend code, it has been factored ou=
t
>>>> when
>>>> implementing the standby methdod.
>>>>
>>>> By this way, the driver is ready to be moved out to the
>>>> drivers/cpuidle.
>>>
>>> The idea itself is quite good, but unfortunately I have to NAK this=
=2E
>>> Please see details in comments below.
>>>
>>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>>>> ---
>>>>
>>>>    arch/arm/mach-s3c64xx/cpuidle.c |   38
>>>>
>>>> ++++++++++++++++---------------------- arch/arm/mach-s3c64xx/pm.c
>>>> |
>>>>
>>>>     33 ++++++++++++++++++++++++++------- 2 files changed, 42
>>>>
>>>> insertions(+), 29 deletions(-)
>>
>> [ ... ]
>>
>>>> -
>>>> -	tmp =3D __raw_readl(S3C64XX_PWR_CFG);
>>>> -	tmp &=3D ~S3C64XX_PWRCFG_CFG_WFI_MASK;
>>>> -	tmp |=3D S3C64XX_PWRCFG_CFG_WFI_SLEEP;
>>>
>>> Finally note the S3C64XX_PWRCFG_CFG_WFI_SLEEP flag here again.
>>
>> Ouch ! I missed it. Thanks for spotting the problem.
>>
>>> I believe it should be visible now what's wrong with this patch. To
>>> make
>>> sure it is, let me explain how the system controller of S3C64xx han=
dles
>>> WFI requests.
>>>
>>> When the CPU issues WFI request to the syscon, it takes an action
>>> depending on how it is configured. A bit field is there in one of
>>> syscon registers (S3C64XX_PWR_CFG) that selects what action to perf=
orm
>>> in case of WFI request.
>>>
>>> You can program the syscon to ignore the request, enter IDLE mode,
>>> enter
>>> STOP mode or enter SLEEP mode. As the names suggest, for cpuidle, i=
t
>>> needs to be programmed for IDLE mode and for system-wide sleep it
>>> needs to be set to SLEEP mode. STOP mode is not very useful as it h=
as
>>> mostly the same effect that can be achieved by performing fine-grai=
ned
>>> clock and power gating of peripherals manually, so it is unused by
>>> Linux.
>>
>> Yes, this is what I assumed but I missed the CFG_WFI_SLEEP flag, my =
eyes
>> read CFG_WFI_IDLE.
>>
>>> Now, my take on the issue you are trying to solve would be a bit
>>> different. Since the S3C64xx does not have any interesting cpuidle
>>> modes, just a normal, clock-gated WFI mode, it does not need to hav=
e a
>>> cpuidle driver at all. All that is needed is simply setting up the
>>> S3C64XX_PWRCFG_CFG_WFI field to S3C64XX_PWRCFG_CFG_WFI_IDLE early a=
t
>>> boot-up, then set it to S3C64XX_PWRCFG_CFG_WFI_SLEEP just before
>>> entering the sleep mode and restore it back to
>>> S3C64XX_PWRCFG_CFG_WFI_IDLE after waking up.
>> So you are suggesting to remove the cpuidle driver ?
>
> Exactly.

I see.

>> Won't it be worth to add a new WFI_SLEEP state to the cpuidle driver=
 ?
>
> I don't think so. How a suspend-to-RAM specific thing like WFI_SLEEP =
could
> be relevant to a cpuidle driver? (Unless there are some plans to
> consolidate STR with cpuidle that I haven't heard about...)

I finally found a documentation for the s3c6410x and the description of=
=20
the different modes. Indeed, the sleep mode is not adequate for a=20
cpuidle state. What about the 'stop' and 'deep stop' state ?

What is 'STR' ?

Thanks
   -- Daniel




--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

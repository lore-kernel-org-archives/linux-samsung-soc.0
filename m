From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 1/2] ARM: s3c64xx: cpuidle: convert to platform driver
Date: Fri, 25 Oct 2013 21:13:35 +0200
Message-ID: <526AC2DF.2020904@linaro.org>
References: <1382685074-16502-1-git-send-email-daniel.lezcano@linaro.org> <6431720.IUjkN7MGOG@thinkpad>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:52288 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753309Ab3JYTNk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Oct 2013 15:13:40 -0400
Received: by mail-wi0-f173.google.com with SMTP id ey11so1558213wid.6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Oct 2013 12:13:39 -0700 (PDT)
In-Reply-To: <6431720.IUjkN7MGOG@thinkpad>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 10/25/2013 12:39 PM, Tomasz Figa wrote:
> Hi Daniel,
>
> [Sending again, without HTML part. Sorry for the noise.]
>
> On Friday 25 of October 2013 09:11:13 Daniel Lezcano wrote:
>> The driver is tied with the pm low level code making difficult to sp=
lit
>> the driver into a more arch independent code. The platform driver al=
lows
>> to move the standby callback into the platform data field and use a
>> simple driver with no more dependency on the low level code.
>>
>> The standby callback has a portion of code to set the standby method=
 and
>> the effective cpu_do_idle switching the cpu to the right mode. As th=
is
>> code is redundant in the cpu suspend code, it has been factored out =
when
>> implementing the standby methdod.
>>
>> By this way, the driver is ready to be moved out to the drivers/cpui=
dle.
>
> The idea itself is quite good, but unfortunately I have to NAK this. =
Please
> see details in comments below.
>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>> ---
>>   arch/arm/mach-s3c64xx/cpuidle.c |   38
>> ++++++++++++++++---------------------- arch/arm/mach-s3c64xx/pm.c   =
   |
>>    33 ++++++++++++++++++++++++++------- 2 files changed, 42
>> insertions(+), 29 deletions(-)

[ ... ]

>> -
>> -	tmp =3D __raw_readl(S3C64XX_PWR_CFG);
>> -	tmp &=3D ~S3C64XX_PWRCFG_CFG_WFI_MASK;
>> -	tmp |=3D S3C64XX_PWRCFG_CFG_WFI_SLEEP;
>
> Finally note the S3C64XX_PWRCFG_CFG_WFI_SLEEP flag here again.

Ouch ! I missed it. Thanks for spotting the problem.

> I believe it should be visible now what's wrong with this patch. To m=
ake
> sure it is, let me explain how the system controller of S3C64xx handl=
es WFI
> requests.
>
> When the CPU issues WFI request to the syscon, it takes an action dep=
ending
> on how it is configured. A bit field is there in one of syscon regist=
ers
> (S3C64XX_PWR_CFG) that selects what action to perform in case of WFI
> request.
>
> You can program the syscon to ignore the request, enter IDLE mode, en=
ter
> STOP mode or enter SLEEP mode. As the names suggest, for cpuidle, it =
needs
> to be programmed for IDLE mode and for system-wide sleep it needs to =
be set
> to SLEEP mode. STOP mode is not very useful as it has mostly the same
> effect that can be achieved by performing fine-grained clock and powe=
r
> gating of peripherals manually, so it is unused by Linux.

Yes, this is what I assumed but I missed the CFG_WFI_SLEEP flag, my eye=
s=20
read CFG_WFI_IDLE.

> Now, my take on the issue you are trying to solve would be a bit diff=
erent.
> Since the S3C64xx does not have any interesting cpuidle modes, just a
> normal, clock-gated WFI mode, it does not need to have a cpuidle driv=
er at
> all. All that is needed is simply setting up the S3C64XX_PWRCFG_CFG_W=
=46I
> field to S3C64XX_PWRCFG_CFG_WFI_IDLE early at boot-up, then set it to
> S3C64XX_PWRCFG_CFG_WFI_SLEEP just before entering the sleep mode and
> restore it back to S3C64XX_PWRCFG_CFG_WFI_IDLE after waking up.

So you are suggesting to remove the cpuidle driver ?

Won't it be worth to add a new WFI_SLEEP state to the cpuidle driver ?

Thanks for the review.

   -- Daniel

--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

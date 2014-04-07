From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH V2 17/17] ARM: exynos: config: Enable cpuidle
Date: Mon, 07 Apr 2014 11:43:47 +0200
Message-ID: <53427353.2020303@linaro.org>
References: <1396618989-2897-1-git-send-email-daniel.lezcano@linaro.org> <1396618989-2897-18-git-send-email-daniel.lezcano@linaro.org> <5825506.2ErDt1UQ5r@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:41490 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754771AbaDGJnb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Apr 2014 05:43:31 -0400
Received: by mail-wg0-f49.google.com with SMTP id a1so6645687wgh.32
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Apr 2014 02:43:30 -0700 (PDT)
In-Reply-To: <5825506.2ErDt1UQ5r@amdc1032>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, rjw@rjwysocki.net, Rajeshwari Shinde <rajeshwari.shinde@linaro.org>

On 04/04/2014 06:09 PM, Bartlomiej Zolnierkiewicz wrote:
>
> On Friday, April 04, 2014 03:43:09 PM Daniel Lezcano wrote:
>> The cpuidle driver is broken since v3.11 and now we are at v3.14.
>>
>> Default the cpuidle driver to favorize a better detection next time.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>> Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
>> ---
>>   arch/arm/configs/exynos_defconfig |    1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/ex=
ynos_defconfig
>> index 4ce7b70..6ed4b34 100644
>> --- a/arch/arm/configs/exynos_defconfig
>> +++ b/arch/arm/configs/exynos_defconfig
>> @@ -132,3 +132,4 @@ CONFIG_DEBUG_INFO=3Dy
>>   CONFIG_DEBUG_USER=3Dy
>>   CONFIG_CRYPTO_SHA256=3Dy
>>   CONFIG_CRC_CCITT=3Dy
>> +CONFIG_CPU_IDLE=3Dy
>
> Sorry but I have to NAK this change.  There are three issues with AFT=
R
> mode that should be resolved first before this patch can be merged:
>
> * The upstream Exynos cpuidle code lacks support for secure firmware =
and
>    it is used on i.e. Trats2 boards (Exynos4412).  Attempts to use AF=
TR on
>    such hardware results in oops + lockup.
>    I have patches adding secure firmware support to Exynos cpuidle dr=
iver
>    but they depend on Tomasz Figa's PM changes which are not yet upst=
ream.

Ok.

> * Somebody needs to verify that the current Exynos cpuidle driver wor=
ks
>    in the AFTR mode on Exynos5420 for which support has been added re=
cently
>    (I really doubt it looking at some internal trees).

Rajeshwari (cc'ed) is working on creating a big.Little driver for this=20
board, so it will be a separate cpuidle driver.

> * Some of our u-boot bootloader versions are incompatible with AFTR. =
 We
>    have observed the problem happening on Trats board (Exynos4210) on=
 which
>    it can be fixed by using the upstream u-boot version and Universal=
 C210
>    board (Exynos4210 with broken SMP support) on which there is no up=
stream
>    u-boot available (IIRC) and because of the broken SMP support enab=
ling
>    cpuidle results in attempt to enter AFTR during boot + immediate l=
ockup.
>
>    I know that this is mainly our problem but the issue is widespread=
 on
>    our targets and I believe that adding some workaround for it in cp=
uidle
>    core would be beneficial for the whole cpuidle subsystem.  Namely =
there
>    should be some way of telling cpuidle subsystem to either disable
>    particular state(s) or limit the max available state.  I think tha=
t this
>    can be also useful for testing and development of other cpuidle dr=
ivers.
>
> For now please change this patch to add CONFIG_CPU_IDLE=3Dn instead (=
since
> the config option is "default y" it will be auto-enabled if there is =
no
> entry in the defconfig)..

Ok.

Kukjin, is it possible you merge patches 1->16 ?

Thanks

   -- Daniel

> --
> Bartlomiej Zolnierkiewicz
> Samsung R&D Institute Poland
> Samsung Electronics
>


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

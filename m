From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [RFC] ARM: exynos: MCPM: [is this a] fix for secondary boot on 5422?
Date: Mon, 15 Jun 2015 11:53:54 -0700
Message-ID: <7h1thc6bwd.fsf@deeprootsystems.com>
References: <1416896510-24612-1-git-send-email-khilman@kernel.org>
	<CAJKOXPfLEV1sQsz87ULDKX4vijqRpbGj7AcOEDiy83kukvVKVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:34667 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754453AbbFOSx7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jun 2015 14:53:59 -0400
Received: by pacgb13 with SMTP id gb13so40702228pac.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2015 11:53:58 -0700 (PDT)
In-Reply-To: <CAJKOXPfLEV1sQsz87ULDKX4vijqRpbGj7AcOEDiy83kukvVKVg@mail.gmail.com>
	("Krzysztof =?utf-8?Q?Koz=C5=82owski=22's?= message of "Sun, 14 Jun 2015
 17:56:20 +0900")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof =?utf-8?Q?Koz=C5=82owski?= <k.kozlowski.k@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org, Olof Johansson <olof@lixom.net>, Mauro Ribeiro <mauro.ribeiro@hardkernel.com>, Abhilash Kesavan <a.kesavan@samsung.com>, Andrew Bresticker <abrestic@chromium.org>, Doug Anderson <dianders@chromium.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, =?utf-8?Q?Bart=C5=82omiej_=C5=BBo?= =?utf-8?Q?=C5=82nierkiewicz?= <b.zolnierkie@samsung.com>, Kukjin Kim <kgene@kernel.org>

Krzysztof Koz=C5=82owski <k.kozlowski.k@gmail.com> writes:

> 2014-11-25 15:21 GMT+09:00 Kevin Hilman <khilman@kernel.org>:
>> From: Kevin Hilman <khilman@linaro.org>
>>
>> Using the current exynos_defconfig on the exynos5422-odroid-xu3, onl=
y
>> 6 of 8 CPUs come online with MCPM boot.  CPU0 is an A7, CPUs 1-4 are
>> A15s and CPU5-7 are the other A7s, but with the current code, CPUs 5
>> and 7 do not boot:
>>
>>    [...]
>>    Exynos MCPM support installed
>>    CPU1: update cpu_capacity 1535
>>    CPU1: thread -1, cpu 0, socket 0, mpidr 80000000
>>    CPU2: update cpu_capacity 1535
>>    CPU2: thread -1, cpu 1, socket 0, mpidr 80000001
>>    CPU3: update cpu_capacity 1535
>>    CPU3: thread -1, cpu 2, socket 0, mpidr 80000002
>>    CPU4: update cpu_capacity 1535
>>    CPU4: thread -1, cpu 3, socket 0, mpidr 80000003
>>    CPU5: failed to come online
>>    CPU6: update cpu_capacity 448
>>    CPU6: thread -1, cpu 2, socket 1, mpidr 80000102
>>    CPU7: failed to come online
>>    Brought up 6 CPUs
>>    CPU: WARNING: CPU(s) started in wrong/inconsistent modes
>>    (primary CPU mode 0x13)
>>    CPU: This may indicate a broken bootloader or firmware.
>>
>> Thanks to a tip from Abhilash, this patch gets all 8 CPUs booting
>> again, but the warning about CPUs started in inconsistent modes
>> remains.  Also, not being terribly familiar with Exynos internals,
>> it's not at all obvious to me why this register write (done for *all=
*
>> secondaries) makes things work works for the 2 secondary CPUs that
>> didn't come online.  It's also not obvious whether this is the right
>> general fix, since it doesn't seem to be needed on other 542x or 580=
0
>> platforms.
>>
>> I suspect the "right" fix is in the bootloader someplace, but not
>> knowing this hardware well, I'm not sure if the fix is in u-boot
>> proper, or somewhere in the binary blobs (bl1/bl2/tz) that start
>> before u-boot.  The u-boot I'm using is from the hardkernel u-boot
>> repo[1], and I'd welcome any suggestions to try.  I'm able to rebuil=
d
>> my own u-boot from there, but only have binaries for bl1/bl2/tz.
>>
>> [1] branch "odroidxu3-v2012.07" of: https://github.com/hardkernel/u-=
boot.git
>>
>>
>> Cc: Mauro Ribeiro <mauro.ribeiro@hardkernel.com>
>> Cc: Abhilash Kesavan <a.kesavan@samsung.com>,
>> Cc: Andrew Bresticker <abrestic@chromium.org>
>> Cc: Doug Anderson <dianders@chromium.org>
>> Cc: Nicolas Pitre <nicolas.pitre@linaro.org>
>> Signed-off-by: Kevin Hilman <khilman@linaro.org>
>> ---
>>  arch/arm/mach-exynos/mcpm-exynos.c | 2 ++
>>  arch/arm/mach-exynos/regs-pmu.h    | 1 +
>>  2 files changed, 3 insertions(+)
>
> Hi,
>
> +Cc Marek, Bartlomiej, Kukjin Kim,
>
>
> I would like to bring back this topic. Unfortunately I don't have
> access to source code of BL1 (or any other firmware blob) so my
> knowledge here comes mostly from experimenting and from looking at
> sources of vendor kernel for Gear 2 (Exynos3250) and SM-G900H (Galaxy
> S5, Exynos5422).
>
> It seems that some booting firmware (I would suspect BL1 because this
> ships Samsung to Hardkernel) uses SPARE2 as synchronization mechanism=
=2E
> For example vendor kernel, when booting little core, it waits till
> SPARE2=3D=3D1 and then executes software reset for this core.
>
> Observations shown that BL1 for Odroid, when booting secondary little=
 core:
> 1. Expects that SPARE2 register will be initialized to 1.
> 2. If it is, then it sets it to 0, proceeds further and little core b=
oots.
> 3. If it is not, then it sets it to 1 and waits. Maybe this is a
> notification to userspace - reset me please!
>
> Unfortunately executing software reset in that time (at point 3)
> stopped kernel from booting. No logs/dmesg and I was unable to turn o=
n
> early printk.
>
> The answer why two of little cores boot is quite simple now. At
> beginning the SPARE2=3D=3D0 so first little core will set it to 1 and=
 wait
> till software reset. Kernel timeouts on this CPU bring up so it start=
s
> the sequence for next little core. Now the SPARE2=3D=3D1 so the core =
boots
> fine and SPARE2 is set to 0. The last little core starts from
> SPARE2=3D=3D0, sets it to 1 and waits for software reset.
>
> Since no one knows how this exactly works and we are stuck with BL1
> provided as is, then IMHO the patch makes sense.
>
> Kevin, can you refresh the patch?
> It would be nice to:
> 1. set SPARE2 only for Odroid (of_machine_is_compatible()),
> 2. extend the explanation.

I'd rather someone else refresh this patch who actually understands
what's going on here and could write a descriptive changelog.  I have n=
o
claims to the authorship as Abhilash is the one who suggested this fix
in the first place.

Also, please note that 8 cores booting doesn't mean all 8 cores fully
working.  This firmware is still horribly broken for low-power modes.

Even with all 8 cores enabled, the firmware also as CCI left in secure
mode which means the kernel MCPM cannot manage CCI, and thus cannot hit
any low-power states.  If CPUidle is enabled, the kernel will hang as
soon as any MCPM state is attempted.  In order to get WFI-only CPUidle
working, I've also had to disable CCI in the DTS by appending something
like this to the board DTS file:

&cci {
     status =3D "disabled";
};

All of this though makes me wonder how the hardkernel kernel actually
does any low-power idle.  Is it relying on firmware for this?  I have a
hard time believe that the firmware would be able to handle this in a
race-free way.

Kevin

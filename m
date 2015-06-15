From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [RFC] ARM: exynos: MCPM: [is this a] fix for secondary boot on
 5422?
Date: Mon, 15 Jun 2015 12:07:23 +0200
Message-ID: <2692641.0572IpMyUN@amdc1976>
References: <1416896510-24612-1-git-send-email-khilman@kernel.org>
 <CAJKOXPfLEV1sQsz87ULDKX4vijqRpbGj7AcOEDiy83kukvVKVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:34737 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753986AbbFOKID convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jun 2015 06:08:03 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NPZ0171RDHB0N20@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 15 Jun 2015 19:07:59 +0900 (KST)
In-reply-to: <CAJKOXPfLEV1sQsz87ULDKX4vijqRpbGj7AcOEDiy83kukvVKVg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof =?utf-8?B?S296xYJvd3NraQ==?= <k.kozlowski.k@gmail.com>
Cc: Kevin Hilman <khilman@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org, Olof Johansson <olof@lixom.net>, Mauro Ribeiro <mauro.ribeiro@hardkernel.com>, Abhilash Kesavan <a.kesavan@samsung.com>, Andrew Bresticker <abrestic@chromium.org>, Doug Anderson <dianders@chromium.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Przemyslaw Marczak <p.marczak@samsung.com>


Hi,

+ Cc Przemyslaw Marczak (he is working on fixing u-boot fox XU3)

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

On Sunday, June 14, 2015 05:56:20 PM Krzysztof Koz=C5=82owski wrote:
> 2014-11-25 15:21 GMT+09:00 Kevin Hilman <khilman@kernel.org>:
> > From: Kevin Hilman <khilman@linaro.org>
> >
> > Using the current exynos_defconfig on the exynos5422-odroid-xu3, on=
ly
> > 6 of 8 CPUs come online with MCPM boot.  CPU0 is an A7, CPUs 1-4 ar=
e
> > A15s and CPU5-7 are the other A7s, but with the current code, CPUs =
5
> > and 7 do not boot:
> >
> >    [...]
> >    Exynos MCPM support installed
> >    CPU1: update cpu_capacity 1535
> >    CPU1: thread -1, cpu 0, socket 0, mpidr 80000000
> >    CPU2: update cpu_capacity 1535
> >    CPU2: thread -1, cpu 1, socket 0, mpidr 80000001
> >    CPU3: update cpu_capacity 1535
> >    CPU3: thread -1, cpu 2, socket 0, mpidr 80000002
> >    CPU4: update cpu_capacity 1535
> >    CPU4: thread -1, cpu 3, socket 0, mpidr 80000003
> >    CPU5: failed to come online
> >    CPU6: update cpu_capacity 448
> >    CPU6: thread -1, cpu 2, socket 1, mpidr 80000102
> >    CPU7: failed to come online
> >    Brought up 6 CPUs
> >    CPU: WARNING: CPU(s) started in wrong/inconsistent modes
> >    (primary CPU mode 0x13)
> >    CPU: This may indicate a broken bootloader or firmware.
> >
> > Thanks to a tip from Abhilash, this patch gets all 8 CPUs booting
> > again, but the warning about CPUs started in inconsistent modes
> > remains.  Also, not being terribly familiar with Exynos internals,
> > it's not at all obvious to me why this register write (done for *al=
l*
> > secondaries) makes things work works for the 2 secondary CPUs that
> > didn't come online.  It's also not obvious whether this is the righ=
t
> > general fix, since it doesn't seem to be needed on other 542x or 58=
00
> > platforms.
> >
> > I suspect the "right" fix is in the bootloader someplace, but not
> > knowing this hardware well, I'm not sure if the fix is in u-boot
> > proper, or somewhere in the binary blobs (bl1/bl2/tz) that start
> > before u-boot.  The u-boot I'm using is from the hardkernel u-boot
> > repo[1], and I'd welcome any suggestions to try.  I'm able to rebui=
ld
> > my own u-boot from there, but only have binaries for bl1/bl2/tz.
> >
> > [1] branch "odroidxu3-v2012.07" of: https://github.com/hardkernel/u=
-boot.git
> >
> >
> > Cc: Mauro Ribeiro <mauro.ribeiro@hardkernel.com>
> > Cc: Abhilash Kesavan <a.kesavan@samsung.com>,
> > Cc: Andrew Bresticker <abrestic@chromium.org>
> > Cc: Doug Anderson <dianders@chromium.org>
> > Cc: Nicolas Pitre <nicolas.pitre@linaro.org>
> > Signed-off-by: Kevin Hilman <khilman@linaro.org>
> > ---
> >  arch/arm/mach-exynos/mcpm-exynos.c | 2 ++
> >  arch/arm/mach-exynos/regs-pmu.h    | 1 +
> >  2 files changed, 3 insertions(+)
>=20
> Hi,
>=20
> +Cc Marek, Bartlomiej, Kukjin Kim,
>=20
>=20
> I would like to bring back this topic. Unfortunately I don't have
> access to source code of BL1 (or any other firmware blob) so my
> knowledge here comes mostly from experimenting and from looking at
> sources of vendor kernel for Gear 2 (Exynos3250) and SM-G900H (Galaxy
> S5, Exynos5422).
>=20
> It seems that some booting firmware (I would suspect BL1 because this
> ships Samsung to Hardkernel) uses SPARE2 as synchronization mechanism=
=2E
> For example vendor kernel, when booting little core, it waits till
> SPARE2=3D=3D1 and then executes software reset for this core.
>=20
> Observations shown that BL1 for Odroid, when booting secondary little=
 core:
> 1. Expects that SPARE2 register will be initialized to 1.
> 2. If it is, then it sets it to 0, proceeds further and little core b=
oots.
> 3. If it is not, then it sets it to 1 and waits. Maybe this is a
> notification to userspace - reset me please!
>=20
> Unfortunately executing software reset in that time (at point 3)
> stopped kernel from booting. No logs/dmesg and I was unable to turn o=
n
> early printk.
>=20
> The answer why two of little cores boot is quite simple now. At
> beginning the SPARE2=3D=3D0 so first little core will set it to 1 and=
 wait
> till software reset. Kernel timeouts on this CPU bring up so it start=
s
> the sequence for next little core. Now the SPARE2=3D=3D1 so the core =
boots
> fine and SPARE2 is set to 0. The last little core starts from
> SPARE2=3D=3D0, sets it to 1 and waits for software reset.
>=20
> Since no one knows how this exactly works and we are stuck with BL1
> provided as is, then IMHO the patch makes sense.
>=20
> Kevin, can you refresh the patch?
> It would be nice to:
> 1. set SPARE2 only for Odroid (of_machine_is_compatible()),
> 2. extend the explanation.
>=20
>=20
> Best regards,
> Krzysztof

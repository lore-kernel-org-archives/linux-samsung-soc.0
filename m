From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: Map SYSRAM through generic SRAM bindings
Date: Fri, 2 May 2014 09:17:38 +0530
Message-ID: <CAK9yfHz3khXdZEL=9iv+FHTMpR-1M=z1MCvCg4tP7JNd+oVwKA@mail.gmail.com>
References: <1398941085-10224-1-git-send-email-sachin.kamat@linaro.org>
	<11106990.1tS5A7pf5r@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <11106990.1tS5A7pf5r@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Heiko,

On 1 May 2014 18:57, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrote:
> Hi Sachin,
>
> Am Donnerstag, 1. Mai 2014, 16:14:44 schrieb Sachin Kamat:
>> Instead of hardcoding the SYSRAM details for each SoC,
>> pass this information through device tree (DT) and make
>> the code SoC agnostic. Generic SRAM bindings are used
>> for achieving this.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>
> very cool :-).

Thanks :)

>
> I've found one little thing I do not understand, which I describe bel=
ow.
> Otherwise
> Acked-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>
>> ---
>> This patch is based on linux next (next-20140501) on top of
>> my Kconfig consolidation patch
>> http://comments.gmane.org/gmane.linux.kernel.samsung-soc/28642
>>
>> Tested on 4210/4412 Origen, 5250/5420 Arndale and SMDK5420 boards.
>> ---
>>  arch/arm/Kconfig                                |    1 +
>>  arch/arm/boot/dts/exynos4210-universal_c210.dts |   17 ++++++
>>  arch/arm/boot/dts/exynos4210.dtsi               |   18 +++++++
>>  arch/arm/boot/dts/exynos4x12.dtsi               |   18 +++++++
>>  arch/arm/boot/dts/exynos5250.dtsi               |   18 +++++++
>>  arch/arm/boot/dts/exynos5420.dtsi               |   18 +++++++
>>  arch/arm/mach-exynos/common.h                   |    1 +
>>  arch/arm/mach-exynos/exynos.c                   |   64
>> ----------------------- arch/arm/mach-exynos/firmware.c             =
    |
>>  5 +-
>>  arch/arm/mach-exynos/include/mach/map.h         |    7 ---
>>  arch/arm/mach-exynos/platsmp.c                  |   39 ++++++++++++=
+-
>>  11 files changed, 133 insertions(+), 73 deletions(-)
>>
>> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
>> index a6aaaad19b1a..f66ea9453df9 100644
>> --- a/arch/arm/Kconfig
>> +++ b/arch/arm/Kconfig
>> @@ -855,6 +855,7 @@ config ARCH_EXYNOS
>>       select S5P_DEV_MFC
>>       select SAMSUNG_DMADEV
>>       select SPARSE_IRQ
>> +     select SRAM
>>       select USE_OF
>>       help
>>         Support for SAMSUNG's EXYNOS SoCs (EXYNOS4/5)
>> diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts
>> b/arch/arm/boot/dts/exynos4210-universal_c210.dts index
>> 63e34b24b04f..8d4de5c0d0c7 100644
>> --- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
>> +++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
>> @@ -28,6 +28,23 @@
>>               bootargs =3D "console=3DttySAC2,115200N8 root=3D/dev/m=
mcblk0p5 rw rootwait
>> earlyprintk panic=3D5 maxcpus=3D1"; };
>>
>> +     sram@02020000 {
>> +             status =3D "disabled";
>> +     };
>> +
>> +     sram@02025000 {
>> +             compatible =3D "mmio-sram";
>> +             reg =3D <0x02025000 0x1000>;
>> +             #address-cells =3D <1>;
>> +             #size-cells =3D <1>;
>> +             ranges =3D <0 0x02025000 0x1000>;
>> +
>> +             smp-sram@0 {
>> +                     compatible =3D "samsung,exynos4210-sram";
>> +                     reg =3D <0x0 0x1000>;
>> +             };
>> +     };
>
> exynos_smp_prepare_sram returns -ENODEV if it can't find
> samsung,exynos4210-sram-ns, so are you sure your universal_c210 will =
run
> without it? I didn't dig to deep into this, so it can also simply be =
something
> I overlooked :-)

Actually I do not have a universal_c210 board and hence could not
check on it and
thus this point got overlooked. Thanks for spotting it and you are
right. There shouldn't
be a error return if second node is not present as it is optional. I
will modify accordingly
and send this patch again. Thanks for your review and Ack :)

--=20
With warm regards,
Sachin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

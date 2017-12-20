From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/4] ARM: dts: add Samsung's exynos4412-based midas boards
Date: Wed, 20 Dec 2017 16:39:34 +0100
Message-ID: <CAJKOXPeL1JhwbZsLNEcVMh2iNCgh1f20EmRxFi57Hqs=njivwA@mail.gmail.com>
References: <20171218123805.26345-1-simon@lineageos.org> <20171218123805.26345-4-simon@lineageos.org>
 <CAJKOXPf4H6kSXJCSaVBPr9G1yNw9FjCUT+fox2V++Nyrco5bQA@mail.gmail.com> <20171220153315.GB23127@lineageos.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171220153315.GB23127-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Dec 20, 2017 at 4:33 PM, Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org> wrote:
> Hi Krzysztof,
>
> On Wed, Dec 20, 2017 at 03:08:27PM +0100, Krzysztof Kozlowski wrote:
>> On Mon, Dec 18, 2017 at 1:38 PM, Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org> wrote:
>> > "midas" is the codename for a family of smartphones released by Samsung
>> > Mobile. It includes the Galaxy S3 (GT-I9300/I9305) and the Galaxy
>> > Note 2 (GT-N7100/N7105). The boards largely have the same peripherals:
>> > the main differences are touchscreen, display panel and cellular modem.
>> >
>> > Signed-off-by: Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>
>> > ---
>> >  arch/arm/boot/dts/Makefile          |  3 +++
>> >  arch/arm/boot/dts/exynos4412-m0.dts | 27 +++++++++++++++++++++++++
>> >  arch/arm/boot/dts/exynos4412-m3.dts | 14 +++++++++++++
>> >  arch/arm/boot/dts/exynos4412-t0.dts | 40 +++++++++++++++++++++++++++++++++++++
>> >  4 files changed, 84 insertions(+)
>> >  create mode 100644 arch/arm/boot/dts/exynos4412-m0.dts
>> >  create mode 100644 arch/arm/boot/dts/exynos4412-m3.dts
>> >  create mode 100644 arch/arm/boot/dts/exynos4412-t0.dts
>> >
>> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> > index 66e28af289da..035abd66b472 100644
>> > --- a/arch/arm/boot/dts/Makefile
>> > +++ b/arch/arm/boot/dts/Makefile
>> > @@ -164,11 +164,14 @@ dtb-$(CONFIG_ARCH_EXYNOS4) += \
>> >         exynos4210-trats.dtb \
>> >         exynos4210-universal_c210.dtb \
>> >         exynos4412-itop-elite.dtb \
>> > +       exynos4412-m0.dtb \
>> > +       exynos4412-m3.dtb \
>> >         exynos4412-odroidu3.dtb \
>> >         exynos4412-odroidx.dtb \
>> >         exynos4412-odroidx2.dtb \
>> >         exynos4412-origen.dtb \
>> >         exynos4412-smdk4412.dtb \
>> > +       exynos4412-t0.dtb \
>> >         exynos4412-tiny4412.dtb \
>> >         exynos4412-trats2.dtb
>> >  dtb-$(CONFIG_ARCH_EXYNOS5) += \
>> > diff --git a/arch/arm/boot/dts/exynos4412-m0.dts b/arch/arm/boot/dts/exynos4412-m0.dts
>> > new file mode 100644
>> > index 000000000000..56c1ea6b5695
>> > --- /dev/null
>> > +++ b/arch/arm/boot/dts/exynos4412-m0.dts
>> > @@ -0,0 +1,27 @@
>> > +/*
>> > + * Samsung's Exynos4412 based M0 (GT-I9300) board device tree source
>> > + *
>> > + * Copyright (c) 2013 Samsung Electronics Co., Ltd.
>> > + *             http://www.samsung.com
>> > + *
>> > + * Device tree source file for Samsung's M0 board which is based on
>> > + * Samsung's Exynos4412 SoC.
>> > + *
>> > + * This program is free software; you can redistribute it and/or modify
>> > + * it under the terms of the GNU General Public License version 2 as
>> > + * published by the Free Software Foundation.
>> > + */
>> > +
>> > +/dts-v1/;
>> > +#include "exynos4412-galaxy-s3.dtsi"
>> > +
>> > +/ {
>> > +       model = "Samsung M0 (GT-I9300) based on Exynos4412";
>> > +       compatible = "samsung,m0", "samsung,midas", "samsung,exynos4412", "samsung,exynos4";
>> > +
>> > +       memory@40000000 {
>> > +               device_type = "memory";
>> > +               reg =  <0x40000000 0x40000000>;
>>
>> I think each board has the same memory so maybe this can be made part
>> of midas.dtsi?
>
> T0 and M3 have 2GB of RAM, trats2/M0 have 1GB.

Ah, ok.

>
>>
>> > +       };
>>
>> What about bootargs?
>
> Handled by the bootloader - to work around the proprietary bootloader not
> supporting device tree and requiring hacks to successfully boot a
> mainline kernel, i'm using kexec from a suitably patched kernel to load
> and boot the "real" kernel. (This also means one image can be used
> across all boards).

Could you document it in DTS why bootargs are missing?

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

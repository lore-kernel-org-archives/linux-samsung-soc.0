From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] arm: exynos4: Add support for dt irq specifier to linux
 virq conversion
Date: Sun, 31 Jul 2011 22:11:29 +0100
Message-ID: <CAJuYYwShEZuM1xLcfxF-=HppP9hUYi1Ukoicxycedf4R7mdWEQ@mail.gmail.com>
References: <1311791068-29933-1-git-send-email-thomas.abraham@linaro.org>
	<20110731034653.GF24334@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:37889 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752718Ab1GaVL3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 31 Jul 2011 17:11:29 -0400
Received: by gxk21 with SMTP id 21so3169883gxk.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Jul 2011 14:11:29 -0700 (PDT)
In-Reply-To: <20110731034653.GF24334@ponder.secretlab.ca>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, nala.la@samsung.com, kgene.kim@samsung.com, chaos.youn@samsung.com

Hi Grant,

On 31 July 2011 04:46, Grant Likely <grant.likely@secretlab.ca> wrote:
> On Wed, Jul 27, 2011 at 11:54:28PM +0530, Thomas Abraham wrote:
>> Exynos4 includes two interrupt controllers - External GIC and Extern=
al
>> Interrupt Combiner. External GIC can handle 16 software generated
>> interrupts (SGI), 16 Private Peripheral Interrupts (PPI) and 128
>> Shared Peripheral Interrupts (SPI). External Interrupt Combiner mana=
ges
>> 32 groups of 8 interrupts each and feeds 32 interrupts as SPI interr=
upts
>> to the External GIC controller.
>>
>> This patch supports conversion of device tree interrupt specifier to
>> linux virq domain for both the interrupt controllers. The concept of
>> this patch is derived from Grant's 'simple' irq converter.
>>
>> This patch is based on Grant's following patchset
>> [PATCH v3 0/2] Simple irq_domain implementation
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>> =A0Documentation/devicetree/bindings/arm/samsung.txt | =A0 72 ++++++=
+++++++
>> =A0arch/arm/mach-exynos4/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 =A01 +
>> =A0arch/arm/mach-exynos4/include/mach/irqs.h =A0 =A0 =A0 =A0 | =A0 =A0=
3 +
>> =A0arch/arm/mach-exynos4/irqdomain.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0117 +++++++++++++++++++++
>> =A0arch/arm/mach-exynos4/mach-exynos4-dt.c =A0 =A0 =A0 =A0 =A0 | =A0=
 =A08 +-
>> =A05 files changed, 196 insertions(+), 5 deletions(-)
>> =A0create mode 100644 arch/arm/mach-exynos4/irqdomain.c
>>
>> diff --git a/Documentation/devicetree/bindings/arm/samsung.txt b/Doc=
umentation/devicetree/bindings/arm/samsung.txt

[...]

>> +
>> +External GIC properties:
>> + =A0- compatible: should be "samsung,exynos4-ext-gic".
>> + =A0- interrupt-cells: should be <2>. The meaning of the cells are
>> + =A0 =A0 =A0* First Cell: Interrupt Number.
>> + =A0 =A0 =A0* Second Cell: Type of Interrupt (0-SPI, 1-SGI, 2-PPI).
>
> Type should probably be the first cell. =A0That's how this has been
> handled in the past for other hardware. =A0Also, the gic binding is
> going to be shared for a bunch of ARM hardware, not just Exynos. =A0C=
an
> you split this patch into two parts; one for gic and one for the
> exynos combiner?

Ok. I will split this patch and change the order of the cells.

>
>> + =A0- reg: The GIC includes a Distributor Interface and CPU Interfa=
ce and
>> + =A0 =A0hence requires two base addresses. The property format is
>> + =A0 =A0<Distributor-Base Distributor-Size>, <CPU-Base CPU Size>
>> +
>> + =A0Example:
>> +
>> + =A0 =A0 EXT_GIC:interrupt-controller@10490000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,exynos4-ext-gic";
>> + =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <2>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
>> + =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x10490000 0x1000>, <0x10480000 0=
x100>;
>> + =A0 =A0 };
>> +
>> + =A0Devices using External GIC as the interrupt parent should speci=
fy two
>> + =A0cells for the interrupts property as shown below.
>> +
>> + =A0 =A0 watchdog@10060000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,s3c2410-wdt";
>> + =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x10060000 0x400>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D <&EXT_GIC>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <43 0>;
>> + =A0 =A0 };
>> +
>> +External Interrupt Combiner properties:
>> + =A0- compatible: should be "samsung,exynos4-ext-combiner".
>> + =A0- interrupt-cells: should be <2>. The meaning of the cells are
>> + =A0 =A0 =A0* First Cell: Combiner Group Number.
>> + =A0 =A0 =A0* Second Cell: Interrupt within the group.
>
> I was under the impression that the irq groupings are programmable,
> and that the combiner irq inputs are a flat numbering layout. =A0Is t=
hat
> correct? =A0If so, then #interrupt-cells should probably be 1, and th=
e
> grouping should probably be configuration properties on the combiner
> node.

Each interrupt group in a combiner has fixed set of interrupts and is
not programmable. Each irq input to a interrupt group combiner has a
fixed number. So there is no programmable irq numbers supported by the
irq-combiner.

>
>> + =A0- reg: Base address and size of interrupt combiner registers.
>> +
>> + =A0Example:
>> +
>> + =A0 =A0 EXT_COMBINER:interrupt-controller@10440000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,exynos4-ext-combin=
er";
>> + =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <2>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
>> + =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x10440000 0x200>;
>> + =A0 =A0 };
>> +
>> + =A0Devices using External Interrupt Combiner as the interrupt pare=
nt should
>> + =A0specify two cells for the interrupts property as shown below.
>> +
>> + =A0 =A0 watchdog@10060000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,s3c2410-wdt";
>> + =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x10060000 0x400>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D <&EXT_COMBINER>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <4 2>;
>> + =A0 =A0 };

[...]

>> +
>> +/*
>> + * The interrupt specifier for External GIC controller uses to two =
cells in
>> + * the device tree source file. The second cell denotes the type of=
 the
>> + * interrupt (SPI/SGI/PPI). The following macros are used to repres=
ent
>> + * these different types of interrupt.
>> + */
>> +#define =A0 =A0 =A0EXT_GIC_SPI =A0 =A0 0
>> +#define =A0 =A0 =A0EXT_GIC_SGI =A0 =A0 1
>> +#define =A0 =A0 =A0EXT_GIC_PPI =A0 =A0 2
>
> Nit: I prefer enums over preprocessor macros, but not a big deal.
>

Ok. I will add a enum for the type of GIC interrupt.

Thanks for your comments on the patch.

Regards,
Thomas.

[...]

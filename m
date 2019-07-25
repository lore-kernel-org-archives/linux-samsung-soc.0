From: Guillaume Gardet <Guillaume.Gardet@arm.com>
Subject: RE: [PATCH V2 1/2] arm: dts: exynos: Add GPU/Mali T604 node to
 exynos5250
Date: Thu, 25 Jul 2019 12:37:33 +0000
Message-ID: <DBBPR08MB46788EBBB3BF3BB8C54FAD1283C10@DBBPR08MB4678.eurprd08.prod.outlook.com>
References: <20190724072008.6272-1-guillaume.gardet@free.fr>
 <20190725083433.6505-1-guillaume.gardet@arm.com>
 <CAJKOXPejSxxH5DJPyEHTt=VEOdVgiXOm1c3MKKir-qRxtDcLLA@mail.gmail.com>
 <DBBPR08MB4678546DF9EE76EE6427DBB783C10@DBBPR08MB4678.eurprd08.prod.outlook.com>
 <CAJKOXPdLd5C0FPwijGwTWW9t46exysdqgeb07txPhp-f_b5DFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAJKOXPdLd5C0FPwijGwTWW9t46exysdqgeb07txPhp-f_b5DFA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: 25 July 2019 14:27
> To: Guillaume Gardet <Guillaume.Gardet@arm.com>
> Cc: linux-samsung-soc@vger.kernel.org; Kukjin Kim <kgene@kernel.org>; linux-
> arm-kernel@lists.infradead.org
> Subject: Re: [PATCH V2 1/2] arm: dts: exynos: Add GPU/Mali T604 node to
> exynos5250
>
> On Thu, 25 Jul 2019 at 13:35, Guillaume Gardet <Guillaume.Gardet@arm.com>
> wrote:
> >
> >
> >
> > > -----Original Message-----
> > > From: Krzysztof Kozlowski <krzk@kernel.org>
> > > Sent: 25 July 2019 13:19
> > > To: Guillaume Gardet <Guillaume.Gardet@arm.com>
> > > Cc: linux-samsung-soc@vger.kernel.org; Kukjin Kim
> > > <kgene@kernel.org>; linux- arm-kernel@lists.infradead.org
> > > Subject: Re: [PATCH V2 1/2] arm: dts: exynos: Add GPU/Mali T604 node
> > > to
> > > exynos5250
> > >
> > > On Thu, 25 Jul 2019 at 10:34, Guillaume <guillaume.gardet@arm.com>
> wrote:
> > > >
> > > > From: Guillaume GARDET <guillaume.gardet@arm.com>
> > > >
> > > > Add nodes for GPU (Mali T604) to Exynos5250.
> > > > Tested with kmscube and glmark2-es2-drm on Chromebook snow.
> > > > Load tested on arndale board.
> > > >
> > > > Signed-off-by: Guillaume GARDET <guillaume.gardet@arm.com>
> > > >
> > > > Cc: Kukjin Kim <kgene@kernel.org>
> > > > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > > > Cc: linux-arm-kernel@lists.infradead.org
> > > > ---
> > > > V2 changes:
> > > >   * move mali node as /soc sub-node
> > > >   * move gpu_opp_table as mali sub-node
> > > >   * minor style updates
> > > >   * test on arndale board
> > > >   * enable by default
> > >
> > > I was not specific enough. It can stay disabled in the DTSI because
> > > not all resources are provided. The board DTSes (all or ones which
> > > are
> > > tested) will enable it and provide missing resources - mali-supply.
> >
> > I think all resources are provided, since no mali-supply property is needed here.
>
> No, regulator is not provided. On all Exynos boards Mali uses its own dedicated
> regulator (and sometimes additional one). It worked in your case because the
> regulator was set as always-on but this is a workaround for lack of consumers.
> Once there is a consumer, the regulator should not be always-on to save the
> energy when not used.

I do not have the required info here. Do you have it, or could I skip the mali-supply for now?

>
> > So, I can either enable it by default for all exynos5250 platforms there, or I can
> enable it only for Arndale board and Chromebook snow. What do you prefer?
>
> Then please enable it on tested platforms.

Ok.

>
> >
> > > Just like:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/c
> > > ommit/?id=f
> > > 0a6208b90bdd44f48f5718c8bb0eb1e763d14c0
> > >
> > > >   * add dt bindings, in a separate patch
> > >
> > > Put the bindings before DTS change.
> >
> > Yes, makes sense.
> >
> > >
> > > >
> > > >  arch/arm/boot/dts/exynos5250.dtsi | 47
> > > > +++++++++++++++++++++++++++++++
> > > >  1 file changed, 47 insertions(+)
> > > >
> > > > diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> > > > b/arch/arm/boot/dts/exynos5250.dtsi
> > > > index d5e0392b409e..f7f34d469bde 100644
> > > > --- a/arch/arm/boot/dts/exynos5250.dtsi
> > > > +++ b/arch/arm/boot/dts/exynos5250.dtsi
> > > > @@ -328,6 +328,52 @@
> > > >                         iommus = <&sysmmu_rotator>;
> > > >                 };
> > > >
> > > > +               mali: gpu@11800000 {
> > > > +                       compatible = "samsung,exynos5250-mali", "arm,mali-t604";
> > > > +                       reg = <0x11800000 0x5000>;
> > > > +                       interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> > > > +                                    <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
> > > > +                                    <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> > > > +                       interrupt-names = "job", "mmu", "gpu";
> > > > +                       clocks = <&clock CLK_G3D>;
> > > > +                       clock-names = "g3d";
> > >
> > > According to bindings this is not proper clock name. I wonder why it
> > > was working... it seems the driver expects first clock to be always the core
> clock.
> >
> > Yes, it works, because 1st clock is assumed to be the core clock.
> > Clock names are optional and could be omitted as in
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre
> > e/arch/arm/boot/dts/rk3288.dtsi?h=v5.3-rc1#n1284
> > Not sure if it would be better to rename it to 'core', or  just skip it? Any opinion?
>
> The driver can change anytime and it might look for "core" so DTS should follow
> the bindings. Additionally, Panfrost might behave differently than Arm driver. So
> "core" please.

Ok.

Thanks,
Guillaume

>
> Best regards,
> Krzysztof
IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.

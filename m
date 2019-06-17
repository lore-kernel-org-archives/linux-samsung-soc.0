From: Joseph Kogut <joseph.kogut@gmail.com>
Subject: Re: [PATCH v2 2/2] arm: dts: add ARM Mali GPU node for Odroid XU3
Date: Mon, 17 Jun 2019 09:15:23 -0700
Message-ID: <CAMWSM7j8dtsS4d-hOc3Sk6OJHs+SiGC9tEaZBEmO0VKmtJguKw@mail.gmail.com>
References: <20190614203144.3850-2-joseph.kogut@gmail.com>
 <20190614235719.8134-1-joseph.kogut@gmail.com>
 <20190616085928.GB3826@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190616085928.GB3826@kozik-lap>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, airlied@linux.ie, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, kgene@kernel.org, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

Thanks for the review.

On Sun, Jun 16, 2019 at 1:59 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Fri, Jun 14, 2019 at 04:57:19PM -0700, Joseph Kogut wrote:
> > Add device tree node for mali gpu on Odroid XU3 SoCs.
> >
> > Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> > ---
> >
> > Changes v1 -> v2:
> > - Use interrupt name ordering from binding doc
> > - Specify a single clock for GPU node
> > - Add gpu opp table
> > - Fix warnings from IRQ_TYPE_NONE
> >
> >  .../boot/dts/exynos5422-odroidxu3-common.dtsi | 26 +++++++++++++++++++
>
> This should go to exynos5422-odroid-core.dtsi instead, because it is
> common to entire Odroid Exynos5422 family (not only XU3 family).
>
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> > index 93a48f2dda49..b8a4246e3b37 100644
> > --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> > +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> > @@ -48,6 +48,32 @@
> >               cooling-levels = <0 130 170 230>;
> >       };
> >
> > +     gpu: gpu@11800000 {
> > +             compatible = "samsung,exynos-mali", "arm,mali-t628";
>
> This is common to all Exynos542x chips so it should go to
> exynos5420.dtsi. Here you would need to only enable it and provide
> regulator.
>

To clarify, which pieces are specific to the Odroid Exynos 5422
family, and which are common to the entire Exynos 542x family? I'm
thinking the gpu node is common to the 542x family, including the
interrupts and clock, and the regulator and opp table are specific to
the Odroid 5422?

> Probably this should be also associated with tmu_gpu as a cooling device
> (if Mali registers a cooling device...). Otherwise the tmu_gpu is not
> really used for it.
>

We have two operating performance points for the GPU, but I'm not sure
at what temperature we should trip the lower opp. Looking at the trip
temperatures for the CPU, we have four alerts, and one critical trip.
The highest alert is 85 C, would it be reasonable to trigger the lower
GPU opp at this temperature? Should it trigger sooner?

> > +             reg = <0x11800000 0x5000>;
> > +             interrupts = <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
> > +                          <GIC_SPI 74  IRQ_TYPE_LEVEL_HIGH>,
> > +                          <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> > +             interrupt-names = "job", "mmu", "gpu";
> > +             clocks = <&clock CLK_G3D>;
> > +             mali-supply = <&buck4_reg>;
>
> Please check if always-on property could be removed from buck4.

I've checked, and this property can be removed safely.

> Also, what about LDO27? It should be used as well (maybe through
> vendor-specific properties which would justify the need of new vendor
> compatible).
>

I'm unsure how LDO27 is used, can you elaborate?

Best,
Joseph

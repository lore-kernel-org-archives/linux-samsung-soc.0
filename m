From: Chanho Park <chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCHv4 1/4] ARM: dts: exynos4: add PMU syscon node
Date: Tue, 20 May 2014 11:01:59 +0900
Message-ID: <011801cf73cf$7c5fc770$751f5650$@samsung.com>
References: <1399004769-31033-1-git-send-email-chanho61.park@samsung.com>
 <1399004769-31033-2-git-send-email-chanho61.park@samsung.com>
 <5374F447.9030102@samsung.com> <537A2FEA.6070208@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <537A2FEA.6070208-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-language: ko
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Kukjin Kim' <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Tomasz Figa' <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kukjin,

> -----Original Message-----
> From: Kukjin Kim [mailto:kgene.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org] On Behalf Of Kukjin Kim
> Sent: Tuesday, May 20, 2014 1:23 AM
> To: Tomasz Figa
> Cc: Chanho Park; kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org; linux-samsung-
> soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
> Subject: Re: [PATCHv4 1/4] ARM: dts: exynos4: add PMU syscon node
> 
> On 05/16/14 02:07, Tomasz Figa wrote:
> > Hi Chanho,
> >
> Hi,
> 
> > When testing some other patches with this series applied I found one
> > more issue. Please see below.
> >
> > On 02.05.2014 06:26, Chanho Park wrote:
> >> This patch adds a PMU(Power Management Unit) syscon node. This
> >> should be required for USB Phy syscon regmap I/F.
> >>
> >> Cc: Kamil Debski<k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >> Signed-off-by: Chanho Park<chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >> Reviewed-by: Tomasz Figa<t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >> ---
> >>   Documentation/devicetree/bindings/arm/samsung/pmu.txt | 3 +++
> >>   arch/arm/boot/dts/exynos4.dtsi                        | 5 +++++
> >>   arch/arm/boot/dts/exynos4x12.dtsi                     | 4 ++++
> >>   3 files changed, 12 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.txt
> b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
> >> index f1f1552..b562634 100644
> >> --- a/Documentation/devicetree/bindings/arm/samsung/pmu.txt
> >> +++ b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
> >> @@ -2,6 +2,9 @@ SAMSUNG Exynos SoC series PMU Registers
> >>
> >>   Properties:
> >>    - compatible : should contain two values. First value must be one
> from following list:
> >> +		   - "samsung,exynos4210-pmu" - for Exynos4210 SoC,
> >> +		   - "samsung,exynos4212-pmu" - for Exynos4212 SoC,
> >> +		   - "samsung,exynos4412-pmu" - for Exynos4412 SoC,
> >
> > Here two compatible strings are specified, one for each SoC in 4x12
> > family, but...
> >
> >>   		- "samsung,exynos5250-pmu" - for Exynos5250 SoC,
> >>   		   - "samsung,exynos5420-pmu" - for Exynos5420 SoC.
> >>   		second value must be always "syscon".
> >> diff --git a/arch/arm/boot/dts/exynos4.dtsi
> b/arch/arm/boot/dts/exynos4.dtsi
> >> index 2f8bcd0..264066f 100644
> >> --- a/arch/arm/boot/dts/exynos4.dtsi
> >> +++ b/arch/arm/boot/dts/exynos4.dtsi
> >> @@ -110,6 +110,11 @@
> >>   		reg =<0x10010000 0x400>;
> >>   	};
> >>
> >> +	pmu_system_controller: system-controller@10020000 {
> >> +		compatible = "samsung,exynos4210-pmu", "syscon";
> >> +		reg =<0x10020000 0x4000>;
> >> +	};
> >> +
> >>   	dsi_0: dsi@11C80000 {
> >>   		compatible = "samsung,exynos4210-mipi-dsi";
> >>   		reg =<0x11C80000 0x10000>;
> >> diff --git a/arch/arm/boot/dts/exynos4x12.dtsi
> b/arch/arm/boot/dts/exynos4x12.dtsi
> >> index c4a9306..7f767f7 100644
> >> --- a/arch/arm/boot/dts/exynos4x12.dtsi
> >> +++ b/arch/arm/boot/dts/exynos4x12.dtsi
> >> @@ -119,6 +119,10 @@
> >>   		interrupts =<0 72 0>;
> >>   	};
> >>
> >> +	pmu_system_controller: system-controller@10020000 {
> >> +		compatible = "samsung,exynos4x12-pmu", "syscon";
> >
> > Here one node is added for both using an undocumented compatible
> string.
> > Please fix this according to documentation.
> >
> 
> Chanho, updated patch?

I'll re-send the patchset soon.
Thanks.

Best Regards,
Chanho Park

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

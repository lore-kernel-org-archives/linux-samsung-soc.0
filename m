From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: exynos: Fix missing missing reg warning
 for syscon restart nodes
Date: Tue, 30 Jan 2018 21:11:24 +0100
Message-ID: <20180130201124.v7jik3ds4kejsa3m@kozik-lap>
References: <20180116213129.16209-1-krzk@kernel.org>
 <20180116213129.16209-2-krzk@kernel.org>
 <20180129162714.2xrqrkfd2xo4jn2g@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180129162714.2xrqrkfd2xo4jn2g@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Jan 29, 2018 at 10:27:14AM -0600, Rob Herring wrote:
> On Tue, Jan 16, 2018 at 10:31:28PM +0100, Krzysztof Kozlowski wrote:
> > Fix DTC warnings like:
> > 
> >     arch/arm/boot/dts/exynos4412-trats2.dtb: Warning (simple_bus_reg):
> >         Node /soc/syscon-poweroff missing or empty reg/ranges property
> >     arch/arm/boot/dts/exynos4412-trats2.dtb: Warning (simple_bus_reg):
> >         Node /soc/syscon-reboot missing or empty reg/ranges property
> > 
> > by moving the syscon poweroff and restart nodes into the PMU (Power
> > Management Unit) node.  The PMU node is the actual block responsible for
> > power management, including typical Exynos on/off/restart procedures.
> > Therefore the syscon poweroff and restart nodes logically belong to it.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > 
> > ---
> > 
> > Tested on Exynos5420 and Exynos4412. Other tests are welcomed.
> > ---
> >  .../devicetree/bindings/arm/samsung/pmu.txt        |  4 +++-
> >  arch/arm/boot/dts/exynos-syscon-restart.dtsi       | 28 ++++++++++------------
> >  arch/arm/boot/dts/exynos3250.dtsi                  |  4 ++--
> >  arch/arm/boot/dts/exynos4.dtsi                     |  5 ++--
> >  arch/arm/boot/dts/exynos4412.dtsi                  |  2 +-
> >  arch/arm/boot/dts/exynos5.dtsi                     |  1 -
> >  arch/arm/boot/dts/exynos5250.dtsi                  |  3 ++-
> >  arch/arm/boot/dts/exynos5410.dtsi                  |  3 ++-
> >  arch/arm/boot/dts/exynos5420.dtsi                  |  3 ++-
> >  9 files changed, 27 insertions(+), 26 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.txt b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
> > index 779f5614bcee..405646655ec7 100644
> > --- a/Documentation/devicetree/bindings/arm/samsung/pmu.txt
> > +++ b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
> > @@ -12,6 +12,8 @@ Properties:
> >  		   - "samsung,exynos5433-pmu" - for Exynos5433 SoC.
> >  		   - "samsung,exynos7-pmu" - for Exynos7 SoC.
> >  		second value must be always "syscon".
> > +		If PMU contains optional syscon-poweroff or syscon-restart nodes,
> > +		then third value must be "simple-mfd".
> 
> I don't think this is right. simple-mfd is only for cases where the 
> parent has no setup that the child nodes are dependent on. You need the 
> regmap setup by the parent before the child can be enumerated. The 
> correct thing to do here is add an of_platform_default_populate() call.

I understand, makes sense. I will send a follow-up.

Thanks for feedback!

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

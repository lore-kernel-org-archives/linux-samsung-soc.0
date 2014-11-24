From: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 RESEND] arm: dts: Exynos5: Use pmu_system_controller
 phandle for dp phy
Date: Mon, 24 Nov 2014 16:59:19 +0530
Message-ID: <CAFp+6iFgXFL8=jvrdw4Z+vfPSzWO9FYxAHMD1Tr9wD0Sy=gHMg@mail.gmail.com>
References: <1416807683-2257-1-git-send-email-gautam.vivek@samsung.com>
	<20141124103249.GA26217@ulmo.nvidia.com>
	<CAFp+6iE22FnHeXJZQyhytzGDNfnP4sdnYZuyFtmfzP_JVTVNPQ@mail.gmail.com>
	<20141124105656.GA32478@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141124105656.GA32478-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Nov 24, 2014 at 4:26 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Nov 24, 2014 at 04:17:18PM +0530, Vivek Gautam wrote:
>> Hi,
>>
>>
>> On Mon, Nov 24, 2014 at 4:02 PM, Thierry Reding
>> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > On Mon, Nov 24, 2014 at 11:11:23AM +0530, Vivek Gautam wrote:
>> >> DP PHY now require pmu-system-controller to handle PMU register
>> >> to control PHY's power isolation. Adding the same to dp-phy
>> >> node.
>> >>
>> >> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> >> Reviewed-by: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> >> Tested-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
>> >> Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> >> ---
>> >>  arch/arm/boot/dts/exynos5250.dtsi |    2 +-
>> >>  arch/arm/boot/dts/exynos5420.dtsi |    4 ++--
>> >>  2 files changed, 3 insertions(+), 3 deletions(-)
>> >>
>> >> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
>> >> index 0a588b4..bebd099 100644
>> >> --- a/arch/arm/boot/dts/exynos5250.dtsi
>> >> +++ b/arch/arm/boot/dts/exynos5250.dtsi
>> >> @@ -732,7 +732,7 @@
>> >>
>> >>       dp_phy: video-phy@10040720 {
>> >>               compatible = "samsung,exynos5250-dp-video-phy";
>> >> -             reg = <0x10040720 4>;
>> >> +             samsung,pmu-syscon = <&pmu_system_controller>;
>> >>               #phy-cells = <0>;
>> >>       };
>> >>
>> >> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
>> >> index 8617a03..1353a09 100644
>> >> --- a/arch/arm/boot/dts/exynos5420.dtsi
>> >> +++ b/arch/arm/boot/dts/exynos5420.dtsi
>> >> @@ -503,8 +503,8 @@
>> >>       };
>> >>
>> >>       dp_phy: video-phy@10040728 {
>> >> -             compatible = "samsung,exynos5250-dp-video-phy";
>> >> -             reg = <0x10040728 4>;
>> >> +             compatible = "samsung,exynos5420-dp-video-phy";
>> >> +             samsung,pmu-syscon = <&pmu_system_controller>;
>> >>               #phy-cells = <0>;
>> >>       };
>> >>
>> >
>> > It seems like these nodes have been in the Linux tree since 3.12 and
>> > 3.17, respectively and these changes break backwards-compatibility. Has
>> > anyone thought about the possible consequences?
>>
>> Sorry for my ignorance, but i have a doubt.
>> If the bindings and device node both are being changed in the same kernel
>> version (as fixes),
>> so that the stable will have both; then the only scenerio of backward
>> compatibility comes when kernel is upgraded but not dtbs.
>
> Correct.
>
>> Does such upgradation makes sense for distros ?
>
> Yes. Back at the time a decision was made that device trees need to be
> stable ABI because eventually they'd be shipped with the device rather
> than the distribution. As such it may not at all be possible to update
> them (they could be in some sort of ROM).
>
> For that reason new kernels need to keep working with old DTBs unless an
> argument can be made that would justify breaking things. I don't think I
> have ever seen anyone win such an argument.
> One of the rare exceptions
> that I know of is if you can prove that a given hardware block has never
> been used in an upstream kernel, then changing the DTB in backwards-
> incompatible ways would be okay because you wouldn't be breaking things
> for existing users.

I am pretty sure about the Chrome devices (which have not been
upgraded to any kernel after
3.8).
Probably Javier may have better knowledge.

Javier, is there any other device using upstream kernel post 3.12 (any
arndale octa based) ?




-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

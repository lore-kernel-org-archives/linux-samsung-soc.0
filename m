From: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: RE: [alsa-devel] [PATCH v3 3/4] ARM: dts: set clock out parent to
 XUSBXTI
Date: Fri, 23 Jan 2015 15:41:22 +0900
Message-ID: <0b7f01d036d7$9a438850$ceca98f0$@kernel.org>
References: <1421925482-15861-1-git-send-email-ideal.song@samsung.com>
 <1421925482-15861-4-git-send-email-ideal.song@samsung.com>
 <54C0EC23.9070209@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <54C0EC23.9070209-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-language: ko
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Sylwester Nawrocki' <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Inha Song' <ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tiwai-l3A5Bk7waGM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Sylwester Nawrocki wrote:
> 
> On 22/01/15 12:18, Inha Song wrote:
> > This patch set clock out parent to XUSBXTI.
> >
> > Signed-off-by: Inha Song <ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/exynos4.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> > index b8168f1..020bbaf 100644
> > --- a/arch/arm/boot/dts/exynos4.dtsi
> > +++ b/arch/arm/boot/dts/exynos4.dtsi
> > @@ -141,6 +141,8 @@
> >  	pmu_system_controller: system-controller@10020000 {
> >  		compatible = "samsung,exynos4210-pmu", "syscon";
> >  		reg = <0x10020000 0x4000>;
> > +		assigned-clocks = <&pmu_system_controller 0>;
> > +		assigned-clock-parents =  <&clock CLK_XUSBXTI>;
> >  	};
> 
> Looks good, except it needs to be done only for the Trats2 board, i.e.
> the PMU device node including these properties should be added to
> exynos4412-trats2.dts.  I think it's fine to make it a one patch including
> all dts changes.
> 
Yeah, I agree with Sylwester's suggestion. Please make a one patch for the
updating DT for sound support and adding me in Cc for the change for relevant
driver changes as well.

Thanks,
Kukjin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

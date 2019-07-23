From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v1 37/50] ARM: dts: exynos: change parent and rate of
 bus_fsys in Exynos5422
Date: Tue, 23 Jul 2019 14:06:32 +0200
Message-ID: <CAJKOXPdC7U64dqFJzJNJJXPQ8_K_SXUOVrNGjOQqcDyNsmskwA@mail.gmail.com>
References: <CGME20190715124504eucas1p1afe0da2c6ac3a8b45d85017a77ba9edf@eucas1p1.samsung.com>
 <20190715124417.4787-1-l.luba@partner.samsung.com> <20190715124417.4787-38-l.luba@partner.samsung.com>
 <CAJKOXPfrGgAczQ-=1aE453RpJ9BN10ZDmFcrEMPkNyF6GcGtNA@mail.gmail.com>
 <2fe2e840-f4b2-773b-7d92-4ffb8502d4e6@partner.samsung.com>
 <CAJKOXPd3gm7no-0TnPmgFg+X3FgdiM6ov5rtzFSM6hKEdEzRCg@mail.gmail.com>
 <518c26ca-4254-056c-d6d0-ae1b4b63709c@partner.samsung.com>
 <CAJKOXPfDX06s7eMctbnPabxho2EaWcTM4xAGKCd_+O6jCCDcRQ@mail.gmail.com> <7ad899c5-347d-546e-a2e9-d96f0203210c@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7ad899c5-347d-546e-a2e9-d96f0203210c@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, s.nawrocki@samsung.com, myungjoo.ham@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 17 Jul 2019 at 14:56, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>
>
> On 7/17/19 1:11 PM, Krzysztof Kozlowski wrote:
> > On Wed, 17 Jul 2019 at 13:06, Lukasz Luba <l.luba@partner.samsung.com> wrote:
> >>
> >>
> >>
> >> On 7/17/19 12:45 PM, Krzysztof Kozlowski wrote:
> >>> On Wed, 17 Jul 2019 at 12:39, Lukasz Luba <l.luba@partner.samsung.com> wrote:
> >>>>>>
> >>>>>>     &bus_fsys {
> >>>>>>            devfreq = <&bus_wcore>;
> >>>>>> +       assigned-clocks = <&clock CLK_MOUT_ACLK200_FSYS>,
> >>>>>> +                         <&clock CLK_DOUT_ACLK200_FSYS>,
> >>>>>> +                         <&clock CLK_FOUT_DPLL>;
> >>>>>> +       assigned-clock-parents = <&clock CLK_MOUT_SCLK_DPLL>;
> >>>>>> +       assigned-clock-rates = <0>, <240000000>,<1200000000>;
> >>>>>
> >>>>> Here and in all other patches:
> >>>>> I am not entirely sure that this should be here. It looks like
> >>>>> property of the SoC. Do we expect that buses will be configured to
> >>>>> different clock rates between different boards?
> This is the board file for Exynos5420/5422/5800 which enables buses.
> Thus, I have change them here. Patch 49/50 adds these buses to
> Exynos5800 (Peach Pi). In Exynos5420 there is no clock tree for
> bus_isp266. The parents for different devices could be also different.
> It is because i.e. in 5420 there is 2 bit in the WCORE 1st mux while in
> 5422 there is 3 bits (6 parents possible).
> That's why I have picked exynos5422-odroid-core.dtsi to reference
> the bus devices and pinned them into proper parent and changed rate.
> When you check patch 49/50 for 5800 not all the parents are the same.
>
> (1) I could create a dedicated files like: exynos5422-bus.dtsi,
> exynos5420-bus.dtsi, exynos5800-bus.dtsi which would include some
> base file with the basic &bus_X and set the right parent, rate.
> Then these files would be included into proper board file like:
> exynos5800-peach-pi.dts.
> Is this something that you would like to see?

I see now. Are there any differences in all these properties between
Peach Pi and Odroids? Both of them are using exynos5800.dtsi so that
could be a place for all clock assignments.

Best regards,
Krzysztof

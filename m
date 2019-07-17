From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v1 37/50] ARM: dts: exynos: change parent and rate of
 bus_fsys in Exynos5422
Date: Wed, 17 Jul 2019 13:11:22 +0200
Message-ID: <CAJKOXPfDX06s7eMctbnPabxho2EaWcTM4xAGKCd_+O6jCCDcRQ@mail.gmail.com>
References: <CGME20190715124504eucas1p1afe0da2c6ac3a8b45d85017a77ba9edf@eucas1p1.samsung.com>
 <20190715124417.4787-1-l.luba@partner.samsung.com> <20190715124417.4787-38-l.luba@partner.samsung.com>
 <CAJKOXPfrGgAczQ-=1aE453RpJ9BN10ZDmFcrEMPkNyF6GcGtNA@mail.gmail.com>
 <2fe2e840-f4b2-773b-7d92-4ffb8502d4e6@partner.samsung.com>
 <CAJKOXPd3gm7no-0TnPmgFg+X3FgdiM6ov5rtzFSM6hKEdEzRCg@mail.gmail.com> <518c26ca-4254-056c-d6d0-ae1b4b63709c@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <518c26ca-4254-056c-d6d0-ae1b4b63709c@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, s.nawrocki@samsung.com, myungjoo.ham@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 17 Jul 2019 at 13:06, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>
>
>
> On 7/17/19 12:45 PM, Krzysztof Kozlowski wrote:
> > On Wed, 17 Jul 2019 at 12:39, Lukasz Luba <l.luba@partner.samsung.com> wrote:
> >>>>
> >>>>    &bus_fsys {
> >>>>           devfreq = <&bus_wcore>;
> >>>> +       assigned-clocks = <&clock CLK_MOUT_ACLK200_FSYS>,
> >>>> +                         <&clock CLK_DOUT_ACLK200_FSYS>,
> >>>> +                         <&clock CLK_FOUT_DPLL>;
> >>>> +       assigned-clock-parents = <&clock CLK_MOUT_SCLK_DPLL>;
> >>>> +       assigned-clock-rates = <0>, <240000000>,<1200000000>;
> >>>
> >>> Here and in all other patches:
> >>> I am not entirely sure that this should be here. It looks like
> >>> property of the SoC. Do we expect that buses will be configured to
> >>> different clock rates between different boards? Since the OPP tables
> >>> are shared (they are property of the SoC, not board) then I would
> >>> assume that default frequency is shared as well.
> >> These clocks they all relay on some bootloader configuration. It depends
> >> which version of the bootloader you have, then you might get different
> >> default configuration in the clocks.
> >
> > I do not agree here. This configuration is not dependent on
> > bootloader. Although one bootloader might set the clocks to X and
> > other to Y, but still you provide here valid configuration setting
> > them, e.g. to Y (or to Z). What bootloader set before does not matter
> > because you always override it.
> This exactly the patch set is aim to do: overwrite any bootloader
> configuration which could be wrong set after boot.
> I don't know for how long it is left in such
> 'bootloader-default-clock-settings' but it is not accurate
> configuration. The pattern in the DT to change the clock rates is
> there.

Still it is not the answer to my concerns and questions.

> >
> >> The pattern of changing the parent
> >> or even rate is known in the DT files (or I am missing something).
> >> When you grep for it, you get 168 hits (38 for exynos*):
> >> git grep -n "assigned-clock-rates" ./arch/arm/boot/dts/ | wc -l
> >
> > Yeah, and if you grep per type you got:
> > DTSI: 114
> > DTS: 54
> > so what do you want to say?
> Thus, It could be changed in DT.

Of course, why not. But how this relevant to my question?

> > My thinking is that all the boards have buses configured to the same
> > initial frequency. I am not questioning the use of
> > assigned-clock-rates at all. Just the place...
> It is not only 'initial frequency' as you name it. It has three changes:
> - re-parent to proper PLL
> - changing this PLL rate
> - change the OPPs frequency values to integer values derived from PLL
>
> The initial frequencies will be changed by devfreq governor using OPP
> tables and the load after the whole system boots.

I simplified with "initial frequency" but it does not matter. Let me
try to raise my concerns again, different wording:
All this looks like property of the SoC, not the board, because:
1. the OPPs are already properties of the SoC, not the board (XU3 Lite
is kind of exception but in fact it uses different flavor of
Exynos5422 SoC which we do not model here as separate DTSI),
2. I expect all boards to have the same properties.

Best regards,
Krzysztof

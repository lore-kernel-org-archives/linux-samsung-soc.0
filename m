From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v1 27/50] ARM: dts: exynos: align bus_wcore OPPs in Exynos5420
Date: Tue, 23 Jul 2019 14:08:14 +0200
Message-ID: <CAJKOXPdoun-2ankrcNzC70tXZi40iONxM3yPstdaiGBMPDjyRQ@mail.gmail.com>
References: <CGME20190715124456eucas1p2acf15d00e3fa7b77fe3a2b10ce1ab74f@eucas1p2.samsung.com>
 <20190715124417.4787-1-l.luba@partner.samsung.com> <20190715124417.4787-28-l.luba@partner.samsung.com>
 <CAJKOXPfFZL8q9hM1vPsLq+Qxe-gMz4c8j0jgFKfdf5qs68MTmA@mail.gmail.com> <15310bd0-0fd4-8d62-82a9-7a9df6a8ced3@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <15310bd0-0fd4-8d62-82a9-7a9df6a8ced3@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, s.nawrocki@samsung.com, myungjoo.ham@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 17 Jul 2019 at 18:58, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>
> Hi Krzysztof,
>
> On 7/17/19 12:15 PM, Krzysztof Kozlowski wrote:
> > On Mon, 15 Jul 2019 at 14:44, Lukasz Luba <l.luba@partner.samsung.com> wrote:
> >>
> >> This is the most important bus in the Exynos5x SoC. The whole communication
> >> inside SoC does through that bus (apart from direct requests from CCI to
> >> DRAM controller). It is also modeled as a master bus in devfreq framework.
> >> It is also the only one OPP table throughout other buses which has voltage
> >> values. The devfreq software controls the speed of that bus and other
> >> buses. The other buses follows the rate of the master. There is only one
> >> regulator. The old lowest OPP had pair 925mV, 84MHz which is enough for
> >
> > s/lowest/slowest/
> please see below
> >
> >> this frequency. However, due to the fact that the other buses follows the
> >> WCORE bus by taking the OPP from their table with the same id, e.g. opp02,
> >> the children frequency should be stable with the set voltage.
> >> It could cause random faults very hard to debug.
> >> Thus, the patch removes the lowest OPP to make other buses' lowest OPPs
> >
> > s/lowest/slowest/
> Actually, I have double checked that, because we always used this
> terminology: low OPP, high OPP, lower OPPs, higher OPPs. I can change
> it here for you, but I think this is not something that people are used
> to. Please check EAS pdf documentation or this file:
> https://www.kernel.org/doc/Documentation/scheduler/sched-energy.txt
> i.e. "running at a lower OPP" or "high OPPs", "lowest OPPs".

Hmm, indeed, you're right. Don't change it then.

Best regards,
Krzysztof

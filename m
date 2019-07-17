From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v1 26/50] ARM: dts: exynos: align NOC100 bus OPPs in Exynos5420
Date: Wed, 17 Jul 2019 12:38:05 +0200
Message-ID: <CAJKOXPdMUV6JP0R4kj=cFKd7QUdrtMXtSm4S9pfF77zvKu4v1g@mail.gmail.com>
References: <CGME20190715124455eucas1p13bfc0c1d113225db9607e4c0dbac353c@eucas1p1.samsung.com>
 <20190715124417.4787-1-l.luba@partner.samsung.com> <20190715124417.4787-27-l.luba@partner.samsung.com>
 <CAJKOXPc3qsM5Xe5JViDZXYfes+_veb-KX3fnZjpkUCrphBcu-Q@mail.gmail.com> <8ed83c77-57f7-78a4-e437-714cfc7b5c58@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8ed83c77-57f7-78a4-e437-714cfc7b5c58@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, s.nawrocki@samsung.com, myungjoo.ham@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 17 Jul 2019 at 12:27, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>
>
> On 7/17/19 12:10 PM, Krzysztof Kozlowski wrote:
> > On Mon, 15 Jul 2019 at 14:44, Lukasz Luba <l.luba@partner.samsung.com> wrote:
> >>
> >> The NOC100 has a parent which clock rate is set tot 400MHz. The OPPs which
> >> are not possible to set are removed and new one is added.
> >
> > I think it is just NOC bus... or are there more of such and this is 100 MHz one?
> Yes, there is a bus NOC100 with a dedicated clock tree in the HW (with
> 3 muxes and one divider), which makes possible to take different PLL as
> a source then WCORE have, divide the rate from it and even switch for a
> while to alternative stable PLL (on the 2nd mux to SPLL (after a
> divider)) to wait for main PLL rate change stability delay. Max rate is
> limited to 100MHz for this NOC100 bus.

I think we misunderstood each other. I am saying, that the bus is
called "NOC" in the DTSI. Not NOC100. So unless there are more of
NOCs, stick to existing name NOC, even if it is not the most accurate.

Best regards,
Krzysztof

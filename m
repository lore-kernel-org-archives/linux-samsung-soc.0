From: Artur =?UTF-8?Q?=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>
Subject: Re: [RFC PATCH 08/11] arm: dts: exynos: Add parents and
 #interconnect-cells to Exynos4412
Date: Wed, 31 Jul 2019 15:00:56 +0200
Message-ID: <73b8c7078b2378921e841b5bd02bd617cc2143be.camel@partner.samsung.com>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
        <CGME20190723122027eucas1p24b1d76e3139f7cc52614d7613ff9ba98@eucas1p2.samsung.com>
        <20190723122016.30279-9-a.swigon@partner.samsung.com>
        <20190724192426.GJ14346@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190724192426.GJ14346@kozik-lap>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, cw00.choi@samsung.com, myungjoo.ham@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, georgi.djakov@linaro.org, m.szyprowski@samsung.com, =?UTF-8?Q?Bart=C5=82omiej_?= =?UTF-8?Q?=C5=BBo=C5=82nierkiewicz?= <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 2019-07-24 at 21:24 +0200, Krzysztof Kozlowski wrote:
> On Tue, Jul 23, 2019 at 02:20:13PM +0200, Artur Świgoń wrote:
> > This patch adds two fields tp the Exynos4412 DTS:
> 
> tp->to

Fixed. Thanks for catching the typo :)

> >   - parent: to declare connections between nodes that are not in a
> >     parent-child relation in devfreq;
> 
> Is it a standard property?
> The explanation needs some improvement... why are you adding parent to a
> devices which are not child-parent?

This is not a standard property. I actually wanted to call it 'neighbor' at first. If you take a look at [1] and search for 'Exynos4x12', you will see that there are two power lines, and each has exactly one parent block (the rest are modelled in devfreq as its children). In [2], the parent of each child is indicated using the 'devfreq' property, e.g.,

&bus_display {
	devfreq = <&bus_leftbus>;
	status = "okay";
};

The single piece missing to make this topology a connected graph (for
interconnect QoS purposes) is the 'parent' property I proposed in this patch.
bus_leftbus is dependent on bus_dmc, therefore using the term 'parent' is
justified IMHO.

The explanation could be improved by adding what Chanwoo Choi <
cw00.choi@samsung.com> expressed in a parallel reply to this patch:
> - If 'devfreq' property is used between buses,
>   it indicates that there are requirement of sharing of power line.
> - If 'parent' property is used between buses,
>   it indicates that there are requirement of interconnect connection.

[1] Documentation/devicetree/bindings/devfreq/exynos-bus.txt
[2] arch/arm/boot/dts/exynos4412-odroid-common.dtsi (subject of this patch)

Best regards,
-- 
Artur Świgoń
Samsung R&D Institute Poland
Samsung Electronics

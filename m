From: Artur =?UTF-8?Q?=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>
Subject: Re: [RFC PATCH 09/11] devfreq: exynos-bus: Add interconnect
 functionality to exynos-bus
Date: Wed, 31 Jul 2019 15:01:44 +0200
Message-ID: <a1fc0e2b5ef2d131f4e896c9c0aa7621bf4b79e2.camel@partner.samsung.com>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
        <CGME20190723122028eucas1p2eb75f35b810e71d6c590370aaff0997b@eucas1p2.samsung.com>
        <20190723122016.30279-10-a.swigon@partner.samsung.com>
        <20190724183639.GA14346@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190724183639.GA14346@kozik-lap>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, cw00.choi@samsung.com, myungjoo.ham@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, georgi.djakov@linaro.org, m.szyprowski@samsung.com, =?UTF-8?Q?Bart=C5=82omiej_?= =?UTF-8?Q?=C5=BBo=C5=82nierkiewicz?= <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 2019-07-24 at 20:36 +0200, Krzysztof Kozlowski wrote:
> On Tue, Jul 23, 2019 at 02:20:14PM +0200, Artur Świgoń wrote:
> > This patch adds interconnect functionality to the exynos-bus devfreq
> > driver.
> > 
> > The SoC topology is a graph (or, more specifically, a tree) and most of its
> > edges are taken from the devfreq parent-child hierarchy (cf.
> > Documentation/devicetree/bindings/devfreq/exynos-bus.txt). The previous
> > patch adds missing edges to the DT (under the name 'parent'). Due to
> 
> Do not refer to DT patches. They will come through different tree so
> "previous" will not be correct anymore. You mentioned dependencies in
> cover letter so it is sufficient.

OK.
 
> >  /*
> > @@ -61,6 +69,13 @@ exynos_bus_ops_edev(enable_edev);
> >  exynos_bus_ops_edev(disable_edev);
> >  exynos_bus_ops_edev(set_event);
> >  
> > +static int exynos_bus_next_id(void)
> > +{
> > +	static int exynos_bus_node_id;
> > +
> > +	return exynos_bus_node_id++;
> 
> This does not look robust. Use IDR for IDs. 

OK.

> > +static int exynos_bus_icc_connect(struct exynos_bus *bus)
> > +{
> > +	struct device_node *np = bus->dev->of_node;
> > +	struct devfreq *parent_devfreq;
> > +	struct icc_node *parent_node = NULL;
> > +	struct of_phandle_args args;
> > +	int ret = 0;
> > +
> > +	parent_devfreq = devfreq_get_devfreq_by_phandle(bus->dev, 0);
> > +	if (!IS_ERR(parent_devfreq)) {
> > +		struct exynos_bus *parent_bus;
> 
> What if someone unbinds this parent devfreq? I guess everything in
> devfreq starts exploding... however it's not the problem of this patch.
> 
> Do you also need suspend/resume order (device links)? I guess the other
> side, e.g.  mixer, should resume before the bus?

Actually, I think that the bus (devfreq) should resume before mixer. However,
suspend/resume order is another issue that applies to this driver regardless of
using the interconnect framework, although device links could probably also be
implemented in the interconnect framework itself.

> > +		parent_bus = dev_get_drvdata(parent_devfreq->dev.parent);
> > +		parent_node = parent_bus->node;
> > +	} else {
> > +		/* Look for parent in DT */
> > +		int num = of_count_phandle_with_args(np, "parent",
> > +						     "#interconnect-cells");
> > +		if (num != 1)
> 
> You will return here 0 but isn't it an error?

It is definitely not an error when 'parent' does not exist in DT (for buses that
are parents themselves). I can extend the comment in the code to explicitly
state that.

Best regards,
-- 
Artur Świgoń
Samsung R&D Institute Poland
Samsung Electronics

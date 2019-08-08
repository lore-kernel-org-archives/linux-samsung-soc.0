From: Artur =?UTF-8?Q?=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>
Subject: Re: [RFC PATCH 09/11] devfreq: exynos-bus: Add interconnect
 functionality to exynos-bus
Date: Thu, 08 Aug 2019 15:18:51 +0200
Message-ID: <7171e3c56b0dca8a81058e77dd76bd1e684e7778.camel@partner.samsung.com>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
        <CGME20190723122028eucas1p2eb75f35b810e71d6c590370aaff0997b@eucas1p2.samsung.com>
        <20190723122016.30279-10-a.swigon@partner.samsung.com>
        <5a82bf8a-d925-ba54-a26f-98b64bedc6e1@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5a82bf8a-d925-ba54-a26f-98b64bedc6e1@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: krzk@kernel.org, myungjoo.ham@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, georgi.djakov@linaro.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Thank you for your remarks. I will take them into account while preparing RFCv2.

On Mon, 2019-07-29 at 10:52 +0900, Chanwoo Choi wrote:
> Hi,
> 
> On 19. 7. 23. 오후 9:20, Artur Świgoń wrote:
> > This patch adds interconnect functionality to the exynos-bus devfreq
> > driver.
> > 
> > The SoC topology is a graph (or, more specifically, a tree) and most of its
> > edges are taken from the devfreq parent-child hierarchy (cf.
> > Documentation/devicetree/bindings/devfreq/exynos-bus.txt). The previous
> > patch adds missing edges to the DT (under the name 'parent'). Due to
> > unspecified relative probing order, -EPROBE_DEFER may be propagated to
> > guarantee that a child is probed before its parent.
> > 
> > Each bus is now an interconnect provider and an interconnect node as well
> > (cf. Documentation/interconnect/interconnect.rst), i.e. every bus registers
> > itself as a node. Node IDs are not hardcoded but rather assigned at
> > runtime, in probing order (subject to the above-mentioned exception
> > regarding relative order). This approach allows for using this driver with
> > various Exynos SoCs.
> > 
> > The devfreq target() callback provided by exynos-bus now selects either the
> > frequency calculated by the devfreq governor or the frequency requested via
> > the interconnect API for the given node, whichever is higher.
> 
> Basically, I agree to support the QoS requirement between devices.
> But, I think that need to consider the multiple cases.
> 
> 
> 1. When changing the devfreq governor by user,
> For example of the connection between bus_dmc/leftbus/display on patch8,
> there are possible multiple cases with various devfreq governor
> which is changed on the runtime by user through sysfs interface.
> 
> If users changes the devfreq governor as following:
> Before,
> - bus_dmc (simple_ondemand, available frequency 100/200/300/400 MHz)
> --> bus_leftbus(simple_ondemand, available frequency 100/200/300/400 MHz)
> ----> bus_display(passive)
> 
> After changed governor of bus_dmc,
> if the min_freq by interconnect requirement is 400Mhz,
> - bus_dmc (powersave) : min_freq and max_freq and cur_freq is 100MHz
> --> bus_leftbus(simple_ondemand) : cur_freq is 400Mhz
> ----> bus_display(passive)
> 
> The final frequency is 400MHz of bus_dmc
> even if the min_freq/max_freq/cur_freq is 100MHz.
> It cannot show the correct min_freq/max_freq through
> devfreq sysfs interface.
> 
> 
> 2. When disabling the some frequency by devfreq-thermal throttling,
> This patch checks the min_freq of interconnect requirement
> in the exynos_bus_target() and exynos_bus_passive_target().
> Also, it cannot show the correct min_freq/max_freq through
> devfreq sysfs interface.
> 
> For example of bus_dmc bus,
> - The available frequencies are 100MHz, 200MHz, 300MHz, 400MHz
> - Disable 400MHz by devfreq-thermal throttling 
> - min_freq is 100MHz
> - max_freq is 300MHz
> - min_freq of interconnect is 400MHz
> 
> In result, the final frequency is 400MHz by exynos_bus_target()
> There are no problem for working. But, the user cannot know
> reason why cur_freq is 400MHz even if max_freq is 300MHz.
> 
> Basically, update_devfreq() considers the all constraints
> of min_freq/max_freq to decide the proper target frequency.
> 
> 
> 3.
> I think that the exynos_bus_passive_target() is used for devfreq device
> using 'passive' governor. The frequency already depends on the parent device.
> 
> If already the parent devfreq device like bus_leftbus consider
> the minimum frequency of QoS requirement like interconnect,
> it is not necessary. The next frequency of devfreq device
> with 'passive' governor, it will apply the QoS requirement
> without any additional code.
> 
> > 
> > Please note that it is not an error when CONFIG_INTERCONNECT is 'n', in
> > which case all interconnect API functions are no-op.
> > 
> > Signed-off-by: Artur Świgoń <a.swigon@partner.samsung.com>
> > ---
> >  drivers/devfreq/exynos-bus.c | 145 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 145 insertions(+)
> > 
> > diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
> > index 412511ca7703..12fb7c84ae50 100644
> > --- a/drivers/devfreq/exynos-bus.c
> > +++ b/drivers/devfreq/exynos-bus.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/devfreq-event.h>
> >  #include <linux/device.h>
> >  #include <linux/export.h>
> > +#include <linux/interconnect-provider.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <linux/pm_opp.h>
> > @@ -23,6 +24,8 @@
> >  #define DEFAULT_SATURATION_RATIO	40
> >  #define DEFAULT_VOLTAGE_TOLERANCE	2
> >  
> > +#define icc_units_to_hz(x) ((x) * 1000UL / 8)
> > +
> >  struct exynos_bus {
> >  	struct device *dev;
> >  
> > @@ -31,12 +34,17 @@ struct exynos_bus {
> >  	unsigned int edev_count;
> >  	struct mutex lock;
> >  
> > +	unsigned long min_freq;
> >  	unsigned long curr_freq;
> >  
> >  	struct regulator *regulator;
> >  	struct clk *clk;
> >  	unsigned int voltage_tolerance;
> >  	unsigned int ratio;
> > +
> > +	/* One provider per bus, one node per provider */
> > +	struct icc_provider provider;
> > +	struct icc_node *node;
> >  };
> >  
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
> > +}
> > +
> >  static int exynos_bus_get_event(struct exynos_bus *bus,
> >  				struct devfreq_event_data *edata)
> >  {
> > @@ -98,6 +113,8 @@ static int exynos_bus_target(struct device *dev, unsigned
> > long *freq, u32 flags)
> >  	unsigned long old_freq, new_freq, new_volt, tol;
> >  	int ret = 0;
> >  
> > +	*freq = max(*freq, bus->min_freq);
> > +
> >  	/* Get new opp-bus instance according to new bus clock */
> >  	new_opp = devfreq_recommended_opp(dev, freq, flags);
> >  	if (IS_ERR(new_opp)) {
> > @@ -208,6 +225,8 @@ static int exynos_bus_passive_target(struct device *dev,
> > unsigned long *freq,
> >  	unsigned long old_freq, new_freq;
> >  	int ret = 0;
> >  
> > +	*freq = max(*freq, bus->min_freq);
> > +
> >  	/* Get new opp-bus instance according to new bus clock */
> >  	new_opp = devfreq_recommended_opp(dev, freq, flags);
> >  	if (IS_ERR(new_opp)) {
> > @@ -251,6 +270,35 @@ static void exynos_bus_passive_exit(struct device *dev)
> >  	clk_disable_unprepare(bus->clk);
> >  }
> >  
> > +static int exynos_bus_icc_set(struct icc_node *src, struct icc_node *dst)
> > +{
> > +	struct exynos_bus *src_bus = src->data, *dst_bus = dst->data;
> > +
> > +	src_bus->min_freq = icc_units_to_hz(src->peak_bw);
> > +	dst_bus->min_freq = icc_units_to_hz(dst->peak_bw);
> > +
> > +	return 0;
> > +}
> > +
> > +static int exynos_bus_icc_aggregate(struct icc_node *node, u32 avg_bw,
> > +				    u32 peak_bw, u32 *agg_avg, u32 *agg_peak)
> > +{
> > +	*agg_peak = *agg_avg = peak_bw;
> > +
> > +	return 0;
> > +}
> > +
> > +static struct icc_node *exynos_bus_icc_xlate(struct of_phandle_args *spec,
> > +					     void *data)
> > +{
> > +	struct exynos_bus *bus = data;
> > +
> > +	if (spec->np != bus->dev->of_node)
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	return bus->node;
> > +}
> > +
> >  static int exynos_bus_parent_parse_of(struct device_node *np,
> >  					struct exynos_bus *bus)
> >  {
> > @@ -469,6 +517,95 @@ static int exynos_bus_profile_init_passive(struct
> > exynos_bus *bus,
> >  	return ret;
> >  }
> >  
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
> > +
> > +		parent_bus = dev_get_drvdata(parent_devfreq->dev.parent);
> > +		parent_node = parent_bus->node;
> > +	} else {
> > +		/* Look for parent in DT */
> > +		int num = of_count_phandle_with_args(np, "parent",
> > +						     "#interconnect-cells");
> > +		if (num != 1)
> > +			goto out;
> > +
> > +		ret = of_parse_phandle_with_args(np, "parent",
> > +						 "#interconnect-cells",
> > +						 0, &args);
> > +		if (ret < 0)
> > +			goto out;
> > +
> > +		of_node_put(args.np);
> > +
> > +		parent_node = of_icc_get_from_provider(&args);
> > +		if (IS_ERR(parent_node)) {
> > +			/* May be -EPROBE_DEFER */
> > +			ret = PTR_ERR(parent_node);
> > +			goto out;
> > +		}
> > +	}
> > +
> > +	ret = icc_link_create(bus->node, parent_node->id);
> > +
> > +out:
> > +	return ret;
> > +}
> > +
> > +static int exynos_bus_icc_init(struct exynos_bus *bus)
> > +{
> > +	struct device *dev = bus->dev;
> > +	struct icc_provider *provider = &bus->provider;
> > +	struct icc_node *node;
> > +	int id, ret;
> > +
> > +	/* Initialize the interconnect provider */
> > +	provider->set = exynos_bus_icc_set;
> > +	provider->aggregate = exynos_bus_icc_aggregate;
> > +	provider->xlate = exynos_bus_icc_xlate;
> > +	provider->dev = dev;
> > +	provider->data = bus;
> > +
> > +	ret = icc_provider_add(provider);
> > +	if (ret < 0)
> > +		goto out;
> > +
> > +	id = exynos_bus_next_id();
> > +	node = icc_node_create(id);
> > +	if (IS_ERR(node)) {
> > +		ret = PTR_ERR(node);
> > +		goto err_node;
> > +	}
> > +
> > +	bus->node = node;
> > +	node->name = dev->of_node->name;
> > +	node->data = bus;
> > +	icc_node_add(node, provider);
> > +
> > +	ret = exynos_bus_icc_connect(bus);
> > +	if (ret < 0)
> > +		goto err_connect;
> > +
> > +out:
> > +	return ret;
> > +
> > +err_connect:
> > +	icc_node_del(node);
> > +	icc_node_destroy(id);
> > +err_node:
> > +	icc_provider_del(provider);
> > +
> > +	return ret;
> > +}
> > +
> >  static int exynos_bus_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> > @@ -517,6 +654,14 @@ static int exynos_bus_probe(struct platform_device
> > *pdev)
> >  			goto err;
> >  	}
> >  
> > +	/*
> > +	 * Initialize interconnect provider. A return value of -ENOTSUPP means
> > +	 * that CONFIG_INTERCONNECT is disabled.
> > +	 */
> > +	ret = exynos_bus_icc_init(bus);
> > +	if (ret < 0 && ret != -ENOTSUPP)
> > +		goto err;
> > +
> >  	max_state = bus->devfreq->profile->max_state;
> >  	min_freq = (bus->devfreq->profile->freq_table[0] / 1000);
> >  	max_freq = (bus->devfreq->profile->freq_table[max_state - 1] / 1000);
> > 
> 
> 
-- 
Artur Świgoń
Samsung R&D Institute Poland
Samsung Electronics

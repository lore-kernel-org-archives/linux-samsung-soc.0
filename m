From: Artur =?UTF-8?Q?=C5=9Awigo=C5=84?= <a.swigon@samsung.com>
Subject: Re: [RFC PATCH v2 09/11] devfreq: exynos-bus: Add interconnect
 functionality to exynos-bus
Date: Wed, 25 Sep 2019 09:12:45 +0200
Message-ID: <9b6a744b732e2cbf95df4da203f94a039a39af21.camel@samsung.com>
References: <20190919142236.4071-1-a.swigon@samsung.com>
        <CGME20190919142329eucas1p2e53992eab9ec6b404f716f955b3c228e@eucas1p2.samsung.com>
        <20190919142236.4071-10-a.swigon@samsung.com>
        <e004bedd-294b-172b-5e34-bf7afcfd04bc@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e004bedd-294b-172b-5e34-bf7afcfd04bc@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Artur =?UTF-8?Q?=C5=9Awigo=C5=84?= <a.swigon@samsung.com>, myungjoo.ham@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, georgi.djakov@linaro.org, leonard.crestez@nxp.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, krzk@kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Wed, 2019-09-25 at 16:03 +0900, Chanwoo Choi wrote:
> Hi,
> 
> I need the time to dig the ICC framework
> to understand them detailed. After that, I'll review this.
> 
> Basically, I agree this approach. But, I'm wondering
> the existing binding method between 'bus_leftbus' and 'bus_dmc'.
> From before, I thought that devfreq framework need to
> enhance the binding method between parent devfreq device
> and passive devfreq device instead of 'devfreq' property.
> 
> On this patch, use the same binding way between
> 'bus_leftbus' and 'bus_dmc' with 'parent' property
> as following:
> 
> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> @@ -106,6 +106,7 @@
>  &bus_leftbus {
>  	devfreq-events = <&ppmu_leftbus_3>, <&ppmu_rightbus_3>;
>  	vdd-supply = <&buck3_reg>;
> +	parent = <&bus_dmc>;
>  	status = "okay";
>  };
> 
> I'm not sure about continuing to use this method for new feature.
> If possible, hope to replace the existing binding style
> with new method like of_graph. Actually, I don't know the correct method.

Adding the 'parent' binding was the simplest solution to create this
RFC to show the concept of using interconnect functionality in devfreq.
I agree that a method like of_graph is probably more elegant. I am open
to suggestions.

> On 19. 9. 19. 오후 11:22, Artur Świgoń wrote:
> > From: Artur Świgoń <a.swigon@partner.samsung.com>
> > 
> > This patch adds interconnect functionality to the exynos-bus devfreq
> > driver.
> > 
> > The SoC topology is a graph (or, more specifically, a tree) and most of
> > its edges are taken from the devfreq parent-child hierarchy (cf.
> > Documentation/devicetree/bindings/devfreq/exynos-bus.txt). Due to
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
> > Frequencies requested via the interconnect API for a given node are
> > propagated to devfreq using dev_pm_qos_update_request(). Please note that
> > it is not an error when CONFIG_INTERCONNECT is 'n', in which case all
> > interconnect API functions are no-op.
> > 
> > Signed-off-by: Artur Świgoń <a.swigon@partner.samsung.com>
> > ---
> >  drivers/devfreq/exynos-bus.c | 153 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 153 insertions(+)
> > 
> > diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
> > index 8d44810cac69..e0232202720d 100644
> > --- a/drivers/devfreq/exynos-bus.c
> > +++ b/drivers/devfreq/exynos-bus.c
> > @@ -14,14 +14,19 @@
> >  #include <linux/devfreq-event.h>
> >  #include <linux/device.h>
> >  #include <linux/export.h>
> > +#include <linux/idr.h>
> > +#include <linux/interconnect-provider.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <linux/pm_opp.h>
> > +#include <linux/pm_qos.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regulator/consumer.h>
> >  
> >  #define DEFAULT_SATURATION_RATIO	40
> >  
> > +#define icc_units_to_khz(x) ((x) / 8)
> > +
> >  struct exynos_bus {
> >  	struct device *dev;
> >  
> > @@ -35,6 +40,12 @@ struct exynos_bus {
> >  	struct opp_table *opp_table;
> >  	struct clk *clk;
> >  	unsigned int ratio;
> > +
> > +	/* One provider per bus, one node per provider */
> > +	struct icc_provider provider;
> > +	struct icc_node *node;
> > +
> > +	struct dev_pm_qos_request qos_req;
> >  };
> >  
> >  /*
> > @@ -59,6 +70,13 @@ exynos_bus_ops_edev(enable_edev);
> >  exynos_bus_ops_edev(disable_edev);
> >  exynos_bus_ops_edev(set_event);
> >  
> > +static int exynos_bus_next_id(void)
> > +{
> > +	static DEFINE_IDA(exynos_bus_icc_ida);
> > +
> > +	return ida_alloc(&exynos_bus_icc_ida, GFP_KERNEL);
> > +}
> > +
> >  static int exynos_bus_get_event(struct exynos_bus *bus,
> >  				struct devfreq_event_data *edata)
> >  {
> > @@ -171,6 +189,38 @@ static void exynos_bus_passive_exit(struct device *dev)
> >  	clk_disable_unprepare(bus->clk);
> >  }
> >  
> > +static int exynos_bus_icc_set(struct icc_node *src, struct icc_node *dst)
> > +{
> > +	struct exynos_bus *src_bus = src->data, *dst_bus = dst->data;
> > +	s32 src_freq = icc_units_to_khz(src->avg_bw);
> > +	s32 dst_freq = icc_units_to_khz(dst->avg_bw);
> > +
> > +	dev_pm_qos_update_request(&src_bus->qos_req, src_freq);
> > +	dev_pm_qos_update_request(&dst_bus->qos_req, dst_freq);
> > +
> > +	return 0;
> > +}
> > +
> > +static int exynos_bus_icc_aggregate(struct icc_node *node, u32 tag, u32 avg_bw,
> > +				    u32 peak_bw, u32 *agg_avg, u32 *agg_peak)
> > +{
> > +	*agg_avg += avg_bw;
> > +	*agg_peak = max(*agg_peak, peak_bw);
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
> > @@ -366,6 +416,101 @@ static int exynos_bus_profile_init_passive(struct exynos_bus *bus,
> >  	return 0;
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
> > +			goto out; /* 'parent' is optional */
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
> 
> 
> 
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
> > +	ret = id = exynos_bus_next_id();
> > +	if (ret < 0)
> > +		goto err_node;
> > +
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
> > +	ret = dev_pm_qos_add_request(bus->devfreq->dev.parent, &bus->qos_req,
> > +				     DEV_PM_QOS_MIN_FREQUENCY, 0);
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
> > @@ -415,6 +560,14 @@ static int exynos_bus_probe(struct platform_device *pdev)
> >  	if (ret < 0)
> >  		goto err;
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

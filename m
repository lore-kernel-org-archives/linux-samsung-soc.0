From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFC PATCH 09/11] devfreq: exynos-bus: Add interconnect
 functionality to exynos-bus
Date: Wed, 24 Jul 2019 20:36:39 +0200
Message-ID: <20190724183639.GA14346@kozik-lap>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
 <CGME20190723122028eucas1p2eb75f35b810e71d6c590370aaff0997b@eucas1p2.samsung.com>
 <20190723122016.30279-10-a.swigon@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190723122016.30279-10-a.swigon@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Artur =?utf-8?B?xZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, cw00.choi@samsung.com, myungjoo.ham@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, georgi.djakov@linaro.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jul 23, 2019 at 02:20:14PM +0200, Artur Świgoń wrote:
> This patch adds interconnect functionality to the exynos-bus devfreq
> driver.
> 
> The SoC topology is a graph (or, more specifically, a tree) and most of its
> edges are taken from the devfreq parent-child hierarchy (cf.
> Documentation/devicetree/bindings/devfreq/exynos-bus.txt). The previous
> patch adds missing edges to the DT (under the name 'parent'). Due to

Do not refer to DT patches. They will come through different tree so
"previous" will not be correct anymore. You mentioned dependencies in
cover letter so it is sufficient.

> unspecified relative probing order, -EPROBE_DEFER may be propagated to
> guarantee that a child is probed before its parent.
> 
> Each bus is now an interconnect provider and an interconnect node as well
> (cf. Documentation/interconnect/interconnect.rst), i.e. every bus registers
> itself as a node. Node IDs are not hardcoded but rather assigned at
> runtime, in probing order (subject to the above-mentioned exception
> regarding relative order). This approach allows for using this driver with
> various Exynos SoCs.
> 
> The devfreq target() callback provided by exynos-bus now selects either the
> frequency calculated by the devfreq governor or the frequency requested via
> the interconnect API for the given node, whichever is higher.
> 
> Please note that it is not an error when CONFIG_INTERCONNECT is 'n', in
> which case all interconnect API functions are no-op.
> 
> Signed-off-by: Artur Świgoń <a.swigon@partner.samsung.com>
> ---
>  drivers/devfreq/exynos-bus.c | 145 +++++++++++++++++++++++++++++++++++
>  1 file changed, 145 insertions(+)
> 
> diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
> index 412511ca7703..12fb7c84ae50 100644
> --- a/drivers/devfreq/exynos-bus.c
> +++ b/drivers/devfreq/exynos-bus.c
> @@ -14,6 +14,7 @@
>  #include <linux/devfreq-event.h>
>  #include <linux/device.h>
>  #include <linux/export.h>
> +#include <linux/interconnect-provider.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/pm_opp.h>
> @@ -23,6 +24,8 @@
>  #define DEFAULT_SATURATION_RATIO	40
>  #define DEFAULT_VOLTAGE_TOLERANCE	2
>  
> +#define icc_units_to_hz(x) ((x) * 1000UL / 8)
> +
>  struct exynos_bus {
>  	struct device *dev;
>  
> @@ -31,12 +34,17 @@ struct exynos_bus {
>  	unsigned int edev_count;
>  	struct mutex lock;
>  
> +	unsigned long min_freq;
>  	unsigned long curr_freq;
>  
>  	struct regulator *regulator;
>  	struct clk *clk;
>  	unsigned int voltage_tolerance;
>  	unsigned int ratio;
> +
> +	/* One provider per bus, one node per provider */
> +	struct icc_provider provider;
> +	struct icc_node *node;
>  };
>  
>  /*
> @@ -61,6 +69,13 @@ exynos_bus_ops_edev(enable_edev);
>  exynos_bus_ops_edev(disable_edev);
>  exynos_bus_ops_edev(set_event);
>  
> +static int exynos_bus_next_id(void)
> +{
> +	static int exynos_bus_node_id;
> +
> +	return exynos_bus_node_id++;

This does not look robust. Use IDR for IDs. 

> +}
> +
>  static int exynos_bus_get_event(struct exynos_bus *bus,
>  				struct devfreq_event_data *edata)
>  {
> @@ -98,6 +113,8 @@ static int exynos_bus_target(struct device *dev, unsigned long *freq, u32 flags)
>  	unsigned long old_freq, new_freq, new_volt, tol;
>  	int ret = 0;
>  
> +	*freq = max(*freq, bus->min_freq);
> +
>  	/* Get new opp-bus instance according to new bus clock */
>  	new_opp = devfreq_recommended_opp(dev, freq, flags);
>  	if (IS_ERR(new_opp)) {
> @@ -208,6 +225,8 @@ static int exynos_bus_passive_target(struct device *dev, unsigned long *freq,
>  	unsigned long old_freq, new_freq;
>  	int ret = 0;
>  
> +	*freq = max(*freq, bus->min_freq);
> +
>  	/* Get new opp-bus instance according to new bus clock */
>  	new_opp = devfreq_recommended_opp(dev, freq, flags);
>  	if (IS_ERR(new_opp)) {
> @@ -251,6 +270,35 @@ static void exynos_bus_passive_exit(struct device *dev)
>  	clk_disable_unprepare(bus->clk);
>  }
>  
> +static int exynos_bus_icc_set(struct icc_node *src, struct icc_node *dst)
> +{
> +	struct exynos_bus *src_bus = src->data, *dst_bus = dst->data;
> +
> +	src_bus->min_freq = icc_units_to_hz(src->peak_bw);
> +	dst_bus->min_freq = icc_units_to_hz(dst->peak_bw);
> +
> +	return 0;
> +}
> +
> +static int exynos_bus_icc_aggregate(struct icc_node *node, u32 avg_bw,
> +				    u32 peak_bw, u32 *agg_avg, u32 *agg_peak)
> +{
> +	*agg_peak = *agg_avg = peak_bw;
> +
> +	return 0;
> +}
> +
> +static struct icc_node *exynos_bus_icc_xlate(struct of_phandle_args *spec,
> +					     void *data)
> +{
> +	struct exynos_bus *bus = data;
> +
> +	if (spec->np != bus->dev->of_node)
> +		return ERR_PTR(-EINVAL);
> +
> +	return bus->node;
> +}
> +
>  static int exynos_bus_parent_parse_of(struct device_node *np,
>  					struct exynos_bus *bus)
>  {
> @@ -469,6 +517,95 @@ static int exynos_bus_profile_init_passive(struct exynos_bus *bus,
>  	return ret;
>  }
>  
> +static int exynos_bus_icc_connect(struct exynos_bus *bus)
> +{
> +	struct device_node *np = bus->dev->of_node;
> +	struct devfreq *parent_devfreq;
> +	struct icc_node *parent_node = NULL;
> +	struct of_phandle_args args;
> +	int ret = 0;
> +
> +	parent_devfreq = devfreq_get_devfreq_by_phandle(bus->dev, 0);
> +	if (!IS_ERR(parent_devfreq)) {
> +		struct exynos_bus *parent_bus;

What if someone unbinds this parent devfreq? I guess everything in
devfreq starts exploding... however it's not the problem of this patch.

Do you also need suspend/resume order (device links)? I guess the other
side, e.g.  mixer, should resume before the bus?

> +
> +		parent_bus = dev_get_drvdata(parent_devfreq->dev.parent);
> +		parent_node = parent_bus->node;
> +	} else {
> +		/* Look for parent in DT */
> +		int num = of_count_phandle_with_args(np, "parent",
> +						     "#interconnect-cells");
> +		if (num != 1)

You will return here 0 but isn't it an error?

Best regards,
Krzysztof

From: Artur =?UTF-8?Q?=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>
Subject: Re: [RFC PATCH 01/11] devfreq: exynos-bus: Extract
 exynos_bus_profile_init()
Date: Wed, 31 Jul 2019 15:00:38 +0200
Message-ID: <bda10bcc66aae96355e74c4739229d72bcc95b0d.camel@partner.samsung.com>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
        <CGME20190723122022eucas1p1266d90873d564894bd852c20140f8474@eucas1p1.samsung.com>
        <20190723122016.30279-2-a.swigon@partner.samsung.com>
        <20190724190741.GD14346@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190724190741.GD14346@kozik-lap>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, cw00.choi@samsung.com, myungjoo.ham@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, georgi.djakov@linaro.org, m.szyprowski@samsung.com, =?UTF-8?Q?Bart=C5=82omiej_?= =?UTF-8?Q?=C5=BBo=C5=82nierkiewicz?= <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Wed, 2019-07-24 at 21:07 +0200, Krzysztof Kozlowski wrote:
> On Tue, Jul 23, 2019 at 02:20:06PM +0200, Artur Świgoń wrote:
> > This patch adds a new static function, exynos_bus_profile_init(), extracted
> > from exynos_bus_probe().
> > 
> > Signed-off-by: Artur Świgoń <a.swigon@partner.samsung.com>
> > ---
> >  drivers/devfreq/exynos-bus.c | 106 ++++++++++++++++++++---------------
> >  1 file changed, 60 insertions(+), 46 deletions(-)
> > 
> > diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
> > index d9f377912c10..d8f1efaf2d49 100644
> > --- a/drivers/devfreq/exynos-bus.c
> > +++ b/drivers/devfreq/exynos-bus.c
> > @@ -372,12 +372,69 @@ static int exynos_bus_parse_of(struct device_node *np,
> >  	return ret;
> >  }
> >  
> > +static int exynos_bus_profile_init(struct exynos_bus *bus,
> > +				   struct devfreq_dev_profile *profile)
> > +{
> > +	struct device *dev = bus->dev;
> > +	struct devfreq_simple_ondemand_data *ondemand_data;
> > +	int ret;
> > +
> > +	/* Initialize the struct profile and governor data for parent device */
> > +	profile->polling_ms = 50;
> > +	profile->target = exynos_bus_target;
> > +	profile->get_dev_status = exynos_bus_get_dev_status;
> > +	profile->exit = exynos_bus_exit;
> > +
> > +	ondemand_data = devm_kzalloc(dev, sizeof(*ondemand_data), GFP_KERNEL);
> > +	if (!ondemand_data) {
> > +		ret = -ENOMEM;
> > +		goto err;
> 
> Just return proper error code. Less lines, obvious code since you do not
> have any cleanup in error path.

I was advised to avoid modifying code being moved (in one patch). I do make
changes in these places in patch 04/11, i.e. change the original label 'err' to
'out'. What's your opinion on making the proposed changes to patches 01 and 02
(s/goto err/return ret/) in patch 04 instead?

> > +
> > +	/* Register opp_notifier to catch the change of OPP  */
> > +	ret = devm_devfreq_register_opp_notifier(dev, bus->devfreq);
> > +	if (ret < 0) {
> > +		dev_err(dev, "failed to register opp notifier\n");
> > +		goto err;
> 
> The same - return err.
> 
> Best regards,
> Krzysztof

Best regards,
-- 
Artur Świgoń
Samsung R&D Institute Poland
Samsung Electronics

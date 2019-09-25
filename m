From: Artur =?UTF-8?Q?=C5=9Awigo=C5=84?= <a.swigon@samsung.com>
Subject: Re: [RFC PATCH v2 01/11] devfreq: exynos-bus: Extract
 exynos_bus_profile_init()
Date: Wed, 25 Sep 2019 07:44:35 +0200
Message-ID: <f51aac4cacb7a0196ab6919b110ad9fcf4009c88.camel@samsung.com>
References: <20190919142236.4071-1-a.swigon@samsung.com>
        <CGME20190919142322eucas1p24bc477ee6e1bcd65546c305d55af097d@eucas1p2.samsung.com>
        <20190919142236.4071-2-a.swigon@samsung.com>
        <2e49bd2c-e074-038b-f8a2-7dd8dea4a9af@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2e49bd2c-e074-038b-f8a2-7dd8dea4a9af@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Artur =?UTF-8?Q?=C5=9Awigo=C5=84?= <a.swigon@samsung.com>, myungjoo.ham@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, georgi.djakov@linaro.org, leonard.crestez@nxp.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, krzk@kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Fri, 2019-09-20 at 11:15 +0900, Chanwoo Choi wrote:
> Hi,
> 
> As I already replied on v1, patch1/2/3 clean-up code
> for readability without any behavior changes. 
> 
> I think that you better to merge patch1/2/3 to one patch.

Yes, when writing the cover letter I think I forgot to explain why I decided not
to merge these patches. Basically, none of the diff algorithms available in git
(I've got v2.17.1) is able to produce a readable patch with these changes
combined together into a single patch (functions are intermixed together in the
output, git thinks that 'exynos_bus_probe' is a new function).

Please take a look at the diff at the bottom of this message to see how patches
01..03 look when combined. If such patch looks acceptable to you, I can merge.

> On 19. 9. 19. 오후 11:22, Artur Świgoń wrote:
> > From: Artur Świgoń <a.swigon@partner.samsung.com>
> > 
> > This patch adds a new static function, exynos_bus_profile_init(), extracted
> > from exynos_bus_probe().
> > 
> > Signed-off-by: Artur Świgoń <a.swigon@partner.samsung.com>
> > ---
> >  drivers/devfreq/exynos-bus.c | 92 +++++++++++++++++++++---------------
> >  1 file changed, 53 insertions(+), 39 deletions(-)
> > 
> > diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
> > index 29f422469960..78f38b7fb596 100644
> > --- a/drivers/devfreq/exynos-bus.c
> > +++ b/drivers/devfreq/exynos-bus.c
> > @@ -287,12 +287,62 @@ static int exynos_bus_parse_of(struct device_node *np,
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
> > +	}
> > +	ondemand_data->upthreshold = 40;
> > +	ondemand_data->downdifferential = 5;
> > +
> > +	/* Add devfreq device to monitor and handle the exynos bus */
> > +	bus->devfreq = devm_devfreq_add_device(dev, profile,
> > +						DEVFREQ_GOV_SIMPLE_ONDEMAND,
> > +						ondemand_data);
> > +	if (IS_ERR(bus->devfreq)) {
> > +		dev_err(dev, "failed to add devfreq device\n");
> > +		ret = PTR_ERR(bus->devfreq);
> > +		goto err;
> > +	}
> > +
> > +	/*
> > +	 * Enable devfreq-event to get raw data which is used to determine
> > +	 * current bus load.
> > +	 */
> > +	ret = exynos_bus_enable_edev(bus);
> > +	if (ret < 0) {
> > +		dev_err(dev, "failed to enable devfreq-event devices\n");
> > +		goto err;
> > +	}
> > +
> > +	ret = exynos_bus_set_event(bus);
> > +	if (ret < 0) {
> > +		dev_err(dev, "failed to set event to devfreq-event devices\n");
> > +		goto err;
> > +	}
> > +
> > +err:
> > +	return ret;
> > +}
> > +
> >  static int exynos_bus_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> >  	struct device_node *np = dev->of_node, *node;
> >  	struct devfreq_dev_profile *profile;
> > -	struct devfreq_simple_ondemand_data *ondemand_data;
> >  	struct devfreq_passive_data *passive_data;
> >  	struct devfreq *parent_devfreq;
> >  	struct exynos_bus *bus;
> > @@ -334,45 +384,9 @@ static int exynos_bus_probe(struct platform_device *pdev)
> >  	if (passive)
> >  		goto passive;
> >  
> > -	/* Initialize the struct profile and governor data for parent device */
> > -	profile->polling_ms = 50;
> > -	profile->target = exynos_bus_target;
> > -	profile->get_dev_status = exynos_bus_get_dev_status;
> > -	profile->exit = exynos_bus_exit;
> > -
> > -	ondemand_data = devm_kzalloc(dev, sizeof(*ondemand_data), GFP_KERNEL);
> > -	if (!ondemand_data) {
> > -		ret = -ENOMEM;
> > +	ret = exynos_bus_profile_init(bus, profile);
> > +	if (ret < 0)
> >  		goto err;
> > -	}
> > -	ondemand_data->upthreshold = 40;
> > -	ondemand_data->downdifferential = 5;
> > -
> > -	/* Add devfreq device to monitor and handle the exynos bus */
> > -	bus->devfreq = devm_devfreq_add_device(dev, profile,
> > -						DEVFREQ_GOV_SIMPLE_ONDEMAND,
> > -						ondemand_data);
> > -	if (IS_ERR(bus->devfreq)) {
> > -		dev_err(dev, "failed to add devfreq device\n");
> > -		ret = PTR_ERR(bus->devfreq);
> > -		goto err;
> > -	}
> > -
> > -	/*
> > -	 * Enable devfreq-event to get raw data which is used to determine
> > -	 * current bus load.
> > -	 */
> > -	ret = exynos_bus_enable_edev(bus);
> > -	if (ret < 0) {
> > -		dev_err(dev, "failed to enable devfreq-event devices\n");
> > -		goto err;
> > -	}
> > -
> > -	ret = exynos_bus_set_event(bus);
> > -	if (ret < 0) {
> > -		dev_err(dev, "failed to set event to devfreq-event devices\n");
> > -		goto err;
> > -	}
> >  
> >  	goto out;
> >  passive:

commit cacf8e4ea0e111908d11779977c81e29d6418801
Author: Artur Świgoń <a.swigon@partner.samsung.com>
Date:   Tue Aug 27 13:17:28 2019 +0200

    tmp: merge patches 01-03
    
    Signed-off-by: Artur Świgoń <a.swigon@partner.samsung.com>

diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
index 29f422469960..60ad4319fd80 100644
--- a/drivers/devfreq/exynos-bus.c
+++ b/drivers/devfreq/exynos-bus.c
@@ -287,52 +287,12 @@ static int exynos_bus_parse_of(struct device_node *np,
 	return ret;
 }
 
-static int exynos_bus_probe(struct platform_device *pdev)
+static int exynos_bus_profile_init(struct exynos_bus *bus,
+				   struct devfreq_dev_profile *profile)
 {
-	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node, *node;
-	struct devfreq_dev_profile *profile;
+	struct device *dev = bus->dev;
 	struct devfreq_simple_ondemand_data *ondemand_data;
-	struct devfreq_passive_data *passive_data;
-	struct devfreq *parent_devfreq;
-	struct exynos_bus *bus;
-	int ret, max_state;
-	unsigned long min_freq, max_freq;
-	bool passive = false;
-
-	if (!np) {
-		dev_err(dev, "failed to find devicetree node\n");
-		return -EINVAL;
-	}
-
-	bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
-	if (!bus)
-		return -ENOMEM;
-	mutex_init(&bus->lock);
-	bus->dev = &pdev->dev;
-	platform_set_drvdata(pdev, bus);
-
-	profile = devm_kzalloc(dev, sizeof(*profile), GFP_KERNEL);
-	if (!profile)
-		return -ENOMEM;
-
-	node = of_parse_phandle(dev->of_node, "devfreq", 0);
-	if (node) {
-		of_node_put(node);
-		passive = true;
-	} else {
-		ret = exynos_bus_parent_parse_of(np, bus);
-		if (ret < 0)
-			return ret;
-	}
-
-	/* Parse the device-tree to get the resource information */
-	ret = exynos_bus_parse_of(np, bus);
-	if (ret < 0)
-		goto err_reg;
-
-	if (passive)
-		goto passive;
+	int ret;
 
 	/* Initialize the struct profile and governor data for parent device */
 	profile->polling_ms = 50;
@@ -374,8 +334,18 @@ static int exynos_bus_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	goto out;
-passive:
+err:
+	return ret;
+}
+
+static int exynos_bus_profile_init_passive(struct exynos_bus *bus,
+					   struct devfreq_dev_profile *profile)
+{
+	struct device *dev = bus->dev;
+	struct devfreq_passive_data *passive_data;
+	struct devfreq *parent_devfreq;
+	int ret = 0;
+
 	/* Initialize the struct profile and governor data for passive device */
 	profile->target = exynos_bus_target;
 	profile->exit = exynos_bus_passive_exit;
@@ -404,7 +374,59 @@ static int exynos_bus_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-out:
+err:
+	return ret;
+}
+
+static int exynos_bus_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node, *node;
+	struct devfreq_dev_profile *profile;
+	struct exynos_bus *bus;
+	int ret, max_state;
+	unsigned long min_freq, max_freq;
+	bool passive = false;
+
+	if (!np) {
+		dev_err(dev, "failed to find devicetree node\n");
+		return -EINVAL;
+	}
+
+	bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
+	if (!bus)
+		return -ENOMEM;
+	mutex_init(&bus->lock);
+	bus->dev = &pdev->dev;
+	platform_set_drvdata(pdev, bus);
+
+	profile = devm_kzalloc(dev, sizeof(*profile), GFP_KERNEL);
+	if (!profile)
+		return -ENOMEM;
+
+	node = of_parse_phandle(dev->of_node, "devfreq", 0);
+	if (node) {
+		of_node_put(node);
+		passive = true;
+	} else {
+		ret = exynos_bus_parent_parse_of(np, bus);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* Parse the device-tree to get the resource information */
+	ret = exynos_bus_parse_of(np, bus);
+	if (ret < 0)
+		goto err_reg;
+
+	if (passive)
+		ret = exynos_bus_profile_init_passive(bus, profile);
+	else
+		ret = exynos_bus_profile_init(bus, profile);
+
+	if (ret < 0)
+		goto err;
+
 	max_state = bus->devfreq->profile->max_state;
 	min_freq = (bus->devfreq->profile->freq_table[0] / 1000);
 	max_freq = (bus->devfreq->profile->freq_table[max_state - 1] / 1000);

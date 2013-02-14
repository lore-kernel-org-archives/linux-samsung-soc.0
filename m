From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V6 02/10] ASoC: SAMSUNG: Add DT support for i2s
Date: Thu, 14 Feb 2013 12:05:54 +0100
Message-ID: <1448282.P7VUi6gpBa@amdc1227>
References: <1358509629-20471-1-git-send-email-padma.v@samsung.com>
 <1358509629-20471-3-git-send-email-padma.v@samsung.com>
 <511CC11B.5030700@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:47465 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933839Ab3BNLGT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Feb 2013 06:06:19 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MI7009MTIUHIQ30@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Feb 2013 20:06:18 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MI70044WIU0X600@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Feb 2013 20:06:17 +0900 (KST)
In-reply-to: <511CC11B.5030700@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, vinod.koul@intel.com, grant.likely@secretlab.ca, swarren@nvidia.com, boojin.kim@samsung.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, thomas.abraham@linaro.org, lrg@ti.com, tiwai@suse.de, ben-linux@fluff.org

Hi,

On Thursday 14 of February 2013 11:48:59 Sylwester Nawrocki wrote:
> On 01/18/2013 12:47 PM, Padmavathi Venna wrote:
> > Add support for device based discovery.
> > 
> > Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> > ---
> 
> ...
> 
> >  /* Lock for cross i/f checks */
> > 
> > @@ -997,19 +1006,76 @@ static struct i2s_dai *i2s_alloc_dai(struct
> > platform_device *pdev, bool sec)> 
> >  	return i2s;
> >  
> >  }
> > 
> > +#ifdef CONFIG_OF
> > +static int samsung_i2s_parse_dt_gpio(struct i2s_dai *i2s)
> > +{
> > +	struct device *dev = &i2s->pdev->dev;
> > +	int index, gpio, ret;
> > +
> > +	for (index = 0; index < 7; index++) {
> > +		gpio = of_get_gpio(dev->of_node, index);
> > +		if (!gpio_is_valid(gpio)) {
> > +			dev_err(dev, "invalid gpio[%d]: %d\n", index, gpio);
> > +			goto free_gpio;
> > +		}
> > +
> > +		ret = gpio_request(gpio, dev_name(dev));
> > +		if (ret) {
> > +			dev_err(dev, "gpio [%d] request failed\n", gpio);
> > +			goto free_gpio;
> > +		}
> > +		i2s->gpios[index] = gpio;
> > +	}
> > +	return 0;
> > +
> > +free_gpio:
> > +	while (--index >= 0)
> > +		gpio_free(i2s->gpios[index]);
> > +	return -EINVAL;
> > +}
> > +
> > +static void samsung_i2s_dt_gpio_free(struct i2s_dai *i2s)
> > +{
> > +	unsigned int index;
> > +	for (index = 0; index < 7; index++)
> > +		gpio_free(i2s->gpios[index]);
> > +}
> > +#else
> > +static int samsung_i2s_parse_dt_gpio(struct i2s_dai *dai)
> > +{
> > +	return -EINVAL;
> > +}
> > +
> > +static void samsung_i2s_dt_gpio_free(struct i2s_dai *dai)
> > +{
> > +}
> > +
> > +#endif
> 
> NAK.

+1

> 
> Why we should leave with this temporary code when there is already
> pinctrl support for Exynos SoCs ?
> 
> If the pinctrl driver for Exynos5 was updated you could instead just do
> 
> devm_pinctrl_get_select_default(&i2s->pdev->dev);

I said it already by the way of some other Exynos5 patches that Exynos5 
has to be migrated to pin control.

The legacy GPIO interface was supposed to be kept only for compatibility 
with existing code (until it gets migrated to pin control), not for adding 
new code relying on it.

If you intend to add new code which needs to configure pin muxes, you 
should migrate Exynos5 to pin control first. This won't be particularly 
hard, since pinctrl-exynos driver already supports Exynos5 and all that is 
missing are Device Tree nodes for it.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform

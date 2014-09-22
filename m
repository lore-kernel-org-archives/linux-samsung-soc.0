From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: RE: [PATCH v4] mfd: syscon: Decouple syscon interface from platform
 devices
Date: Mon, 22 Sep 2014 09:41:54 +0530
Message-ID: <001a01cfd61b$5ac95a00$105c0e00$@samsung.com>
References: <1411132009-11173-1-git-send-email-pankaj.dubey@samsung.com>
 <541C47BD.3070601@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:14642 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750757AbaIVEJs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Sep 2014 00:09:48 -0400
In-reply-to: <541C47BD.3070601@gmail.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: lee.jones@linaro.org, arnd@arndb.de, linux@arm.linux.org.uk, vikas.sajjan@samsung.com, joshi@samsung.com, naushad@samsung.com, thomas.ab@samsung.com, chow.kim@samsung.com, kgene.kim@samsung.com, b29396@freescale.com, Li.Xiubo@freescale.com

Hi Tomasz,

On Friday, September 19, 2014 Tomasz Figa wrote,
> Hi Pankaj,
> 
> Please see my comments inline.
> 
> On 19.09.2014 15:06, Pankaj Dubey wrote:
> > Currently a syscon entity can be only registered directly through a
> > platform device that binds to a dedicated syscon driver. However in
> > certain use cases it is desirable to make a device used with another
> > driver a syscon interface provider.
> 
> [snip]
> 
> > -static int syscon_match_node(struct device *dev, void *data)
> > +static struct syscon *of_syscon_register(struct device_node *np)
> >  {
> > -	struct device_node *dn = data;
> > +	struct platform_device *pdev = NULL;
> > +	struct syscon *syscon;
> > +	struct regmap *regmap;
> > +	void __iomem *base;
> > +
> > +
> 
> nit: Stray blank line.
> 

OK. Will remove this.

> > +	if (!of_device_is_compatible(np, "syscon"))
> > +		return ERR_PTR(-EINVAL);
> 
> I don't think this check is needed at all. I'd say that drivers should be
free to register a
> syscon provider for any node.

I think this check is correct, as only nodes having "syscon" as secondary
compatibility should be
used to create a syscon provider. And that's why we have "syscon" as
secondary compatibility in
device nodes which can be a syscon provider.

> 
> > +
> > +	syscon = kzalloc(sizeof(*syscon), GFP_KERNEL);
> > +	if (!syscon)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	base = of_iomap(np, 0);
> > +	if (!base)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	if (!of_device_is_available(np) ||
> 
> Wouldn't it be enough to simply call of_find_device_by_node(np) and if it
fails then
> instead create a dummy device?
> 

OK, this could be also one of approach, I will change accordingly.

> > +			of_node_test_and_set_flag(np, OF_POPULATED)) {
> > +		/* if device is already populated and avaiable then use it
*/
> > +		pdev = of_find_device_by_node(np);
> > +		if (!(&pdev->dev))
> 
> This is just plain wrong, because this condition will always evaluate to
true (see the
> definition of struct platform_device). Shouldn't you rather just check the
pdev
> pointer?

OK, will update this.

> 
> > +			return ERR_PTR(-ENODEV);
> > +
> > +	} else {
> > +		/* for early users create dummy syscon device and use it */
> > +		pdev = kzalloc(sizeof(*pdev), GFP_KERNEL);
> > +		if (!pdev)
> > +			return ERR_PTR(-ENOMEM);
> 
> Any clean-up on error path?

OK, will add error path. Also will use platform_device_alloc as suggested.

> 
> > +
> > +		pdev->name = "dummy-syscon";
> > +		pdev->id = -1;
> 
> Wouldn't you get an ID collision if more than one syscon is registered
early? Maybe
> the naming scheme from of_device_alloc() could be adopted partially?

I think this should not be an issue, passing id as -1 should take care of
this.
As you know Exynos has two syscon providers "pmu" and "sysreg" I have
written a test
code to check this scenario and tested it during early stage and I am
successfully able to get
PMU and SYSREG handle.
 
> 
> > +		device_initialize(&pdev->dev);
> 
> I wonder if you couldn't simply reuse platform_device_alloc() for all of
this, except
> the line below, which would still have to be handled separately.
> 
> > +		pdev->dev.of_node = np;
> > +	}
> > +
> > +	regmap = regmap_init_mmio(&pdev->dev, base, &syscon_regmap_config);
> > +	if (IS_ERR(regmap)) {
> > +		pr_err("regmap init failed\n");
> 
> If you have a dev here then you should be able to use dev_err() already.

OK.

> 
> > +		return ERR_CAST(regmap);
> > +	}

[snip]

> > +
> > +	if (!syscon)
> > +		syscon = of_syscon_register(np);
> > +
> > +	if (!IS_ERR(syscon))
> > +		return syscon->regmap;
> > +
> > +	return ERR_CAST(syscon);
> 
> nit: Usually error checking is done the opposite way, i.e.

OK, will change accordingly.

Thanks,
Pankaj Dubey
> 
> 	if (IS_ERR(syscon))
> 		return ERR_CAST(syscon);
> 
> 	return syscon->regmap;
> 
> Best regards,
> Tomasz

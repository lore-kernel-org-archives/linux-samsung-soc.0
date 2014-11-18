From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: RE: [PATCH v4 2/2] ARM: EXYNOS: PMU: move restart code into pmu driver
Date: Tue, 18 Nov 2014 16:20:40 +0530
Message-ID: <000001d0031d$96c32250$c44966f0$@samsung.com>
References: <1416223273-1279-1-git-send-email-pankaj.dubey@samsung.com>
 <1416223273-1279-3-git-send-email-pankaj.dubey@samsung.com>
 <20141117164116.GA28915@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:18852 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753434AbaKRKug (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Nov 2014 05:50:36 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NF800627E4AE8B0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Nov 2014 19:50:34 +0900 (KST)
In-reply-to: <20141117164116.GA28915@roeck-us.net>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Guenter Roeck' <linux@roeck-us.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, linux@arm.linux.org.uk, thomas.ab@samsung.com

On Monday, November 17, 2014 10:11 PM, Guenter Roeck wrote:
> On Mon, Nov 17, 2014 at 04:51:13PM +0530, Pankaj Dubey wrote:
> >
> > +/*
> > + * Exynos PMU reboot notifier, handles reboot functionality
> 
> restart, really.
> 
> > + */
> > +static struct notifier_block pmu_restart_handler = {
> > +	.notifier_call = pmu_restart_notify,
> > +	.priority = 128,
> > +};
> > +
> >  static int exynos_pmu_probe(struct platform_device *pdev)  {
> >  	const struct of_device_id *match;
> >  	struct device *dev = &pdev->dev;
> >  	struct resource *res;
> > +	int ret;
> >
> >  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >  	pmu_base_addr = devm_ioremap_resource(dev, res); @@ -794,6 +813,10
> > @@ static int exynos_pmu_probe(struct platform_device *pdev)
> >
> >  	platform_set_drvdata(pdev, pmu_context);
> >
> > +	ret = register_restart_handler(&pmu_restart_handler);
> > +	if (ret)
> > +		dev_err(dev, "can't register restart handler err=%d\n",
ret);
> > +
> 
> dev_warn might be more appropriate, since you ignore the error.
> But that is a nitpick, really, as well as the above.
> 
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> 

Thanks for review. I will update both patches as per your review comments.

Thanks,
Pankaj Dubey

> >  	dev_dbg(dev, "Exynos PMU Driver probe done\n");
> >  	return 0;
> >  }
> > --
> > 1.7.9.5
> >

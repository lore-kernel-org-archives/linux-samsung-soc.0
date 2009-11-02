From: Ben Dooks <ben@trinity.fluff.org>
Subject: Re: [PATCH 4/4] S3C64XX DSP: Added the CPU driver for PCM
	controllers
Date: Mon, 2 Nov 2009 11:39:32 +0000
Message-ID: <20091102113932.GB23772@trinity.fluff.org>
References: <1257127791-5595-1-git-send-email-jassisinghbrar@gmail.com> <1257127791-5595-2-git-send-email-jassisinghbrar@gmail.com> <1257127791-5595-3-git-send-email-jassisinghbrar@gmail.com> <1257127791-5595-4-git-send-email-jassisinghbrar@gmail.com> <20091102111753.GB29351@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:55755 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754443AbZKBLje (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Nov 2009 06:39:34 -0500
Content-Disposition: inline
In-Reply-To: <20091102111753.GB29351@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: jassisinghbrar@gmail.com, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>


> > +	dai->private_data = dsp;
> > +
> > +	if (!base) {
> > +		struct resource *res = platform_get_resource(pdev,
> > +							     IORESOURCE_MEM,
> > +							     0);
> > +		if (!res) {
> > +			dev_err(dev, "Unable to get register resource\n");
> > +			return -ENXIO;
> > +		}
> > +
> > +		if (!request_mem_region(res->start, resource_size(res),
> > +					"s3c64xx-dsp")) {
> > +			dev_err(dev, "Unable to request register region\n");
> > +			return -EBUSY;
> > +		}
> > +
> > +		base = res->start;
> > +	}

I would like to see platform_devices with their proper resources being
mandatory for new drivers. We could do with this lot proplerly following
the device driver model.

> > +/* Module information */
> > +MODULE_AUTHOR("Jaswinder Singh, <jassi.brar@samsung.com>");
> > +MODULE_DESCRIPTION("S3C64XX PCM Controller Driver");

no module license.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.

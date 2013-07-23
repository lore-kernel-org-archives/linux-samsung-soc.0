From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2] spi: s3c64xx: fix casting warning
Date: Tue, 23 Jul 2013 16:08:39 +0200
Message-ID: <3276871.6XdjSQGWvi@amdc1227>
References: <008101ce82cb$34f0eea0$9ed2cbe0$@samsung.com>
 <10928386.fNethLYWc8@amdc1227> <20130723132753.GE9858@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:52559 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932442Ab3GWOIp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jul 2013 10:08:45 -0400
In-reply-to: <20130723132753.GE9858@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Jingoo Han <jg1.han@samsung.com>, linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Joe Perches' <joe@perches.com>, heiko@sntech.de, sylvester.nawrocki@gmail.com

On Tuesday 23 of July 2013 14:27:53 Mark Brown wrote:
> On Mon, Jul 22, 2013 at 07:09:27PM +0200, Tomasz Figa wrote:
> > On Wednesday 17 of July 2013 11:08:16 Mark Brown wrote:
> > > Applied, though only the cast to unsigned long should actually be
> > > needed
> > > - casting to void * should be good for any pointer so changing to the
> > > specific struct shouldn't be essential (might catch issues due to
> > > future API changes though).
> > 
> > Well, hopefully the old S3C DMA API with all its brokenness will get
> > removed soon and we switch to generic DMA engine API. (I already have
> > patches to migrate Samsung ASoC and SPI is being worked on.)
> 
> If you've done patches for ASoC note that there is generic dmaengine
> helper code which should be used.

Hmm, good to know. Let me see if I can adapt my patches to use this. There 
is no hurry, though, as we can't merge the conversion before s3c24xx DMA 
engine driver and my patches for s3c64xx support in PL08x driver get 
merged.

Best regards,
Tomasz

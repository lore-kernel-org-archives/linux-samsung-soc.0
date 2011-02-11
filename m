From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: S5PV210: Use REGULATOR_SUPPLY macro for regulator
	consumers
Date: Fri, 11 Feb 2011 18:31:05 +0000
Message-ID: <20110211183104.GA8149@sirena.org.uk>
References: <1296206960-28148-1-git-send-email-kgene.kim@samsung.com> <000501cbc9ce$6d281360$47783a20$%szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:46730 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757888Ab1BKSbI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Feb 2011 13:31:08 -0500
Content-Disposition: inline
In-Reply-To: <000501cbc9ce$6d281360$47783a20$%szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Fri, Feb 11, 2011 at 10:31:08AM +0100, Marek Szyprowski wrote:

> I'm sorry for the late reply, just noticed this commit on your kernel tree...

Please don't make up e-mail addresses for people if you want them to see
your e-mail - my e-mail address is broonie@opensource.wolfsonmicro.com

> > -	.num_consumer_supplies	= ARRAY_SIZE(buck1_consumer),
> > -	.consumer_supplies	= buck1_consumer,
> > +	.num_consumer_supplies	= 1,
> > +	.consumer_supplies	= &buck1_consumer,
> >  };

> I'm really not sure that this type of change is necessary. IMHO it makes the code harder
> to read, update or reuse. What is the reason for it?

FWIW I don't think it makes much difference either way.

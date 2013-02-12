From: Wolfram Sang <wolfram-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [RFC] i2c: Providing hooks for i2c multimaster bus arbitration.
Date: Tue, 12 Feb 2013 11:03:35 +0100
Message-ID: <20130212100335.GA5490@nekote.pengutronix.de>
References: <1359968595-21291-1-git-send-email-yuvaraj.cd@samsung.com>
 <20130210181710.GB12760@nekote.pengutronix.de>
 <CAD=FV=XzfseMEHK4KutgYYoU4kEFPq7qoFoJtaBrh6QJUa1Y_w@mail.gmail.com>
 <CAPnjgZ3HnXDp9ErsbZEfpc-NexuAt1C5cUWbFn=BW2TMGiMJEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPnjgZ3HnXDp9ErsbZEfpc-NexuAt1C5cUWbFn=BW2TMGiMJEg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Yuvaraj Kumar C D <yuvaraj.cd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yuvaraj Kumar C D <yuvaraj.cd-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Grundler <grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, naveen krishna <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

> > At the moment perhaps the strongest argument for why this particular
> > arbitration scheme is needed is that's what the EC (embedded
> > controller) on the ARM Chromebook uses.  There have been several
> > arguments in-house about whether this was the most ideal way to
> > structure things, but that's what we shipped with.  Thus, if we want
> > to be able to talk to i2c devices on this bus (contains the keyboard,
> > battery, and a bunch of power switches) we need something in the
> > system that implements this arbitration scheme.
> >
> 
> There was some discussion about using the built-in I2C multi-master
> support but no one had had a good experience getting it to work
> reliably in a real system so we ended up deciding not to rely on this.

So, were there no experiences at all or bad experiences when trying? I
am interested in hearing what I2C multi master restrictions might exist
in practice.

Thanks,

   Wolfram

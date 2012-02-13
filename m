From: Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH] i2c-s3c2410: move resume state flag to end of resume
Date: Mon, 13 Feb 2012 22:54:39 +0000
Message-ID: <20120213225439.GB2999@freya.fluff.org>
References: <018401cce86c$5df94130$19ebc390$@samsung.com>
 <20120212131230.GB3395@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120212131230.GB3395-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Huisung Kang <hs1218.kang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, Feb 12, 2012 at 01:12:31PM +0000, Mark Brown wrote:
> On Sat, Feb 11, 2012 at 12:22:21PM +0900, Huisung Kang wrote:
> > From: Kisoo Yu <ksoo.yu-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> 
> > need to set flag after finishing its work
> 
> > -	i2c->suspended = 0;
> >  	clk_enable(i2c->clk);
> >  	s3c24xx_i2c_init(i2c);
> >  	clk_disable(i2c->clk);
> > +	i2c->suspended = 0;
> 
> Why is this needed - given that there's no locking involved anywhere
> here does this mean that we've got a race somewhere?

It is in the wrong order, the lack of locking is a bit of a problem
but then again so is the whole suspend/resume framework at the
moment. I'm inclined to apply this to the fixes branch.

-- 
Ben

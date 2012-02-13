From: Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH] i2c-s3c2410: move resume state flag to end of resume
Date: Mon, 13 Feb 2012 22:53:20 +0000
Message-ID: <20120213225320.GA2999@freya.fluff.org>
References: <018401cce86c$5df94130$19ebc390$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <018401cce86c$5df94130$19ebc390$@samsung.com>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Huisung Kang <hs1218.kang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Feb 11, 2012 at 12:22:21PM +0900, Huisung Kang wrote:
> From: Kisoo Yu <ksoo.yu-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> 
> need to set flag after finishing its work
> 
> Signed-off-by: Kisoo Yu <ksoo.yu-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Huisung Kang <hs1218.kang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/i2c/busses/i2c-s3c2410.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> index 4c17180..7d6d2b7 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -1082,10 +1082,10 @@ static int s3c24xx_i2c_resume(struct device *dev)
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct s3c24xx_i2c *i2c = platform_get_drvdata(pdev);
>  
> -	i2c->suspended = 0;
>  	clk_enable(i2c->clk);
>  	s3c24xx_i2c_init(i2c);
>  	clk_disable(i2c->clk);
> +	i2c->suspended = 0;

Yes, technically we should not mark ourselves as un-suspended until
the peripheral has been properly restarted. I will have a look at
Mark's comments before this is applied.

-- 
Ben

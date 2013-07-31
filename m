From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 6/8] usb: host: ohci-s3c2410 Use clk_prepare_enable/clk_disable_unprepare
Date: Wed, 31 Jul 2013 20:58:48 +0200
Message-ID: <6370497.apKG6kIlfT@flatron>
References: <1374536965-3545-1-git-send-email-tomasz.figa@gmail.com> <1374536965-3545-7-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374536965-3545-7-git-send-email-tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Alan, Greg,

On Tuesday 23 of July 2013 01:49:23 Tomasz Figa wrote:
> This patch modifies the ohci-s3c2410 driver to prepare and unprepare
> clocks in addition to enabling and disabling, since it is required
> by common clock framework.
> 
> Signed-off-by: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/usb/host/ohci-s3c2410.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-s3c2410.c
> b/drivers/usb/host/ohci-s3c2410.c index e125770..db096bf 100644
> --- a/drivers/usb/host/ohci-s3c2410.c
> +++ b/drivers/usb/host/ohci-s3c2410.c
> @@ -47,10 +47,10 @@ static void s3c2410_start_hc(struct platform_device
> *dev, struct usb_hcd *hcd)
> 
>  	dev_dbg(&dev->dev, "s3c2410_start_hc:\n");
> 
> -	clk_enable(usb_clk);
> +	clk_prepare_enable(usb_clk);
>  	mdelay(2);			/* let the bus clock stabilise */
> 
> -	clk_enable(clk);
> +	clk_prepare_enable(clk);
> 
>  	if (info != NULL) {
>  		info->hcd	= hcd;
> @@ -75,8 +75,8 @@ static void s3c2410_stop_hc(struct platform_device
> *dev) (info->enable_oc)(info, 0);
>  	}
> 
> -	clk_disable(clk);
> -	clk_disable(usb_clk);
> +	clk_disable_unprepare(clk);
> +	clk_disable_unprepare(usb_clk);
>  }
> 
>  /* ohci_s3c2410_hub_status_data

Any chance to get your ack on this?

Best regards,
Tomasz

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH 2/2] i2c: s3c2410: Get the i2c bus number from alias id
Date: Wed, 21 Nov 2012 18:43:15 +0900
Message-ID: <0dfd01cdc7cc$a10b98c0$e322ca40$%kim@samsung.com>
References: <1353450428-2615-1-git-send-email-dianders@chromium.org>
 <1353450428-2615-2-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1353450428-2615-2-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Content-language: ko
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Doug Anderson' <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Olof Johansson' <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, 'Thomas Abraham' <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, 'Padmavathi Venna' <padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Ben Dooks' <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, 'Wolfram Sang' <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Doug Anderson wrote:
> 
> From: Padmavathi Venna <padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> 
> Get the i2c bus number that the device is connected to using the alias
> id.  This makes debugging / grokking of kernel messages much easier.
> 
> [dianders: slight patch cleanup from Padmavathi's original.]
> 
> Signed-off-by: Padmavathi Venna <padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Acked-by: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> ---
>  drivers/i2c/busses/i2c-s3c2410.c |   10 +++++++++-
>  1 files changed, 9 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-
> s3c2410.c
> index 3e0335f..ca43590 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -899,11 +899,19 @@ static void
>  s3c24xx_i2c_parse_dt(struct device_node *np, struct s3c24xx_i2c *i2c)
>  {
>  	struct s3c2410_platform_i2c *pdata = i2c->pdata;
> +	int id;
> 
>  	if (!np)
>  		return;
> 
> -	pdata->bus_num = -1; /* i2c bus number is dynamically assigned */
> +	id = of_alias_get_id(np, "i2c");
> +	if (id < 0) {
> +		dev_warn(i2c->dev, "failed to get alias id:%d\n", id);
> +		pdata->bus_num = -1;
> +	} else {
> +		/* i2c bus number is statically assigned from alias */
> +		pdata->bus_num = id;
> +	}
>  	of_property_read_u32(np, "samsung,i2c-sda-delay", &pdata-
> >sda_delay);
>  	of_property_read_u32(np, "samsung,i2c-slave-addr", &pdata-
> >slave_addr);
>  	of_property_read_u32(np, "samsung,i2c-max-bus-freq",
> --
> 1.7.7.3

From: Inderpal Singh <inderpal.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] i2c: s3c2410: Initialize i2c->gpios[] with requested
 gpio lines
Date: Thu, 27 Dec 2012 10:09:35 +0530
Message-ID: <CAG17yqQURetDMfdJ672My2Bs3_1sW6sknj6OfnKfcfP15XUFDw@mail.gmail.com>
References: <1356581384-23063-1-git-send-email-inderpal.singh@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1356581384-23063-1-git-send-email-inderpal.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 27 December 2012 09:39, Inderpal Singh <inderpal.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> i2c->gpios[] is being used to free_gpios but it's not getting initialized.
>
> Signed-off-by: Inderpal Singh <inderpal.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/i2c/busses/i2c-s3c2410.c |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> index a290d08..f1d1f1e 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -875,6 +875,8 @@ static int s3c24xx_i2c_parse_dt_gpio(struct s3c24xx_i2c *i2c)
>                         dev_err(i2c->dev, "gpio [%d] request failed\n", gpio);
>                         goto free_gpio;
>                 }
> +
> +               i2c->gpios[idx] = gpio;
>         }
>         return 0;
>
> --
> 1.7.9.5
>

Please ignore this patch as this has been sent already at

http://www.mail-archive.com/linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg10781.html

Sorry for the noise !!!

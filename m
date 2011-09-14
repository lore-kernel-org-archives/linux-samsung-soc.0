From: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Subject: Re: [PATCH V4 RESEND 1/6] video: s3c-fb: Add S5P64X0 specific s3c_fb_driverdata
Date: Wed, 14 Sep 2011 21:19:09 +0000
Message-ID: <4E711A4D.6020109@gmx.de>
References: <1315591251-17071-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout-de.gmx.net ([213.165.64.22]:44472 "HELO
	mailout-de.gmx.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S933201Ab1INVTN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Sep 2011 17:19:13 -0400
In-Reply-To: <1315591251-17071-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, lethal@linux-sh.org, jg1.han@samsung.com, ben-linux@fluff.org

On 09/09/2011 06:00 PM, Ajay Kumar wrote:
> This patch:
> 	-- Adds s3c_fb_driverdata for S5P64X0, which supports 3 windows.
> 	-- Also, register "s5p64x0-fb" type driver_data.
> 
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> Acked-by: Jingoo Han <jg1.han@samsung.com>
> Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Applied.


Thanks,

Florian Tobias Schandinat

> ---
>  drivers/video/s3c-fb.c |   27 +++++++++++++++++++++++++++
>  1 files changed, 27 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/video/s3c-fb.c b/drivers/video/s3c-fb.c
> index 4aecf21..0fda252 100644
> --- a/drivers/video/s3c-fb.c
> +++ b/drivers/video/s3c-fb.c
> @@ -1859,6 +1859,30 @@ static struct s3c_fb_driverdata s3c_fb_data_s3c2443 = {
>  	},
>  };
>  
> +static struct s3c_fb_driverdata s3c_fb_data_s5p64x0 = {
> +	.variant = {
> +		.nr_windows	= 3,
> +		.vidtcon	= VIDTCON0,
> +		.wincon		= WINCON(0),
> +		.winmap		= WINxMAP(0),
> +		.keycon		= WKEYCON,
> +		.osd		= VIDOSD_BASE,
> +		.osd_stride	= 16,
> +		.buf_start	= VIDW_BUF_START(0),
> +		.buf_size	= VIDW_BUF_SIZE(0),
> +		.buf_end	= VIDW_BUF_END(0),
> +
> +		.palette = {
> +			[0] = 0x2400,
> +			[1] = 0x2800,
> +			[2] = 0x2c00,
> +		},
> +	},
> +	.win[0] = &s3c_fb_data_s5p_wins[0],
> +	.win[1] = &s3c_fb_data_s5p_wins[1],
> +	.win[2] = &s3c_fb_data_s5p_wins[2],
> +};
> +
>  static struct platform_device_id s3c_fb_driver_ids[] = {
>  	{
>  		.name		= "s3c-fb",
> @@ -1872,6 +1896,9 @@ static struct platform_device_id s3c_fb_driver_ids[] = {
>  	}, {
>  		.name		= "s3c2443-fb",
>  		.driver_data	= (unsigned long)&s3c_fb_data_s3c2443,
> +	}, {
> +		.name		= "s5p64x0-fb",
> +		.driver_data	= (unsigned long)&s3c_fb_data_s5p64x0,
>  	},
>  	{},
>  };

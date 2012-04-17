From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 06/12] rtc-s3c: Fix breakage introduced by S3C2443/S3C2416 support
Date: Tue, 17 Apr 2012 15:30:04 +0900
Message-ID: <CAH9JG2V=5v0hp9rcynywcHYnrPUqN0XrS_hOcU-uY=FkNJ0O9g@mail.gmail.com>
References: <1334641595-25301-1-git-send-email-thomas.abraham@linaro.org>
	<1334641595-25301-7-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:32783 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751762Ab2DQGaE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Apr 2012 02:30:04 -0400
Received: by mail-iy0-f174.google.com with SMTP id z16so8505742iag.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Apr 2012 23:30:04 -0700 (PDT)
In-Reply-To: <1334641595-25301-7-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>

Hi,

It's already merged with different patch,

#ifdef CONFIG_OF
static const struct of_device_id s3c_rtc_dt_match[] = {
        {
                .compatible = "samsung,s3c2410-rtc",
                .data = &s3c_rtc_drv_data_array[TYPE_S3C2410],
        }, {
                .compatible = "samsung,s3c2416-rtc",
                .data = &s3c_rtc_drv_data_array[TYPE_S3C2416],
        }, {
                .compatible = "samsung,s3c2443-rtc",
                .data = &s3c_rtc_drv_data_array[TYPE_S3C2443],
        }, {
                .compatible = "samsung,s3c6410-rtc",
                .data = &s3c_rtc_drv_data_array[TYPE_S3C64XX],
        },
        {},
};
MODULE_DEVICE_TABLE(of, s3c_rtc_dt_match);
#else
#define s3c_rtc_dt_match NULL
#endif

Thank you,
Kyungmin Park

On 4/17/12, Thomas Abraham <thomas.abraham@linaro.org> wrote:
> From: Heiko Stuebner <heiko@sntech.de>
>
> Commits 7006ee4f (rtc-s3c: make room for more variants in devicetree block)
> and 6c0a2365 (rtc-s3c: add variants for S3C2443 and S3C2416)
> introduced build-failures with enabled CONFIG_USE_OF option.
>
> This patch fixes missing "," in s3c_rtc_dt_match and wrong handling of
> the of_device_id.data property.
>
> Reported-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/rtc/rtc-s3c.c |   18 +++++++++---------
>  1 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index 9ccea13..c792b6d 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -449,7 +449,7 @@ static inline int s3c_rtc_get_driver_data(struct
> platform_device *pdev)
>  	if (pdev->dev.of_node) {
>  		const struct of_device_id *match;
>  		match = of_match_node(s3c_rtc_dt_match, pdev->dev.of_node);
> -		return match->data;
> +		return (int)match->data;
>  	}
>  #endif
>  	return platform_get_device_id(pdev)->driver_data;
> @@ -667,17 +667,17 @@ static int s3c_rtc_resume(struct platform_device
> *pdev)
>  #ifdef CONFIG_OF
>  static const struct of_device_id s3c_rtc_dt_match[] = {
>  	{
> -		.compatible = "samsung,s3c2410-rtc"
> -		.data = TYPE_S3C2410,
> +		.compatible = "samsung,s3c2410-rtc",
> +		.data = (void *)TYPE_S3C2410,
>  	}, {
> -		.compatible = "samsung,s3c2416-rtc"
> -		.data = TYPE_S3C2416,
> +		.compatible = "samsung,s3c2416-rtc",
> +		.data = (void *)TYPE_S3C2416,
>  	}, {
> -		.compatible = "samsung,s3c2443-rtc"
> -		.data = TYPE_S3C2443,
> +		.compatible = "samsung,s3c2443-rtc",
> +		.data = (void *)TYPE_S3C2443,
>  	}, {
> -		.compatible = "samsung,s3c6410-rtc"
> -		.data = TYPE_S3C64XX,
> +		.compatible = "samsung,s3c6410-rtc",
> +		.data = (void *)TYPE_S3C64XX,
>  	},
>  	{},
>  };
> --
> 1.6.6.rc2
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

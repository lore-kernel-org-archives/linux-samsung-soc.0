From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 2/2] input: cros_ec_keyb: Add of match table
Date: Sat, 23 Aug 2014 17:42:42 +0400
Message-ID: <53F89A52.60605@cogentembedded.com>
References: <1408748582-29029-1-git-send-email-sjoerd.simons@collabora.co.uk> <1408748582-29029-3-git-send-email-sjoerd.simons@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:37607 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751269AbaHWNmp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 23 Aug 2014 09:42:45 -0400
Received: by mail-lb0-f173.google.com with SMTP id u10so10496218lbd.18
        for <linux-samsung-soc@vger.kernel.org>; Sat, 23 Aug 2014 06:42:44 -0700 (PDT)
In-Reply-To: <1408748582-29029-3-git-send-email-sjoerd.simons@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Doug Anderson <dianders@chromium.org>, Lee Jones <lee.jones@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hello.

On 8/23/2014 3:03 AM, Sjoerd Simons wrote:

> To enable the cros_ec_keyb driver to be auto-loaded when build as
> module add an of match table (and export it) to match the modalias
> information passed on to userspace as the Cros EC MFD driver registers
> the MFD subdevices with an of_compatibility string.

> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
> ---
>   drivers/input/keyboard/cros_ec_keyb.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)

> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> index 791781a..0bdbf2d 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -342,10 +342,20 @@ static int cros_ec_keyb_resume(struct device *dev)
>
>   static SIMPLE_DEV_PM_OPS(cros_ec_keyb_pm_ops, NULL, cros_ec_keyb_resume);
>
> +#ifdef CONFIG_OF
> +static const struct of_device_id cros_ec_keyb_of_match[] = {

    Perhaps better to use '__maybe_unused' instead of #ifdef...

> +	{ .compatible = "google,cros-ec-keyb" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, cros_ec_keyb_of_match);
> +#endif
> +
> +

    Too many empty lines.

>   static struct platform_driver cros_ec_keyb_driver = {
>   	.probe = cros_ec_keyb_probe,
>   	.driver = {
>   		.name = "cros-ec-keyb",
> +		.of_match_table = of_match_ptr (cros_ec_keyb_of_match),

    There shouldn't be space before (.

>   		.pm	= &cros_ec_keyb_pm_ops,
>   	},
>   };

WBR, Sergei

From: Gwendal Grignou <gwendal@chromium.org>
Subject: Re: [RESEND PATCH 3/8] mfd: cros_ec: Instantiate sub-devices from
 device tree
Date: Sat, 25 Apr 2015 18:34:37 -0700
Message-ID: <CAMHSBOX7jHCHESR9_XXcUmZhiJR+VH8G7bo4CmrSnL0UVbj9Gg@mail.gmail.com>
References: <1428336906-14906-1-git-send-email-javier.martinez@collabora.co.uk>
 <1428336906-14906-4-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f52.google.com ([209.85.216.52]:35661 "EHLO
	mail-vn0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751247AbbDZBe6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 25 Apr 2015 21:34:58 -0400
Received: by vnbg1 with SMTP id g1so7999963vnb.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 25 Apr 2015 18:34:57 -0700 (PDT)
In-Reply-To: <1428336906-14906-4-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Olof Johansson <olof@lixom.net>, Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, linux-samsung-soc@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>

Reviewed-by: Gwendal Grignou <gwendal@chromium.org>
Tested-by: Gwendal Grignou <gwendal@chromium.org>

On Mon, Apr 6, 2015 at 9:15 AM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> From: Todd Broch <tbroch@chromium.org>
>
> If the EC device tree node has sub-nodes, try to instantiate them as
> MFD sub-devices.  We can configure the EC features provided by the board.
>
> Signed-off-by: Todd Broch <tbroch@chromium.org>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---
>  drivers/mfd/cros_ec.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
> index c4aecc6f8373..8aa83b91e25c 100644
> --- a/drivers/mfd/cros_ec.c
> +++ b/drivers/mfd/cros_ec.c
> @@ -17,6 +17,7 @@
>   * battery charging and regulator control, firmware update.
>   */
>
> +#include <linux/of_platform.h>
>  #include <linux/interrupt.h>
>  #include <linux/slab.h>
>  #include <linux/module.h>
> @@ -109,18 +110,8 @@ EXPORT_SYMBOL(cros_ec_cmd_xfer);
>
>  static const struct mfd_cell cros_devs[] = {
>         {
> -               .name = "cros-ec-keyb",
> -               .id = 1,
> -               .of_compatible = "google,cros-ec-keyb",
> -       },
> -       {
> -               .name = "cros-ec-i2c-tunnel",
> -               .id = 2,
> -               .of_compatible = "google,cros-ec-i2c-tunnel",
> -       },
> -       {
>                 .name = "cros-ec-ctl",
> -               .id = 3,
> +               .id = 1,
>         },
>  };
>
> @@ -150,6 +141,15 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>                 return err;
>         }
>
> +#ifdef CONFIG_OF
> +       err = of_platform_populate(dev->of_node, NULL, NULL, dev);
> +       if (err) {
> +               mfd_remove_devices(dev);
> +               dev_err(dev, "Failed to register sub-devices\n");
> +               return err;
> +       }
> +#endif
> +
>         dev_info(dev, "Chrome EC device registered\n");
>
>         return 0;
> --
> 2.1.4
>

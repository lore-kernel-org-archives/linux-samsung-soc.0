From: Gwendal Grignou <gwendal@google.com>
Subject: Re: [RESEND PATCH 5/8] mfd: cros-ec: Support multiple EC in a system
Date: Thu, 23 Apr 2015 16:54:59 -0700
Message-ID: <CAMHSBOXMgYjxZL=rkB7rvg_192sbFGryD6hX2oSPMDPT+6OGog@mail.gmail.com>
References: <1428336906-14906-1-git-send-email-javier.martinez@collabora.co.uk>
 <1428336906-14906-6-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f43.google.com ([209.85.216.43]:44681 "EHLO
	mail-vn0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030905AbbDWXzV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Apr 2015 19:55:21 -0400
Received: by vnbg7 with SMTP id g7so2774157vnb.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2015 16:55:20 -0700 (PDT)
In-Reply-To: <1428336906-14906-6-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Olof Johansson <olof@lixom.net>, Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, linux-samsung-soc@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, Gwendal Grignou <gwendal@chromium.org>

This patch needs  https://chromium-review.googlesource.com/217297:
/dev/cros_ec0 was not a good idea, because it is difficult to know
what it represents.

On Mon, Apr 6, 2015 at 9:15 AM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> From: Gwendal Grignou <gwendal@chromium.org>
>
> Chromebooks can have more than one Embedded Controller so the
> cros_ec device id has to be incremented for each EC registered.
>
> Add code to handle multiple EC. First ec found is cros-ec0,
cros_ec0
> second cros-ec1 and so on.
cros_ec1
>
> Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
> Reviewed-by: Dmitry Torokhov <dtor@chromium.org>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---
>  drivers/mfd/cros_ec.c                 | 7 ++++++-
>  drivers/platform/chrome/cros_ec_dev.c | 4 ++--
>  include/linux/mfd/cros_ec.h           | 2 ++
>  3 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
> index c532dbca7404..70f6e55a096e 100644
> --- a/drivers/mfd/cros_ec.c
> +++ b/drivers/mfd/cros_ec.c
> @@ -28,6 +28,8 @@
>
>  #define EC_COMMAND_RETRIES     50
>
> +static int dev_id;
> +
>  int cros_ec_prepare_tx(struct cros_ec_device *ec_dev,
>                        struct cros_ec_command *msg)
>  {
> @@ -130,6 +132,8 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>         struct device *dev = ec_dev->dev;
>         int err = 0;
>
> +       ec_dev->id = dev_id;
> +
>         if (ec_dev->din_size) {
>                 ec_dev->din = devm_kzalloc(dev, ec_dev->din_size, GFP_KERNEL);
>                 if (!ec_dev->din)
> @@ -143,7 +147,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>
>         mutex_init(&ec_dev->lock);
>
> -       err = mfd_add_devices(dev, 0, cros_devs,
> +       err = mfd_add_devices(dev, ec_dev->id, cros_devs,
>                               ARRAY_SIZE(cros_devs),
>                               NULL, ec_dev->irq, NULL);
>         if (err) {
> @@ -159,6 +163,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>                 return err;
>         }
>  #endif
> +       dev_id += ARRAY_SIZE(cros_devs);
>
>         dev_info(dev, "Chrome EC device registered\n");
>
> diff --git a/drivers/platform/chrome/cros_ec_dev.c b/drivers/platform/chrome/cros_ec_dev.c
> index e7e50f18097f..7173f0ea6ae5 100644
> --- a/drivers/platform/chrome/cros_ec_dev.c
> +++ b/drivers/platform/chrome/cros_ec_dev.c
> @@ -191,7 +191,7 @@ static int ec_device_probe(struct platform_device *pdev)
>  {
>         struct cros_ec_device *ec = dev_get_drvdata(pdev->dev.parent);
>         int retval = -ENOTTY;
> -       dev_t devno = MKDEV(ec_major, 0);
> +       dev_t devno = MKDEV(ec_major, ec->id);
>
>         /* Instantiate it (and remember the EC) */
>         cdev_init(&ec->cdev, &fops);
> @@ -203,7 +203,7 @@ static int ec_device_probe(struct platform_device *pdev)
>         }
>
>         ec->vdev = device_create(cros_class, NULL, devno, ec,
> -                                CROS_EC_DEV_NAME);
> +                                CROS_EC_DEV_NAME "%d", ec->id);
>         if (IS_ERR(ec->vdev)) {
>                 retval = PTR_ERR(ec->vdev);
>                 dev_err(&pdev->dev, ": failed to create device\n");
> diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.h
> index 7eee38abd02a..2bee6ac74ffb 100644
> --- a/include/linux/mfd/cros_ec.h
> +++ b/include/linux/mfd/cros_ec.h
> @@ -72,6 +72,7 @@ struct cros_ec_command {
>   *
>   * @priv: Private data
>   * @irq: Interrupt to use
> + * @id: Device id
>   * @din: input buffer (for data from EC)
>   * @dout: output buffer (for data to EC)
>   * \note
> @@ -106,6 +107,7 @@ struct cros_ec_device {
>         /* These are used to implement the platform-specific interface */
>         void *priv;
>         int irq;
> +       int id;
>         uint8_t *din;
>         uint8_t *dout;
>         int din_size;
> --
> 2.1.4
>

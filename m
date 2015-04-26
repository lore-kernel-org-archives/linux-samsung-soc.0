From: Gwendal Grignou <gwendal@chromium.org>
Subject: Re: [RESEND PATCH 2/8] platform/chrome: cros_ec_lpc - Use existing
 function to check EC result
Date: Sat, 25 Apr 2015 18:33:56 -0700
Message-ID: <CAMHSBOX3X1y0QA3nGxtw7RRdot78e0UKGNYv+fDbYe88=0iLaQ@mail.gmail.com>
References: <1428336906-14906-1-git-send-email-javier.martinez@collabora.co.uk>
 <1428336906-14906-3-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428336906-14906-3-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Olof Johansson <olof@lixom.net>, Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, linux-samsung-soc@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Reviewed-by: Gwendal Grignou <gwendal@chromium.org>
Tested-by: Gwendal Grignou <gwendal@chromium.org>

On Mon, Apr 6, 2015 at 9:15 AM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> Commit 6db07b633658 ("mfd: cros_ec: Check result code from EC messages")
> added a common cros_ec_check_result() function that can be used to check
> the ec_msg->result for errors and warns about them.
>
> Use the existing function instead of duplicating same check in the driver.
>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---
>  drivers/platform/chrome/cros_ec_lpc.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
> index 860310513cf0..3a675817c95d 100644
> --- a/drivers/platform/chrome/cros_ec_lpc.c
> +++ b/drivers/platform/chrome/cros_ec_lpc.c
> @@ -95,19 +95,9 @@ static int cros_ec_cmd_xfer_lpc(struct cros_ec_device *ec,
>
>         /* Check result */
>         msg->result = inb(EC_LPC_ADDR_HOST_DATA);
> -
> -       switch (msg->result) {
> -       case EC_RES_SUCCESS:
> -               break;
> -       case EC_RES_IN_PROGRESS:
> -               ret = -EAGAIN;
> -               dev_dbg(ec->dev, "command 0x%02x in progress\n",
> -                       msg->command);
> +       ret = cros_ec_check_result(ec, msg);
> +       if (ret)
>                 goto done;
> -       default:
> -               dev_dbg(ec->dev, "command 0x%02x returned %d\n",
> -                       msg->command, msg->result);
> -       }
>
>         /* Read back args */
>         args.flags = inb(EC_LPC_ADDR_HOST_ARGS);
> --
> 2.1.4
>

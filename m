From: Shubhrajyoti Datta <omaplinuxkernel@gmail.com>
Subject: Re: [PATCH] i2c-s3c2410: Use plain pm_runtime_put()
Date: Fri, 29 Jun 2012 15:00:40 +0530
Message-ID: <CAM=Q2cs2-aSPGz3FSLkWj3AV28qCZbNxYdTg3ym=6=h-+uZpaw@mail.gmail.com>
References: <1340888906-1152-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:64564 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753831Ab2F2Jal convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 Jun 2012 05:30:41 -0400
In-Reply-To: <1340888906-1152-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Wolfram Sang <w.sang@pengutronix.de>, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org

Hi Mark,

On Thu, Jun 28, 2012 at 6:38 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> There's no point in using _sync() as we don't really care if the susp=
end
> has completed immediately.

Agree.


Reviewed-by: Shubhrajyoti D <shubhrajyoti@ti.com>
>
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
> =A0drivers/i2c/busses/i2c-s3c2410.c | =A0 =A04 ++--
> =A01 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2=
c-s3c2410.c
> index ddd5797..c4a4494 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -608,7 +608,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *a=
dap,
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret !=3D -EAGAIN) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0clk_disable(i2c->clk);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pm_runtime_put_sync(&ad=
ap->dev);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pm_runtime_put(&adap->d=
ev);
Especially if we are retrying in 100us :-)

> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ret;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> @@ -618,7 +618,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *a=
dap,
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0clk_disable(i2c->clk);
> - =A0 =A0 =A0 pm_runtime_put_sync(&adap->dev);
> + =A0 =A0 =A0 pm_runtime_put(&adap->dev);
> =A0 =A0 =A0 =A0return -EREMOTEIO;
> =A0}
>
> --
> 1.7.10
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-i2c" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html

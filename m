From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 6/6] hwmon: pwm-fan: Update the duty cycle inorder
 to control the pwm-fan
Date: Sun, 12 Apr 2015 08:07:08 -0700
Message-ID: <552A8A1C.9000409@roeck-us.net>
References: <1428850452-4178-1-git-send-email-linux.amoon@gmail.com> <1428850452-4178-7-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:32837 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751314AbbDLPHM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 12 Apr 2015 11:07:12 -0400
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YhJTb-000Kf4-Je
	for linux-samsung-soc@vger.kernel.org; Sun, 12 Apr 2015 15:07:11 +0000
In-Reply-To: <1428850452-4178-7-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, Lukasz Majewski <l.majewski@samsung.com>, Eduardo Valentin <edubezval@gmail.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Markus Reichl <m.reichl@fivetechno.de>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 04/12/2015 07:54 AM, Anand Moon wrote:
> In order to disable the PWM we need to update using following sequence.
>
> 	pwm_config(pwm, 0, period);
>   	pwm_disable(pwm);
>
> pwm_config() with a zero duty cycle to make it clear the timer and update the PWM registers.
> pwm_disable will clear the TCON_AUTORELOAD(tcon_chan) and update the PWM register.
>
There is no TCON_AUTORELOAD in this driver. Future developers will have no idea
what you are talking about here. Please provide a generic comment.

> Next change in state will get trigger unless a new PWM cycle happened.
>
That sentence is difficult to parse. Actually, I have no idea what it is supposed to mean.

> 	pwm_config(pwm, duty, period);
>   	pwm_enable(pwm);
>
> Through pwm_config we update the duty cycle and period and update the PWM register.
> pwm_enable will update the state to TCON_MANUALUPDATE(tcon_chan)
> and TCON_START(tcon_chan) | TCON_AUTORELOAD(tcon_chan) and update the PWM register.
>
This sentence does not make sense in the context of the pwm-fan driver.

> Reported-by: Markus Reichl <m.reichl@fivetechno.de>
> Tested-by: Markus Reichl <m.reichl@fivetechno.de>
> Reviewed-by: Lukasz Majewski <l.majewski@samsung.com>
> Reviewed-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>   drivers/hwmon/pwm-fan.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index 7c83dc4..f25c841 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -44,26 +44,24 @@ static int  __set_pwm(struct pwm_fan_ctx *ctx, unsigned long pwm)
>   	int ret = 0;
>
>   	mutex_lock(&ctx->lock);
> +

Please refrain from making unnecessary whitespace changes.

Thanks,
Guenter

From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCHv2] regulator: s2mps11: Added shutdown function to poweroff
Date: Wed, 15 Jul 2015 10:03:43 +0900
Message-ID: <55A5B16F.9000003@samsung.com>
References: <1436888477-3841-1-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:48587 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751241AbbGOBDr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jul 2015 21:03:47 -0400
In-reply-to: <1436888477-3841-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, Sangbeom Kim <sbkim73@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

On 15.07.2015 00:41, Anand Moon wrote:
> Added .shutdown function to s2mps11 to help poweroff the board successfully.

Which board does not poweroff? The PMIC is used on multiple boards, did
you observed this on all of them?

> 
> s2mps11-pmic: S2MPS11_REG_CTRL1 reg value 16:00000000000000000000000000010000
> 
> The device driver clears the register to turn off the PMIC.

This is not sufficient explanation for commit message.

I already raised concerns that this does not look to me as a proper way
of doing poweroff. Unfortunately you did not resolved these concerns.

The main questions are unanswered: Why you have to do this and why
"standard" way does not work?
How can you properly fix some problem if you don't know the cause of
problem? It is blind shooting which may hurt other boards.


> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> 
> ---
> Console log for improper shutdown.
> root@odroidxu3:~# poweroff
> ...
>   * Unmounting temporary filesystems...                                   [ OK ]
>   * Deactivating swap...                                                  [ OK ]
>   * Unmounting local filesystems...                                       [ OK ]
>   * Will now halt
>   [  209.020280] reboot: Power down
>   [  209.122039] Power down failed, please power off system manually.
> 
> Console log for proper shutdown.
> root@odroidxu3:~# poweroff
> ...
>   * Unmounting temporary filesystems...                                   [ OK ]
>   * Deactivating swap...                                                  [ OK ]
>   * Unmounting local filesystems...                                       [ OK ]
>   * Will now halt
>   [  476.283071] reboo
> ---
>  drivers/regulator/s2mps11.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
> index 326ffb5..823180e 100644
> --- a/drivers/regulator/s2mps11.c
> +++ b/drivers/regulator/s2mps11.c
> @@ -1060,6 +1060,31 @@ out:
>  	return ret;
>  }
>  
> +static void s2mps11_pmic_shutdown(struct platform_device *pdev)
> +{
> +	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
> +	unsigned int reg_val, ret;
> +
> +	ret = regmap_read(iodev->regmap_pmic, S2MPS11_REG_CTRL1, &reg_val);
> +	if (ret < 0) {

regmap_read() returns an int which you assign to an unsigned int which
then you compare against <0? This does not look good.

> +		dev_crit(&pdev->dev, "could not read S2MPS11_REG_CTRL1 value\n");
> +	} else {
> +		/*
> +		 * s2mps11-pmic: S2MPS11_REG_CTRL1 reg value
> +		 * is 00000000000000000000000000010000
> +		 * clear the S2MPS11_REG_CTRL1 0x10 value to shutdown.
> +		 */
> +		if (reg_val & BIT(4)) {
> +			ret = regmap_update_bits(iodev->regmap_pmic,
> +						 S2MPS11_REG_CTRL1,
> +						 BIT(4), BIT(0));

I don't understand. You want to update BIT(4) but the value is BIT(0)?
This will clear BIT(4) but is totally unreadable.

> +			if (ret)
> +				dev_crit(&pdev->dev,
> +					 "could not write S2MPS11_REG_CTRL1 value\n");
> +		}
> +	}

The code is not readable, to many unnecessary indentations.

> +}
> +
>  static const struct platform_device_id s2mps11_pmic_id[] = {
>  	{ "s2mps11-pmic", S2MPS11X},
>  	{ "s2mps13-pmic", S2MPS13X},
> @@ -1074,6 +1099,7 @@ static struct platform_driver s2mps11_pmic_driver = {
>  		.name = "s2mps11-pmic",
>  	},
>  	.probe = s2mps11_pmic_probe,
> +	.shutdown = s2mps11_pmic_shutdown,

The purpose of shutdown function is not to shutdown the system but to
prepare the system for shutdown.

The patch is just wrong and you did not answered the major question -
WHY you have to do this? Don't fix the problem blindly (or because some
hardkernel tree for some of the boards use such patch).

Best regards,
Krzysztof

>  	.id_table = s2mps11_pmic_id,
>  };
>  
> 

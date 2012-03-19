From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 5/5] mmc: sdhci-s3c: setup pins using pinctrl interface
Date: Mon, 19 Mar 2012 15:55:24 -0600
Message-ID: <4F67AB4C.9040801@wwwdotorg.org>
References: <1331469965-28846-1-git-send-email-thomas.abraham@linaro.org> <1331469965-28846-6-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:43384 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755055Ab2CSVz2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Mar 2012 17:55:28 -0400
In-Reply-To: <1331469965-28846-6-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linus.walleij@linaro.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, patches@linaro.org

On 03/11/2012 06:46 AM, Thomas Abraham wrote:
> The platform specific callback to setup the sdhci pin mux and pin config
> is removed and the pinctrl subsystem interface is used to setup the
> mux and config.

> @@ -643,8 +649,13 @@ static int __devinit sdhci_s3c_probe(struct platform_device *pdev)
>  	}
>  
>  	/* Ensure we have minimal gpio selected CMD/CLK/Detect */
> -	if (pdata->cfg_gpio)
> -		pdata->cfg_gpio(pdev, pdata->max_width);
> +	pstate = pdata->max_width ? "sdhci-pcfg8" : "sdhci-pcfg4";

If the driver is going to select a single state ("sdhci-pcfg8" or
"sdhci-pcfg4" above) at probe() time and never change it (which seems
quite reasonable for an SDHCI controller), then the driver should always
use state PINCTRL_STATE_DEFAULT, and it should be up to the board to set
up the mapping table such that PINCTRL_STATE_DEFAULT sets up the pins
for either 4-bit or 8-bit as appropriate for the board.

From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [RFC][PATCH 2/4] lcd: platform-lcd: Add support for Hydis
 hv070wsa lcd panel
Date: Mon, 2 Jan 2012 11:45:59 +0000
Message-ID: <20120102114559.GE2899@opensource.wolfsonmicro.com>
References: <1325483675-21908-1-git-send-email-thomas.abraham@linaro.org>
 <1325483675-21908-2-git-send-email-thomas.abraham@linaro.org>
 <1325483675-21908-3-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:42637 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751887Ab2ABLqD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jan 2012 06:46:03 -0500
Content-Disposition: inline
In-Reply-To: <1325483675-21908-3-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rpurdie@rpsys.net, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, jg1.han@samsung.com, kyungmin.park@samsung.com, cbou@mail.ru, kwangwoo.lee@gmail.com, augulis.darius@gmail.com, ben-linux@fluff.org, patches@linaro.org

On Mon, Jan 02, 2012 at 11:24:33AM +0530, Thomas Abraham wrote:

> +static void lcd_hv070wsa_set_power(struct platform_lcd *plcd, unsigned int pwr)
> +{
> +	struct plat_lcd_hydis_hv070wsa_pdata *pdata = plcd->lcd_pdata;
> +
> +	gpio_direction_output(pdata->gpio, pwr);
> +}

This doesn't look at all specific to this panel - it's just setting a
GPIO - so it should probably just be a generic gpio-lcd driver (or
similar).  It ought to be possible to do a device tree binding for at
least this subset of panels.

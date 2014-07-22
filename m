From: Varka Bhadram <varkabhadram@gmail.com>
Subject: Re: [PATCH v6 05/14] drm/exynos: dsi: add TE interrupt handler to
 support LCD I80 interface
Date: Tue, 22 Jul 2014 16:27:55 +0530
Message-ID: <53CE43B3.2080203@gmail.com>
References: <53CE3C45.9010509@samsung.com> <1406026184-29185-1-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:44241 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753956AbaGVK7T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Jul 2014 06:59:19 -0400
In-Reply-To: <1406026184-29185-1-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: YoungJun Cho <yj44.cho@samsung.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, thierry.reding@gmail.com, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com

On 07/22/2014 04:19 PM, YoungJun Cho wrote:

(...)

> +	ret = gpio_request_one(dsi->te_gpio, GPIOF_IN, "te_gpio");

devm_* APIs..?

> +	if (ret) {
> +		dev_err(dsi->dev, "gpio request failed with %d\n", ret);
> +		goto out;
> +	}
> +
> +	/*
> +	 * This TE GPIO IRQ should not be set to IRQ_NOAUTOEN, because panel
> +	 * calls drm_panel_init() first then calls mipi_dsi_attach() in probe().
> +	 * It means that te_gpio is invalid when exynos_dsi_enable_irq() is
> +	 * called by drm_panel_init() before panel is attached.
> +	 */
> +	ret = request_threaded_irq(gpio_to_irq(dsi->te_gpio),
> +					exynos_dsi_te_irq_handler, NULL,
> +					IRQF_TRIGGER_RISING, "TE", dsi);

why don't we use devm_request_threaded_irq()..?


-- 
Regards,
Varka Bhadram.

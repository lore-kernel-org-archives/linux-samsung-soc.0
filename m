From: Seungwon Jeon <tgih.jun@samsung.com>
Subject: RE: [PATCH v6 9/9] mmc: dw_mmc: add support for exynos specific
 implementation of dw-mshc
Date: Wed, 19 Sep 2012 22:42:53 +0900
Message-ID: <001501cd966c$ab1ef6e0$015ce4a0$%jun@samsung.com>
References: <1347905803-22742-1-git-send-email-thomas.abraham@linaro.org>
 <1347905803-22742-10-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:47528 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750741Ab2ISNmy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Sep 2012 09:42:54 -0400
In-reply-to: <1347905803-22742-10-git-send-email-thomas.abraham@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-mmc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: will.newton@imgtec.com, cjb@laptop.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, girish.shivananjappa@linaro.org, jh80.chung@samsung.com, patches@linaro.org, 'Thomas Abraham' <thomas.ab@samsung.com>

On Tuesday, September 18, 2012, Thomas Abraham <thomas.abraham@linaro.org> wrote:
> +int dw_mci_exynos_probe(struct platform_device *pdev)
> +{
> +	struct dw_mci_drv_data *drv_data;
> +	const struct of_device_id *match;
> +
> +	match = of_match_node(dw_mci_exynos_match, pdev->dev.of_node);
> +	drv_data = match->data;
In non-dt case, match has NULL.
Needed to check "pdev->dev.of_node"

Thanks,
Seungwon Jeon
> +	return dw_mci_pltfm_register(pdev, drv_data);
> +}
> +
> +static struct platform_driver dw_mci_exynos_pltfm_driver = {
> +	.probe		= dw_mci_exynos_probe,
> +	.remove		= __exit_p(dw_mci_pltfm_remove),
> +	.driver		= {
> +		.name		= "dwmmc_exynos",
> +		.of_match_table	= of_match_ptr(dw_mci_exynos_match),
> +		.pm		= &dw_mci_pltfm_pmops,
> +	},
> +};
> +
> +module_platform_driver(dw_mci_exynos_pltfm_driver);
> +
> +MODULE_DESCRIPTION("Samsung Specific DW-MSHC Driver Extension");
> +MODULE_AUTHOR("Thomas Abraham <thomas.ab@samsung.com");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:dwmmc-exynos");
> diff --git a/include/linux/mmc/dw_mmc.h b/include/linux/mmc/dw_mmc.h
> index 6cb043e..7c6a113 100644
> --- a/include/linux/mmc/dw_mmc.h
> +++ b/include/linux/mmc/dw_mmc.h
> @@ -227,7 +227,7 @@ struct dw_mci_board {
>  	u32 num_slots;
> 
>  	u32 quirks; /* Workaround / Quirk flags */
> -	unsigned int bus_hz; /* Bus speed */
> +	unsigned int bus_hz; /* Clock speed at the cclk_in pad */
> 
>  	unsigned int caps;	/* Capabilities */
>  	unsigned int caps2;	/* More capabilities */
> --
> 1.6.6.rc2

From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] mtd: s3c2410: add device tree support
Date: Mon, 19 Sep 2016 12:44:07 +0200
Message-ID: <f8907616-0d6b-37ef-1419-f6aedf3ddbdc@samsung.com>
References: <CGME20160917152404eucas1p2ca0ebfe59dd762f5cdd611a9dd3cd1a5@eucas1p2.samsung.com>
 <1474125760-28168-1-git-send-email-sergio.prado@e-labworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:57182 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754765AbcISKoO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Sep 2016 06:44:14 -0400
In-reply-to: <1474125760-28168-1-git-send-email-sergio.prado@e-labworks.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sergio Prado <sergio.prado@e-labworks.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, kgene@kernel.org, k.kozlowski@samsung.com, boris.brezillon@free-electrons.com, richard@nod.at, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 09/17/2016 05:22 PM, Sergio Prado wrote:
> +static int s3c24xx_nand_probe_dt(struct platform_device *pdev)
> +{
> +	const struct s3c24XX_nand_devtype_data *devtype_data;
> +	struct s3c2410_platform_nand *pdata;
> +	struct s3c2410_nand_info *info = platform_get_drvdata(pdev);
> +	struct device_node *np = pdev->dev.of_node, *child;
> +	const struct of_device_id *of_id;
> +	struct s3c2410_nand_set *sets;
> +
> +	of_id = of_match_device(s3c24xx_nand_dt_ids, &pdev->dev);
> +	if (!of_id)
> +		return 1;
> +
> +	devtype_data = of_id->data;

You could make it a bit simpler with of_device_get_match_data().

--
Thanks,
Sylwester

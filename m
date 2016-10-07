From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/3] mtd: s3c2410: parse the device configuration from OF
 node
Date: Fri, 7 Oct 2016 19:28:10 +0300
Message-ID: <20161007162810.GB4222@kozik-lap>
References: <1475711217-974-1-git-send-email-sergio.prado@e-labworks.com>
 <1475711217-974-4-git-send-email-sergio.prado@e-labworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33901 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754556AbcJGQ3V (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 7 Oct 2016 12:29:21 -0400
Content-Disposition: inline
In-Reply-To: <1475711217-974-4-git-send-email-sergio.prado@e-labworks.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sergio Prado <sergio.prado@e-labworks.com>
Cc: linux@armlinux.org.uk, linux@simtec.co.uk, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, kgene@kernel.org, krzk@kernel.org, javier@osg.samsung.com, boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org

On Wed, Oct 05, 2016 at 08:46:57PM -0300, Sergio Prado wrote:
> Allows configuring Samsung's s3c2410 memory controller using a
> devicetree.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  drivers/mtd/nand/s3c2410.c                     | 171 ++++++++++++++++++++++---
>  include/linux/platform_data/mtd-nand-s3c2410.h |   1 +
>  2 files changed, 156 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
> index 174ac9dc4265..352cf2656bc8 100644
> --- a/drivers/mtd/nand/s3c2410.c
> +++ b/drivers/mtd/nand/s3c2410.c
> @@ -39,6 +39,8 @@
>  #include <linux/slab.h>
>  #include <linux/clk.h>
>  #include <linux/cpufreq.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
>  
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/nand.h>
> @@ -185,6 +187,26 @@ struct s3c2410_nand_info {
>  #endif
>  };
>  
> +struct s3c24XX_nand_devtype_data {
> +	enum s3c_cpu_type type;
> +};
> +
> +struct s3c24XX_nand_devtype_data s3c2410_nand_devtype_data = {
> +	.type = TYPE_S3C2410,
> +};
> +
> +struct s3c24XX_nand_devtype_data s3c2412_nand_devtype_data = {
> +	.type = TYPE_S3C2412,
> +};
> +
> +struct s3c24XX_nand_devtype_data s3c2440_nand_devtype_data = {
> +	.type = TYPE_S3C2440,
> +};
> +
> +struct s3c24XX_nand_devtype_data s3c6400_nand_devtype_data = {
> +	.type = TYPE_S3C2412,

All of these look like candidate for static const.

Additionally you are not actually differentiating between s3c2412 and
s3c64xx so I think there is not need of samsung,s3c6400-nand compatible.
Just use existing one.

Best regards,
Krzysztof

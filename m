From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2 3/3] mtd: s3c2410: parse the device configuration
 from OF node
Date: Wed, 19 Oct 2016 22:10:12 +0200
Message-ID: <20161019221012.5a20e7df@bbrezillon>
References: <1476906725-22613-1-git-send-email-sergio.prado@e-labworks.com>
        <1476906725-22613-4-git-send-email-sergio.prado@e-labworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from up.free-electrons.com ([163.172.77.33]:41365 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752006AbcJSUKQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Oct 2016 16:10:16 -0400
In-Reply-To: <1476906725-22613-4-git-send-email-sergio.prado@e-labworks.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sergio Prado <sergio.prado@e-labworks.com>
Cc: linux@armlinux.org.uk, linux@simtec.co.uk, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, kgene@kernel.org, javier@osg.samsung.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org

On Wed, 19 Oct 2016 17:52:05 -0200
Sergio Prado <sergio.prado@e-labworks.com> wrote:

> Allows configuring Samsung's s3c2410 memory controller using a
> devicetree.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  drivers/mtd/nand/s3c2410.c                     | 155 ++++++++++++++++++++++---
>  include/linux/platform_data/mtd-nand-s3c2410.h |   1 +
>  2 files changed, 140 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
> index 371db0d48135..52f768f01b0d 100644
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
> @@ -185,6 +187,22 @@ struct s3c2410_nand_info {
>  #endif
>  };
>  
> +struct s3c24XX_nand_devtype_data {
> +	enum s3c_cpu_type type;
> +};
> +
> +static const struct s3c24XX_nand_devtype_data s3c2410_nand_devtype_data = {
> +	.type = TYPE_S3C2410,
> +};
> +
> +static const struct s3c24XX_nand_devtype_data s3c2412_nand_devtype_data = {
> +	.type = TYPE_S3C2412,
> +};
> +
> +static const struct s3c24XX_nand_devtype_data s3c2440_nand_devtype_data = {
> +	.type = TYPE_S3C2440,
> +};
> +
>  /* conversion functions */
>  
>  static struct s3c2410_nand_mtd *s3c2410_nand_mtd_toours(struct mtd_info *mtd)
> @@ -794,6 +812,34 @@ static int s3c2410_nand_add_partition(struct s3c2410_nand_info *info,
>  	return -ENODEV;
>  }
>  
> +static int s3c2410_nand_setup_data_interface(struct mtd_info *mtd,
> +					     const struct nand_data_interface *conf,
> +					     bool check_only)
> +{
> +	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
> +	struct s3c2410_platform_nand *pdata = info->platform;
> +	struct device_node *np = info->device->of_node;
> +	const struct nand_sdr_timings *timings;
> +	int tacls;
> +
> +	/* auto-detect timings when booting with a device tree */
> +	if (np) {

That's not really dependent on the use of DT, but I understand why you
want to keep it unchanged for users who did not switch to DT.

Instead of testing the np value here, I'd recommend that you
conditionally assign chip->setup_data_interface to
s3c2410_nand_setup_data_interface in s3c2410_nand_init_chip().

Can you also explain in more details in the comment why you don't want
to do it for non-DT configs (keep behavior unchanged for legacy boards)?

> +		timings = nand_get_sdr_timings(conf);
> +		if (IS_ERR(timings))
> +			return -ENOTSUPP;
> +
> +		tacls = timings->tCLS_min - timings->tWP_min;
> +		if (tacls < 0)
> +			tacls = 0;
> +
> +		pdata->tacls  = DIV_ROUND_UP(tacls, 1000);
> +		pdata->twrph0 = DIV_ROUND_UP(timings->tWP_min, 1000);
> +		pdata->twrph1 = DIV_ROUND_UP(timings->tCLH_min, 1000);
> +	}
> +
> +	return 0;
> +}

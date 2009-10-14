From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v2] S3C: ide: Add Samsung S3C IDE controller driver
Date: Wed, 14 Oct 2009 12:10:33 +0100
Message-ID: <20091014111032.GC24540@sirena.org.uk>
References: <1255505607-26195-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:35681 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932550AbZJNLLL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Oct 2009 07:11:11 -0400
Content-Disposition: inline
In-Reply-To: <1255505607-26195-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Abhilash Kesavan <a.kesavan@samsung.com>

On Wed, Oct 14, 2009 at 04:33:27PM +0900, Thomas Abraham wrote:

>  drivers/ide/Kconfig        |   22 ++-
>  drivers/ide/ide-proc.c     |    1 +

It'd be nice to include some mention of why this is using drivers/ide
rather than libata (or to see the driver be a libata one).

> -obj-$(CONFIG_S3C_DEV_HSMMC)	+= dev-hsmmc.o
> -obj-$(CONFIG_S3C_DEV_HSMMC1)	+= dev-hsmmc1.o
> +#obj-$(CONFIG_S3C_DEV_HSMMC)	+= dev-hsmmc.o
> +#obj-$(CONFIG_S3C_DEV_HSMMC1)	+= dev-hsmmc1.o

This is a bit surprising?  If these should be removed they should
probably just be removed rather than commented out.

> +config BLK_DEV_IDE_S3C
> +        tristate "Samsung S3C IDE Controller"
> +	depends on PLAT_S3C64XX
> +        help
> +          Say Y here if you want to support using CF controller on SMDK(Samsung)
> +	  development board. It will be configured for true IDE mode.
> +

Is this really only for the SMDK development boards or can the driver
also be used on other boards - if it's only for the SMDK boards the
dependencies and probably Kconfig name should be updated.  If the driver
is usable on other boards then the description could use an update.

> +config BLK_DEV_IDE_S3C_PIO
> +        bool "Use PIO Mode"
> +        depends on (BLK_DEV_IDE_S3C && !BLK_DEV_IDE_S3C_UDMA)
> +        select IDE_XFER_MODE
> +        help
> +          Say Y here if you want to support the DMA in PIO Mode.

> +config BLK_DEV_IDE_S3C_UDMA
> +        bool "Use UDMA Mode"
> +        depends on BLK_DEV_IDE_S3C
> +        help
> +          Say Y here if you want to support the UDMA.
> +

Do these need to be selected at Kconfig time?

> +/* IDE device instantiation */
> +static struct s3c_ide_device s3c_ide_dev;

Any reason not to do this dynamically?

> +#define ide_writel(dev, value, reg) writel(value, dev->regbase + (reg))
> +#define ide_readl(dev, reg) readl(dev->regbase + (reg))

static inline functions are generally preferred - they give type safety
and avoid nasty surprises with macros.

> +/*
> + * following are the ide_dma_ops functions implemented by the ide driver
> + */
> +static int s3c_ide_dma_init(ide_hwif_t *hwif, const struct ide_port_info *d)
> +{
> +	return 0;
> +}
> +
> +static void s3c_ide_dma_host_set(ide_drive_t *drive, int on)
> +{
> +	return;
> +}

> +static int s3c_ide_dma_test_irq(ide_drive_t *drive)
> +{
> +	return 1;
> +}

These all look suspicous, especially the latter one - I'd expect the
functions to be omitted if they don't do anything.

> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (res == NULL) {
> +		dev_err(&pdev->dev, "could not obtain base address \
> +					of controller\n");
> +		return -ENODEV;
> +	}

This split of the error message is going to include an awful lot of
blank space in the middle of the message.  In general it's best not to
split strings like this to support grep - something like this would be
better:

 		dev_err(&pdev->dev,
		        "could not obtain base address of controller\n");

or if you need to split things then use

     "part 1"
     "part 2"

> +	host->irq_handler = s3c_irq_handler;
> +	host->ports[0]->hwif_data = (void *)ide_dev;
> +
> +	ret = ide_host_register(host, &s3c_port_info, hws);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to register ide host\n");
> +		goto dealloc_ide_host;
> +	}

> +	s3c_ide_dev.hwif = host->ports[0];
> +	platform_set_drvdata(pdev, host);

I'd expect to see these come before the driver is registered to avoid
something trying to use the driver before they are fully set up.

> +	printk(KERN_INFO "S3C IDE driver configured");

This should probably be removed.

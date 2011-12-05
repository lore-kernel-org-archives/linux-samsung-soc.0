From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] spi/s3c64xx: Implement runtime PM support
Date: Mon, 5 Dec 2011 22:41:21 +0100
Message-ID: <CACRpkdYPdV2_Hr8hO_CAhZ=MvqcBiNdgwySbATcPSfwFRvkARg@mail.gmail.com>
References: <1323103813-5325-1-git-send-email-broonie@opensource.wolfsonmicro.com>
	<1323103813-5325-2-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:51969 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932500Ab1LEVlW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Dec 2011 16:41:22 -0500
Received: by iakc1 with SMTP id c1so2628176iak.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Dec 2011 13:41:22 -0800 (PST)
In-Reply-To: <1323103813-5325-2-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, spi-devel-general@lists.sourceforge.net, linux-samsung-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>

On Mon, Dec 5, 2011 at 5:50 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:

> Enable and disable the clocks to the SPI controller using runtime PM.=
 This
> serves the dual purpose of reducing power consumption a little and le=
tting
> the core know when the device is idle.
(...)
> +#ifdef CONFIG_PM_RUNTIME
> +static int s3c64xx_spi_runtime_suspend(struct device *dev)
> +{
> + =A0 =A0 =A0 struct spi_master *master =3D spi_master_get(dev_get_dr=
vdata(dev));
> + =A0 =A0 =A0 struct s3c64xx_spi_driver_data *sdd =3D spi_master_get_=
devdata(master);
> +
> + =A0 =A0 =A0 clk_disable(sdd->clk);
> + =A0 =A0 =A0 clk_disable(sdd->src_clk);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static int s3c64xx_spi_runtime_resume(struct device *dev)
> +{
> + =A0 =A0 =A0 struct spi_master *master =3D spi_master_get(dev_get_dr=
vdata(dev));
> + =A0 =A0 =A0 struct s3c64xx_spi_driver_data *sdd =3D spi_master_get_=
devdata(master);
> +
> + =A0 =A0 =A0 clk_enable(sdd->src_clk);
> + =A0 =A0 =A0 clk_enable(sdd->clk);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +#endif /* CONFIG_PM_RUNTIME */

This is similar to how I'm doing things in my drivers so this looks
good to me, Acked-by.

Just wanted to mention that I had this discussion with Magnus Damm
about how they do this in shmobile: in there their central runtime PM
policy in arch/arm/mach-shmobile/pm_runtime.c adds in the
pm_clk_notifier from drivers/base/power/clock_ops.c to gate/ungate
the clocks centrally acting on bus notifiers without any per-driver
hooks like these.

I clearly see that in this platform it's *not* going to work since
for this one driver atleast, there are two clocks, not just one,
that need to be managed for the device.

So I guess that some platforms will do central clock
management and some will do driver-local management.

I fear for the day one of these devices turn up in two platforms:
one using central clock management and one using
distributed clock management ...

Yours,
Linus Walleij

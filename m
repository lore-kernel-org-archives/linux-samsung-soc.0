From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ARM: S3C64XX: Fix section mismatch from cpufreq init
Date: Wed, 16 Mar 2011 09:38:11 +0100
Message-ID: <20110316083811.GG13316@pengutronix.de>
References: <1299769093-14516-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:34800 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751422Ab1CPIiU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Mar 2011 04:38:20 -0400
Content-Disposition: inline
In-Reply-To: <1299769093-14516-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com, linux-arm-kernel@lists.infradead.org

On Thu, Mar 10, 2011 at 02:58:13PM +0000, Mark Brown wrote:
> The cpufreq init function is referenced from the driver structure and
> we don't appear to have annotations which allow us to mark that it'll
> never be called after system init, causing the linker consistency
> infrastructure to complain. Just remove the __init annotation to avoi=
d
> noise from the build.
>=20
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
>  arch/arm/mach-s3c64xx/cpufreq.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/arch/arm/mach-s3c64xx/cpufreq.c b/arch/arm/mach-s3c64xx/=
cpufreq.c
> index 74c0e83..4375b97 100644
> --- a/arch/arm/mach-s3c64xx/cpufreq.c
> +++ b/arch/arm/mach-s3c64xx/cpufreq.c
> @@ -181,7 +181,7 @@ static void __init s3c64xx_cpufreq_config_regulat=
or(void)
>  }
>  #endif
> =20
> -static int __init s3c64xx_cpufreq_driver_init(struct cpufreq_policy =
*policy)
> +static int s3c64xx_cpufreq_driver_init(struct cpufreq_policy *policy=
)
>  {
>  	int ret;
>  	struct cpufreq_frequency_table *freq;
Actually this is warning is a false positive.  There is a section
mismatch, but it is never a problem because the .init callback is only
called by cpufreq_register_driver. To get rid of the warning the right
fix is to remove the .init callback from struct cpufreq_driver and
change the prototype of cpufreq_register_driver to

	int cpufreq_register_driver(struct cpufreq_driver *, int (*)(struct cp=
ufreq_policy *))

(that is pass the init callback to cpufreq_register_driver).

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |

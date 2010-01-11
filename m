From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 1/3] ARM: SAMSUNG: Add config option for number of
	additional GPIO pins.
Date: Mon, 11 Jan 2010 06:59:53 +0000
Message-ID: <20100111065953.GM3738@trinity.fluff.org>
References: <1263180113-31605-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:39331 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751397Ab0AKG7y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jan 2010 01:59:54 -0500
Content-Disposition: inline
In-Reply-To: <1263180113-31605-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Adityapratap Sharma <aditya.ps@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Atul Dahiya <atul.dahiya@samsung.com>

On Mon, Jan 11, 2010 at 12:21:51PM +0900, Kukjin Kim wrote:
> This patch adds a configuration option for specifing the number
> of additional GPIO pins to be used in addition to the GPIO pins
> supported onchip.

looks fine, will apply. 

> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Adityapratap Sharma <aditya.ps@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
> ---
>  arch/arm/plat-samsung/Kconfig |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
> index 900b463..faec4b8 100644
> --- a/arch/arm/plat-samsung/Kconfig
> +++ b/arch/arm/plat-samsung/Kconfig
> @@ -66,6 +66,14 @@ config S3C_GPIO_PULL_UP
>  	help
>  	  Internal configuration to enable the correct GPIO pull helper
>  
> +config SAMSUNG_GPIO_EXTRA
> +	int "Number of additional GPIO pins"
> +	default 0
> +	help
> +	  Use additional GPIO space in addition to the GPIO's the SOC
> +	  provides. This allows expanding the GPIO space for use with
> +	  GPIO expanders.
> +
>  # device definitions to compile in
>  
>  config S3C_DEV_HSMMC
> -- 
> 1.6.2.5
> 

-- 
-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.

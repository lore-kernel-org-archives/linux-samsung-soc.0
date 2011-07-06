From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 2/2] SPI: S5PV210: Enable the SPI driver for S5PV210
Date: Wed, 06 Jul 2011 08:45:46 +0530
Message-ID: <4E13D362.7010107@linaro.org>
References: <1309801476-29678-1-git-send-email-padma.v@samsung.com> <1309801476-29678-2-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f52.google.com ([209.85.161.52]:57769 "EHLO
	mail-fx0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755845Ab1GFDPx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2011 23:15:53 -0400
Received: by fxd18 with SMTP id 18so6752772fxd.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jul 2011 20:15:52 -0700 (PDT)
In-Reply-To: <1309801476-29678-2-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi,

Patch 1/2 looks redundant as both changes can be very well accommodated 
in a single patch.

On Monday 04 July 2011 11:14 PM, Padmavathi Venna wrote:
> The SPI module on S5PV210 is similar to the earlier Samsung SoCs like
> S3C64XX. Enable the existing SPI driver for use on S5PV210.
>
> Signed-off-by: Padmavathi Venna<padma.v@samsung.com>
> ---
>   drivers/spi/Kconfig |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
> index 91d607b..ed1ebea 100644
> --- a/drivers/spi/Kconfig
> +++ b/drivers/spi/Kconfig
> @@ -340,7 +340,8 @@ config SPI_S3C24XX_GPIO
>
>   config SPI_S3C64XX
>   	tristate "Samsung S3C64XX series type SPI"
> -	depends on (ARCH_S3C64XX || ARCH_S5P64X0 || ARCH_S5PC100)
> +	depends on (ARCH_S3C64XX || ARCH_S5P64X0 || ARCH_S5PC100 \
> +			|| ARCH_S5PV210)
>   	select S3C64XX_DMA if ARCH_S3C64XX
>   	help
>   	  SPI driver for Samsung S3C64XX and newer SoCs.


-- 
Tushar Behera

From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH V4 05/14] ARM: SAMSUNG: Update to use PL330-DMA driver
Date: Mon, 25 Jul 2011 17:01:53 +0530
Message-ID: <CABb+yY07Th8L08gC7NHaft375Kqn1rMsdB6iUo4HKrrPaYQOmw@mail.gmail.com>
References: <1311557312-26107-1-git-send-email-boojin.kim@samsung.com>
	<1311557312-26107-6-git-send-email-boojin.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f52.google.com ([209.85.161.52]:61553 "EHLO
	mail-fx0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751673Ab1GYLby convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jul 2011 07:31:54 -0400
Received: by mail-fx0-f52.google.com with SMTP id 18so8945813fxd.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Jul 2011 04:31:53 -0700 (PDT)
In-Reply-To: <1311557312-26107-6-git-send-email-boojin.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, Mark Brown <broonie@opensource.wolfsonmicro.com>

On Mon, Jul 25, 2011 at 6:58 AM, Boojin Kim <boojin.kim@samsung.com> wr=
ote:

> diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kc=
onfig
> index 4d79519..cb170a6 100644
> --- a/arch/arm/plat-samsung/Kconfig
> +++ b/arch/arm/plat-samsung/Kconfig
> @@ -300,6 +300,14 @@ config S3C_PL330_DMA
> =C2=A0 =C2=A0 =C2=A0 =C2=A0help
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S3C DMA API Driver for PL330 DMAC.
>
> +config DMADEV_PL330
> + =C2=A0 =C2=A0 =C2=A0 bool
> + =C2=A0 =C2=A0 =C2=A0 select DMADEVICES
> + =C2=A0 =C2=A0 =C2=A0 select PL330_DMA
> + =C2=A0 =C2=A0 =C2=A0 select ARM_AMBA
> + =C2=A0 =C2=A0 =C2=A0 help
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 Use DMA device engine for PL330 DMAC.
> +
If this is for the 'wrapper' dma driver, please use S3C or similar pref=
ix.

> diff --git a/arch/arm/plat-samsung/include/plat/s3c-dma-pl330.h b/arc=
h/arm/plat-samsung/include/plat/dma-pl330.h
> similarity index 84%
> rename from arch/arm/plat-samsung/include/plat/s3c-dma-pl330.h
> rename to arch/arm/plat-samsung/include/plat/dma-pl330.h
> index 8107442..c402719 100644
> --- a/arch/arm/plat-samsung/include/plat/s3c-dma-pl330.h
> +++ b/arch/arm/plat-samsung/include/plat/dma-pl330.h
> @@ -8,19 +8,18 @@
> =C2=A0* (at your option) any later version.
> =C2=A0*/
>
> -#ifndef =C2=A0 =C2=A0 =C2=A0 =C2=A0__S3C_DMA_PL330_H_
> -#define =C2=A0 =C2=A0 =C2=A0 =C2=A0__S3C_DMA_PL330_H_
> -
> -#define S3C2410_DMAF_AUTOSTART =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 << 0)
> -#define S3C2410_DMAF_CIRCULAR =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 <=
< 1)
> +#ifndef __DMA_PL330_H_
> +#define __DMA_PL330_H_ __FILE__
To respect namespaces, please preserve S3C prefix because
the file is Samsung specific.


> @@ -84,6 +83,14 @@ enum dma_ch {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0DMACH_SLIMBUS4_TX,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0DMACH_SLIMBUS5_RX,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0DMACH_SLIMBUS5_TX,
> + =C2=A0 =C2=A0 =C2=A0 DMACH_MTOM_0,
> + =C2=A0 =C2=A0 =C2=A0 DMACH_MTOM_1,
> + =C2=A0 =C2=A0 =C2=A0 DMACH_MTOM_2,
> + =C2=A0 =C2=A0 =C2=A0 DMACH_MTOM_3,
> + =C2=A0 =C2=A0 =C2=A0 DMACH_MTOM_4,
> + =C2=A0 =C2=A0 =C2=A0 DMACH_MTOM_5,
> + =C2=A0 =C2=A0 =C2=A0 DMACH_MTOM_6,
> + =C2=A0 =C2=A0 =C2=A0 DMACH_MTOM_7,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* END Marker, also used to denote a reser=
ved channel */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0DMACH_MAX,
> =C2=A0};

Naming mem->mem channels should be unnecessary.
Not sure what you have in mind.

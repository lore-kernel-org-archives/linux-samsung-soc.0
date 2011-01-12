From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH V3] spi: Enable SPI driver for S5P6440 and S5P6450
Date: Wed, 12 Jan 2011 15:29:41 +0900
Message-ID: <AANLkTikGDN+S7MPMi9V4AQ4v94nc=B-Cgm-7Up69EK8V@mail.gmail.com>
References: <1294812023-32697-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:45655 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751444Ab1ALG3m convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jan 2011 01:29:42 -0500
Received: by bwz15 with SMTP id 15so259062bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2011 22:29:41 -0800 (PST)
In-Reply-To: <1294812023-32697-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, spi-devel-general@lists.sourceforge.net, Sangbeom Kim <sbkim73@samsung.com>, dbrownell@users.courceforge.net, ben-linux@fluff.org, Abhilash Kesavan <a.kesavan@samsung.com>

On Wed, Jan 12, 2011 at 3:00 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> From: Abhilash Kesavan <a.kesavan@samsung.com>
>
> This patch enables the existing S3C64XX series SPI driver for S5P64X0
> and removed dependency on EXPERIMENTAL because we don't need it now.
>
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> Cc: Jassi Brar <jassi.brar@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> Changes since v2:
> - Changed dependency of S3C64XX_DMA
>
> Changes since v1:
> - Removed dependency on EXPERIMENTAL
>
> (Following is same with previous patch v2)
>
> Hi David and Grant,
>
> I missed that send to you when I have got this via Linux Samsung SoC =
mailing list.
> Hmm...I know, it's 38 merge winodw...so I'm not sure can be handled n=
ow.
>
> Anyway if any problems, please let me know.
>
> Thanks and Happy New year :)
>
> Best regards,
> Kgene.
>
> =C2=A0drivers/spi/Kconfig | =C2=A0 =C2=A04 ++--
> =C2=A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
> index 1906840..37aec5e 100644
> --- a/drivers/spi/Kconfig
> +++ b/drivers/spi/Kconfig
> @@ -310,8 +310,8 @@ config SPI_S3C24XX_GPIO
>
> =C2=A0config SPI_S3C64XX
> =C2=A0 =C2=A0 =C2=A0 =C2=A0tristate "Samsung S3C64XX series type SPI"
> - =C2=A0 =C2=A0 =C2=A0 depends on ARCH_S3C64XX && EXPERIMENTAL
> - =C2=A0 =C2=A0 =C2=A0 select S3C64XX_DMA
> + =C2=A0 =C2=A0 =C2=A0 depends on (ARCH_S3C64XX || ARCH_S5P64X0)
> + =C2=A0 =C2=A0 =C2=A0 select S3C64XX_DMA if ARCH_S3C64XX
> =C2=A0 =C2=A0 =C2=A0 =C2=A0help
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SPI driver for Samsung S3C64XX and =
newer SoCs.
>
> --
> 1.6.2.5

Acked-by: Jassi Brar <jassi.brar@samsung.com>

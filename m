From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 2/2] SPI: SAMSUNG: Bug fix for SPI with different FIFO level
Date: Thu, 30 Jun 2011 12:38:18 +0530
Message-ID: <BANLkTi=L7QeN75ebWFXdp_V5Pw1zEc-ZtA@mail.gmail.com>
References: <1309437536-9315-1-git-send-email-padma.v@samsung.com>
	<1309437536-9315-2-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:52254 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753730Ab1F3HIU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 03:08:20 -0400
Received: by bwd5 with SMTP id 5so1588293bwd.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2011 00:08:18 -0700 (PDT)
In-Reply-To: <1309437536-9315-2-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: kgene.kim@samsung.com, sbkim73@samsung.com, grant.likely@secretlab.ca, spi-devel-general@lists.sourceforge.net, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Thu, Jun 30, 2011 at 6:08 PM, Padmavathi Venna <padma.v@samsung.com>=
 wrote:
> Fixed the bug in transmission status check for 64 bytes FIFO
> level.
>
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
> =C2=A0drivers/spi/spi_s3c64xx.c | =C2=A0 =C2=A04 +---
> =C2=A01 files changed, 1 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/spi/spi_s3c64xx.c b/drivers/spi/spi_s3c64xx.c
> index 795828b..8945e20 100644
> --- a/drivers/spi/spi_s3c64xx.c
> +++ b/drivers/spi/spi_s3c64xx.c
> @@ -116,9 +116,7 @@
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(=
((i)->fifo_lvl_mask + 1))) \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0?=
 1 : 0)
>
> -#define S3C64XX_SPI_ST_TX_DONE(v, i) ((((v) >> (i)->rx_lvl_offset) &=
 \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (((i)->=
fifo_lvl_mask + 1) << 1)) \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ? 1 : 0=
)
> +#define S3C64XX_SPI_ST_TX_DONE(v, i) (((v) & (1 << (i)->tx_st_done))=
 ? 1 : 0)

IIRC the macro is already designed to deduct tx-done levels from other =
fields.
Could you please _explain_ with one example where it fails ? It is
difficult to see without
numbers.

Thanks,
-Jassi

From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH] ARM:SAMSUNG: DMA Cleanup as per sparse
Date: Thu, 30 Jun 2011 16:07:10 +0530
Message-ID: <BANLkTimCWFP18o7ZmO5puzs2HMU+DmkfAQ@mail.gmail.com>
References: <1309428980-20176-1-git-send-email-sangwook.lee@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:56290 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752310Ab1F3KhL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 06:37:11 -0400
Received: by bwd5 with SMTP id 5so1704970bwd.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2011 03:37:10 -0700 (PDT)
In-Reply-To: <1309428980-20176-1-git-send-email-sangwook.lee@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangwook Lee <sangwook.lee@linaro.org>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ben-linux@fluff.org, patches@linaro.org

On Thu, Jun 30, 2011 at 3:46 PM, Sangwook Lee <sangwook.lee@linaro.org>=
 wrote:
> Function declaration differs between file:s3c-pl330.c and file:dma.h
> and SPARSE (Documentation/sparse.txt) gives error messages
>
> Signed-off-by: Sangwook Lee <sangwook.lee@linaro.org>

Acked-by: Jassi Brar <jassisinghbrar@gmail.com>

> ---
> =C2=A0arch/arm/plat-samsung/include/plat/dma.h | =C2=A0 16 ++++++++--=
------
> =C2=A01 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm/plat-samsung/include/plat/dma.h b/arch/arm/plat=
-samsung/include/plat/dma.h
> index 2e8f8c6..7365f46 100644
> --- a/arch/arm/plat-samsung/include/plat/dma.h
> +++ b/arch/arm/plat-samsung/include/plat/dma.h
> @@ -62,7 +62,7 @@ typedef int =C2=A0(*s3c2410_dma_opfn_t)(struct s3c2=
410_dma_chan *,
> =C2=A0* request a dma channel exclusivley
> =C2=A0*/
>
> -extern int s3c2410_dma_request(unsigned int channel,
> +extern int s3c2410_dma_request(enum dma_ch id,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct s3c2410_dma_client *, void *=
dev);
>
>
> @@ -71,14 +71,14 @@ extern int s3c2410_dma_request(unsigned int chann=
el,
> =C2=A0* change the state of the dma channel
> =C2=A0*/
>
> -extern int s3c2410_dma_ctrl(unsigned int channel, enum s3c2410_chan_=
op op);
> +extern int s3c2410_dma_ctrl(enum dma_ch id, enum s3c2410_chan_op op)=
;
>
> =C2=A0/* s3c2410_dma_setflags
> =C2=A0*
> =C2=A0* set the channel's flags to a given state
> =C2=A0*/
>
> -extern int s3c2410_dma_setflags(unsigned int channel,
> +extern int s3c2410_dma_setflags(enum dma_ch id,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int flags);
>
> =C2=A0/* s3c2410_dma_free
> @@ -86,7 +86,7 @@ extern int s3c2410_dma_setflags(unsigned int channe=
l,
> =C2=A0* free the dma channel (will also abort any outstanding operati=
ons)
> =C2=A0*/
>
> -extern int s3c2410_dma_free(unsigned int channel, struct s3c2410_dma=
_client *);
> +extern int s3c2410_dma_free(enum dma_ch id, struct s3c2410_dma_clien=
t *);
>
> =C2=A0/* s3c2410_dma_enqueue
> =C2=A0*
> @@ -95,7 +95,7 @@ extern int s3c2410_dma_free(unsigned int channel, s=
truct s3c2410_dma_client *);
> =C2=A0* drained before the buffer is given to the DMA system.
> =C2=A0*/
>
> -extern int s3c2410_dma_enqueue(unsigned int channel, void *id,
> +extern int s3c2410_dma_enqueue(enum dma_ch idx, void *id,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_addr_t data, int size);
>
> =C2=A0/* s3c2410_dma_config
> @@ -103,14 +103,14 @@ extern int s3c2410_dma_enqueue(unsigned int cha=
nnel, void *id,
> =C2=A0* configure the dma channel
> =C2=A0*/
>
> -extern int s3c2410_dma_config(unsigned int channel, int xferunit);
> +extern int s3c2410_dma_config(enum dma_ch id, int xferunit);
>
> =C2=A0/* s3c2410_dma_devconfig
> =C2=A0*
> =C2=A0* configure the device we're talking to
> =C2=A0*/
>
> -extern int s3c2410_dma_devconfig(unsigned int channel,
> +extern int s3c2410_dma_devconfig(enum dma_ch id,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum s3c2410_d=
masrc source, unsigned long devaddr);
>
> =C2=A0/* s3c2410_dma_getposition
> @@ -118,7 +118,7 @@ extern int s3c2410_dma_devconfig(unsigned int cha=
nnel,
> =C2=A0* get the position that the dma transfer is currently at
> =C2=A0*/
>
> -extern int s3c2410_dma_getposition(unsigned int channel,
> +extern int s3c2410_dma_getposition(enum dma_ch id,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_addr_t *src, dma_=
addr_t *dest);
>
> =C2=A0extern int s3c2410_dma_set_opfn(unsigned int, s3c2410_dma_opfn_=
t rtn);
> --
> 1.7.4.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM:SAMSUNG: Move S3C DMA driver to drivers/dma
Date: Tue, 7 Jun 2011 17:00:38 +0900
Message-ID: <BANLkTintADbXSiV07VTMbFfmUV+4-q2-gw@mail.gmail.com>
References: <1307432901-22781-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:45537 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751135Ab1FGIAk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jun 2011 04:00:40 -0400
Received: by vxi39 with SMTP id 39so3355891vxi.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jun 2011 01:00:39 -0700 (PDT)
In-Reply-To: <1307432901-22781-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: root <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

Hi,

As I know there's are PL330 DMA implementation by
MODULE_AUTHOR("Jaswinder Singh <jassi.brar@samsung.com>");

Doesn't it better to use the generic PL330 instead of Samsung specific
PL330 implementation?

As I remember Jassi has a plan to use generic one?

Thank you,
Kyungmin Park

On Tue, Jun 7, 2011 at 4:48 PM, root <alim.akhtar@samsung.com> wrote:
> Signed-off-by: alim.akhtar <alim.akhtar@samsung.com>
> ---
> =A0arch/arm/configs/exynos4_defconfig | =A0 =A01 +
> =A0arch/arm/configs/s5p64x0_defconfig | =A0 =A01 +
> =A0arch/arm/configs/s5pc100_defconfig | =A0 =A01 +
> =A0arch/arm/configs/s5pv210_defconfig | =A0 =A01 +
> =A0arch/arm/plat-samsung/Kconfig =A0 =A0 =A0| =A0 =A06 -
> =A0arch/arm/plat-samsung/Makefile =A0 =A0 | =A0 =A02 -
> =A0arch/arm/plat-samsung/s3c-pl330.c =A0| 1244 ----------------------=
--------------
> =A0drivers/dma/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A08 +
> =A0drivers/dma/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +
> =A0drivers/dma/s3c-pl330.c =A0 =A0 =A0 =A0 =A0 =A0| 1244 ++++++++++++=
++++++++++++++++++++++++
> =A010 files changed, 1258 insertions(+), 1252 deletions(-)
> =A0delete mode 100644 arch/arm/plat-samsung/s3c-pl330.c
> =A0create mode 100644 drivers/dma/s3c-pl330.c
>
> diff --git a/arch/arm/configs/exynos4_defconfig b/arch/arm/configs/ex=
ynos4_defconfig
> index da53ff3..6421074 100644
> --- a/arch/arm/configs/exynos4_defconfig
> +++ b/arch/arm/configs/exynos4_defconfig
> @@ -37,6 +37,7 @@ CONFIG_SERIAL_SAMSUNG=3Dy
> =A0CONFIG_SERIAL_SAMSUNG_CONSOLE=3Dy
> =A0CONFIG_HW_RANDOM=3Dy
> =A0CONFIG_I2C=3Dy
> +CONFIG_DMADEVICES=3Dy
> =A0# CONFIG_HWMON is not set
> =A0# CONFIG_MFD_SUPPORT is not set
> =A0# CONFIG_HID_SUPPORT is not set
> diff --git a/arch/arm/configs/s5p64x0_defconfig b/arch/arm/configs/s5=
p64x0_defconfig
> index ad6b61b..9340ffc 100644
> --- a/arch/arm/configs/s5p64x0_defconfig
> +++ b/arch/arm/configs/s5p64x0_defconfig
> @@ -31,6 +31,7 @@ CONFIG_SERIAL_8250_NR_UARTS=3D3
> =A0CONFIG_SERIAL_SAMSUNG=3Dy
> =A0CONFIG_SERIAL_SAMSUNG_CONSOLE=3Dy
> =A0CONFIG_HW_RANDOM=3Dy
> +CONFIG_DMADEVICES=3Dy
> =A0# CONFIG_HWMON is not set
> =A0CONFIG_DISPLAY_SUPPORT=3Dy
> =A0# CONFIG_VGA_CONSOLE is not set
> diff --git a/arch/arm/configs/s5pc100_defconfig b/arch/arm/configs/s5=
pc100_defconfig
> index 41bafc9..694ef97 100644
> --- a/arch/arm/configs/s5pc100_defconfig
> +++ b/arch/arm/configs/s5pc100_defconfig
> @@ -20,6 +20,7 @@ CONFIG_SERIAL_SAMSUNG_CONSOLE=3Dy
> =A0CONFIG_HW_RANDOM=3Dy
> =A0CONFIG_I2C=3Dy
> =A0CONFIG_I2C_CHARDEV=3Dy
> +CONFIG_DMADEVICES=3Dy
> =A0# CONFIG_VGA_CONSOLE is not set
> =A0CONFIG_MMC=3Dy
> =A0CONFIG_MMC_DEBUG=3Dy
> diff --git a/arch/arm/configs/s5pv210_defconfig b/arch/arm/configs/s5=
pv210_defconfig
> index fa98990..0013593 100644
> --- a/arch/arm/configs/s5pv210_defconfig
> +++ b/arch/arm/configs/s5pv210_defconfig
> @@ -37,6 +37,7 @@ CONFIG_SERIAL_8250=3Dy
> =A0CONFIG_SERIAL_SAMSUNG=3Dy
> =A0CONFIG_SERIAL_SAMSUNG_CONSOLE=3Dy
> =A0CONFIG_HW_RANDOM=3Dy
> +CONFIG_DMADEVICES=3Dy
> =A0# CONFIG_HWMON is not set
> =A0# CONFIG_VGA_CONSOLE is not set
> =A0# CONFIG_HID_SUPPORT is not set
> diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kc=
onfig
> index 4d79519..9607ac4 100644
> --- a/arch/arm/plat-samsung/Kconfig
> +++ b/arch/arm/plat-samsung/Kconfig
> @@ -294,12 +294,6 @@ config S3C_DMA
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Internal configuration for S3C DMA core
>
> -config S3C_PL330_DMA
> - =A0 =A0 =A0 bool
> - =A0 =A0 =A0 select PL330
> - =A0 =A0 =A0 help
> - =A0 =A0 =A0 =A0 S3C DMA API Driver for PL330 DMAC.
> -
> =A0comment "Power management"
>
> =A0config SAMSUNG_PM_DEBUG
> diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung/M=
akefile
> index 53eb15b..895c697 100644
> --- a/arch/arm/plat-samsung/Makefile
> +++ b/arch/arm/plat-samsung/Makefile
> @@ -64,8 +64,6 @@ obj-$(CONFIG_SAMSUNG_DEV_PWM) +=3D dev-pwm.o
>
> =A0obj-$(CONFIG_S3C_DMA) =A0 =A0 =A0 =A0 =A0+=3D dma.o
>
> -obj-$(CONFIG_S3C_PL330_DMA) =A0 =A0+=3D s3c-pl330.o
> -
> =A0# PM support
>
> =A0obj-$(CONFIG_PM) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D pm.o
> diff --git a/arch/arm/plat-samsung/s3c-pl330.c b/arch/arm/plat-samsun=
g/s3c-pl330.c
> deleted file mode 100644
> index f85638c..0000000
> --- a/arch/arm/plat-samsung/s3c-pl330.c
> +++ /dev/null
> @@ -1,1244 +0,0 @@
> -/* linux/arch/arm/plat-samsung/s3c-pl330.c
> - *
> - * Copyright (C) 2010 Samsung Electronics Co. Ltd.
> - * =A0 =A0 Jaswinder Singh <jassi.brar@samsung.com>
> - *
> - * This program is free software; you can redistribute it and/or mod=
ify
> - * it under the terms of the GNU General Public License as published=
 by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - */
> -
> -#include <linux/init.h>
> -#include <linux/module.h>
> -#include <linux/interrupt.h>
> -#include <linux/io.h>
> -#include <linux/slab.h>
> -#include <linux/platform_device.h>
> -#include <linux/clk.h>
> -#include <linux/err.h>
> -
> -#include <asm/hardware/pl330.h>
> -
> -#include <plat/s3c-pl330-pdata.h>
> -
> -/**
> - * struct s3c_pl330_dmac - Logical representation of a PL330 DMAC.
> - * @busy_chan: Number of channels currently busy.
> - * @peri: List of IDs of peripherals this DMAC can work with.
> - * @node: To attach to the global list of DMACs.
> - * @pi: PL330 configuration info for the DMAC.
> - * @kmcache: Pool to quickly allocate xfers for all channels in the =
dmac.
> - * @clk: Pointer of DMAC operation clock.
> - */
> -struct s3c_pl330_dmac {
> - =A0 =A0 =A0 unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0busy_chan;
> - =A0 =A0 =A0 enum dma_ch =A0 =A0 =A0 =A0 =A0 =A0 *peri;
> - =A0 =A0 =A0 struct list_head =A0 =A0 =A0 =A0node;
> - =A0 =A0 =A0 struct pl330_info =A0 =A0 =A0 *pi;
> - =A0 =A0 =A0 struct kmem_cache =A0 =A0 =A0 *kmcache;
> - =A0 =A0 =A0 struct clk =A0 =A0 =A0 =A0 =A0 =A0 =A0*clk;
> -};
> -
> -/**
> - * struct s3c_pl330_xfer - A request submitted by S3C DMA clients.
> - * @token: Xfer ID provided by the client.
> - * @node: To attach to the list of xfers on a channel.
> - * @px: Xfer for PL330 core.
> - * @chan: Owner channel of this xfer.
> - */
> -struct s3c_pl330_xfer {
> - =A0 =A0 =A0 void =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*token;
> - =A0 =A0 =A0 struct list_head =A0 =A0 =A0 =A0node;
> - =A0 =A0 =A0 struct pl330_xfer =A0 =A0 =A0 px;
> - =A0 =A0 =A0 struct s3c_pl330_chan =A0 *chan;
> -};
> -
> -/**
> - * struct s3c_pl330_chan - Logical channel to communicate with
> - * =A0 =A0 a Physical peripheral.
> - * @pl330_chan_id: Token of a hardware channel thread of PL330 DMAC.
> - * =A0 =A0 NULL if the channel is available to be acquired.
> - * @id: ID of the peripheral that this channel can communicate with.
> - * @options: Options specified by the client.
> - * @sdaddr: Address provided via s3c2410_dma_devconfig.
> - * @node: To attach to the global list of channels.
> - * @lrq: Pointer to the last submitted pl330_req to PL330 core.
> - * @xfer_list: To manage list of xfers enqueued.
> - * @req: Two requests to communicate with the PL330 engine.
> - * @callback_fn: Callback function to the client.
> - * @rqcfg: Channel configuration for the xfers.
> - * @xfer_head: Pointer to the xfer to be next executed.
> - * @dmac: Pointer to the DMAC that manages this channel, NULL if the
> - * =A0 =A0 channel is available to be acquired.
> - * @client: Client of this channel. NULL if the
> - * =A0 =A0 channel is available to be acquired.
> - */
> -struct s3c_pl330_chan {
> - =A0 =A0 =A0 void =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0*pl330_chan_id;
> - =A0 =A0 =A0 enum dma_ch =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 id;
> - =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0opt=
ions;
> - =A0 =A0 =A0 unsigned long =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sdadd=
r;
> - =A0 =A0 =A0 struct list_head =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0node;
> - =A0 =A0 =A0 struct pl330_req =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*lrq;
> - =A0 =A0 =A0 struct list_head =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0xfer_li=
st;
> - =A0 =A0 =A0 struct pl330_req =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0req[2];
> - =A0 =A0 =A0 s3c2410_dma_cbfn_t =A0 =A0 =A0 =A0 =A0 =A0 =A0callback_=
fn;
> - =A0 =A0 =A0 struct pl330_reqcfg =A0 =A0 =A0 =A0 =A0 =A0 rqcfg;
> - =A0 =A0 =A0 struct s3c_pl330_xfer =A0 =A0 =A0 =A0 =A0 *xfer_head;
> - =A0 =A0 =A0 struct s3c_pl330_dmac =A0 =A0 =A0 =A0 =A0 *dmac;
> - =A0 =A0 =A0 struct s3c2410_dma_client =A0 =A0 =A0 *client;
> -};
> -
> -/* All DMACs in the platform */
> -static LIST_HEAD(dmac_list);
> -
> -/* All channels to peripherals in the platform */
> -static LIST_HEAD(chan_list);
> -
> -/*
> - * Since we add resources(DMACs and Channels) to the global pool,
> - * we need to guard access to the resources using a global lock
> - */
> -static DEFINE_SPINLOCK(res_lock);
> -
> -/* Returns the channel with ID 'id' in the chan_list */
> -static struct s3c_pl330_chan *id_to_chan(const enum dma_ch id)
> -{
> - =A0 =A0 =A0 struct s3c_pl330_chan *ch;
> -
> - =A0 =A0 =A0 list_for_each_entry(ch, &chan_list, node)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ch->id =3D=3D id)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ch;
> -
> - =A0 =A0 =A0 return NULL;
> -}
> -
> -/* Allocate a new channel with ID 'id' and add to chan_list */
> -static void chan_add(const enum dma_ch id)
> -{
> - =A0 =A0 =A0 struct s3c_pl330_chan *ch =3D id_to_chan(id);
> -
> - =A0 =A0 =A0 /* Return if the channel already exists */
> - =A0 =A0 =A0 if (ch)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> -
> - =A0 =A0 =A0 ch =3D kmalloc(sizeof(*ch), GFP_KERNEL);
> - =A0 =A0 =A0 /* Return silently to work with other channels */
> - =A0 =A0 =A0 if (!ch)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> -
> - =A0 =A0 =A0 ch->id =3D id;
> - =A0 =A0 =A0 ch->dmac =3D NULL;
> -
> - =A0 =A0 =A0 list_add_tail(&ch->node, &chan_list);
> -}
> -
> -/* If the channel is not yet acquired by any client */
> -static bool chan_free(struct s3c_pl330_chan *ch)
> -{
> - =A0 =A0 =A0 if (!ch)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return false;
> -
> - =A0 =A0 =A0 /* Channel points to some DMAC only when it's acquired =
*/
> - =A0 =A0 =A0 return ch->dmac ? false : true;
> -}
> -
> -/*
> - * Returns 0 is peripheral i/f is invalid or not present on the dmac=
=2E
> - * Index + 1, otherwise.
> - */
> -static unsigned iface_of_dmac(struct s3c_pl330_dmac *dmac, enum dma_=
ch ch_id)
> -{
> - =A0 =A0 =A0 enum dma_ch *id =3D dmac->peri;
> - =A0 =A0 =A0 int i;
> -
> - =A0 =A0 =A0 /* Discount invalid markers */
> - =A0 =A0 =A0 if (ch_id =3D=3D DMACH_MAX)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> -
> - =A0 =A0 =A0 for (i =3D 0; i < PL330_MAX_PERI; i++)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (id[i] =3D=3D ch_id)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return i + 1;
> -
> - =A0 =A0 =A0 return 0;
> -}
> -
> -/* If all channel threads of the DMAC are busy */
> -static inline bool dmac_busy(struct s3c_pl330_dmac *dmac)
> -{
> - =A0 =A0 =A0 struct pl330_info *pi =3D dmac->pi;
> -
> - =A0 =A0 =A0 return (dmac->busy_chan < pi->pcfg.num_chan) ? false : =
true;
> -}
> -
> -/*
> - * Returns the number of free channels that
> - * can be handled by this dmac only.
> - */
> -static unsigned ch_onlyby_dmac(struct s3c_pl330_dmac *dmac)
> -{
> - =A0 =A0 =A0 enum dma_ch *id =3D dmac->peri;
> - =A0 =A0 =A0 struct s3c_pl330_dmac *d;
> - =A0 =A0 =A0 struct s3c_pl330_chan *ch;
> - =A0 =A0 =A0 unsigned found, count =3D 0;
> - =A0 =A0 =A0 enum dma_ch p;
> - =A0 =A0 =A0 int i;
> -
> - =A0 =A0 =A0 for (i =3D 0; i < PL330_MAX_PERI; i++) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D id[i];
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch =3D id_to_chan(p);
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (p =3D=3D DMACH_MAX || !chan_free(ch=
))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 found =3D 0;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 list_for_each_entry(d, &dmac_list, node=
) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (d !=3D dmac && ifac=
e_of_dmac(d, ch->id)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 found =3D=
 1;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!found)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 count++;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 return count;
> -}
> -
> -/*
> - * Measure of suitability of 'dmac' handling 'ch'
> - *
> - * 0 indicates 'dmac' can not handle 'ch' either
> - * because it is not supported by the hardware or
> - * because all dmac channels are currently busy.
> - *
> - * >0 vlaue indicates 'dmac' has the capability.
> - * The bigger the value the more suitable the dmac.
> - */
> -#define MAX_SUIT =A0 =A0 =A0 UINT_MAX
> -#define MIN_SUIT =A0 =A0 =A0 0
> -
> -static unsigned suitablility(struct s3c_pl330_dmac *dmac,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct s3c_pl330_chan *ch)
> -{
> - =A0 =A0 =A0 struct pl330_info *pi =3D dmac->pi;
> - =A0 =A0 =A0 enum dma_ch *id =3D dmac->peri;
> - =A0 =A0 =A0 struct s3c_pl330_dmac *d;
> - =A0 =A0 =A0 unsigned s;
> - =A0 =A0 =A0 int i;
> -
> - =A0 =A0 =A0 s =3D MIN_SUIT;
> - =A0 =A0 =A0 /* If all the DMAC channel threads are busy */
> - =A0 =A0 =A0 if (dmac_busy(dmac))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return s;
> -
> - =A0 =A0 =A0 for (i =3D 0; i < PL330_MAX_PERI; i++)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (id[i] =3D=3D ch->id)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> -
> - =A0 =A0 =A0 /* If the 'dmac' can't talk to 'ch' */
> - =A0 =A0 =A0 if (i =3D=3D PL330_MAX_PERI)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return s;
> -
> - =A0 =A0 =A0 s =3D MAX_SUIT;
> - =A0 =A0 =A0 list_for_each_entry(d, &dmac_list, node) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* If some other dmac can talk to thi=
s
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* peri and has some channel free.
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (d !=3D dmac && iface_of_dmac(d, ch-=
>id) && !dmac_busy(d)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s =3D 0;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> - =A0 =A0 =A0 }
> - =A0 =A0 =A0 if (s)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return s;
> -
> - =A0 =A0 =A0 s =3D 100;
> -
> - =A0 =A0 =A0 /* Good if free chans are more, bad otherwise */
> - =A0 =A0 =A0 s +=3D (pi->pcfg.num_chan - dmac->busy_chan) - ch_onlyb=
y_dmac(dmac);
> -
> - =A0 =A0 =A0 return s;
> -}
> -
> -/* More than one DMAC may have capability to transfer data with the
> - * peripheral. This function assigns most suitable DMAC to manage th=
e
> - * channel and hence communicate with the peripheral.
> - */
> -static struct s3c_pl330_dmac *map_chan_to_dmac(struct s3c_pl330_chan=
 *ch)
> -{
> - =A0 =A0 =A0 struct s3c_pl330_dmac *d, *dmac =3D NULL;
> - =A0 =A0 =A0 unsigned sn, sl =3D MIN_SUIT;
> -
> - =A0 =A0 =A0 list_for_each_entry(d, &dmac_list, node) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sn =3D suitablility(d, ch);
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (sn =3D=3D MAX_SUIT)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return d;
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (sn > sl)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dmac =3D d;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 return dmac;
> -}
> -
> -/* Acquire the channel for peripheral 'id' */
> -static struct s3c_pl330_chan *chan_acquire(const enum dma_ch id)
> -{
> - =A0 =A0 =A0 struct s3c_pl330_chan *ch =3D id_to_chan(id);
> - =A0 =A0 =A0 struct s3c_pl330_dmac *dmac;
> -
> - =A0 =A0 =A0 /* If the channel doesn't exist or is already acquired =
*/
> - =A0 =A0 =A0 if (!ch || !chan_free(ch)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch =3D NULL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto acq_exit;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 dmac =3D map_chan_to_dmac(ch);
> - =A0 =A0 =A0 /* If couldn't map */
> - =A0 =A0 =A0 if (!dmac) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch =3D NULL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto acq_exit;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 dmac->busy_chan++;
> - =A0 =A0 =A0 ch->dmac =3D dmac;
> -
> -acq_exit:
> - =A0 =A0 =A0 return ch;
> -}
> -
> -/* Delete xfer from the queue */
> -static inline void del_from_queue(struct s3c_pl330_xfer *xfer)
> -{
> - =A0 =A0 =A0 struct s3c_pl330_xfer *t;
> - =A0 =A0 =A0 struct s3c_pl330_chan *ch;
> - =A0 =A0 =A0 int found;
> -
> - =A0 =A0 =A0 if (!xfer)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> -
> - =A0 =A0 =A0 ch =3D xfer->chan;
> -
> - =A0 =A0 =A0 /* Make sure xfer is in the queue */
> - =A0 =A0 =A0 found =3D 0;
> - =A0 =A0 =A0 list_for_each_entry(t, &ch->xfer_list, node)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (t =3D=3D xfer) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 found =3D 1;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 if (!found)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> -
> - =A0 =A0 =A0 /* If xfer is last entry in the queue */
> - =A0 =A0 =A0 if (xfer->node.next =3D=3D &ch->xfer_list)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 t =3D list_entry(ch->xfer_list.next,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct =
s3c_pl330_xfer, node);
> - =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 t =3D list_entry(xfer->node.next,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct =
s3c_pl330_xfer, node);
> -
> - =A0 =A0 =A0 /* If there was only one node left */
> - =A0 =A0 =A0 if (t =3D=3D xfer)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->xfer_head =3D NULL;
> - =A0 =A0 =A0 else if (ch->xfer_head =3D=3D xfer)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->xfer_head =3D t;
> -
> - =A0 =A0 =A0 list_del(&xfer->node);
> -}
> -
> -/* Provides pointer to the next xfer in the queue.
> - * If CIRCULAR option is set, the list is left intact,
> - * otherwise the xfer is removed from the list.
> - * Forced delete 'pluck' can be set to override the CIRCULAR option.
> - */
> -static struct s3c_pl330_xfer *get_from_queue(struct s3c_pl330_chan *=
ch,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 int pluck)
> -{
> - =A0 =A0 =A0 struct s3c_pl330_xfer *xfer =3D ch->xfer_head;
> -
> - =A0 =A0 =A0 if (!xfer)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
> -
> - =A0 =A0 =A0 /* If xfer is last entry in the queue */
> - =A0 =A0 =A0 if (xfer->node.next =3D=3D &ch->xfer_list)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->xfer_head =3D list_entry(ch->xfer_l=
ist.next,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 struct s3c_pl330_xfer, node);
> - =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->xfer_head =3D list_entry(xfer->node=
=2Enext,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 struct s3c_pl330_xfer, node);
> -
> - =A0 =A0 =A0 if (pluck || !(ch->options & S3C2410_DMAF_CIRCULAR))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 del_from_queue(xfer);
> -
> - =A0 =A0 =A0 return xfer;
> -}
> -
> -static inline void add_to_queue(struct s3c_pl330_chan *ch,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct s3c_pl330_xfer *xfer, int front)
> -{
> - =A0 =A0 =A0 struct pl330_xfer *xt;
> -
> - =A0 =A0 =A0 /* If queue empty */
> - =A0 =A0 =A0 if (ch->xfer_head =3D=3D NULL)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->xfer_head =3D xfer;
> -
> - =A0 =A0 =A0 xt =3D &ch->xfer_head->px;
> - =A0 =A0 =A0 /* If the head already submitted (CIRCULAR head) */
> - =A0 =A0 =A0 if (ch->options & S3C2410_DMAF_CIRCULAR &&
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 (xt =3D=3D ch->req[0].x || xt =3D=3D ch=
->req[1].x))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->xfer_head =3D xfer;
> -
> - =A0 =A0 =A0 /* If this is a resubmission, it should go at the head =
*/
> - =A0 =A0 =A0 if (front) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->xfer_head =3D xfer;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 list_add(&xfer->node, &ch->xfer_list);
> - =A0 =A0 =A0 } else {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 list_add_tail(&xfer->node, &ch->xfer_li=
st);
> - =A0 =A0 =A0 }
> -}
> -
> -static inline void _finish_off(struct s3c_pl330_xfer *xfer,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 enum s3c2410_dma_buffresult res, int ff=
ree)
> -{
> - =A0 =A0 =A0 struct s3c_pl330_chan *ch;
> -
> - =A0 =A0 =A0 if (!xfer)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> -
> - =A0 =A0 =A0 ch =3D xfer->chan;
> -
> - =A0 =A0 =A0 /* Do callback */
> - =A0 =A0 =A0 if (ch->callback_fn)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->callback_fn(NULL, xfer->token, xfer=
->px.bytes, res);
> -
> - =A0 =A0 =A0 /* Force Free or if buffer is not needed anymore */
> - =A0 =A0 =A0 if (ffree || !(ch->options & S3C2410_DMAF_CIRCULAR))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 kmem_cache_free(ch->dmac->kmcache, xfer=
);
> -}
> -
> -static inline int s3c_pl330_submit(struct s3c_pl330_chan *ch,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct pl330_req *r)
> -{
> - =A0 =A0 =A0 struct s3c_pl330_xfer *xfer;
> - =A0 =A0 =A0 int ret =3D 0;
> -
> - =A0 =A0 =A0 /* If already submitted */
> - =A0 =A0 =A0 if (r->x)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> -
> - =A0 =A0 =A0 xfer =3D get_from_queue(ch, 0);
> - =A0 =A0 =A0 if (xfer) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 r->x =3D &xfer->px;
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Use max bandwidth for M<->M xfers */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (r->rqtype =3D=3D MEMTOMEM) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct pl330_info *pi =3D=
 xfer->chan->dmac->pi;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int burst =3D 1 << ch->=
rqcfg.brst_size;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 u32 bytes =3D r->x->byt=
es;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int bl;
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bl =3D pi->pcfg.data_bu=
s_width / 8;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bl *=3D pi->pcfg.data_b=
uf_dep;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bl /=3D burst;
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* src/dst_burst_len ca=
n't be more than 16 */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (bl > 16)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bl =3D =
16;
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (bl > 1) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!(b=
ytes % (bl * burst)))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 break;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bl--;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->rqcfg.brst_len =3D =
bl;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->rqcfg.brst_len =3D =
1;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D pl330_submit_req(ch->pl330_chan=
_id, r);
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* If submission was successful */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!ret) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->lrq =3D r; /* lates=
t submitted req */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 r->x =3D NULL;
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* If both of the PL330 ping-pong buffe=
rs filled */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret =3D=3D -EAGAIN) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(ch->dmac->pi->d=
ev, "%s:%d!\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func_=
_, __LINE__);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Queue back again */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 add_to_queue(ch, xfer, =
1);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D 0;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(ch->dmac->pi->d=
ev, "%s:%d!\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func_=
_, __LINE__);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 _finish_off(xfer, S3C24=
10_RES_ERR, 0);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 return ret;
> -}
> -
> -static void s3c_pl330_rq(struct s3c_pl330_chan *ch,
> - =A0 =A0 =A0 struct pl330_req *r, enum pl330_op_err err)
> -{
> - =A0 =A0 =A0 unsigned long flags;
> - =A0 =A0 =A0 struct s3c_pl330_xfer *xfer;
> - =A0 =A0 =A0 struct pl330_xfer *xl =3D r->x;
> - =A0 =A0 =A0 enum s3c2410_dma_buffresult res;
> -
> - =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> -
> - =A0 =A0 =A0 r->x =3D NULL;
> -
> - =A0 =A0 =A0 s3c_pl330_submit(ch, r);
> -
> - =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags);
> -
> - =A0 =A0 =A0 /* Map result to S3C DMA API */
> - =A0 =A0 =A0 if (err =3D=3D PL330_ERR_NONE)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 res =3D S3C2410_RES_OK;
> - =A0 =A0 =A0 else if (err =3D=3D PL330_ERR_ABORT)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 res =3D S3C2410_RES_ABORT;
> - =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 res =3D S3C2410_RES_ERR;
> -
> - =A0 =A0 =A0 /* If last request had some xfer */
> - =A0 =A0 =A0 if (xl) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 xfer =3D container_of(xl, struct s3c_pl=
330_xfer, px);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 _finish_off(xfer, res, 0);
> - =A0 =A0 =A0 } else {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_info(ch->dmac->pi->dev, "%s:%d No X=
fer?!\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func__, __LINE__);
> - =A0 =A0 =A0 }
> -}
> -
> -static void s3c_pl330_rq0(void *token, enum pl330_op_err err)
> -{
> - =A0 =A0 =A0 struct pl330_req *r =3D token;
> - =A0 =A0 =A0 struct s3c_pl330_chan *ch =3D container_of(r,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 struct s3c_pl330_chan, req[0]);
> - =A0 =A0 =A0 s3c_pl330_rq(ch, r, err);
> -}
> -
> -static void s3c_pl330_rq1(void *token, enum pl330_op_err err)
> -{
> - =A0 =A0 =A0 struct pl330_req *r =3D token;
> - =A0 =A0 =A0 struct s3c_pl330_chan *ch =3D container_of(r,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 struct s3c_pl330_chan, req[1]);
> - =A0 =A0 =A0 s3c_pl330_rq(ch, r, err);
> -}
> -
> -/* Release an acquired channel */
> -static void chan_release(struct s3c_pl330_chan *ch)
> -{
> - =A0 =A0 =A0 struct s3c_pl330_dmac *dmac;
> -
> - =A0 =A0 =A0 if (chan_free(ch))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> -
> - =A0 =A0 =A0 dmac =3D ch->dmac;
> - =A0 =A0 =A0 ch->dmac =3D NULL;
> - =A0 =A0 =A0 dmac->busy_chan--;
> -}
> -
> -int s3c2410_dma_ctrl(enum dma_ch id, enum s3c2410_chan_op op)
> -{
> - =A0 =A0 =A0 struct s3c_pl330_xfer *xfer;
> - =A0 =A0 =A0 enum pl330_chan_op pl330op;
> - =A0 =A0 =A0 struct s3c_pl330_chan *ch;
> - =A0 =A0 =A0 unsigned long flags;
> - =A0 =A0 =A0 int idx, ret;
> -
> - =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> -
> - =A0 =A0 =A0 ch =3D id_to_chan(id);
> -
> - =A0 =A0 =A0 if (!ch || chan_free(ch)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto ctrl_exit;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 switch (op) {
> - =A0 =A0 =A0 case S3C2410_DMAOP_START:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Make sure both reqs are enqueued */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 idx =3D (ch->lrq =3D=3D &ch->req[0]) ? =
1 : 0;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_pl330_submit(ch, &ch->req[idx]);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_pl330_submit(ch, &ch->req[1 - idx])=
;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pl330op =3D PL330_OP_START;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> -
> - =A0 =A0 =A0 case S3C2410_DMAOP_STOP:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pl330op =3D PL330_OP_ABORT;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> -
> - =A0 =A0 =A0 case S3C2410_DMAOP_FLUSH:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pl330op =3D PL330_OP_FLUSH;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> -
> - =A0 =A0 =A0 case S3C2410_DMAOP_PAUSE:
> - =A0 =A0 =A0 case S3C2410_DMAOP_RESUME:
> - =A0 =A0 =A0 case S3C2410_DMAOP_TIMEOUT:
> - =A0 =A0 =A0 case S3C2410_DMAOP_STARTED:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags=
);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> -
> - =A0 =A0 =A0 default:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags=
);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 ret =3D pl330_chan_ctrl(ch->pl330_chan_id, pl330op);
> -
> - =A0 =A0 =A0 if (pl330op =3D=3D PL330_OP_START) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags=
);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 idx =3D (ch->lrq =3D=3D &ch->req[0]) ? 1 : 0;
> -
> - =A0 =A0 =A0 /* Abort the current xfer */
> - =A0 =A0 =A0 if (ch->req[idx].x) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 xfer =3D container_of(ch->req[idx].x,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct =
s3c_pl330_xfer, px);
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Drop xfer during FLUSH */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pl330op =3D=3D PL330_OP_FLUSH)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 del_from_queue(xfer);
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->req[idx].x =3D NULL;
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags=
);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 _finish_off(xfer, S3C2410_RES_ABORT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pl330op=
 =3D=3D PL330_OP_FLUSH ? 1 : 0);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 /* Flush the whole queue */
> - =A0 =A0 =A0 if (pl330op =3D=3D PL330_OP_FLUSH) {
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ch->req[1 - idx].x) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 xfer =3D container_of(c=
h->req[1 - idx].x,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 struct s3c_pl330_xfer, px);
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 del_from_queue(xfer);
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->req[1 - idx].x =3D =
NULL;
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(=
&res_lock, flags);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 _finish_off(xfer, S3C24=
10_RES_ABORT, 1);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_irqsave(&res_=
lock, flags);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Finish off the remaining in the queu=
e */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 xfer =3D ch->xfer_head;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (xfer) {
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 del_from_queue(xfer);
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(=
&res_lock, flags);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 _finish_off(xfer, S3C24=
10_RES_ABORT, 1);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_irqsave(&res_=
lock, flags);
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 xfer =3D ch->xfer_head;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> - =A0 =A0 =A0 }
> -
> -ctrl_exit:
> - =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags);
> -
> - =A0 =A0 =A0 return ret;
> -}
> -EXPORT_SYMBOL(s3c2410_dma_ctrl);
> -
> -int s3c2410_dma_enqueue(enum dma_ch id, void *token,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_addr_t addr, int si=
ze)
> -{
> - =A0 =A0 =A0 struct s3c_pl330_chan *ch;
> - =A0 =A0 =A0 struct s3c_pl330_xfer *xfer;
> - =A0 =A0 =A0 unsigned long flags;
> - =A0 =A0 =A0 int idx, ret =3D 0;
> -
> - =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> -
> - =A0 =A0 =A0 ch =3D id_to_chan(id);
> -
> - =A0 =A0 =A0 /* Error if invalid or free channel */
> - =A0 =A0 =A0 if (!ch || chan_free(ch)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto enq_exit;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 /* Error if size is unaligned */
> - =A0 =A0 =A0 if (ch->rqcfg.brst_size && size % (1 << ch->rqcfg.brst_=
size)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto enq_exit;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 xfer =3D kmem_cache_alloc(ch->dmac->kmcache, GFP_ATOMIC=
);
> - =A0 =A0 =A0 if (!xfer) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto enq_exit;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 xfer->token =3D token;
> - =A0 =A0 =A0 xfer->chan =3D ch;
> - =A0 =A0 =A0 xfer->px.bytes =3D size;
> - =A0 =A0 =A0 xfer->px.next =3D NULL; /* Single request */
> -
> - =A0 =A0 =A0 /* For S3C DMA API, direction is always fixed for all x=
fers */
> - =A0 =A0 =A0 if (ch->req[0].rqtype =3D=3D MEMTODEV) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 xfer->px.src_addr =3D addr;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 xfer->px.dst_addr =3D ch->sdaddr;
> - =A0 =A0 =A0 } else {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 xfer->px.src_addr =3D ch->sdaddr;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 xfer->px.dst_addr =3D addr;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 add_to_queue(ch, xfer, 0);
> -
> - =A0 =A0 =A0 /* Try submitting on either request */
> - =A0 =A0 =A0 idx =3D (ch->lrq =3D=3D &ch->req[0]) ? 1 : 0;
> -
> - =A0 =A0 =A0 if (!ch->req[idx].x)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_pl330_submit(ch, &ch->req[idx]);
> - =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_pl330_submit(ch, &ch->req[1 - idx])=
;
> -
> - =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags);
> -
> - =A0 =A0 =A0 if (ch->options & S3C2410_DMAF_AUTOSTART)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c2410_dma_ctrl(id, S3C2410_DMAOP_STAR=
T);
> -
> - =A0 =A0 =A0 return 0;
> -
> -enq_exit:
> - =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags);
> -
> - =A0 =A0 =A0 return ret;
> -}
> -EXPORT_SYMBOL(s3c2410_dma_enqueue);
> -
> -int s3c2410_dma_request(enum dma_ch id,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct s3c2410_dma_clie=
nt *client,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 void *dev)
> -{
> - =A0 =A0 =A0 struct s3c_pl330_dmac *dmac;
> - =A0 =A0 =A0 struct s3c_pl330_chan *ch;
> - =A0 =A0 =A0 unsigned long flags;
> - =A0 =A0 =A0 int ret =3D 0;
> -
> - =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> -
> - =A0 =A0 =A0 ch =3D chan_acquire(id);
> - =A0 =A0 =A0 if (!ch) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EBUSY;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto req_exit;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 dmac =3D ch->dmac;
> -
> - =A0 =A0 =A0 ch->pl330_chan_id =3D pl330_request_channel(dmac->pi);
> - =A0 =A0 =A0 if (!ch->pl330_chan_id) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 chan_release(ch);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EBUSY;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto req_exit;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 ch->client =3D client;
> - =A0 =A0 =A0 ch->options =3D 0; /* Clear any option */
> - =A0 =A0 =A0 ch->callback_fn =3D NULL; /* Clear any callback */
> - =A0 =A0 =A0 ch->lrq =3D NULL;
> -
> - =A0 =A0 =A0 ch->rqcfg.brst_size =3D 2; /* Default word size */
> - =A0 =A0 =A0 ch->rqcfg.swap =3D SWAP_NO;
> - =A0 =A0 =A0 ch->rqcfg.scctl =3D SCCTRL0; /* Noncacheable and nonbuf=
ferable */
> - =A0 =A0 =A0 ch->rqcfg.dcctl =3D DCCTRL0; /* Noncacheable and nonbuf=
ferable */
> - =A0 =A0 =A0 ch->rqcfg.privileged =3D 0;
> - =A0 =A0 =A0 ch->rqcfg.insnaccess =3D 0;
> -
> - =A0 =A0 =A0 /* Set invalid direction */
> - =A0 =A0 =A0 ch->req[0].rqtype =3D DEVTODEV;
> - =A0 =A0 =A0 ch->req[1].rqtype =3D ch->req[0].rqtype;
> -
> - =A0 =A0 =A0 ch->req[0].cfg =3D &ch->rqcfg;
> - =A0 =A0 =A0 ch->req[1].cfg =3D ch->req[0].cfg;
> -
> - =A0 =A0 =A0 ch->req[0].peri =3D iface_of_dmac(dmac, id) - 1; /* Ori=
ginal index */
> - =A0 =A0 =A0 ch->req[1].peri =3D ch->req[0].peri;
> -
> - =A0 =A0 =A0 ch->req[0].token =3D &ch->req[0];
> - =A0 =A0 =A0 ch->req[0].xfer_cb =3D s3c_pl330_rq0;
> - =A0 =A0 =A0 ch->req[1].token =3D &ch->req[1];
> - =A0 =A0 =A0 ch->req[1].xfer_cb =3D s3c_pl330_rq1;
> -
> - =A0 =A0 =A0 ch->req[0].x =3D NULL;
> - =A0 =A0 =A0 ch->req[1].x =3D NULL;
> -
> - =A0 =A0 =A0 /* Reset xfer list */
> - =A0 =A0 =A0 INIT_LIST_HEAD(&ch->xfer_list);
> - =A0 =A0 =A0 ch->xfer_head =3D NULL;
> -
> -req_exit:
> - =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags);
> -
> - =A0 =A0 =A0 return ret;
> -}
> -EXPORT_SYMBOL(s3c2410_dma_request);
> -
> -int s3c2410_dma_free(enum dma_ch id, struct s3c2410_dma_client *clie=
nt)
> -{
> - =A0 =A0 =A0 struct s3c_pl330_chan *ch;
> - =A0 =A0 =A0 struct s3c_pl330_xfer *xfer;
> - =A0 =A0 =A0 unsigned long flags;
> - =A0 =A0 =A0 int ret =3D 0;
> - =A0 =A0 =A0 unsigned idx;
> -
> - =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> -
> - =A0 =A0 =A0 ch =3D id_to_chan(id);
> -
> - =A0 =A0 =A0 if (!ch || chan_free(ch))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto free_exit;
> -
> - =A0 =A0 =A0 /* Refuse if someone else wanted to free the channel */
> - =A0 =A0 =A0 if (ch->client !=3D client) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EBUSY;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto free_exit;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 /* Stop any active xfer, Flushe the queue and do callba=
cks */
> - =A0 =A0 =A0 pl330_chan_ctrl(ch->pl330_chan_id, PL330_OP_FLUSH);
> -
> - =A0 =A0 =A0 /* Abort the submitted requests */
> - =A0 =A0 =A0 idx =3D (ch->lrq =3D=3D &ch->req[0]) ? 1 : 0;
> -
> - =A0 =A0 =A0 if (ch->req[idx].x) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 xfer =3D container_of(ch->req[idx].x,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct =
s3c_pl330_xfer, px);
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->req[idx].x =3D NULL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 del_from_queue(xfer);
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags=
);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 _finish_off(xfer, S3C2410_RES_ABORT, 1)=
;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 if (ch->req[1 - idx].x) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 xfer =3D container_of(ch->req[1 - idx].=
x,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct =
s3c_pl330_xfer, px);
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->req[1 - idx].x =3D NULL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 del_from_queue(xfer);
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags=
);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 _finish_off(xfer, S3C2410_RES_ABORT, 1)=
;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 /* Pluck and Abort the queued requests in order */
> - =A0 =A0 =A0 do {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 xfer =3D get_from_queue(ch, 1);
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags=
);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 _finish_off(xfer, S3C2410_RES_ABORT, 1)=
;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> - =A0 =A0 =A0 } while (xfer);
> -
> - =A0 =A0 =A0 ch->client =3D NULL;
> -
> - =A0 =A0 =A0 pl330_release_channel(ch->pl330_chan_id);
> -
> - =A0 =A0 =A0 ch->pl330_chan_id =3D NULL;
> -
> - =A0 =A0 =A0 chan_release(ch);
> -
> -free_exit:
> - =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags);
> -
> - =A0 =A0 =A0 return ret;
> -}
> -EXPORT_SYMBOL(s3c2410_dma_free);
> -
> -int s3c2410_dma_config(enum dma_ch id, int xferunit)
> -{
> - =A0 =A0 =A0 struct s3c_pl330_chan *ch;
> - =A0 =A0 =A0 struct pl330_info *pi;
> - =A0 =A0 =A0 unsigned long flags;
> - =A0 =A0 =A0 int i, dbwidth, ret =3D 0;
> -
> - =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> -
> - =A0 =A0 =A0 ch =3D id_to_chan(id);
> -
> - =A0 =A0 =A0 if (!ch || chan_free(ch)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto cfg_exit;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 pi =3D ch->dmac->pi;
> - =A0 =A0 =A0 dbwidth =3D pi->pcfg.data_bus_width / 8;
> -
> - =A0 =A0 =A0 /* Max size of xfer can be pcfg.data_bus_width */
> - =A0 =A0 =A0 if (xferunit > dbwidth) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto cfg_exit;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 i =3D 0;
> - =A0 =A0 =A0 while (xferunit !=3D (1 << i))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 i++;
> -
> - =A0 =A0 =A0 /* If valid value */
> - =A0 =A0 =A0 if (xferunit =3D=3D (1 << i))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->rqcfg.brst_size =3D i;
> - =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> -
> -cfg_exit:
> - =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags);
> -
> - =A0 =A0 =A0 return ret;
> -}
> -EXPORT_SYMBOL(s3c2410_dma_config);
> -
> -/* Options that are supported by this driver */
> -#define S3C_PL330_FLAGS (S3C2410_DMAF_CIRCULAR | S3C2410_DMAF_AUTOST=
ART)
> -
> -int s3c2410_dma_setflags(enum dma_ch id, unsigned int options)
> -{
> - =A0 =A0 =A0 struct s3c_pl330_chan *ch;
> - =A0 =A0 =A0 unsigned long flags;
> - =A0 =A0 =A0 int ret =3D 0;
> -
> - =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> -
> - =A0 =A0 =A0 ch =3D id_to_chan(id);
> -
> - =A0 =A0 =A0 if (!ch || chan_free(ch) || options & ~(S3C_PL330_FLAGS=
))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> - =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->options =3D options;
> -
> - =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags);
> -
> - =A0 =A0 =A0 return 0;
> -}
> -EXPORT_SYMBOL(s3c2410_dma_setflags);
> -
> -int s3c2410_dma_set_buffdone_fn(enum dma_ch id, s3c2410_dma_cbfn_t r=
tn)
> -{
> - =A0 =A0 =A0 struct s3c_pl330_chan *ch;
> - =A0 =A0 =A0 unsigned long flags;
> - =A0 =A0 =A0 int ret =3D 0;
> -
> - =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> -
> - =A0 =A0 =A0 ch =3D id_to_chan(id);
> -
> - =A0 =A0 =A0 if (!ch || chan_free(ch))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> - =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->callback_fn =3D rtn;
> -
> - =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags);
> -
> - =A0 =A0 =A0 return ret;
> -}
> -EXPORT_SYMBOL(s3c2410_dma_set_buffdone_fn);
> -
> -int s3c2410_dma_devconfig(enum dma_ch id, enum s3c2410_dmasrc source=
,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long addre=
ss)
> -{
> - =A0 =A0 =A0 struct s3c_pl330_chan *ch;
> - =A0 =A0 =A0 unsigned long flags;
> - =A0 =A0 =A0 int ret =3D 0;
> -
> - =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> -
> - =A0 =A0 =A0 ch =3D id_to_chan(id);
> -
> - =A0 =A0 =A0 if (!ch || chan_free(ch)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto devcfg_exit;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 switch (source) {
> - =A0 =A0 =A0 case S3C2410_DMASRC_HW: /* P->M */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->req[0].rqtype =3D DEVTOMEM;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->req[1].rqtype =3D DEVTOMEM;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->rqcfg.src_inc =3D 0;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->rqcfg.dst_inc =3D 1;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> - =A0 =A0 =A0 case S3C2410_DMASRC_MEM: /* M->P */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->req[0].rqtype =3D MEMTODEV;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->req[1].rqtype =3D MEMTODEV;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->rqcfg.src_inc =3D 1;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->rqcfg.dst_inc =3D 0;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> - =A0 =A0 =A0 default:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto devcfg_exit;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 ch->sdaddr =3D address;
> -
> -devcfg_exit:
> - =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags);
> -
> - =A0 =A0 =A0 return ret;
> -}
> -EXPORT_SYMBOL(s3c2410_dma_devconfig);
> -
> -int s3c2410_dma_getposition(enum dma_ch id, dma_addr_t *src, dma_add=
r_t *dst)
> -{
> - =A0 =A0 =A0 struct s3c_pl330_chan *ch =3D id_to_chan(id);
> - =A0 =A0 =A0 struct pl330_chanstatus status;
> - =A0 =A0 =A0 int ret;
> -
> - =A0 =A0 =A0 if (!ch || chan_free(ch))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> -
> - =A0 =A0 =A0 ret =3D pl330_chan_status(ch->pl330_chan_id, &status);
> - =A0 =A0 =A0 if (ret < 0)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> -
> - =A0 =A0 =A0 *src =3D status.src_addr;
> - =A0 =A0 =A0 *dst =3D status.dst_addr;
> -
> - =A0 =A0 =A0 return 0;
> -}
> -EXPORT_SYMBOL(s3c2410_dma_getposition);
> -
> -static irqreturn_t pl330_irq_handler(int irq, void *data)
> -{
> - =A0 =A0 =A0 if (pl330_update(data))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return IRQ_HANDLED;
> - =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return IRQ_NONE;
> -}
> -
> -static int pl330_probe(struct platform_device *pdev)
> -{
> - =A0 =A0 =A0 struct s3c_pl330_dmac *s3c_pl330_dmac;
> - =A0 =A0 =A0 struct s3c_pl330_platdata *pl330pd;
> - =A0 =A0 =A0 struct pl330_info *pl330_info;
> - =A0 =A0 =A0 struct resource *res;
> - =A0 =A0 =A0 int i, ret, irq;
> -
> - =A0 =A0 =A0 pl330pd =3D pdev->dev.platform_data;
> -
> - =A0 =A0 =A0 /* Can't do without the list of _32_ peripherals */
> - =A0 =A0 =A0 if (!pl330pd || !pl330pd->peri) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "platform data miss=
ing!\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 pl330_info =3D kzalloc(sizeof(*pl330_info), GFP_KERNEL)=
;
> - =A0 =A0 =A0 if (!pl330_info)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> -
> - =A0 =A0 =A0 pl330_info->pl330_data =3D NULL;
> - =A0 =A0 =A0 pl330_info->dev =3D &pdev->dev;
> -
> - =A0 =A0 =A0 res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> - =A0 =A0 =A0 if (!res) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENODEV;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto probe_err1;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 request_mem_region(res->start, resource_size(res), pdev=
->name);
> -
> - =A0 =A0 =A0 pl330_info->base =3D ioremap(res->start, resource_size(=
res));
> - =A0 =A0 =A0 if (!pl330_info->base) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENXIO;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto probe_err2;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 irq =3D platform_get_irq(pdev, 0);
> - =A0 =A0 =A0 if (irq < 0) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D irq;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto probe_err3;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 ret =3D request_irq(irq, pl330_irq_handler, 0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_name(&pdev->dev), p=
l330_info);
> - =A0 =A0 =A0 if (ret)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto probe_err4;
> -
> - =A0 =A0 =A0 /* Allocate a new DMAC */
> - =A0 =A0 =A0 s3c_pl330_dmac =3D kmalloc(sizeof(*s3c_pl330_dmac), GFP=
_KERNEL);
> - =A0 =A0 =A0 if (!s3c_pl330_dmac) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto probe_err5;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 /* Get operation clock and enable it */
> - =A0 =A0 =A0 s3c_pl330_dmac->clk =3D clk_get(&pdev->dev, "pdma");
> - =A0 =A0 =A0 if (IS_ERR(s3c_pl330_dmac->clk)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "Cannot get operati=
on clock.\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto probe_err6;
> - =A0 =A0 =A0 }
> - =A0 =A0 =A0 clk_enable(s3c_pl330_dmac->clk);
> -
> - =A0 =A0 =A0 ret =3D pl330_add(pl330_info);
> - =A0 =A0 =A0 if (ret)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto probe_err7;
> -
> - =A0 =A0 =A0 /* Hook the info */
> - =A0 =A0 =A0 s3c_pl330_dmac->pi =3D pl330_info;
> -
> - =A0 =A0 =A0 /* No busy channels */
> - =A0 =A0 =A0 s3c_pl330_dmac->busy_chan =3D 0;
> -
> - =A0 =A0 =A0 s3c_pl330_dmac->kmcache =3D kmem_cache_create(dev_name(=
&pdev->dev),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sizeof(=
struct s3c_pl330_xfer), 0, 0, NULL);
> -
> - =A0 =A0 =A0 if (!s3c_pl330_dmac->kmcache) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto probe_err8;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 /* Get the list of peripherals */
> - =A0 =A0 =A0 s3c_pl330_dmac->peri =3D pl330pd->peri;
> -
> - =A0 =A0 =A0 /* Attach to the list of DMACs */
> - =A0 =A0 =A0 list_add_tail(&s3c_pl330_dmac->node, &dmac_list);
> -
> - =A0 =A0 =A0 /* Create a channel for each peripheral in the DMAC
> - =A0 =A0 =A0 =A0* that is, if it doesn't already exist
> - =A0 =A0 =A0 =A0*/
> - =A0 =A0 =A0 for (i =3D 0; i < PL330_MAX_PERI; i++)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (s3c_pl330_dmac->peri[i] !=3D DMACH_=
MAX)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chan_add(s3c_pl330_dmac=
->peri[i]);
> -
> - =A0 =A0 =A0 printk(KERN_INFO
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Loaded driver for PL330 DMAC-%d %s\n",=
 pdev->id, pdev->name);
> - =A0 =A0 =A0 printk(KERN_INFO
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 "\tDBUFF-%ux%ubytes Num_Chans-%u Num_Pe=
ri-%u Num_Events-%u\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pl330_info->pcfg.data_buf_dep,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pl330_info->pcfg.data_bus_width / 8, pl=
330_info->pcfg.num_chan,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pl330_info->pcfg.num_peri, pl330_info->=
pcfg.num_events);
> -
> - =A0 =A0 =A0 return 0;
> -
> -probe_err8:
> - =A0 =A0 =A0 pl330_del(pl330_info);
> -probe_err7:
> - =A0 =A0 =A0 clk_disable(s3c_pl330_dmac->clk);
> - =A0 =A0 =A0 clk_put(s3c_pl330_dmac->clk);
> -probe_err6:
> - =A0 =A0 =A0 kfree(s3c_pl330_dmac);
> -probe_err5:
> - =A0 =A0 =A0 free_irq(irq, pl330_info);
> -probe_err4:
> -probe_err3:
> - =A0 =A0 =A0 iounmap(pl330_info->base);
> -probe_err2:
> - =A0 =A0 =A0 release_mem_region(res->start, resource_size(res));
> -probe_err1:
> - =A0 =A0 =A0 kfree(pl330_info);
> -
> - =A0 =A0 =A0 return ret;
> -}
> -
> -static int pl330_remove(struct platform_device *pdev)
> -{
> - =A0 =A0 =A0 struct s3c_pl330_dmac *dmac, *d;
> - =A0 =A0 =A0 struct s3c_pl330_chan *ch;
> - =A0 =A0 =A0 unsigned long flags;
> - =A0 =A0 =A0 int del, found;
> -
> - =A0 =A0 =A0 if (!pdev->dev.platform_data)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> -
> - =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> -
> - =A0 =A0 =A0 found =3D 0;
> - =A0 =A0 =A0 list_for_each_entry(d, &dmac_list, node)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (d->pi->dev =3D=3D &pdev->dev) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 found =3D 1;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 if (!found) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags=
);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 dmac =3D d;
> -
> - =A0 =A0 =A0 /* Remove all Channels that are managed only by this DM=
AC */
> - =A0 =A0 =A0 list_for_each_entry(ch, &chan_list, node) {
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Only channels that are handled by th=
is DMAC */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (iface_of_dmac(dmac, ch->id))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 del =3D 1;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Don't remove if some other DMAC has =
it too */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 list_for_each_entry(d, &dmac_list, node=
)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (d !=3D dmac && ifac=
e_of_dmac(d, ch->id)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 del =3D=
 0;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (del) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(=
&res_lock, flags);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c2410_dma_free(ch->id=
, ch->client);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_irqsave(&res_=
lock, flags);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 list_del(&ch->node);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(ch);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 /* Disable operation clock */
> - =A0 =A0 =A0 clk_disable(dmac->clk);
> - =A0 =A0 =A0 clk_put(dmac->clk);
> -
> - =A0 =A0 =A0 /* Remove the DMAC */
> - =A0 =A0 =A0 list_del(&dmac->node);
> - =A0 =A0 =A0 kfree(dmac);
> -
> - =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags);
> -
> - =A0 =A0 =A0 return 0;
> -}
> -
> -static struct platform_driver pl330_driver =3D {
> - =A0 =A0 =A0 .driver =A0 =A0 =A0 =A0 =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .owner =A0=3D THIS_MODULE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =3D "s3c-pl330",
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 .probe =A0 =A0 =A0 =A0 =A0=3D pl330_probe,
> - =A0 =A0 =A0 .remove =A0 =A0 =A0 =A0 =3D pl330_remove,
> -};
> -
> -static int __init pl330_init(void)
> -{
> - =A0 =A0 =A0 return platform_driver_register(&pl330_driver);
> -}
> -module_init(pl330_init);
> -
> -static void __exit pl330_exit(void)
> -{
> - =A0 =A0 =A0 platform_driver_unregister(&pl330_driver);
> - =A0 =A0 =A0 return;
> -}
> -module_exit(pl330_exit);
> -
> -MODULE_AUTHOR("Jaswinder Singh <jassi.brar@samsung.com>");
> -MODULE_DESCRIPTION("Driver for PL330 DMA Controller");
> -MODULE_LICENSE("GPL");
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index 25cf327..9a023e6 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -199,6 +199,14 @@ config PL330_DMA
> =A0 =A0 =A0 =A0 =A0You need to provide platform specific settings via
> =A0 =A0 =A0 =A0 =A0platform_data for a dma-pl330 device.
>
> +config S3C_PL330_DMA
> + =A0 =A0 =A0 bool "S3C DMA API Driver for PL330 DMAC"
> + =A0 =A0 =A0 select DMA_ENGINE
> + =A0 =A0 =A0 select PL330
> + =A0 =A0 =A0 depends on PLAT_SAMSUNG
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 S3C DMA API Driver for PL330 DMAC.
> +
> =A0config PCH_DMA
> =A0 =A0 =A0 =A0tristate "Intel EG20T PCH / OKI Semi IOH(ML7213/ML7223=
) DMA support"
> =A0 =A0 =A0 =A0depends on PCI && X86
> diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
> index 836095a..6e81b5d 100644
> --- a/drivers/dma/Makefile
> +++ b/drivers/dma/Makefile
> @@ -25,3 +25,4 @@ obj-$(CONFIG_STE_DMA40) +=3D ste_dma40.o ste_dma40_=
ll.o
> =A0obj-$(CONFIG_PL330_DMA) +=3D pl330.o
> =A0obj-$(CONFIG_PCH_DMA) +=3D pch_dma.o
> =A0obj-$(CONFIG_AMBA_PL08X) +=3D amba-pl08x.o
> +obj-$(CONFIG_S3C_PL330_DMA) =A0 =A0+=3D s3c-pl330.o
> diff --git a/drivers/dma/s3c-pl330.c b/drivers/dma/s3c-pl330.c
> new file mode 100644
> index 0000000..f85638c
> --- /dev/null
> +++ b/drivers/dma/s3c-pl330.c
> @@ -0,0 +1,1244 @@
> +/* linux/arch/arm/plat-samsung/s3c-pl330.c
> + *
> + * Copyright (C) 2010 Samsung Electronics Co. Ltd.
> + * =A0 =A0 Jaswinder Singh <jassi.brar@samsung.com>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/slab.h>
> +#include <linux/platform_device.h>
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +
> +#include <asm/hardware/pl330.h>
> +
> +#include <plat/s3c-pl330-pdata.h>
> +
> +/**
> + * struct s3c_pl330_dmac - Logical representation of a PL330 DMAC.
> + * @busy_chan: Number of channels currently busy.
> + * @peri: List of IDs of peripherals this DMAC can work with.
> + * @node: To attach to the global list of DMACs.
> + * @pi: PL330 configuration info for the DMAC.
> + * @kmcache: Pool to quickly allocate xfers for all channels in the =
dmac.
> + * @clk: Pointer of DMAC operation clock.
> + */
> +struct s3c_pl330_dmac {
> + =A0 =A0 =A0 unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0busy_chan;
> + =A0 =A0 =A0 enum dma_ch =A0 =A0 =A0 =A0 =A0 =A0 *peri;
> + =A0 =A0 =A0 struct list_head =A0 =A0 =A0 =A0node;
> + =A0 =A0 =A0 struct pl330_info =A0 =A0 =A0 *pi;
> + =A0 =A0 =A0 struct kmem_cache =A0 =A0 =A0 *kmcache;
> + =A0 =A0 =A0 struct clk =A0 =A0 =A0 =A0 =A0 =A0 =A0*clk;
> +};
> +
> +/**
> + * struct s3c_pl330_xfer - A request submitted by S3C DMA clients.
> + * @token: Xfer ID provided by the client.
> + * @node: To attach to the list of xfers on a channel.
> + * @px: Xfer for PL330 core.
> + * @chan: Owner channel of this xfer.
> + */
> +struct s3c_pl330_xfer {
> + =A0 =A0 =A0 void =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*token;
> + =A0 =A0 =A0 struct list_head =A0 =A0 =A0 =A0node;
> + =A0 =A0 =A0 struct pl330_xfer =A0 =A0 =A0 px;
> + =A0 =A0 =A0 struct s3c_pl330_chan =A0 *chan;
> +};
> +
> +/**
> + * struct s3c_pl330_chan - Logical channel to communicate with
> + * =A0 =A0 a Physical peripheral.
> + * @pl330_chan_id: Token of a hardware channel thread of PL330 DMAC.
> + * =A0 =A0 NULL if the channel is available to be acquired.
> + * @id: ID of the peripheral that this channel can communicate with.
> + * @options: Options specified by the client.
> + * @sdaddr: Address provided via s3c2410_dma_devconfig.
> + * @node: To attach to the global list of channels.
> + * @lrq: Pointer to the last submitted pl330_req to PL330 core.
> + * @xfer_list: To manage list of xfers enqueued.
> + * @req: Two requests to communicate with the PL330 engine.
> + * @callback_fn: Callback function to the client.
> + * @rqcfg: Channel configuration for the xfers.
> + * @xfer_head: Pointer to the xfer to be next executed.
> + * @dmac: Pointer to the DMAC that manages this channel, NULL if the
> + * =A0 =A0 channel is available to be acquired.
> + * @client: Client of this channel. NULL if the
> + * =A0 =A0 channel is available to be acquired.
> + */
> +struct s3c_pl330_chan {
> + =A0 =A0 =A0 void =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0*pl330_chan_id;
> + =A0 =A0 =A0 enum dma_ch =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 id;
> + =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0opt=
ions;
> + =A0 =A0 =A0 unsigned long =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sdadd=
r;
> + =A0 =A0 =A0 struct list_head =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0node;
> + =A0 =A0 =A0 struct pl330_req =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*lrq;
> + =A0 =A0 =A0 struct list_head =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0xfer_li=
st;
> + =A0 =A0 =A0 struct pl330_req =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0req[2];
> + =A0 =A0 =A0 s3c2410_dma_cbfn_t =A0 =A0 =A0 =A0 =A0 =A0 =A0callback_=
fn;
> + =A0 =A0 =A0 struct pl330_reqcfg =A0 =A0 =A0 =A0 =A0 =A0 rqcfg;
> + =A0 =A0 =A0 struct s3c_pl330_xfer =A0 =A0 =A0 =A0 =A0 *xfer_head;
> + =A0 =A0 =A0 struct s3c_pl330_dmac =A0 =A0 =A0 =A0 =A0 *dmac;
> + =A0 =A0 =A0 struct s3c2410_dma_client =A0 =A0 =A0 *client;
> +};
> +
> +/* All DMACs in the platform */
> +static LIST_HEAD(dmac_list);
> +
> +/* All channels to peripherals in the platform */
> +static LIST_HEAD(chan_list);
> +
> +/*
> + * Since we add resources(DMACs and Channels) to the global pool,
> + * we need to guard access to the resources using a global lock
> + */
> +static DEFINE_SPINLOCK(res_lock);
> +
> +/* Returns the channel with ID 'id' in the chan_list */
> +static struct s3c_pl330_chan *id_to_chan(const enum dma_ch id)
> +{
> + =A0 =A0 =A0 struct s3c_pl330_chan *ch;
> +
> + =A0 =A0 =A0 list_for_each_entry(ch, &chan_list, node)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ch->id =3D=3D id)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ch;
> +
> + =A0 =A0 =A0 return NULL;
> +}
> +
> +/* Allocate a new channel with ID 'id' and add to chan_list */
> +static void chan_add(const enum dma_ch id)
> +{
> + =A0 =A0 =A0 struct s3c_pl330_chan *ch =3D id_to_chan(id);
> +
> + =A0 =A0 =A0 /* Return if the channel already exists */
> + =A0 =A0 =A0 if (ch)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> +
> + =A0 =A0 =A0 ch =3D kmalloc(sizeof(*ch), GFP_KERNEL);
> + =A0 =A0 =A0 /* Return silently to work with other channels */
> + =A0 =A0 =A0 if (!ch)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> +
> + =A0 =A0 =A0 ch->id =3D id;
> + =A0 =A0 =A0 ch->dmac =3D NULL;
> +
> + =A0 =A0 =A0 list_add_tail(&ch->node, &chan_list);
> +}
> +
> +/* If the channel is not yet acquired by any client */
> +static bool chan_free(struct s3c_pl330_chan *ch)
> +{
> + =A0 =A0 =A0 if (!ch)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return false;
> +
> + =A0 =A0 =A0 /* Channel points to some DMAC only when it's acquired =
*/
> + =A0 =A0 =A0 return ch->dmac ? false : true;
> +}
> +
> +/*
> + * Returns 0 is peripheral i/f is invalid or not present on the dmac=
=2E
> + * Index + 1, otherwise.
> + */
> +static unsigned iface_of_dmac(struct s3c_pl330_dmac *dmac, enum dma_=
ch ch_id)
> +{
> + =A0 =A0 =A0 enum dma_ch *id =3D dmac->peri;
> + =A0 =A0 =A0 int i;
> +
> + =A0 =A0 =A0 /* Discount invalid markers */
> + =A0 =A0 =A0 if (ch_id =3D=3D DMACH_MAX)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> +
> + =A0 =A0 =A0 for (i =3D 0; i < PL330_MAX_PERI; i++)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (id[i] =3D=3D ch_id)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return i + 1;
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +/* If all channel threads of the DMAC are busy */
> +static inline bool dmac_busy(struct s3c_pl330_dmac *dmac)
> +{
> + =A0 =A0 =A0 struct pl330_info *pi =3D dmac->pi;
> +
> + =A0 =A0 =A0 return (dmac->busy_chan < pi->pcfg.num_chan) ? false : =
true;
> +}
> +
> +/*
> + * Returns the number of free channels that
> + * can be handled by this dmac only.
> + */
> +static unsigned ch_onlyby_dmac(struct s3c_pl330_dmac *dmac)
> +{
> + =A0 =A0 =A0 enum dma_ch *id =3D dmac->peri;
> + =A0 =A0 =A0 struct s3c_pl330_dmac *d;
> + =A0 =A0 =A0 struct s3c_pl330_chan *ch;
> + =A0 =A0 =A0 unsigned found, count =3D 0;
> + =A0 =A0 =A0 enum dma_ch p;
> + =A0 =A0 =A0 int i;
> +
> + =A0 =A0 =A0 for (i =3D 0; i < PL330_MAX_PERI; i++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D id[i];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch =3D id_to_chan(p);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (p =3D=3D DMACH_MAX || !chan_free(ch=
))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 found =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 list_for_each_entry(d, &dmac_list, node=
) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (d !=3D dmac && ifac=
e_of_dmac(d, ch->id)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 found =3D=
 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!found)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 count++;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return count;
> +}
> +
> +/*
> + * Measure of suitability of 'dmac' handling 'ch'
> + *
> + * 0 indicates 'dmac' can not handle 'ch' either
> + * because it is not supported by the hardware or
> + * because all dmac channels are currently busy.
> + *
> + * >0 vlaue indicates 'dmac' has the capability.
> + * The bigger the value the more suitable the dmac.
> + */
> +#define MAX_SUIT =A0 =A0 =A0 UINT_MAX
> +#define MIN_SUIT =A0 =A0 =A0 0
> +
> +static unsigned suitablility(struct s3c_pl330_dmac *dmac,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct s3c_pl330_chan *ch)
> +{
> + =A0 =A0 =A0 struct pl330_info *pi =3D dmac->pi;
> + =A0 =A0 =A0 enum dma_ch *id =3D dmac->peri;
> + =A0 =A0 =A0 struct s3c_pl330_dmac *d;
> + =A0 =A0 =A0 unsigned s;
> + =A0 =A0 =A0 int i;
> +
> + =A0 =A0 =A0 s =3D MIN_SUIT;
> + =A0 =A0 =A0 /* If all the DMAC channel threads are busy */
> + =A0 =A0 =A0 if (dmac_busy(dmac))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return s;
> +
> + =A0 =A0 =A0 for (i =3D 0; i < PL330_MAX_PERI; i++)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (id[i] =3D=3D ch->id)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 /* If the 'dmac' can't talk to 'ch' */
> + =A0 =A0 =A0 if (i =3D=3D PL330_MAX_PERI)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return s;
> +
> + =A0 =A0 =A0 s =3D MAX_SUIT;
> + =A0 =A0 =A0 list_for_each_entry(d, &dmac_list, node) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* If some other dmac can talk to thi=
s
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* peri and has some channel free.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (d !=3D dmac && iface_of_dmac(d, ch-=
>id) && !dmac_busy(d)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 if (s)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return s;
> +
> + =A0 =A0 =A0 s =3D 100;
> +
> + =A0 =A0 =A0 /* Good if free chans are more, bad otherwise */
> + =A0 =A0 =A0 s +=3D (pi->pcfg.num_chan - dmac->busy_chan) - ch_onlyb=
y_dmac(dmac);
> +
> + =A0 =A0 =A0 return s;
> +}
> +
> +/* More than one DMAC may have capability to transfer data with the
> + * peripheral. This function assigns most suitable DMAC to manage th=
e
> + * channel and hence communicate with the peripheral.
> + */
> +static struct s3c_pl330_dmac *map_chan_to_dmac(struct s3c_pl330_chan=
 *ch)
> +{
> + =A0 =A0 =A0 struct s3c_pl330_dmac *d, *dmac =3D NULL;
> + =A0 =A0 =A0 unsigned sn, sl =3D MIN_SUIT;
> +
> + =A0 =A0 =A0 list_for_each_entry(d, &dmac_list, node) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 sn =3D suitablility(d, ch);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (sn =3D=3D MAX_SUIT)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return d;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (sn > sl)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dmac =3D d;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return dmac;
> +}
> +
> +/* Acquire the channel for peripheral 'id' */
> +static struct s3c_pl330_chan *chan_acquire(const enum dma_ch id)
> +{
> + =A0 =A0 =A0 struct s3c_pl330_chan *ch =3D id_to_chan(id);
> + =A0 =A0 =A0 struct s3c_pl330_dmac *dmac;
> +
> + =A0 =A0 =A0 /* If the channel doesn't exist or is already acquired =
*/
> + =A0 =A0 =A0 if (!ch || !chan_free(ch)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch =3D NULL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto acq_exit;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 dmac =3D map_chan_to_dmac(ch);
> + =A0 =A0 =A0 /* If couldn't map */
> + =A0 =A0 =A0 if (!dmac) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch =3D NULL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto acq_exit;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 dmac->busy_chan++;
> + =A0 =A0 =A0 ch->dmac =3D dmac;
> +
> +acq_exit:
> + =A0 =A0 =A0 return ch;
> +}
> +
> +/* Delete xfer from the queue */
> +static inline void del_from_queue(struct s3c_pl330_xfer *xfer)
> +{
> + =A0 =A0 =A0 struct s3c_pl330_xfer *t;
> + =A0 =A0 =A0 struct s3c_pl330_chan *ch;
> + =A0 =A0 =A0 int found;
> +
> + =A0 =A0 =A0 if (!xfer)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> +
> + =A0 =A0 =A0 ch =3D xfer->chan;
> +
> + =A0 =A0 =A0 /* Make sure xfer is in the queue */
> + =A0 =A0 =A0 found =3D 0;
> + =A0 =A0 =A0 list_for_each_entry(t, &ch->xfer_list, node)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (t =3D=3D xfer) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 found =3D 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (!found)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> +
> + =A0 =A0 =A0 /* If xfer is last entry in the queue */
> + =A0 =A0 =A0 if (xfer->node.next =3D=3D &ch->xfer_list)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 t =3D list_entry(ch->xfer_list.next,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct =
s3c_pl330_xfer, node);
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 t =3D list_entry(xfer->node.next,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct =
s3c_pl330_xfer, node);
> +
> + =A0 =A0 =A0 /* If there was only one node left */
> + =A0 =A0 =A0 if (t =3D=3D xfer)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->xfer_head =3D NULL;
> + =A0 =A0 =A0 else if (ch->xfer_head =3D=3D xfer)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->xfer_head =3D t;
> +
> + =A0 =A0 =A0 list_del(&xfer->node);
> +}
> +
> +/* Provides pointer to the next xfer in the queue.
> + * If CIRCULAR option is set, the list is left intact,
> + * otherwise the xfer is removed from the list.
> + * Forced delete 'pluck' can be set to override the CIRCULAR option.
> + */
> +static struct s3c_pl330_xfer *get_from_queue(struct s3c_pl330_chan *=
ch,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 int pluck)
> +{
> + =A0 =A0 =A0 struct s3c_pl330_xfer *xfer =3D ch->xfer_head;
> +
> + =A0 =A0 =A0 if (!xfer)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
> +
> + =A0 =A0 =A0 /* If xfer is last entry in the queue */
> + =A0 =A0 =A0 if (xfer->node.next =3D=3D &ch->xfer_list)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->xfer_head =3D list_entry(ch->xfer_l=
ist.next,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 struct s3c_pl330_xfer, node);
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->xfer_head =3D list_entry(xfer->node=
=2Enext,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 struct s3c_pl330_xfer, node);
> +
> + =A0 =A0 =A0 if (pluck || !(ch->options & S3C2410_DMAF_CIRCULAR))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 del_from_queue(xfer);
> +
> + =A0 =A0 =A0 return xfer;
> +}
> +
> +static inline void add_to_queue(struct s3c_pl330_chan *ch,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct s3c_pl330_xfer *xfer, int front)
> +{
> + =A0 =A0 =A0 struct pl330_xfer *xt;
> +
> + =A0 =A0 =A0 /* If queue empty */
> + =A0 =A0 =A0 if (ch->xfer_head =3D=3D NULL)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->xfer_head =3D xfer;
> +
> + =A0 =A0 =A0 xt =3D &ch->xfer_head->px;
> + =A0 =A0 =A0 /* If the head already submitted (CIRCULAR head) */
> + =A0 =A0 =A0 if (ch->options & S3C2410_DMAF_CIRCULAR &&
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 (xt =3D=3D ch->req[0].x || xt =3D=3D ch=
->req[1].x))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->xfer_head =3D xfer;
> +
> + =A0 =A0 =A0 /* If this is a resubmission, it should go at the head =
*/
> + =A0 =A0 =A0 if (front) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->xfer_head =3D xfer;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 list_add(&xfer->node, &ch->xfer_list);
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 list_add_tail(&xfer->node, &ch->xfer_li=
st);
> + =A0 =A0 =A0 }
> +}
> +
> +static inline void _finish_off(struct s3c_pl330_xfer *xfer,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 enum s3c2410_dma_buffresult res, int ff=
ree)
> +{
> + =A0 =A0 =A0 struct s3c_pl330_chan *ch;
> +
> + =A0 =A0 =A0 if (!xfer)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> +
> + =A0 =A0 =A0 ch =3D xfer->chan;
> +
> + =A0 =A0 =A0 /* Do callback */
> + =A0 =A0 =A0 if (ch->callback_fn)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->callback_fn(NULL, xfer->token, xfer=
->px.bytes, res);
> +
> + =A0 =A0 =A0 /* Force Free or if buffer is not needed anymore */
> + =A0 =A0 =A0 if (ffree || !(ch->options & S3C2410_DMAF_CIRCULAR))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 kmem_cache_free(ch->dmac->kmcache, xfer=
);
> +}
> +
> +static inline int s3c_pl330_submit(struct s3c_pl330_chan *ch,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct pl330_req *r)
> +{
> + =A0 =A0 =A0 struct s3c_pl330_xfer *xfer;
> + =A0 =A0 =A0 int ret =3D 0;
> +
> + =A0 =A0 =A0 /* If already submitted */
> + =A0 =A0 =A0 if (r->x)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> +
> + =A0 =A0 =A0 xfer =3D get_from_queue(ch, 0);
> + =A0 =A0 =A0 if (xfer) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 r->x =3D &xfer->px;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Use max bandwidth for M<->M xfers */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (r->rqtype =3D=3D MEMTOMEM) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct pl330_info *pi =3D=
 xfer->chan->dmac->pi;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int burst =3D 1 << ch->=
rqcfg.brst_size;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 u32 bytes =3D r->x->byt=
es;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int bl;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bl =3D pi->pcfg.data_bu=
s_width / 8;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bl *=3D pi->pcfg.data_b=
uf_dep;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bl /=3D burst;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* src/dst_burst_len ca=
n't be more than 16 */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (bl > 16)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bl =3D =
16;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (bl > 1) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!(b=
ytes % (bl * burst)))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bl--;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->rqcfg.brst_len =3D =
bl;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->rqcfg.brst_len =3D =
1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D pl330_submit_req(ch->pl330_chan=
_id, r);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* If submission was successful */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->lrq =3D r; /* lates=
t submitted req */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 r->x =3D NULL;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* If both of the PL330 ping-pong buffe=
rs filled */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret =3D=3D -EAGAIN) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(ch->dmac->pi->d=
ev, "%s:%d!\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func_=
_, __LINE__);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Queue back again */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 add_to_queue(ch, xfer, =
1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(ch->dmac->pi->d=
ev, "%s:%d!\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func_=
_, __LINE__);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 _finish_off(xfer, S3C24=
10_RES_ERR, 0);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return ret;
> +}
> +
> +static void s3c_pl330_rq(struct s3c_pl330_chan *ch,
> + =A0 =A0 =A0 struct pl330_req *r, enum pl330_op_err err)
> +{
> + =A0 =A0 =A0 unsigned long flags;
> + =A0 =A0 =A0 struct s3c_pl330_xfer *xfer;
> + =A0 =A0 =A0 struct pl330_xfer *xl =3D r->x;
> + =A0 =A0 =A0 enum s3c2410_dma_buffresult res;
> +
> + =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> +
> + =A0 =A0 =A0 r->x =3D NULL;
> +
> + =A0 =A0 =A0 s3c_pl330_submit(ch, r);
> +
> + =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags);
> +
> + =A0 =A0 =A0 /* Map result to S3C DMA API */
> + =A0 =A0 =A0 if (err =3D=3D PL330_ERR_NONE)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 res =3D S3C2410_RES_OK;
> + =A0 =A0 =A0 else if (err =3D=3D PL330_ERR_ABORT)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 res =3D S3C2410_RES_ABORT;
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 res =3D S3C2410_RES_ERR;
> +
> + =A0 =A0 =A0 /* If last request had some xfer */
> + =A0 =A0 =A0 if (xl) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 xfer =3D container_of(xl, struct s3c_pl=
330_xfer, px);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 _finish_off(xfer, res, 0);
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_info(ch->dmac->pi->dev, "%s:%d No X=
fer?!\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func__, __LINE__);
> + =A0 =A0 =A0 }
> +}
> +
> +static void s3c_pl330_rq0(void *token, enum pl330_op_err err)
> +{
> + =A0 =A0 =A0 struct pl330_req *r =3D token;
> + =A0 =A0 =A0 struct s3c_pl330_chan *ch =3D container_of(r,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 struct s3c_pl330_chan, req[0]);
> + =A0 =A0 =A0 s3c_pl330_rq(ch, r, err);
> +}
> +
> +static void s3c_pl330_rq1(void *token, enum pl330_op_err err)
> +{
> + =A0 =A0 =A0 struct pl330_req *r =3D token;
> + =A0 =A0 =A0 struct s3c_pl330_chan *ch =3D container_of(r,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 struct s3c_pl330_chan, req[1]);
> + =A0 =A0 =A0 s3c_pl330_rq(ch, r, err);
> +}
> +
> +/* Release an acquired channel */
> +static void chan_release(struct s3c_pl330_chan *ch)
> +{
> + =A0 =A0 =A0 struct s3c_pl330_dmac *dmac;
> +
> + =A0 =A0 =A0 if (chan_free(ch))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> +
> + =A0 =A0 =A0 dmac =3D ch->dmac;
> + =A0 =A0 =A0 ch->dmac =3D NULL;
> + =A0 =A0 =A0 dmac->busy_chan--;
> +}
> +
> +int s3c2410_dma_ctrl(enum dma_ch id, enum s3c2410_chan_op op)
> +{
> + =A0 =A0 =A0 struct s3c_pl330_xfer *xfer;
> + =A0 =A0 =A0 enum pl330_chan_op pl330op;
> + =A0 =A0 =A0 struct s3c_pl330_chan *ch;
> + =A0 =A0 =A0 unsigned long flags;
> + =A0 =A0 =A0 int idx, ret;
> +
> + =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> +
> + =A0 =A0 =A0 ch =3D id_to_chan(id);
> +
> + =A0 =A0 =A0 if (!ch || chan_free(ch)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto ctrl_exit;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 switch (op) {
> + =A0 =A0 =A0 case S3C2410_DMAOP_START:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Make sure both reqs are enqueued */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 idx =3D (ch->lrq =3D=3D &ch->req[0]) ? =
1 : 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_pl330_submit(ch, &ch->req[idx]);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_pl330_submit(ch, &ch->req[1 - idx])=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pl330op =3D PL330_OP_START;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case S3C2410_DMAOP_STOP:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pl330op =3D PL330_OP_ABORT;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case S3C2410_DMAOP_FLUSH:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pl330op =3D PL330_OP_FLUSH;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case S3C2410_DMAOP_PAUSE:
> + =A0 =A0 =A0 case S3C2410_DMAOP_RESUME:
> + =A0 =A0 =A0 case S3C2410_DMAOP_TIMEOUT:
> + =A0 =A0 =A0 case S3C2410_DMAOP_STARTED:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags=
);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> +
> + =A0 =A0 =A0 default:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags=
);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 ret =3D pl330_chan_ctrl(ch->pl330_chan_id, pl330op);
> +
> + =A0 =A0 =A0 if (pl330op =3D=3D PL330_OP_START) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags=
);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 idx =3D (ch->lrq =3D=3D &ch->req[0]) ? 1 : 0;
> +
> + =A0 =A0 =A0 /* Abort the current xfer */
> + =A0 =A0 =A0 if (ch->req[idx].x) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 xfer =3D container_of(ch->req[idx].x,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct =
s3c_pl330_xfer, px);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Drop xfer during FLUSH */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pl330op =3D=3D PL330_OP_FLUSH)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 del_from_queue(xfer);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->req[idx].x =3D NULL;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags=
);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 _finish_off(xfer, S3C2410_RES_ABORT,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pl330op=
 =3D=3D PL330_OP_FLUSH ? 1 : 0);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Flush the whole queue */
> + =A0 =A0 =A0 if (pl330op =3D=3D PL330_OP_FLUSH) {
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ch->req[1 - idx].x) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 xfer =3D container_of(c=
h->req[1 - idx].x,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 struct s3c_pl330_xfer, px);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 del_from_queue(xfer);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->req[1 - idx].x =3D =
NULL;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(=
&res_lock, flags);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 _finish_off(xfer, S3C24=
10_RES_ABORT, 1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_irqsave(&res_=
lock, flags);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Finish off the remaining in the queu=
e */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 xfer =3D ch->xfer_head;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (xfer) {
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 del_from_queue(xfer);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(=
&res_lock, flags);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 _finish_off(xfer, S3C24=
10_RES_ABORT, 1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_irqsave(&res_=
lock, flags);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 xfer =3D ch->xfer_head;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> +
> +ctrl_exit:
> + =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags);
> +
> + =A0 =A0 =A0 return ret;
> +}
> +EXPORT_SYMBOL(s3c2410_dma_ctrl);
> +
> +int s3c2410_dma_enqueue(enum dma_ch id, void *token,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dma_addr_t addr, int si=
ze)
> +{
> + =A0 =A0 =A0 struct s3c_pl330_chan *ch;
> + =A0 =A0 =A0 struct s3c_pl330_xfer *xfer;
> + =A0 =A0 =A0 unsigned long flags;
> + =A0 =A0 =A0 int idx, ret =3D 0;
> +
> + =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> +
> + =A0 =A0 =A0 ch =3D id_to_chan(id);
> +
> + =A0 =A0 =A0 /* Error if invalid or free channel */
> + =A0 =A0 =A0 if (!ch || chan_free(ch)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto enq_exit;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Error if size is unaligned */
> + =A0 =A0 =A0 if (ch->rqcfg.brst_size && size % (1 << ch->rqcfg.brst_=
size)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto enq_exit;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 xfer =3D kmem_cache_alloc(ch->dmac->kmcache, GFP_ATOMIC=
);
> + =A0 =A0 =A0 if (!xfer) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto enq_exit;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 xfer->token =3D token;
> + =A0 =A0 =A0 xfer->chan =3D ch;
> + =A0 =A0 =A0 xfer->px.bytes =3D size;
> + =A0 =A0 =A0 xfer->px.next =3D NULL; /* Single request */
> +
> + =A0 =A0 =A0 /* For S3C DMA API, direction is always fixed for all x=
fers */
> + =A0 =A0 =A0 if (ch->req[0].rqtype =3D=3D MEMTODEV) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 xfer->px.src_addr =3D addr;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 xfer->px.dst_addr =3D ch->sdaddr;
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 xfer->px.src_addr =3D ch->sdaddr;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 xfer->px.dst_addr =3D addr;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 add_to_queue(ch, xfer, 0);
> +
> + =A0 =A0 =A0 /* Try submitting on either request */
> + =A0 =A0 =A0 idx =3D (ch->lrq =3D=3D &ch->req[0]) ? 1 : 0;
> +
> + =A0 =A0 =A0 if (!ch->req[idx].x)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_pl330_submit(ch, &ch->req[idx]);
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_pl330_submit(ch, &ch->req[1 - idx])=
;
> +
> + =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags);
> +
> + =A0 =A0 =A0 if (ch->options & S3C2410_DMAF_AUTOSTART)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c2410_dma_ctrl(id, S3C2410_DMAOP_STAR=
T);
> +
> + =A0 =A0 =A0 return 0;
> +
> +enq_exit:
> + =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags);
> +
> + =A0 =A0 =A0 return ret;
> +}
> +EXPORT_SYMBOL(s3c2410_dma_enqueue);
> +
> +int s3c2410_dma_request(enum dma_ch id,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct s3c2410_dma_clie=
nt *client,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 void *dev)
> +{
> + =A0 =A0 =A0 struct s3c_pl330_dmac *dmac;
> + =A0 =A0 =A0 struct s3c_pl330_chan *ch;
> + =A0 =A0 =A0 unsigned long flags;
> + =A0 =A0 =A0 int ret =3D 0;
> +
> + =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> +
> + =A0 =A0 =A0 ch =3D chan_acquire(id);
> + =A0 =A0 =A0 if (!ch) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EBUSY;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto req_exit;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 dmac =3D ch->dmac;
> +
> + =A0 =A0 =A0 ch->pl330_chan_id =3D pl330_request_channel(dmac->pi);
> + =A0 =A0 =A0 if (!ch->pl330_chan_id) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chan_release(ch);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EBUSY;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto req_exit;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 ch->client =3D client;
> + =A0 =A0 =A0 ch->options =3D 0; /* Clear any option */
> + =A0 =A0 =A0 ch->callback_fn =3D NULL; /* Clear any callback */
> + =A0 =A0 =A0 ch->lrq =3D NULL;
> +
> + =A0 =A0 =A0 ch->rqcfg.brst_size =3D 2; /* Default word size */
> + =A0 =A0 =A0 ch->rqcfg.swap =3D SWAP_NO;
> + =A0 =A0 =A0 ch->rqcfg.scctl =3D SCCTRL0; /* Noncacheable and nonbuf=
ferable */
> + =A0 =A0 =A0 ch->rqcfg.dcctl =3D DCCTRL0; /* Noncacheable and nonbuf=
ferable */
> + =A0 =A0 =A0 ch->rqcfg.privileged =3D 0;
> + =A0 =A0 =A0 ch->rqcfg.insnaccess =3D 0;
> +
> + =A0 =A0 =A0 /* Set invalid direction */
> + =A0 =A0 =A0 ch->req[0].rqtype =3D DEVTODEV;
> + =A0 =A0 =A0 ch->req[1].rqtype =3D ch->req[0].rqtype;
> +
> + =A0 =A0 =A0 ch->req[0].cfg =3D &ch->rqcfg;
> + =A0 =A0 =A0 ch->req[1].cfg =3D ch->req[0].cfg;
> +
> + =A0 =A0 =A0 ch->req[0].peri =3D iface_of_dmac(dmac, id) - 1; /* Ori=
ginal index */
> + =A0 =A0 =A0 ch->req[1].peri =3D ch->req[0].peri;
> +
> + =A0 =A0 =A0 ch->req[0].token =3D &ch->req[0];
> + =A0 =A0 =A0 ch->req[0].xfer_cb =3D s3c_pl330_rq0;
> + =A0 =A0 =A0 ch->req[1].token =3D &ch->req[1];
> + =A0 =A0 =A0 ch->req[1].xfer_cb =3D s3c_pl330_rq1;
> +
> + =A0 =A0 =A0 ch->req[0].x =3D NULL;
> + =A0 =A0 =A0 ch->req[1].x =3D NULL;
> +
> + =A0 =A0 =A0 /* Reset xfer list */
> + =A0 =A0 =A0 INIT_LIST_HEAD(&ch->xfer_list);
> + =A0 =A0 =A0 ch->xfer_head =3D NULL;
> +
> +req_exit:
> + =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags);
> +
> + =A0 =A0 =A0 return ret;
> +}
> +EXPORT_SYMBOL(s3c2410_dma_request);
> +
> +int s3c2410_dma_free(enum dma_ch id, struct s3c2410_dma_client *clie=
nt)
> +{
> + =A0 =A0 =A0 struct s3c_pl330_chan *ch;
> + =A0 =A0 =A0 struct s3c_pl330_xfer *xfer;
> + =A0 =A0 =A0 unsigned long flags;
> + =A0 =A0 =A0 int ret =3D 0;
> + =A0 =A0 =A0 unsigned idx;
> +
> + =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> +
> + =A0 =A0 =A0 ch =3D id_to_chan(id);
> +
> + =A0 =A0 =A0 if (!ch || chan_free(ch))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto free_exit;
> +
> + =A0 =A0 =A0 /* Refuse if someone else wanted to free the channel */
> + =A0 =A0 =A0 if (ch->client !=3D client) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EBUSY;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto free_exit;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Stop any active xfer, Flushe the queue and do callba=
cks */
> + =A0 =A0 =A0 pl330_chan_ctrl(ch->pl330_chan_id, PL330_OP_FLUSH);
> +
> + =A0 =A0 =A0 /* Abort the submitted requests */
> + =A0 =A0 =A0 idx =3D (ch->lrq =3D=3D &ch->req[0]) ? 1 : 0;
> +
> + =A0 =A0 =A0 if (ch->req[idx].x) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 xfer =3D container_of(ch->req[idx].x,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct =
s3c_pl330_xfer, px);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->req[idx].x =3D NULL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 del_from_queue(xfer);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags=
);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 _finish_off(xfer, S3C2410_RES_ABORT, 1)=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (ch->req[1 - idx].x) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 xfer =3D container_of(ch->req[1 - idx].=
x,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct =
s3c_pl330_xfer, px);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->req[1 - idx].x =3D NULL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 del_from_queue(xfer);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags=
);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 _finish_off(xfer, S3C2410_RES_ABORT, 1)=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Pluck and Abort the queued requests in order */
> + =A0 =A0 =A0 do {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 xfer =3D get_from_queue(ch, 1);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags=
);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 _finish_off(xfer, S3C2410_RES_ABORT, 1)=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> + =A0 =A0 =A0 } while (xfer);
> +
> + =A0 =A0 =A0 ch->client =3D NULL;
> +
> + =A0 =A0 =A0 pl330_release_channel(ch->pl330_chan_id);
> +
> + =A0 =A0 =A0 ch->pl330_chan_id =3D NULL;
> +
> + =A0 =A0 =A0 chan_release(ch);
> +
> +free_exit:
> + =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags);
> +
> + =A0 =A0 =A0 return ret;
> +}
> +EXPORT_SYMBOL(s3c2410_dma_free);
> +
> +int s3c2410_dma_config(enum dma_ch id, int xferunit)
> +{
> + =A0 =A0 =A0 struct s3c_pl330_chan *ch;
> + =A0 =A0 =A0 struct pl330_info *pi;
> + =A0 =A0 =A0 unsigned long flags;
> + =A0 =A0 =A0 int i, dbwidth, ret =3D 0;
> +
> + =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> +
> + =A0 =A0 =A0 ch =3D id_to_chan(id);
> +
> + =A0 =A0 =A0 if (!ch || chan_free(ch)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto cfg_exit;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 pi =3D ch->dmac->pi;
> + =A0 =A0 =A0 dbwidth =3D pi->pcfg.data_bus_width / 8;
> +
> + =A0 =A0 =A0 /* Max size of xfer can be pcfg.data_bus_width */
> + =A0 =A0 =A0 if (xferunit > dbwidth) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto cfg_exit;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 i =3D 0;
> + =A0 =A0 =A0 while (xferunit !=3D (1 << i))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 i++;
> +
> + =A0 =A0 =A0 /* If valid value */
> + =A0 =A0 =A0 if (xferunit =3D=3D (1 << i))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->rqcfg.brst_size =3D i;
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> +
> +cfg_exit:
> + =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags);
> +
> + =A0 =A0 =A0 return ret;
> +}
> +EXPORT_SYMBOL(s3c2410_dma_config);
> +
> +/* Options that are supported by this driver */
> +#define S3C_PL330_FLAGS (S3C2410_DMAF_CIRCULAR | S3C2410_DMAF_AUTOST=
ART)
> +
> +int s3c2410_dma_setflags(enum dma_ch id, unsigned int options)
> +{
> + =A0 =A0 =A0 struct s3c_pl330_chan *ch;
> + =A0 =A0 =A0 unsigned long flags;
> + =A0 =A0 =A0 int ret =3D 0;
> +
> + =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> +
> + =A0 =A0 =A0 ch =3D id_to_chan(id);
> +
> + =A0 =A0 =A0 if (!ch || chan_free(ch) || options & ~(S3C_PL330_FLAGS=
))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->options =3D options;
> +
> + =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +EXPORT_SYMBOL(s3c2410_dma_setflags);
> +
> +int s3c2410_dma_set_buffdone_fn(enum dma_ch id, s3c2410_dma_cbfn_t r=
tn)
> +{
> + =A0 =A0 =A0 struct s3c_pl330_chan *ch;
> + =A0 =A0 =A0 unsigned long flags;
> + =A0 =A0 =A0 int ret =3D 0;
> +
> + =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> +
> + =A0 =A0 =A0 ch =3D id_to_chan(id);
> +
> + =A0 =A0 =A0 if (!ch || chan_free(ch))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->callback_fn =3D rtn;
> +
> + =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags);
> +
> + =A0 =A0 =A0 return ret;
> +}
> +EXPORT_SYMBOL(s3c2410_dma_set_buffdone_fn);
> +
> +int s3c2410_dma_devconfig(enum dma_ch id, enum s3c2410_dmasrc source=
,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long addre=
ss)
> +{
> + =A0 =A0 =A0 struct s3c_pl330_chan *ch;
> + =A0 =A0 =A0 unsigned long flags;
> + =A0 =A0 =A0 int ret =3D 0;
> +
> + =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> +
> + =A0 =A0 =A0 ch =3D id_to_chan(id);
> +
> + =A0 =A0 =A0 if (!ch || chan_free(ch)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto devcfg_exit;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 switch (source) {
> + =A0 =A0 =A0 case S3C2410_DMASRC_HW: /* P->M */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->req[0].rqtype =3D DEVTOMEM;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->req[1].rqtype =3D DEVTOMEM;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->rqcfg.src_inc =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->rqcfg.dst_inc =3D 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case S3C2410_DMASRC_MEM: /* M->P */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->req[0].rqtype =3D MEMTODEV;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->req[1].rqtype =3D MEMTODEV;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->rqcfg.src_inc =3D 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch->rqcfg.dst_inc =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 default:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto devcfg_exit;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 ch->sdaddr =3D address;
> +
> +devcfg_exit:
> + =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags);
> +
> + =A0 =A0 =A0 return ret;
> +}
> +EXPORT_SYMBOL(s3c2410_dma_devconfig);
> +
> +int s3c2410_dma_getposition(enum dma_ch id, dma_addr_t *src, dma_add=
r_t *dst)
> +{
> + =A0 =A0 =A0 struct s3c_pl330_chan *ch =3D id_to_chan(id);
> + =A0 =A0 =A0 struct pl330_chanstatus status;
> + =A0 =A0 =A0 int ret;
> +
> + =A0 =A0 =A0 if (!ch || chan_free(ch))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> +
> + =A0 =A0 =A0 ret =3D pl330_chan_status(ch->pl330_chan_id, &status);
> + =A0 =A0 =A0 if (ret < 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> +
> + =A0 =A0 =A0 *src =3D status.src_addr;
> + =A0 =A0 =A0 *dst =3D status.dst_addr;
> +
> + =A0 =A0 =A0 return 0;
> +}
> +EXPORT_SYMBOL(s3c2410_dma_getposition);
> +
> +static irqreturn_t pl330_irq_handler(int irq, void *data)
> +{
> + =A0 =A0 =A0 if (pl330_update(data))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return IRQ_HANDLED;
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return IRQ_NONE;
> +}
> +
> +static int pl330_probe(struct platform_device *pdev)
> +{
> + =A0 =A0 =A0 struct s3c_pl330_dmac *s3c_pl330_dmac;
> + =A0 =A0 =A0 struct s3c_pl330_platdata *pl330pd;
> + =A0 =A0 =A0 struct pl330_info *pl330_info;
> + =A0 =A0 =A0 struct resource *res;
> + =A0 =A0 =A0 int i, ret, irq;
> +
> + =A0 =A0 =A0 pl330pd =3D pdev->dev.platform_data;
> +
> + =A0 =A0 =A0 /* Can't do without the list of _32_ peripherals */
> + =A0 =A0 =A0 if (!pl330pd || !pl330pd->peri) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "platform data miss=
ing!\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 pl330_info =3D kzalloc(sizeof(*pl330_info), GFP_KERNEL)=
;
> + =A0 =A0 =A0 if (!pl330_info)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> +
> + =A0 =A0 =A0 pl330_info->pl330_data =3D NULL;
> + =A0 =A0 =A0 pl330_info->dev =3D &pdev->dev;
> +
> + =A0 =A0 =A0 res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> + =A0 =A0 =A0 if (!res) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENODEV;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto probe_err1;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 request_mem_region(res->start, resource_size(res), pdev=
->name);
> +
> + =A0 =A0 =A0 pl330_info->base =3D ioremap(res->start, resource_size(=
res));
> + =A0 =A0 =A0 if (!pl330_info->base) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENXIO;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto probe_err2;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 irq =3D platform_get_irq(pdev, 0);
> + =A0 =A0 =A0 if (irq < 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D irq;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto probe_err3;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 ret =3D request_irq(irq, pl330_irq_handler, 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_name(&pdev->dev), p=
l330_info);
> + =A0 =A0 =A0 if (ret)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto probe_err4;
> +
> + =A0 =A0 =A0 /* Allocate a new DMAC */
> + =A0 =A0 =A0 s3c_pl330_dmac =3D kmalloc(sizeof(*s3c_pl330_dmac), GFP=
_KERNEL);
> + =A0 =A0 =A0 if (!s3c_pl330_dmac) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto probe_err5;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Get operation clock and enable it */
> + =A0 =A0 =A0 s3c_pl330_dmac->clk =3D clk_get(&pdev->dev, "pdma");
> + =A0 =A0 =A0 if (IS_ERR(s3c_pl330_dmac->clk)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "Cannot get operati=
on clock.\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto probe_err6;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 clk_enable(s3c_pl330_dmac->clk);
> +
> + =A0 =A0 =A0 ret =3D pl330_add(pl330_info);
> + =A0 =A0 =A0 if (ret)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto probe_err7;
> +
> + =A0 =A0 =A0 /* Hook the info */
> + =A0 =A0 =A0 s3c_pl330_dmac->pi =3D pl330_info;
> +
> + =A0 =A0 =A0 /* No busy channels */
> + =A0 =A0 =A0 s3c_pl330_dmac->busy_chan =3D 0;
> +
> + =A0 =A0 =A0 s3c_pl330_dmac->kmcache =3D kmem_cache_create(dev_name(=
&pdev->dev),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sizeof(=
struct s3c_pl330_xfer), 0, 0, NULL);
> +
> + =A0 =A0 =A0 if (!s3c_pl330_dmac->kmcache) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto probe_err8;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Get the list of peripherals */
> + =A0 =A0 =A0 s3c_pl330_dmac->peri =3D pl330pd->peri;
> +
> + =A0 =A0 =A0 /* Attach to the list of DMACs */
> + =A0 =A0 =A0 list_add_tail(&s3c_pl330_dmac->node, &dmac_list);
> +
> + =A0 =A0 =A0 /* Create a channel for each peripheral in the DMAC
> + =A0 =A0 =A0 =A0* that is, if it doesn't already exist
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 for (i =3D 0; i < PL330_MAX_PERI; i++)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (s3c_pl330_dmac->peri[i] !=3D DMACH_=
MAX)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chan_add(s3c_pl330_dmac=
->peri[i]);
> +
> + =A0 =A0 =A0 printk(KERN_INFO
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Loaded driver for PL330 DMAC-%d %s\n",=
 pdev->id, pdev->name);
> + =A0 =A0 =A0 printk(KERN_INFO
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "\tDBUFF-%ux%ubytes Num_Chans-%u Num_Pe=
ri-%u Num_Events-%u\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pl330_info->pcfg.data_buf_dep,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pl330_info->pcfg.data_bus_width / 8, pl=
330_info->pcfg.num_chan,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pl330_info->pcfg.num_peri, pl330_info->=
pcfg.num_events);
> +
> + =A0 =A0 =A0 return 0;
> +
> +probe_err8:
> + =A0 =A0 =A0 pl330_del(pl330_info);
> +probe_err7:
> + =A0 =A0 =A0 clk_disable(s3c_pl330_dmac->clk);
> + =A0 =A0 =A0 clk_put(s3c_pl330_dmac->clk);
> +probe_err6:
> + =A0 =A0 =A0 kfree(s3c_pl330_dmac);
> +probe_err5:
> + =A0 =A0 =A0 free_irq(irq, pl330_info);
> +probe_err4:
> +probe_err3:
> + =A0 =A0 =A0 iounmap(pl330_info->base);
> +probe_err2:
> + =A0 =A0 =A0 release_mem_region(res->start, resource_size(res));
> +probe_err1:
> + =A0 =A0 =A0 kfree(pl330_info);
> +
> + =A0 =A0 =A0 return ret;
> +}
> +
> +static int pl330_remove(struct platform_device *pdev)
> +{
> + =A0 =A0 =A0 struct s3c_pl330_dmac *dmac, *d;
> + =A0 =A0 =A0 struct s3c_pl330_chan *ch;
> + =A0 =A0 =A0 unsigned long flags;
> + =A0 =A0 =A0 int del, found;
> +
> + =A0 =A0 =A0 if (!pdev->dev.platform_data)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> +
> + =A0 =A0 =A0 spin_lock_irqsave(&res_lock, flags);
> +
> + =A0 =A0 =A0 found =3D 0;
> + =A0 =A0 =A0 list_for_each_entry(d, &dmac_list, node)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (d->pi->dev =3D=3D &pdev->dev) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 found =3D 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (!found) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags=
);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 dmac =3D d;
> +
> + =A0 =A0 =A0 /* Remove all Channels that are managed only by this DM=
AC */
> + =A0 =A0 =A0 list_for_each_entry(ch, &chan_list, node) {
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Only channels that are handled by th=
is DMAC */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (iface_of_dmac(dmac, ch->id))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 del =3D 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Don't remove if some other DMAC has =
it too */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 list_for_each_entry(d, &dmac_list, node=
)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (d !=3D dmac && ifac=
e_of_dmac(d, ch->id)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 del =3D=
 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (del) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(=
&res_lock, flags);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c2410_dma_free(ch->id=
, ch->client);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_lock_irqsave(&res_=
lock, flags);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 list_del(&ch->node);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(ch);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Disable operation clock */
> + =A0 =A0 =A0 clk_disable(dmac->clk);
> + =A0 =A0 =A0 clk_put(dmac->clk);
> +
> + =A0 =A0 =A0 /* Remove the DMAC */
> + =A0 =A0 =A0 list_del(&dmac->node);
> + =A0 =A0 =A0 kfree(dmac);
> +
> + =A0 =A0 =A0 spin_unlock_irqrestore(&res_lock, flags);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static struct platform_driver pl330_driver =3D {
> + =A0 =A0 =A0 .driver =A0 =A0 =A0 =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .owner =A0=3D THIS_MODULE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =3D "s3c-pl330",
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 .probe =A0 =A0 =A0 =A0 =A0=3D pl330_probe,
> + =A0 =A0 =A0 .remove =A0 =A0 =A0 =A0 =3D pl330_remove,
> +};
> +
> +static int __init pl330_init(void)
> +{
> + =A0 =A0 =A0 return platform_driver_register(&pl330_driver);
> +}
> +module_init(pl330_init);
> +
> +static void __exit pl330_exit(void)
> +{
> + =A0 =A0 =A0 platform_driver_unregister(&pl330_driver);
> + =A0 =A0 =A0 return;
> +}
> +module_exit(pl330_exit);
> +
> +MODULE_AUTHOR("Jaswinder Singh <jassi.brar@samsung.com>");
> +MODULE_DESCRIPTION("Driver for PL330 DMA Controller");
> +MODULE_LICENSE("GPL");
> --
> 1.7.2.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

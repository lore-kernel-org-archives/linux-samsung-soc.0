From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH] S3C: ide: Add Samsung S3C IDE controller driver
Date: Fri, 9 Oct 2009 09:59:01 +0900
Message-ID: <1b68c6790910081759l4af67a26j20a88381258c3c87@mail.gmail.com>
References: <1254985168-21720-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f172.google.com ([209.85.221.172]:33896 "EHLO
	mail-qy0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756103AbZJIA7k convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Oct 2009 20:59:40 -0400
Received: by qyk2 with SMTP id 2so6139366qyk.21
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Oct 2009 17:59:04 -0700 (PDT)
In-Reply-To: <1254985168-21720-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: thomas.ab@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, Abhilash Kesavan <a.kesavan@samsung.com>

On Thu, Oct 8, 2009 at 3:59 PM,  <thomas.ab@samsung.com> wrote:
> From: Thomas Abraham <thomas.ab@samsung.com>
> diff --git a/drivers/ide/s3c-ide.c b/drivers/ide/s3c-ide.c
> new file mode 100644
> index 0000000..5ebfe98
> --- /dev/null
> +++ b/drivers/ide/s3c-ide.c
> @@ -0,0 +1,486 @@
> +/*
> + * s3c-ide.c - Samsung S3C IDE controller Driver
> + *
> + * Copyright (C) 2009 Samsung Electronics
> + * =C2=A0 =C2=A0 =C2=A0http://samsungsemi.com/
> + *
> + * The Samsung S3C IDE controller driver provides low-level support =
for
> + * interfacing with IDE disks. This supports only PIO mode of operat=
ion.
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=A0See th=
e
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA =C2=A002=
111-1307 =C2=A0USA
> + */
> +
> +#include <linux/types.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/platform_device.h>
> +#include <linux/init.h>
> +#include <linux/ide.h>
> +#include <linux/sysdev.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <plat/regs-ide.h>
> +#include <plat/ide.h>
> +
> +/*
> + * This structure represents one instance of the IDE controller driv=
er.
> + */
> +struct s3c_ide_device {
> + =C2=A0 =C2=A0 =C2=A0 struct platform_device =C2=A0*pdev;
> + =C2=A0 =C2=A0 =C2=A0 ide_hwif_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0*hwif;
> + =C2=A0 =C2=A0 =C2=A0 int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq;
> + =C2=A0 =C2=A0 =C2=A0 ulong =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 piotime[5];
> + =C2=A0 =C2=A0 =C2=A0 void __iomem =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0*regbase;
> +};
> +
> +/* Global Declarations */
> +static struct s3c_ide_device s3c_ide_dev;
> +
> +#define ide_writel(value, reg) writel(value, ide_dev->regbase + (reg=
))
> +#define ide_readl(reg) readl(ide_dev->regbase + (reg))
> +
> +/*
> + * This function waits until the IDE controller is able to perform n=
ext
> + * read/write operation to the disk.
> + */
> +static void wait_for_host_ready(struct s3c_ide_device *ide_dev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 u32 count =3D 1000000;
> + =C2=A0 =C2=A0 =C2=A0 while (ide_readl(S3C_ATA_FIFO_STATUS) >> 28) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(count--)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 dev_err(&ide_dev->pdev->dev,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 "ide controller not ready for next taskfile operation");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 }
> +}

 I think instead of using a magic number for loop counter, it will be
better to use some timed wait using a counter as in
http://www.spinics.net/lists/arm-kernel/msg73904.html


> +
> +/*
> + * This function writes to one of the rask file registers.
> + */
> +static void s3c_ide_OUTB(ide_hwif_t *hwif, u8 addr, ulong reg)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct s3c_ide_device *ide_dev =3D
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (struct s3c_ide_device *)hwif->hwif_data;
> +
> + =C2=A0 =C2=A0 =C2=A0 wait_for_host_ready(ide_dev);
> + =C2=A0 =C2=A0 =C2=A0 __raw_writeb(addr, reg);
> +}
> +
> +/*
> + * This function reads from one of the task file registers.
> + */
> +static u8 s3c_ide_INB(ide_hwif_t *hwif, ulong reg)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct s3c_ide_device *ide_dev =3D
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (struct s3c_ide_device *)hwif->hwif_data;
> + =C2=A0 =C2=A0 =C2=A0 u8 temp;
> +
> + =C2=A0 =C2=A0 =C2=A0 wait_for_host_ready(ide_dev);
> + =C2=A0 =C2=A0 =C2=A0 temp =3D __raw_readb(reg);
> + =C2=A0 =C2=A0 =C2=A0 wait_for_host_ready(ide_dev);
> + =C2=A0 =C2=A0 =C2=A0 temp =3D __raw_readb(ide_dev->regbase + S3C_AT=
A_PIO_RDATA);
> + =C2=A0 =C2=A0 =C2=A0 return temp;
> +}

any namespace reason for the caps  _OUTB and _INB ?


> +
> +/*
> + * The following are ide_tp_ops functions implemented by the IDE
> + * cotnroller driver.
> + */
> +static void s3c_ide_exec_command(ide_hwif_t *hwif, u8 cmd)
> +{
> + =C2=A0 =C2=A0 =C2=A0 s3c_ide_OUTB(hwif, cmd, hwif->io_ports.command=
_addr);
> +}
> +
> +static u8 s3c_ide_read_status(ide_hwif_t *hwif)
> +{
> + =C2=A0 =C2=A0 =C2=A0 return s3c_ide_INB(hwif, hwif->io_ports.status=
_addr);
> +}
> +
> +static u8 s3c_ide_read_altstatus(ide_hwif_t *hwif)
> +{
> + =C2=A0 =C2=A0 =C2=A0 return s3c_ide_INB(hwif, hwif->io_ports.ctl_ad=
dr);
> +}
> +
> +static void s3c_ide_write_devctl(ide_hwif_t *hwif, u8 ctl)
> +{
> + =C2=A0 =C2=A0 =C2=A0 s3c_ide_OUTB(hwif, ctl, hwif->io_ports.ctl_add=
r);
> +}
> +
> +static void s3c_ide_dev_select(ide_drive_t *drive)
> +{
> + =C2=A0 =C2=A0 =C2=A0 ide_hwif_t *hwif =3D drive->hwif;
> + =C2=A0 =C2=A0 =C2=A0 u8 select =3D drive->select | ATA_DEVICE_OBS;
> + =C2=A0 =C2=A0 =C2=A0 s3c_ide_OUTB(hwif, select, hwif->io_ports.devi=
ce_addr);
> +}
> +
> +static void s3c_ide_input_data(ide_drive_t *drive, struct ide_cmd *c=
md,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *b=
uf, unsigned int len)
> +{
> + =C2=A0 =C2=A0 =C2=A0 ide_hwif_t *hwif =3D drive->hwif;
> + =C2=A0 =C2=A0 =C2=A0 struct s3c_ide_device *ide_dev =3D
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (struct s3c_ide_device *)hwif->hwif_data;
> + =C2=A0 =C2=A0 =C2=A0 struct ide_io_ports *io_ports =3D &hwif->io_po=
rts;
> + =C2=A0 =C2=A0 =C2=A0 unsigned long data_addr =3D io_ports->data_add=
r;
> + =C2=A0 =C2=A0 =C2=A0 unsigned int words =3D (len + 1) >> 1, i;
> + =C2=A0 =C2=A0 =C2=A0 u16 *temp_addr =3D (u16 *)buf;
> +
> + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < words; i++, temp_addr++) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wait_for_host_read=
y(ide_dev);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *temp_addr =3D __r=
aw_readw(data_addr);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wait_for_host_read=
y(ide_dev);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *temp_addr =3D __r=
aw_readw(ide_dev->regbase + S3C_ATA_PIO_RDATA);
> + =C2=A0 =C2=A0 =C2=A0 }
> +}
> +
> +static void s3c_ide_output_data(ide_drive_t *drive, struct ide_cmd *=
cmd,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *b=
uf, unsigned int len)
> +{
> + =C2=A0 =C2=A0 =C2=A0 ide_hwif_t *hwif =3D drive->hwif;
> + =C2=A0 =C2=A0 =C2=A0 struct s3c_ide_device *ide_dev =3D
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (struct s3c_ide_device *)hwif->hwif_data;
> + =C2=A0 =C2=A0 =C2=A0 struct ide_io_ports *io_ports =3D &hwif->io_po=
rts;
> + =C2=A0 =C2=A0 =C2=A0 unsigned long data_addr =3D io_ports->data_add=
r;
> + =C2=A0 =C2=A0 =C2=A0 unsigned int words =3D (len + 1) >> 1, i;
> + =C2=A0 =C2=A0 =C2=A0 u16 *temp_addr =3D (u16 *)buf;
> +
> + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < words; i++, temp_addr++) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wait_for_host_read=
y(ide_dev);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 writel(*temp_addr,=
 data_addr);
> + =C2=A0 =C2=A0 =C2=A0 }
> +}
> +
> +static void s3c_ide_tf_load(ide_drive_t *drive, struct ide_taskfile =
*tf,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u8 valid)
> +{
> + =C2=A0 =C2=A0 =C2=A0 ide_hwif_t *hwif =3D drive->hwif;
> + =C2=A0 =C2=A0 =C2=A0 struct ide_io_ports *io_ports =3D &hwif->io_po=
rts;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (valid & IDE_VALID_FEATURE)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_ide_OUTB(hwif,=
 tf->feature, io_ports->feature_addr);
> + =C2=A0 =C2=A0 =C2=A0 if (valid & IDE_VALID_NSECT)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_ide_OUTB(hwif,=
 tf->nsect, io_ports->nsect_addr);
> + =C2=A0 =C2=A0 =C2=A0 if (valid & IDE_VALID_LBAL)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_ide_OUTB(hwif,=
 tf->lbal, io_ports->lbal_addr);
> + =C2=A0 =C2=A0 =C2=A0 if (valid & IDE_VALID_LBAM)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_ide_OUTB(hwif,=
 tf->lbam, io_ports->lbam_addr);
> + =C2=A0 =C2=A0 =C2=A0 if (valid & IDE_VALID_LBAH)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_ide_OUTB(hwif,=
 tf->lbah, io_ports->lbah_addr);
> + =C2=A0 =C2=A0 =C2=A0 if (valid & IDE_VALID_DEVICE)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_ide_OUTB(hwif,=
 tf->device, io_ports->device_addr);
> +}
> +
> +void s3c_ide_tf_read(ide_drive_t *drive, struct ide_taskfile *tf, u8=
 valid)
> +{
> + =C2=A0 =C2=A0 =C2=A0 ide_hwif_t *hwif =3D drive->hwif;
> + =C2=A0 =C2=A0 =C2=A0 struct ide_io_ports *io_ports =3D &hwif->io_po=
rts;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (valid & IDE_VALID_ERROR)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tf->error =C2=A0=3D=
 s3c_ide_INB(hwif, io_ports->feature_addr);
> + =C2=A0 =C2=A0 =C2=A0 if (valid & IDE_VALID_NSECT)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tf->nsect =C2=A0=3D=
 s3c_ide_INB(hwif, io_ports->nsect_addr);
> + =C2=A0 =C2=A0 =C2=A0 if (valid & IDE_VALID_LBAL)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tf->lbal =C2=A0 =3D=
 s3c_ide_INB(hwif, io_ports->lbal_addr);
> + =C2=A0 =C2=A0 =C2=A0 if (valid & IDE_VALID_LBAM)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tf->lbam =C2=A0 =3D=
 s3c_ide_INB(hwif, io_ports->lbam_addr);
> + =C2=A0 =C2=A0 =C2=A0 if (valid & IDE_VALID_LBAH)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tf->lbah =C2=A0 =3D=
 s3c_ide_INB(hwif, io_ports->lbah_addr);
> + =C2=A0 =C2=A0 =C2=A0 if (valid & IDE_VALID_DEVICE)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tf->device =3D s3c=
_ide_INB(hwif, io_ports->device_addr);
> +}
> +
> +static void set_ata_enable(struct s3c_ide_device *ide_dev, u8 state)
> +{
> + =C2=A0 =C2=A0 =C2=A0 u32 temp =3D ide_readl(S3C_ATA_CTRL);
> + =C2=A0 =C2=A0 =C2=A0 temp =3D state ? temp | 1 : temp & ~1;
> + =C2=A0 =C2=A0 =C2=A0 ide_writel(temp , S3C_ATA_CTRL);
> +}
> +
> +static void set_endian_mode(struct s3c_ide_device *ide_dev, u8 mode)
> +{
> + =C2=A0 =C2=A0 =C2=A0 u32 reg =3D ide_readl(S3C_ATA_CFG);
> + =C2=A0 =C2=A0 =C2=A0 reg =3D mode ? (reg & ~S3C_ATA_CFG_SWAP) : (re=
g | S3C_ATA_CFG_SWAP);
> + =C2=A0 =C2=A0 =C2=A0 ide_writel(reg, S3C_ATA_CFG);
> +}
> +
> +/*
> + * This function selects the maximum possible transfer speed.
> + */
> +static u8 s3c_ide_ratefilter(u8 speed)
> +{
> + =C2=A0 =C2=A0 =C2=A0 return min(speed, (u8)XFER_PIO_4);
> +}
> +
> +/*
> + * This function selects the best possible transfer speed.
> + */
> +static void s3c_ide_tune_chipset(ide_drive_t *drive, u8 xferspeed)
> +{
> + =C2=A0 =C2=A0 =C2=A0 ide_hwif_t *hwif =3D (ide_hwif_t *)drive->hwif=
;
> + =C2=A0 =C2=A0 =C2=A0 struct s3c_ide_device *ide_dev =3D
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (struct s3c_ide_device *)hwif->hwif_data;
> + =C2=A0 =C2=A0 =C2=A0 u8 speed =3D s3c_ide_ratefilter(xferspeed);
> +
> + =C2=A0 =C2=A0 =C2=A0 /* IORDY is enabled for modes > PIO2 */
> + =C2=A0 =C2=A0 =C2=A0 if (XFER_PIO_0 >=3D speed && speed <=3D XFER_P=
IO_4) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ulong ata_cfg =3D =
ide_readl(S3C_ATA_CFG);
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (speed) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case XFER_PIO_0:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case XFER_PIO_1:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case XFER_PIO_2:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ata_cfg &=3D (~S3C_ATA_CFG_IORDYEN);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case XFER_PIO_3:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case XFER_PIO_4:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ata_cfg |=3D S3C_ATA_CFG_IORDYEN;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ide_writel(ata_cfg=
, S3C_ATA_CFG);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ide_writel(ide_dev=
->piotime[speed - XFER_PIO_0],
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S3C_ATA_PIO_TIME);
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 ide_config_drive_speed(drive, speed);
> +}
> +
> +static void s3c_ide_tune_drive(ide_drive_t *drive, u8 pio)
> +{
> + =C2=A0 =C2=A0 =C2=A0 pio =3D ide_get_best_pio_mode(drive, 255, pio)=
;
> + =C2=A0 =C2=A0 =C2=A0 (void)s3c_ide_tune_chipset(drive, (XFER_PIO_0 =
+ pio));
> +}
> +
> +irqreturn_t s3c_irq_handler(int irq, void *dev_id)
> +{
> + =C2=A0 =C2=A0 =C2=A0 ide_hwif_t *hwif =3D (ide_hwif_t *)dev_id;
> + =C2=A0 =C2=A0 =C2=A0 struct s3c_ide_device *ide_dev =3D
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (struct s3c_ide_device *)hwif->hwif_data;
> + =C2=A0 =C2=A0 =C2=A0 u32 reg =3D ide_readl(S3C_ATA_IRQ);
> +
> + =C2=A0 =C2=A0 =C2=A0 ide_writel(reg, S3C_ATA_IRQ);
> + =C2=A0 =C2=A0 =C2=A0 return ide_intr(irq, dev_id);
> +}
> +
> +static void s3c_ide_setup_timing_value(struct s3c_ide_device *ide_de=
v,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 u32 clk_rate)
> +{
> + =C2=A0 =C2=A0 =C2=A0 uint t1, t2, teoc, i;
> + =C2=A0 =C2=A0 =C2=A0 uint pio_t1[5] =3D { 70, 50, 30, 30, 30 };
> + =C2=A0 =C2=A0 =C2=A0 uint pio_t2[5] =3D { 290, 290, 290, 80, 70 };
> + =C2=A0 =C2=A0 =C2=A0 uint pio_teoc[5] =3D { 20, 20, 10, 10, 10 };
> + =C2=A0 =C2=A0 =C2=A0 ulong cycle_time =3D (uint) (1000000000 / clk_=
rate);
> +
> + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < 5; i++) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t1 =3D (pio_t1[i] =
/ cycle_time) & 0x0f;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t2 =3D (pio_t2[i] =
/ cycle_time) & 0xff;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 teoc =3D (pio_teoc=
[i] / cycle_time) & 0xff;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ide_dev->piotime[i=
] =3D (teoc << 12) | (t2 << 4) | t1;
> + =C2=A0 =C2=A0 =C2=A0 }
> +}
> +
> +static void change_mode_to_ata(struct s3c_ide_device *ide_dev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 ide_writel(ide_readl(S3C_CFATA_MUX) | S3C_CFAT=
A_MUX_TRUEIDE,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 S3C_CFATA_MUX);
> +}
> +
> +static void init_ide_device(struct s3c_ide_device *ide_dev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 change_mode_to_ata(ide_dev);
> + =C2=A0 =C2=A0 =C2=A0 set_endian_mode(ide_dev, 1);
> + =C2=A0 =C2=A0 =C2=A0 set_ata_enable(ide_dev, 1);
> +}
> +
> +static void s3c_ide_setup_ports(struct ide_hw *hw,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct s3c_ide_device *ide_dev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 int i;
> + =C2=A0 =C2=A0 =C2=A0 unsigned long *ata_regs =3D hw->io_ports_array=
;
> +
> + =C2=A0 =C2=A0 =C2=A0 /* S3C IDE controller does not include irq_add=
r port */
> + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < IDE_NR_PORTS-1; i++)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *ata_regs++ =3D (u=
long)ide_dev->regbase +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S3C_ATA_PIO_DTR + (i << 2);
> +}
> +
> +static u8 s3c_cable_detect(ide_hwif_t *hwif)
> +{
> + =C2=A0 =C2=A0 =C2=A0 return ATA_CBL_PATA40;
> +}
> +
> +static const struct ide_port_ops s3c_port_ops =3D {
> + =C2=A0 =C2=A0 =C2=A0 .set_pio_mode =3D s3c_ide_tune_drive,
> + =C2=A0 =C2=A0 =C2=A0 .set_dma_mode =3D s3c_ide_tune_chipset,
> + =C2=A0 =C2=A0 =C2=A0 .cable_detect =3D s3c_cable_detect,
> +};
> +
> +static const struct ide_tp_ops s3c_ide_tp_ops =3D {
> + =C2=A0 =C2=A0 =C2=A0 .exec_command =C2=A0 =3D s3c_ide_exec_command,
> + =C2=A0 =C2=A0 =C2=A0 .read_status =C2=A0 =C2=A0=3D s3c_ide_read_sta=
tus,
> + =C2=A0 =C2=A0 =C2=A0 .read_altstatus =3D s3c_ide_read_altstatus,
> + =C2=A0 =C2=A0 =C2=A0 .write_devctl =C2=A0 =3D s3c_ide_write_devctl,
> + =C2=A0 =C2=A0 =C2=A0 .dev_select =C2=A0 =C2=A0 =3D s3c_ide_dev_sele=
ct,
> + =C2=A0 =C2=A0 =C2=A0 .tf_load =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D s3c_id=
e_tf_load,
> + =C2=A0 =C2=A0 =C2=A0 .tf_read =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D s3c_id=
e_tf_read,
> + =C2=A0 =C2=A0 =C2=A0 .input_data =C2=A0 =C2=A0 =3D s3c_ide_input_da=
ta,
> + =C2=A0 =C2=A0 =C2=A0 .output_data =C2=A0 =C2=A0=3D s3c_ide_output_d=
ata,
> +};
> +
> +
> +static const struct ide_port_info s3c_port_info =3D {
> + =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "=
s3c-ide",
> + =C2=A0 =C2=A0 =C2=A0 .port_ops =C2=A0 =C2=A0 =C2=A0 =3D &s3c_port_o=
ps,
> + =C2=A0 =C2=A0 =C2=A0 .tp_ops =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &s3c_i=
de_tp_ops,
> + =C2=A0 =C2=A0 =C2=A0 .chipset =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ide_s3=
c,
> + =C2=A0 =C2=A0 =C2=A0 .host_flags =C2=A0 =C2=A0 =3D IDE_HFLAG_MMIO |=
 IDE_HFLAG_NO_IO_32BIT |
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IDE_HFLAG_UNMASK_IRQS,
> + =C2=A0 =C2=A0 =C2=A0 .pio_mask =C2=A0 =C2=A0 =C2=A0 =3D ATA_PIO4,
> +};
> +
> +static int __devinit s3c_ide_probe(struct platform_device *pdev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct resource *res;
> + =C2=A0 =C2=A0 =C2=A0 struct clk *ide_clk;
> + =C2=A0 =C2=A0 =C2=A0 struct s3c_ide_device *ide_dev =3D &s3c_ide_de=
v;
> + =C2=A0 =C2=A0 =C2=A0 struct s3c_ide_platdata *pdata;
> + =C2=A0 =C2=A0 =C2=A0 struct ide_host *host;
> + =C2=A0 =C2=A0 =C2=A0 int ret =3D 0;
> + =C2=A0 =C2=A0 =C2=A0 struct ide_hw hw, *hws[] =3D { &hw };
> +
> + =C2=A0 =C2=A0 =C2=A0 memset(&s3c_ide_dev, 0, sizeof(s3c_ide_dev));
> + =C2=A0 =C2=A0 =C2=A0 ide_dev->pdev =3D pdev;
> + =C2=A0 =C2=A0 =C2=A0 pdata =3D pdev->dev.platform_data;
> + =C2=A0 =C2=A0 =C2=A0 ide_dev->irq =3D platform_get_irq(pdev, 0);
> +
> + =C2=A0 =C2=A0 =C2=A0 res =3D platform_get_resource(pdev, IORESOURCE=
_MEM, 0);
> + =C2=A0 =C2=A0 =C2=A0 if (res =3D=3D NULL) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev=
, "could not obtain base address \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 of cont=
roller\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ENODEV;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 if (ide_dev->irq < 0) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev=
, "could not obtain irq number\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ENODEV;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
> + =C2=A0 =C2=A0 =C2=A0 }
             check for valid irq shud be done immidiately after trying =
to get it
and before acquiring any other resource


> + =C2=A0 =C2=A0 =C2=A0 if (!request_mem_region(res->start, res->end -=
 res->start + 1,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pdev->name)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev=
, "could not obtain i/o address\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EBUSY;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 ide_dev->regbase =3D ioremap(res->start, res->=
end - res->start + 1);
> + =C2=A0 =C2=A0 =C2=A0 if (ide_dev->regbase =3D=3D 0) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev=
, "could not remap i/o address\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ENOMEM;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 ide_clk =3D clk_get(&pdev->dev, "cfcon");
> + =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(ide_clk)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev=
, "failed to find clock source\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D PTR_ERR(id=
e_clk);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ide_clk =3D NULL;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 if (clk_enable(ide_clk)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev=
, "failed to enable clock source.\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 s3c_ide_setup_timing_value(ide_dev, clk_get_ra=
te(ide_clk));
> + =C2=A0 =C2=A0 =C2=A0 if (pdata->setup_gpio)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pdata->setup_gpio(=
);
> + =C2=A0 =C2=A0 =C2=A0 init_ide_device(ide_dev);
> +
> + =C2=A0 =C2=A0 =C2=A0 ide_writel(0x1f, S3C_ATA_IRQ);
> + =C2=A0 =C2=A0 =C2=A0 ide_writel(0x1b, S3C_ATA_IRQ_MSK);
> +
> + =C2=A0 =C2=A0 =C2=A0 memset(&hw, 0, sizeof(hw));
> + =C2=A0 =C2=A0 =C2=A0 s3c_ide_setup_ports(&hw, ide_dev);
> + =C2=A0 =C2=A0 =C2=A0 hw.irq =3D ide_dev->irq;
> + =C2=A0 =C2=A0 =C2=A0 hw.dev =3D &pdev->dev;
> +
> + =C2=A0 =C2=A0 =C2=A0 host =3D ide_host_alloc(&s3c_port_info, hws, 1=
);
> + =C2=A0 =C2=A0 =C2=A0 if (!host) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev=
, "failed to allocate ide host\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 host->irq_handler =3D s3c_irq_handler;
> + =C2=A0 =C2=A0 =C2=A0 host->ports[0]->hwif_data =3D (void *)ide_dev;
> +
> + =C2=A0 =C2=A0 =C2=A0 ret =3D ide_host_register(host, &s3c_port_info=
, hws);
> + =C2=A0 =C2=A0 =C2=A0 if (ret) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev=
, "failed to register ide host\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ide_host_free(host=
);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 s3c_ide_dev.hwif =3D host->ports[0];
> + =C2=A0 =C2=A0 =C2=A0 platform_set_drvdata(pdev, host);
> + =C2=A0 =C2=A0 =C2=A0 printk(KERN_INFO "S3C IDE driver configured fo=
r PIO_ONLY mode\n");
> +
> +out:
> + =C2=A0 =C2=A0 =C2=A0 return ret;
> +}
Since you call 'goto out' upon some call failure, the label 'out' shud
 undo all the successful operations before hitting the failure.
It shud rather be out1, out2 etc jumped at from various locations durin=
g
initialization.


> +static int __devexit s3c_ide_remove(struct platform_device *pdev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct ide_host *host =3D platform_get_drvdata=
(pdev);
> + =C2=A0 =C2=A0 =C2=A0 struct resource *res;
> + =C2=A0 =C2=A0 =C2=A0 struct s3c_ide_device *ide_dev =3D host->ports=
[0]->hwif_data;
> +
> + =C2=A0 =C2=A0 =C2=A0 ide_host_remove(host);
> + =C2=A0 =C2=A0 =C2=A0 iounmap(ide_dev->regbase);
> + =C2=A0 =C2=A0 =C2=A0 res =3D platform_get_resource(pdev, IORESOURCE=
_MEM, 0);
> + =C2=A0 =C2=A0 =C2=A0 release_resource(res);

          It had rather be release_mem_region ?

> + =C2=A0 =C2=A0 =C2=A0 kfree(res);
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> +static struct platform_driver s3c_ide_driver =3D {
> + =C2=A0 =C2=A0 =C2=A0 .probe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D s=
3c_ide_probe,
> + =C2=A0 =C2=A0 =C2=A0 .remove =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D __deve=
xit_p(s3c_ide_remove),
> + =C2=A0 =C2=A0 =C2=A0 .driver =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =3D "=
s3c-ide",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner =C2=A0=3D T=
HIS_MODULE,
> + =C2=A0 =C2=A0 =C2=A0 },
> +};
> +
> +static int __init s3c_ide_init(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&s3c_ide_drive=
r);
> +}
> +
> +static void __exit s3c_ide_exit(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&s3c_ide_driver);
> +}
> +
> +module_init(s3c_ide_init);
> +module_exit(s3c_ide_exit);
> +
> +MODULE_DESCRIPTION("Samsung S3C IDE Controller Driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:s3c-cfcon");
> diff --git a/include/linux/ide.h b/include/linux/ide.h
> index edc93a6..ff9eb0e 100644
> --- a/include/linux/ide.h
> +++ b/include/linux/ide.h
> @@ -164,7 +164,7 @@ enum { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ide_unknown, =C2=A0 =C2=A0ide_generic, =C2=A0 =C2=A0ide_pci,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ide_cmd640, =C2=
=A0 =C2=A0 ide_dtc2278, =C2=A0 =C2=A0ide_ali14xx,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ide_qd65xx, =C2=
=A0 =C2=A0 ide_umc8672, =C2=A0 =C2=A0ide_ht6560b,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ide_4drives, =C2=
=A0 =C2=A0ide_pmac, =C2=A0 =C2=A0 =C2=A0 ide_acorn,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ide_au1xxx, =C2=A0=
 =C2=A0 ide_palm3710
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ide_au1xxx, =C2=A0=
 =C2=A0 ide_palm3710, =C2=A0 ide_s3c
> =C2=A0};
>
> =C2=A0typedef u8 hwif_chipset_t;
> --
> 1.5.3.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>
--
To unsubscribe from this list: send the line "unsubscribe linux-samsung=
-soc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

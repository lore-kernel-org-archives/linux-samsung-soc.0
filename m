From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 2/3] ASoC: AC97: S3C: Add controller driver
Date: Wed, 27 Jan 2010 11:45:24 +0900
Message-ID: <1b68c6791001261845y7635b92dm2fd4c7ad240d40c7@mail.gmail.com>
References: <1264485101-13782-1-git-send-email-jassisinghbrar@gmail.com>
	 <1264485101-13782-2-git-send-email-jassisinghbrar@gmail.com>
	 <20100126102343.GA24843@trinity.fluff.org>
	 <1b68c6791001260303m38e6e689p2ee8c2c4c6ac2af3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f204.google.com ([209.85.221.204]:65383 "EHLO
	mail-qy0-f204.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752064Ab0A0CpZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jan 2010 21:45:25 -0500
Received: by qyk42 with SMTP id 42so199144qyk.33
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jan 2010 18:45:24 -0800 (PST)
In-Reply-To: <1b68c6791001260303m38e6e689p2ee8c2c4c6ac2af3@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, broonie@opensource.wolfsonmicro.com, lrg@slimlogic.co.uk, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Tue, Jan 26, 2010 at 8:03 PM, jassi brar <jassisinghbrar@gmail.com> =
wrote:
> On Tue, Jan 26, 2010 at 7:23 PM, Ben Dooks <ben-linux@fluff.org> wrot=
e:
>> On Tue, Jan 26, 2010 at 02:51:40PM +0900, jassisinghbrar@gmail.com w=
rote:
>>> From: Jassi Brar <jassi.brar@samsung.com>
>>>
>>> Add the AC97 controller driver for Samsung SoCs that have one.
>>>
>>> Signed-off-by: Jassi Brar <jassi.brar@samsung.com>
>>> ---
>>> =C2=A0sound/soc/s3c24xx/Kconfig =C2=A0 =C2=A0| =C2=A0 =C2=A06 +-
>>> =C2=A0sound/soc/s3c24xx/Makefile =C2=A0 | =C2=A0 =C2=A03 +-
>>> =C2=A0sound/soc/s3c24xx/s3c-ac97.c | =C2=A0535 ++++++++++++++++++++=
++++++++++++++++++++++
>>> =C2=A0sound/soc/s3c24xx/s3c-ac97.h | =C2=A0 23 ++
>>> =C2=A04 files changed, 565 insertions(+), 2 deletions(-)
>>> =C2=A0create mode 100644 sound/soc/s3c24xx/s3c-ac97.c
>>> =C2=A0create mode 100644 sound/soc/s3c24xx/s3c-ac97.h
>>>
>>> diff --git a/sound/soc/s3c24xx/Kconfig b/sound/soc/s3c24xx/Kconfig
>>> index b489f1a..ad3690e 100644
>>> --- a/sound/soc/s3c24xx/Kconfig
>>> +++ b/sound/soc/s3c24xx/Kconfig
>>> @@ -32,7 +32,11 @@ config SND_S3C2443_SOC_AC97
>>> =C2=A0 =C2=A0 =C2=A0 select S3C2410_DMA
>>> =C2=A0 =C2=A0 =C2=A0 select AC97_BUS
>>> =C2=A0 =C2=A0 =C2=A0 select SND_SOC_AC97_BUS
>>> -
>>> +
>>> +config SND_S3C_SOC_AC97
>>> + =C2=A0 =C2=A0 tristate
>>> + =C2=A0 =C2=A0 select SND_SOC_AC97_BUS
>>> +
>>> =C2=A0config SND_S3C24XX_SOC_NEO1973_WM8753
>>> =C2=A0 =C2=A0 =C2=A0 tristate "SoC I2S Audio support for NEO1973 - =
WM8753"
>>> =C2=A0 =C2=A0 =C2=A0 depends on SND_S3C24XX_SOC && MACH_NEO1973_GTA=
01
>>> diff --git a/sound/soc/s3c24xx/Makefile b/sound/soc/s3c24xx/Makefil=
e
>>> index b744657..b7411bd 100644
>>> --- a/sound/soc/s3c24xx/Makefile
>>> +++ b/sound/soc/s3c24xx/Makefile
>>> @@ -4,12 +4,14 @@ snd-soc-s3c24xx-i2s-objs :=3D s3c24xx-i2s.o
>>> =C2=A0snd-soc-s3c2412-i2s-objs :=3D s3c2412-i2s.o
>>> =C2=A0snd-soc-s3c64xx-i2s-objs :=3D s3c64xx-i2s.o
>>> =C2=A0snd-soc-s3c2443-ac97-objs :=3D s3c2443-ac97.o
>>> +snd-soc-s3c-ac97-objs :=3D s3c-ac97.o
>>> =C2=A0snd-soc-s3c-i2s-v2-objs :=3D s3c-i2s-v2.o
>>> =C2=A0snd-soc-s3c-pcm-objs :=3D s3c-pcm.o
>>>
>>> =C2=A0obj-$(CONFIG_SND_S3C24XX_SOC) +=3D snd-soc-s3c24xx.o
>>> =C2=A0obj-$(CONFIG_SND_S3C24XX_SOC_I2S) +=3D snd-soc-s3c24xx-i2s.o
>>> =C2=A0obj-$(CONFIG_SND_S3C2443_SOC_AC97) +=3D snd-soc-s3c2443-ac97.=
o
>>> +obj-$(CONFIG_SND_S3C_SOC_AC97) +=3D snd-soc-s3c-ac97.o
>>> =C2=A0obj-$(CONFIG_SND_S3C2412_SOC_I2S) +=3D snd-soc-s3c2412-i2s.o
>>> =C2=A0obj-$(CONFIG_SND_S3C64XX_SOC_I2S) +=3D snd-soc-s3c64xx-i2s.o
>>> =C2=A0obj-$(CONFIG_SND_S3C_I2SV2_SOC) +=3D snd-soc-s3c-i2s-v2.o
>>> @@ -37,4 +39,3 @@ obj-$(CONFIG_SND_S3C24XX_SOC_SIMTEC) +=3D snd-soc=
-s3c24xx-simtec.o
>>> =C2=A0obj-$(CONFIG_SND_S3C24XX_SOC_SIMTEC_HERMES) +=3D snd-soc-s3c2=
4xx-simtec-hermes.o
>>> =C2=A0obj-$(CONFIG_SND_S3C24XX_SOC_SIMTEC_TLV320AIC23) +=3D snd-soc=
-s3c24xx-simtec-tlv320aic23.o
>>> =C2=A0obj-$(CONFIG_SND_S3C64XX_SOC_WM8580) +=3D snd-soc-smdk64xx-wm=
8580.o
>>> -
>>> diff --git a/sound/soc/s3c24xx/s3c-ac97.c b/sound/soc/s3c24xx/s3c-a=
c97.c
>>> new file mode 100644
>>> index 0000000..acb8f51
>>> --- /dev/null
>>> +++ b/sound/soc/s3c24xx/s3c-ac97.c
>>> @@ -0,0 +1,535 @@
>>> +/* sound/soc/s3c24xx/s3c-ac97.c
>>> + *
>>> + * ALSA SoC Audio Layer - S3C AC97 Controller driver
>>> + * =C2=A0 Evolved from s3c2443-ac97.c
>>> + *
>>> + * Copyright (c) 2010 Samsung Electronics Co. Ltd
>>> + * =C2=A0 Author: Jaswinder Singh <jassi.brar@samsung.com>
>>> + * =C2=A0 Credits: Graeme Gregory, Sean Choi
>>> + *
>>> + * This program is free software; you can redistribute it and/or m=
odify
>>> + * it under the terms of the GNU General Public License version 2 =
as
>>> + * published by the Free Software Foundation.
>>> + */
>>> +
>>> +#include <linux/init.h>
>>> +#include <linux/module.h>
>>> +#include <linux/io.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/clk.h>
>>> +
>>> +#include <sound/soc.h>
>>> +
>>> +#include <plat/regs-ac97.h>
>>> +#include <mach/dma.h>
>>> +#include <plat/audio.h>
>>> +
>>> +#include "s3c-dma.h"
>>> +#include "s3c-ac97.h"
>>> +
>>> +#define AC_CMD_ADDR(x) (x << 16)
>>> +#define AC_CMD_DATA(x) (x & 0xffff)
>>> +
>>> +struct s3c_ac97_info {
>>> + =C2=A0 =C2=A0 unsigned =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state;
>>> + =C2=A0 =C2=A0 struct clk =C2=A0 =C2=A0 =C2=A0 =C2=A0 *ac97_clk;
>>> + =C2=A0 =C2=A0 void __iomem =C2=A0 =C2=A0 =C2=A0 *regs;
>>> + =C2=A0 =C2=A0 struct mutex =C2=A0 =C2=A0 =C2=A0 lock;
>>> + =C2=A0 =C2=A0 struct completion =C2=A0done;
>>> +};
>>> +static struct s3c_ac97_info s3c_ac97;
>>> +
>>> +static struct s3c2410_dma_client s3c_dma_client_out =3D {
>>> + =C2=A0 =C2=A0 .name =3D "AC97 PCMOut"
>>> +};
>>> +
>>> +static struct s3c2410_dma_client s3c_dma_client_in =3D {
>>> + =C2=A0 =C2=A0 .name =3D "AC97 PCMIn"
>>> +};
>>> +
>>> +static struct s3c2410_dma_client s3c_dma_client_micin =3D {
>>> + =C2=A0 =C2=A0 .name =3D "AC97 MicIn"
>>> +};
>>> +
>>> +static struct s3c_dma_params s3c_ac97_pcm_out =3D {
>>> + =C2=A0 =C2=A0 .client =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &s3c_dma_cl=
ient_out,
>>> + =C2=A0 =C2=A0 .dma_size =C2=A0 =C2=A0 =C2=A0 =3D 4,
>>> +};
>>> +
>>> +static struct s3c_dma_params s3c_ac97_pcm_in =3D {
>>> + =C2=A0 =C2=A0 .client =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &s3c_dma_cl=
ient_in,
>>> + =C2=A0 =C2=A0 .dma_size =C2=A0 =C2=A0 =C2=A0 =3D 4,
>>> +};
>>> +
>>> +static struct s3c_dma_params s3c_ac97_mic_in =3D {
>>> + =C2=A0 =C2=A0 .client =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &s3c_dma_cl=
ient_micin,
>>> + =C2=A0 =C2=A0 .dma_size =C2=A0 =C2=A0 =C2=A0 =3D 4,
>>> +};
>>> +
>>> +static void s3c_ac97_cold_reset(struct snd_ac97 *ac97)
>>> +{
>>> + =C2=A0 =C2=A0 writel(S3C_AC97_GLBCTRL_COLDRESET,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 s3c_ac97.regs + S3C_AC97_GLBCTRL);
>>> + =C2=A0 =C2=A0 msleep(1);
>>> +
>>> + =C2=A0 =C2=A0 writel(0, s3c_ac97.regs + S3C_AC97_GLBCTRL);
>>> + =C2=A0 =C2=A0 msleep(1);
>>> +}
>>> +
>>> +static void s3c_ac97_warm_reset(struct snd_ac97 *ac97)
>>> +{
>>> + =C2=A0 =C2=A0 writel(S3C_AC97_GLBCTRL_WARMRESET, s3c_ac97.regs + =
S3C_AC97_GLBCTRL);
>>> + =C2=A0 =C2=A0 msleep(1);
>>> +
>>> + =C2=A0 =C2=A0 writel(0, s3c_ac97.regs + S3C_AC97_GLBCTRL);
>>> + =C2=A0 =C2=A0 msleep(1);
>>> +}
>>
>> It would be nice t osee something to convert a 'struct snd_ac97' to =
a
>> 'struct s3c_ac97_info' as this is being passed in to most place and
>> would also help if there is ever >1 block.
> ok, will find a way to do that.
after looking, I found there is no convenient way to extract driver pri=
vate
data from the snd_ac97 structure. Its possible, but after ugly voodoo
stuff.  Not to forget that no other ASoC ac97 controller driver does
it either.
And since we have just 1 AC97 controller in SoCs till date(no plans of
adding another anytime soon) I think we can live with it?

>>> +static void s3c_ac97_activate(struct snd_ac97 *ac97)
>>> +{
>>> + =C2=A0 =C2=A0 u32 ac_glbctrl, stat;
>>> +
>>> + =C2=A0 =C2=A0 stat =3D readl(s3c_ac97.regs + S3C_AC97_GLBSTAT) & =
0x7;
>>> + =C2=A0 =C2=A0 switch (stat) {
>>> + =C2=A0 =C2=A0 case S3C_AC97_GLBSTAT_MAINSTATE_ACTIVE:
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
>>> + =C2=A0 =C2=A0 case S3C_AC97_GLBSTAT_MAINSTATE_READY:
>>> + =C2=A0 =C2=A0 case S3C_AC97_GLBSTAT_MAINSTATE_INIT:
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>>> + =C2=A0 =C2=A0 default:
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_ac97_cold_reset(ac9=
7);
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_ac97_warm_reset(ac9=
7);
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>>> + =C2=A0 =C2=A0 }
>>> +
>>> + =C2=A0 =C2=A0 ac_glbctrl =3D readl(s3c_ac97.regs + S3C_AC97_GLBCT=
RL);
>>> + =C2=A0 =C2=A0 ac_glbctrl =3D S3C_AC97_GLBCTRL_ACLINKON;
>>> + =C2=A0 =C2=A0 writel(ac_glbctrl, s3c_ac97.regs + S3C_AC97_GLBCTRL=
);
>>> + =C2=A0 =C2=A0 msleep(1);
>>> +
>>> + =C2=A0 =C2=A0 ac_glbctrl |=3D S3C_AC97_GLBCTRL_TRANSFERDATAENABLE=
;
>>> + =C2=A0 =C2=A0 writel(ac_glbctrl, s3c_ac97.regs + S3C_AC97_GLBCTRL=
);
>>> + =C2=A0 =C2=A0 msleep(1);
>>> +
>>> + =C2=A0 =C2=A0 ac_glbctrl =3D readl(s3c_ac97.regs + S3C_AC97_GLBCT=
RL);
>>> + =C2=A0 =C2=A0 ac_glbctrl |=3D S3C_AC97_GLBCTRL_CODECREADYIE;
>>> + =C2=A0 =C2=A0 writel(ac_glbctrl, s3c_ac97.regs + S3C_AC97_GLBCTRL=
);
>>> +
>>> + =C2=A0 =C2=A0 INIT_COMPLETION(s3c_ac97.done);
>>> +
>>> + =C2=A0 =C2=A0 if (!wait_for_completion_timeout(&s3c_ac97.done, HZ=
))
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "AC97: =
Unable to activate!");
>>> +}
>>> +
>>> +static unsigned short s3c_ac97_read(struct snd_ac97 *ac97,
>>> + =C2=A0 =C2=A0 unsigned short reg)
>>> +{
>>> + =C2=A0 =C2=A0 u32 ac_glbctrl, ac_codec_cmd;
>>> + =C2=A0 =C2=A0 u32 stat, addr, data;
>>> +
>>> + =C2=A0 =C2=A0 mutex_lock(&s3c_ac97.lock);
>>> +
>>> + =C2=A0 =C2=A0 s3c_ac97_activate(ac97);
>>> +
>>> + =C2=A0 =C2=A0 ac_codec_cmd =3D readl(s3c_ac97.regs + S3C_AC97_COD=
EC_CMD);
>>> + =C2=A0 =C2=A0 ac_codec_cmd =3D S3C_AC97_CODEC_CMD_READ | AC_CMD_A=
DDR(reg);
>>> + =C2=A0 =C2=A0 writel(ac_codec_cmd, s3c_ac97.regs + S3C_AC97_CODEC=
_CMD);
>>> +
>>> + =C2=A0 =C2=A0 udelay(50);
>>> +
>>> + =C2=A0 =C2=A0 ac_glbctrl =3D readl(s3c_ac97.regs + S3C_AC97_GLBCT=
RL);
>>> + =C2=A0 =C2=A0 ac_glbctrl |=3D S3C_AC97_GLBCTRL_CODECREADYIE;
>>> + =C2=A0 =C2=A0 writel(ac_glbctrl, s3c_ac97.regs + S3C_AC97_GLBCTRL=
);
>>> +
>>> + =C2=A0 =C2=A0 INIT_COMPLETION(s3c_ac97.done);
>>> +
>>> + =C2=A0 =C2=A0 if (!wait_for_completion_timeout(&s3c_ac97.done, HZ=
))
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "AC97: =
Unable to read!");
>>> +
>>> + =C2=A0 =C2=A0 stat =3D readl(s3c_ac97.regs + S3C_AC97_STAT);
>>> + =C2=A0 =C2=A0 addr =3D (stat >> 16) & 0x7f;
>>> + =C2=A0 =C2=A0 data =3D (stat & 0xffff);
>>> +
>>> + =C2=A0 =C2=A0 if (addr !=3D reg)
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "s3c-ac=
97: req addr =3D %02x,"
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 " rep addr =3D %02x\n", reg, addr);
>>> +
>>> + =C2=A0 =C2=A0 mutex_unlock(&s3c_ac97.lock);
>>> +
>>> + =C2=A0 =C2=A0 return (unsigned short)data;
>>> +}
>>> +
>>> +static void s3c_ac97_write(struct snd_ac97 *ac97, unsigned short r=
eg,
>>> + =C2=A0 =C2=A0 unsigned short val)
>>> +{
>>> + =C2=A0 =C2=A0 u32 ac_glbctrl, ac_codec_cmd;
>>> +
>>> + =C2=A0 =C2=A0 mutex_lock(&s3c_ac97.lock);
>>> +
>>> + =C2=A0 =C2=A0 s3c_ac97_activate(ac97);
>>> +
>>> + =C2=A0 =C2=A0 ac_codec_cmd =3D readl(s3c_ac97.regs + S3C_AC97_COD=
EC_CMD);
>>> + =C2=A0 =C2=A0 ac_codec_cmd =3D AC_CMD_ADDR(reg) | AC_CMD_DATA(val=
);
>>> + =C2=A0 =C2=A0 writel(ac_codec_cmd, s3c_ac97.regs + S3C_AC97_CODEC=
_CMD);
>>> +
>>> + =C2=A0 =C2=A0 udelay(50);
>>> +
>>> + =C2=A0 =C2=A0 ac_glbctrl =3D readl(s3c_ac97.regs + S3C_AC97_GLBCT=
RL);
>>> + =C2=A0 =C2=A0 ac_glbctrl |=3D S3C_AC97_GLBCTRL_CODECREADYIE;
>>> + =C2=A0 =C2=A0 writel(ac_glbctrl, s3c_ac97.regs + S3C_AC97_GLBCTRL=
);
>>> +
>>> + =C2=A0 =C2=A0 INIT_COMPLETION(s3c_ac97.done);
>>> +
>>> + =C2=A0 =C2=A0 if (!wait_for_completion_timeout(&s3c_ac97.done, HZ=
))
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "AC97: =
Unable to write!");
>>> +
>>> + =C2=A0 =C2=A0 ac_codec_cmd =3D readl(s3c_ac97.regs + S3C_AC97_COD=
EC_CMD);
>>> + =C2=A0 =C2=A0 ac_codec_cmd |=3D S3C_AC97_CODEC_CMD_READ;
>>> + =C2=A0 =C2=A0 writel(ac_codec_cmd, s3c_ac97.regs + S3C_AC97_CODEC=
_CMD);
>>> +
>>> + =C2=A0 =C2=A0 mutex_unlock(&s3c_ac97.lock);
>>> +}
>>> +
>>> +static irqreturn_t s3c_ac97_irq(int irq, void *dev_id)
>>> +{
>>> + =C2=A0 =C2=A0 u32 ac_glbctrl, ac_glbstat;
>>> +
>>> + =C2=A0 =C2=A0 ac_glbstat =3D readl(s3c_ac97.regs + S3C_AC97_GLBST=
AT);
>>> +
>>> + =C2=A0 =C2=A0 if (ac_glbstat & S3C_AC97_GLBSTAT_CODECREADY) {
>>> +
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ac_glbctrl =3D readl(s3=
c_ac97.regs + S3C_AC97_GLBCTRL);
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ac_glbctrl &=3D ~S3C_AC=
97_GLBCTRL_CODECREADYIE;
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 writel(ac_glbctrl, s3c_=
ac97.regs + S3C_AC97_GLBCTRL);
>>> +
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ac_glbctrl =3D readl(s3=
c_ac97.regs + S3C_AC97_GLBCTRL);
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ac_glbctrl |=3D (1<<30)=
; /* Clear interrupt */
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 writel(ac_glbctrl, s3c_=
ac97.regs + S3C_AC97_GLBCTRL);
>>> +
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 complete(&s3c_ac97.done=
);
>>> + =C2=A0 =C2=A0 }
>>> +
>>> + =C2=A0 =C2=A0 return IRQ_HANDLED;
>>> +}
>>> +
>>> +struct snd_ac97_bus_ops soc_ac97_ops =3D {
>>> + =C2=A0 =C2=A0 .read =C2=A0 =C2=A0 =C2=A0 =3D s3c_ac97_read,
>>> + =C2=A0 =C2=A0 .write =C2=A0 =C2=A0 =C2=A0=3D s3c_ac97_write,
>>> + =C2=A0 =C2=A0 .warm_reset =3D s3c_ac97_warm_reset,
>>> + =C2=A0 =C2=A0 .reset =C2=A0 =C2=A0 =C2=A0=3D s3c_ac97_cold_reset,
>>> +};
>>> +EXPORT_SYMBOL_GPL(soc_ac97_ops);
>>> +
>>> +static int s3c_ac97_hw_params(struct snd_pcm_substream *substream,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct snd_pcm_hw_params *params=
,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct snd_soc_dai *dai)
>>> +{
>>> + =C2=A0 =C2=A0 struct snd_soc_pcm_runtime *rtd =3D substream->priv=
ate_data;
>>> + =C2=A0 =C2=A0 struct snd_soc_dai *cpu_dai =3D rtd->dai->cpu_dai;
>>> +
>>> + =C2=A0 =C2=A0 if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYB=
ACK)
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_dai->dma_data =3D &=
s3c_ac97_pcm_out;
>>> + =C2=A0 =C2=A0 else
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_dai->dma_data =3D &=
s3c_ac97_pcm_in;
>>> +
>>> + =C2=A0 =C2=A0 return 0;
>>> +}
>>> +
>>> +static int s3c_ac97_trigger(struct snd_pcm_substream *substream, i=
nt cmd,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct snd_soc_dai *dai)
>>> +{
>>> + =C2=A0 =C2=A0 u32 ac_glbctrl;
>>> + =C2=A0 =C2=A0 struct snd_soc_pcm_runtime *rtd =3D substream->priv=
ate_data;
>>> + =C2=A0 =C2=A0 int channel =3D ((struct s3c_dma_params *)
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rtd->dai->cpu_da=
i->dma_data)->channel;
>>> +
>>> + =C2=A0 =C2=A0 ac_glbctrl =3D readl(s3c_ac97.regs + S3C_AC97_GLBCT=
RL);
>>> + =C2=A0 =C2=A0 if (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTU=
RE)
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ac_glbctrl &=3D ~S3C_AC=
97_GLBCTRL_PCMINTM_MASK;
>>> + =C2=A0 =C2=A0 else
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ac_glbctrl &=3D ~S3C_AC=
97_GLBCTRL_PCMOUTTM_MASK;
>>> +
>>> + =C2=A0 =C2=A0 switch (cmd) {
>>> + =C2=A0 =C2=A0 case SNDRV_PCM_TRIGGER_START:
>>> + =C2=A0 =C2=A0 case SNDRV_PCM_TRIGGER_RESUME:
>>> + =C2=A0 =C2=A0 case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (substream->stream =3D=
=3D SNDRV_PCM_STREAM_CAPTURE)
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ac_glbctrl |=3D S3C_AC97_GLBCTRL_PCMINTM_DMA;
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ac_glbctrl |=3D S3C_AC97_GLBCTRL_PCMOUTTM_DMA;
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>>> +
>>> + =C2=A0 =C2=A0 case SNDRV_PCM_TRIGGER_STOP:
>>> + =C2=A0 =C2=A0 case SNDRV_PCM_TRIGGER_SUSPEND:
>>> + =C2=A0 =C2=A0 case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>>> + =C2=A0 =C2=A0 }
>>> +
>>> + =C2=A0 =C2=A0 writel(ac_glbctrl, s3c_ac97.regs + S3C_AC97_GLBCTRL=
);
>>> +
>>> + =C2=A0 =C2=A0 s3c2410_dma_ctrl(channel, S3C2410_DMAOP_STARTED);
>>> +
>>> + =C2=A0 =C2=A0 return 0;
>>> +}
>>> +
>>> +static int s3c_ac97_hw_mic_params(struct snd_pcm_substream *substr=
eam,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct snd_pcm_hw_=
params *params,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct snd_soc_dai=
 *dai)
>>> +{
>>> + =C2=A0 =C2=A0 struct snd_soc_pcm_runtime *rtd =3D substream->priv=
ate_data;
>>> + =C2=A0 =C2=A0 struct snd_soc_dai *cpu_dai =3D rtd->dai->cpu_dai;
>>> +
>>> + =C2=A0 =C2=A0 if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYB=
ACK)
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
>>> + =C2=A0 =C2=A0 else
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_dai->dma_data =3D &=
s3c_ac97_mic_in;
>>> +
>>> + =C2=A0 =C2=A0 return 0;
>>> +}
>>> +
>>> +static int s3c_ac97_mic_trigger(struct snd_pcm_substream *substrea=
m,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int cmd, struct snd_soc_d=
ai *dai)
>>> +{
>>> + =C2=A0 =C2=A0 u32 ac_glbctrl;
>>> + =C2=A0 =C2=A0 struct snd_soc_pcm_runtime *rtd =3D substream->priv=
ate_data;
>>> + =C2=A0 =C2=A0 int channel =3D ((struct s3c_dma_params *)
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rtd->dai->cpu_da=
i->dma_data)->channel;
>>> +
>>> + =C2=A0 =C2=A0 ac_glbctrl =3D readl(s3c_ac97.regs + S3C_AC97_GLBCT=
RL);
>>> + =C2=A0 =C2=A0 ac_glbctrl &=3D ~S3C_AC97_GLBCTRL_MICINTM_MASK;
>>> +
>>> + =C2=A0 =C2=A0 switch (cmd) {
>>> + =C2=A0 =C2=A0 case SNDRV_PCM_TRIGGER_START:
>>> + =C2=A0 =C2=A0 case SNDRV_PCM_TRIGGER_RESUME:
>>> + =C2=A0 =C2=A0 case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ac_glbctrl |=3D S3C_AC9=
7_GLBCTRL_MICINTM_DMA;
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>>> +
>>> + =C2=A0 =C2=A0 case SNDRV_PCM_TRIGGER_STOP:
>>> + =C2=A0 =C2=A0 case SNDRV_PCM_TRIGGER_SUSPEND:
>>> + =C2=A0 =C2=A0 case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>>> + =C2=A0 =C2=A0 }
>>> +
>>> + =C2=A0 =C2=A0 writel(ac_glbctrl, s3c_ac97.regs + S3C_AC97_GLBCTRL=
);
>>> +
>>> + =C2=A0 =C2=A0 s3c2410_dma_ctrl(channel, S3C2410_DMAOP_STARTED);
>>> +
>>> + =C2=A0 =C2=A0 return 0;
>>> +}
>>> +
>>> +#define S3C_AC97_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_11025=
 |\
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SNDRV_PCM_RATE_16000 | =
SNDRV_PCM_RATE_22050 | \
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SNDRV_PCM_RATE_32000 | =
SNDRV_PCM_RATE_44100 | \
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SNDRV_PCM_RATE_48000)
>>> +
>>> +static struct snd_soc_dai_ops s3c_ac97_dai_ops =3D {
>>> + =C2=A0 =C2=A0 .hw_params =C2=A0 =C2=A0 =C2=A0=3D s3c_ac97_hw_para=
ms,
>>> + =C2=A0 =C2=A0 .trigger =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D s3c_ac97_tr=
igger,
>>> +};
>>> +
>>> +static struct snd_soc_dai_ops s3c_ac97_mic_dai_ops =3D {
>>> + =C2=A0 =C2=A0 .hw_params =C2=A0 =C2=A0 =C2=A0=3D s3c_ac97_hw_mic_=
params,
>>> + =C2=A0 =C2=A0 .trigger =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D s3c_ac97_mi=
c_trigger,
>>> +};
>>> +
>>> +struct snd_soc_dai s3c_ac97_dai[] =3D {
>>> + =C2=A0 =C2=A0 [S3C_AC97_DAI_PCM] =3D {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D "s3c-ac97",
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .id =3D S3C_AC97_DAI_PC=
M,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ac97_control =3D 1,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .playback =3D {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .stream_name =3D "AC97 Playback",
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .channels_min =3D 2,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .channels_max =3D 2,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .rates =3D S3C_AC97_RATES,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .formats =3D SNDRV_PCM_FMTBIT_S16_LE,},
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .capture =3D {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .stream_name =3D "AC97 Capture",
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* NOTE: If the codec ouputs just one slot,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* it *seems* our AC97 controller reads the only
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* valid slot(if either 3 or 4) for PCM-In.
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* For such cases, we record Mono.
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*/
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .channels_min =3D 1,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .channels_max =3D 2,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .rates =3D S3C_AC97_RATES,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .formats =3D SNDRV_PCM_FMTBIT_S16_LE,},
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ops =3D &s3c_ac97_dai_=
ops,
>>> + =C2=A0 =C2=A0 },
>>> + =C2=A0 =C2=A0 [S3C_AC97_DAI_MIC] =3D {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D "s3c-ac97-mic=
",
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .id =3D S3C_AC97_DAI_MI=
C,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ac97_control =3D 1,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .capture =3D {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .stream_name =3D "AC97 Mic Capture",
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .channels_min =3D 1,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* NOTE: If the codec(like WM9713) can't ouput just
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* one slot, it *seems* our AC97 controller reads
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* two slots(if one of them is Slot-6) for MIC also.
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* For such cases, we record Stereo.
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*/
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .channels_max =3D 2,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .rates =3D S3C_AC97_RATES,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .formats =3D SNDRV_PCM_FMTBIT_S16_LE,},
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ops =3D &s3c_ac97_mic_=
dai_ops,
>>> + =C2=A0 =C2=A0 },
>>> +};
>>> +EXPORT_SYMBOL_GPL(s3c_ac97_dai);
>>> +
>>> +static __devinit int s3c_ac97_probe(struct platform_device *pdev)
>>> +{
>>> + =C2=A0 =C2=A0 struct resource *mem_res, *dmatx_res, *dmarx_res, *=
dmamic_res, *irq_res;
>>> + =C2=A0 =C2=A0 struct s3c_audio_pdata *ac97_pdata;
>>> + =C2=A0 =C2=A0 int ret;
>>> +
>>> + =C2=A0 =C2=A0 ac97_pdata =3D pdev->dev.platform_data;
>>> + =C2=A0 =C2=A0 if (!ac97_pdata || !ac97_pdata->cfg_gpio) {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev, "cf=
g_gpio callback not provided!\n");
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>>> + =C2=A0 =C2=A0 }
>>> +
>>> + =C2=A0 =C2=A0 /* Check for availability of necessary resource */
>>> + =C2=A0 =C2=A0 dmatx_res =3D platform_get_resource(pdev, IORESOURC=
E_DMA, 0);
>>> + =C2=A0 =C2=A0 if (!dmatx_res) {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev, "Un=
able to get AC97-TX dma resource\n");
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENXIO;
>>> + =C2=A0 =C2=A0 }
>>> +
>>> + =C2=A0 =C2=A0 dmarx_res =3D platform_get_resource(pdev, IORESOURC=
E_DMA, 1);
>>> + =C2=A0 =C2=A0 if (!dmarx_res) {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev, "Un=
able to get AC97-RX dma resource\n");
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENXIO;
>>> + =C2=A0 =C2=A0 }
>>> +
>>> + =C2=A0 =C2=A0 dmamic_res =3D platform_get_resource(pdev, IORESOUR=
CE_DMA, 2);
>>> + =C2=A0 =C2=A0 if (!dmamic_res) {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev, "Un=
able to get AC97-MIC dma resource\n");
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENXIO;
>>> + =C2=A0 =C2=A0 }
>>> +
>>> + =C2=A0 =C2=A0 mem_res =3D platform_get_resource(pdev, IORESOURCE_=
MEM, 0);
>>> + =C2=A0 =C2=A0 if (!mem_res) {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev, "Un=
able to get register resource\n");
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENXIO;
>>> + =C2=A0 =C2=A0 }
>>> +
>>> + =C2=A0 =C2=A0 irq_res =3D platform_get_resource(pdev, IORESOURCE_=
IRQ, 0);
>>> + =C2=A0 =C2=A0 if (!irq_res) {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev, "AC=
97 IRQ not provided!\n");
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENXIO;
>>> + =C2=A0 =C2=A0 }
>>> +
>>> + =C2=A0 =C2=A0 if (!request_mem_region(mem_res->start,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resource_size(mem_res), "s3c-ac97")) {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev, "Un=
able to request register region\n");
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EBUSY;
>>> + =C2=A0 =C2=A0 }
>>> +
>>> + =C2=A0 =C2=A0 s3c_ac97_pcm_out.channel =3D dmatx_res->start;
>>> + =C2=A0 =C2=A0 s3c_ac97_pcm_out.dma_addr =3D mem_res->start + S3C_=
AC97_PCM_DATA;
>>> + =C2=A0 =C2=A0 s3c_ac97_pcm_in.channel =3D dmarx_res->start;
>>> + =C2=A0 =C2=A0 s3c_ac97_pcm_in.dma_addr =3D mem_res->start + S3C_A=
C97_PCM_DATA;
>>> + =C2=A0 =C2=A0 s3c_ac97_mic_in.channel =3D dmamic_res->start;
>>> + =C2=A0 =C2=A0 s3c_ac97_mic_in.dma_addr =3D mem_res->start + S3C_A=
C97_MIC_DATA;
>>> +
>>> + =C2=A0 =C2=A0 init_completion(&s3c_ac97.done);
>>> + =C2=A0 =C2=A0 mutex_init(&s3c_ac97.lock);
>>> +
>>> + =C2=A0 =C2=A0 s3c_ac97.regs =3D ioremap(mem_res->start, resource_=
size(mem_res));
>>> + =C2=A0 =C2=A0 if (s3c_ac97.regs =3D=3D NULL) {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev, "Un=
able to ioremap register region\n");
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ENXIO;
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto lb1;
>>> + =C2=A0 =C2=A0 }
>>> +
>>> + =C2=A0 =C2=A0 s3c_ac97.ac97_clk =3D clk_get(&pdev->dev, "ac97");
>>> + =C2=A0 =C2=A0 if (IS_ERR(s3c_ac97.ac97_clk)) {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev, "s3=
c-ac97 failed to get ac97_clock\n");
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ENODEV;
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto lb2;
>>> + =C2=A0 =C2=A0 }
>>> + =C2=A0 =C2=A0 clk_enable(s3c_ac97.ac97_clk);
>>> +
>>> + =C2=A0 =C2=A0 if (ac97_pdata->cfg_gpio(pdev)) {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev, "Un=
able to configure gpio\n");
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EINVAL;
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto lb3;
>>> + =C2=A0 =C2=A0 }
>>> +
>>> + =C2=A0 =C2=A0 ret =3D request_irq(irq_res->start, s3c_ac97_irq,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IRQF_DISABL=
ED, "AC97", NULL);
>>> + =C2=A0 =C2=A0 if (ret < 0) {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "s3c-ac=
97: interrupt request failed.\n");
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto lb4;
>>> + =C2=A0 =C2=A0 }
>>> +
>>> + =C2=A0 =C2=A0 s3c_ac97_dai[S3C_AC97_DAI_PCM].dev =3D &pdev->dev;
>>> + =C2=A0 =C2=A0 s3c_ac97_dai[S3C_AC97_DAI_MIC].dev =3D &pdev->dev;
>>> +
>>> + =C2=A0 =C2=A0 ret =3D snd_soc_register_dais(s3c_ac97_dai, ARRAY_S=
IZE(s3c_ac97_dai));
>>> + =C2=A0 =C2=A0 if (ret)
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto lb5;
>>> +
>>> + =C2=A0 =C2=A0 return 0;
>>> +
>>> +lb5:
>>> + =C2=A0 =C2=A0 free_irq(irq_res->start, NULL);
>>> +lb4:
>>> +lb3:
>>> + =C2=A0 =C2=A0 clk_disable(s3c_ac97.ac97_clk);
>>> + =C2=A0 =C2=A0 clk_put(s3c_ac97.ac97_clk);
>>> +lb2:
>>> + =C2=A0 =C2=A0 iounmap(s3c_ac97.regs);
>>> +lb1:
>>> + =C2=A0 =C2=A0 release_mem_region(mem_res->start, resource_size(me=
m_res));
>>> +
>>> + =C2=A0 =C2=A0 return ret;
>>> +}
>>> +
>>> +static __devexit int s3c_ac97_remove(struct platform_device *pdev)
>>> +{
>>> + =C2=A0 =C2=A0 struct resource *mem_res, *irq_res;
>>> +
>>> + =C2=A0 =C2=A0 snd_soc_unregister_dais(s3c_ac97_dai, ARRAY_SIZE(s3=
c_ac97_dai));
>>> +
>>> + =C2=A0 =C2=A0 irq_res =3D platform_get_resource(pdev, IORESOURCE_=
IRQ, 0);
>>> + =C2=A0 =C2=A0 if (irq_res)
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free_irq(irq_res->start=
, NULL);
>>> +
>>> + =C2=A0 =C2=A0 clk_disable(s3c_ac97.ac97_clk);
>>> + =C2=A0 =C2=A0 clk_put(s3c_ac97.ac97_clk);
>>> +
>>> + =C2=A0 =C2=A0 iounmap(s3c_ac97.regs);
>>> +
>>> + =C2=A0 =C2=A0 mem_res =3D platform_get_resource(pdev, IORESOURCE_=
MEM, 0);
>>> + =C2=A0 =C2=A0 if (mem_res)
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 release_mem_region(mem_=
res->start, resource_size(mem_res));
>>> +
>>> + =C2=A0 =C2=A0 return 0;
>>> +}
>>> +
>>> +static struct platform_driver s3c_ac97_driver =3D {
>>> + =C2=A0 =C2=A0 .probe =C2=A0=3D s3c_ac97_probe,
>>> + =C2=A0 =C2=A0 .remove =3D s3c_ac97_remove,
>>> + =C2=A0 =C2=A0 .driver =3D {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D "s3c-ac97",
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner =3D THIS_MODULE,
>>> + =C2=A0 =C2=A0 },
>>> +};
>>> +
>>> +static int __init s3c_ac97_init(void)
>>> +{
>>> + =C2=A0 =C2=A0 return platform_driver_register(&s3c_ac97_driver);
>>> +}
>>> +module_init(s3c_ac97_init);
>>> +
>>> +static void __exit s3c_ac97_exit(void)
>>> +{
>>> + =C2=A0 =C2=A0 platform_driver_unregister(&s3c_ac97_driver);
>>> +}
>>> +module_exit(s3c_ac97_exit);
>>> +
>>> +MODULE_AUTHOR("Jaswinder Singh, <jassi.brar@samsung.com>");
>>> +MODULE_DESCRIPTION("AC97 driver for the Samsung SoC");
>>> +MODULE_LICENSE("GPL");
>>> diff --git a/sound/soc/s3c24xx/s3c-ac97.h b/sound/soc/s3c24xx/s3c-a=
c97.h
>>> new file mode 100644
>>> index 0000000..2781983
>>> --- /dev/null
>>> +++ b/sound/soc/s3c24xx/s3c-ac97.h
>>> @@ -0,0 +1,23 @@
>>> +/* sound/soc/s3c24xx/s3c-ac97.h
>>> + *
>>> + * ALSA SoC Audio Layer - S3C AC97 Controller driver
>>> + * =C2=A0 Evolved from s3c2443-ac97.h
>>> + *
>>> + * Copyright (c) 2010 Samsung Electronics Co. Ltd
>>> + * =C2=A0 Author: Jaswinder Singh <jassi.brar@samsung.com>
>>> + * =C2=A0 Credits: Graeme Gregory, Sean Choi
>>> + *
>>> + * This program is free software; you can redistribute it and/or m=
odify
>>> + * it under the terms of the GNU General Public License version 2 =
as
>>> + * published by the Free Software Foundation.
>>> + */
>>> +
>>> +#ifndef __S3C_AC97_H_
>>> +#define __S3C_AC97_H_
>>> +
>>> +#define S3C_AC97_DAI_PCM 0
>>> +#define S3C_AC97_DAI_MIC 1
>>> +
>>> +extern struct snd_soc_dai s3c_ac97_dai[];
>>> +
>>> +#endif /* __S3C_AC97_H_ */
>>> --
>>> 1.6.2.5
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-sam=
sung-soc" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.=
html
>>
>>
>> Out of interest, how similar are the two blocks and could the s3c244=
3
>> case be elided into this one with some minimal checks for which one =
is
>> currently in use?
> Same except for a few 'dead' bits in 2443.
> The only reason I didn't submit patch to delete s3c2443-ac97.c is tha=
t my
> =C2=A0smdk2443 didn't produce any sound. (btw the s3c2443-ac97.c also=
 fails to do so)
>

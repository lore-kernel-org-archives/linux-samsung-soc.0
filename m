From: Seungwhan Youn <claude.youn@gmail.com>
Subject: Re: [PATCH 9/10] ASoC: SAMSUNG: Add S/PDIF CPU driver
Date: Tue, 5 Oct 2010 11:08:21 +0900
Message-ID: <AANLkTimfgdwhBi1grDpKT0XrKbL7Xc0L=SK=-X3rh1pa@mail.gmail.com>
References: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
	<1286194397-19904-1-git-send-email-sw.youn@samsung.com>
	<20101004220207.GA3545@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:54805 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756162Ab0JECIW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Oct 2010 22:08:22 -0400
Received: by wwj40 with SMTP id 40so4998836wwj.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Oct 2010 19:08:21 -0700 (PDT)
In-Reply-To: <20101004220207.GA3545@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Seungwhan Youn <sw.youn@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, ben-linux@fluff.org, kgene.kim@samsung.com, lrg@slimlogic.co.uk, jassi.brar@samsung.com

Hi,

On Tue, Oct 5, 2010 at 7:02 AM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Mon, Oct 04, 2010 at 09:13:17PM +0900, Seungwhan Youn wrote:
>
>> +static int spdif_set_sysclk(struct snd_soc_dai *cpu_dai,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int clk_id, unsigned int freq, int dir)
>> +{
>
> If you save the clock rate here...
>
>> + =C2=A0 =C2=A0 case SND_SOC_SPDIF_MAIN_AUDIO_CLK:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (div) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 256:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 con |=3D CON_MCLKDIV_256FS;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 384:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 con |=3D CON_MCLKDIV_384FS;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 512:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 con |=3D CON_MCLKDIV_512FS;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;
>
> ...then you can calculate this dynamically at runtime in hw_params wh=
ich
> makes life easier for users.

Yes, right. I'll fix this and resend a patch.
Actually the first time, I implemented like your opinion but I and
Jassi were afraid about S/PDIF use external clock rate.
But it's no matter that machine driver can give external clock rate als=
o.

>
>> +/**
>> + * struct samsung_spdif_info - Samsung S/PDIF Controller informatio=
n
>> + * @lock: Spin lock for S/PDIF.
>> + * @dev: The parent device passed to use from the probe.
>> + * @regs: The pointer to the device register block.
>> + * @pclk: The peri-clock pointer for spdif master operation.
>> + * @sclk: The source clock pointer for making sync signals.
>> + * @save_clkcon: Backup clkcon reg. in suspend.
>> + * @save_con: Backup con reg. in suspend.
>> + * @save_cstas: Backup cstas reg. in suspend.
>> + * @dma_playback: DMA information for playback channel.
>> + */
>> +struct samsung_spdif_info {
>> + =C2=A0 =C2=A0 spinlock_t =C2=A0 =C2=A0 =C2=A0lock;
>
> No need to have this in the headers.
>
>> +/* Registers */
>> +#define CLKCON =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00
>> +#define CON =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x04
>> +#define BSTAS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x08
>
> These should all be namespaced or in the driver file to avoid colliso=
ons
> with other things - even if only used in this driver things like CON =
are
> risky for collisions with normal kernel headers the driver needs.

Okay, I'll move these into driver file(and remove header file), and
resend patch few days later after listen other people's opinions.

Thanks,
Claude

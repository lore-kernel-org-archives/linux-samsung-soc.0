From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [alsa-devel] [PATCH 2/4] ASoC: SAMSUNG: Add I2S0 internal dma driver
Date: Mon, 13 Jun 2011 14:37:16 +0530
Message-ID: <BANLkTikXtEvpjbPJtx6dB3nt0SVaBV=wYw@mail.gmail.com>
References: <1307606950-8310-1-git-send-email-sbkim73@samsung.com>
	<1307606950-8310-3-git-send-email-sbkim73@samsung.com>
	<BANLkTikND3dyqmi9xj93ZDPh2-NaXo_jTA@mail.gmail.com>
	<005001cc299f$5105b850$f31128f0$@com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:58250 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754998Ab1FMJHR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Jun 2011 05:07:17 -0400
Received: by bwz15 with SMTP id 15so3542288bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jun 2011 02:07:16 -0700 (PDT)
In-Reply-To: <005001cc299f$5105b850$f31128f0$@com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, ben-linux@fluff.org, lrg@slimlogic.co.uk

On Mon, Jun 13, 2011 at 1:25 PM, Sangbeom Kim <sbkim73@samsung.com> wro=
te:
> On Thu, Jun 10, 2011 at 7:08 PM, Jassi Brar wrote:
>> For my convenience, could you please tell how does it differ from my
>> original implementation? =C2=A0Most things look same, except for a f=
ew
>> variables.
> Original code only can support specific buffer size and period count.
> New idma driver can work with various buffer size and multiple period=
=2E
> And Original code is implemented it based on wrapper arch.
> But This patch can support driver arch.
>
>>
>> > @@ -16,6 +17,7 @@ obj-$(CONFIG_SND_S3C_I2SV2_SOC) +=3D snd-soc-s3c=
-i2s-
>> v2.o
>> > =C2=A0obj-$(CONFIG_SND_SAMSUNG_SPDIF) +=3D snd-soc-samsung-spdif.o
>> > =C2=A0obj-$(CONFIG_SND_SAMSUNG_PCM) +=3D snd-soc-pcm.o
>> > =C2=A0obj-$(CONFIG_SND_SAMSUNG_I2S) +=3D snd-soc-i2s.o
>> > +obj-$(CONFIG_SND_SAMSUNG_I2S) +=3D snd-soc-idma.o
>>
>> Please check that building only for s3c64xx doesn't break by this.
> If It have building problem, I will modify it in the next version
>
>>
>> > +
>> > +static struct idma_info {
>> > + =C2=A0 =C2=A0 =C2=A0 spinlock_t =C2=A0 =C2=A0 =C2=A0lock;
>> > + =C2=A0 =C2=A0 =C2=A0 void =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __iomem =C2=A0*regs;
>> > + =C2=A0 =C2=A0 =C2=A0 int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 trigger_stat;
>> The role of trigger_stat is not necessary.
> trigger_stat can be used LP audio mode.
> It can be used flag for checking idma operation.

ST_RUNNING bit of 'state' member of idma_ctrl structure can be used to
do the same.

Btw, please rename either the idma_ctrl structure or the idma_ctrl func=
tion, the
names clash.

Thnx
-j

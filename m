From: Sangbeom Kim <sbkim73@samsung.com>
Subject: RE: [alsa-devel] [PATCH 3/3] SoC: SAMSUNG: Add WM8580 PCM Machine
 driver
Date: Thu, 07 Apr 2011 13:44:37 +0900
Message-ID: <041f01cbf4de$85702f30$90508d90$@com>
References: <1302136270-28776-1-git-send-email-sbkim73@samsung.com>
 <1302136270-28776-4-git-send-email-sbkim73@samsung.com>
 <BANLkTinOadw2TkNMs2_Lvmskb=yU8XYUuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:10907 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751052Ab1DGEo6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Apr 2011 00:44:58 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LJ9008Q3MINO300@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Apr 2011 13:44:47 +0900 (KST)
Received: from DOSBKIM7301 ([12.23.103.65])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LJ900FLXMIMO1@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Apr 2011 13:44:47 +0900 (KST)
In-reply-to: <BANLkTinOadw2TkNMs2_Lvmskb=yU8XYUuw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jassi Brar' <jassisinghbrar@gmail.com>
Cc: alsa-devel@alsa-project.org, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, lrg@slimlogic.co.uk

Hi! Jassi

On Thursday, April 07, 2011 12:43 PM, Jassi Brar wrote:
> > +static struct snd_soc_dai_link smdk_dai[] = {
> > +       {
> > +               .name = "WM8580 PAIF PCM RX",
> > +               .stream_name = "Playback",
> > +               .cpu_dai_name = "samsung-pcm.0",
> > +               .codec_dai_name = "wm8580-hifi-playback",
> > +               .platform_name = "samsung-audio",
> > +               .codec_name = "wm8580-codec.0-001b",
> > +               .ops = &smdk_wm8580_pcm_ops,
> > +       }, {
> > +               .name = "WM8580 PAIF PCM TX",
> > +               .stream_name = "Capture",
> > +               .cpu_dai_name = "samsung-pcm.0",
> > +               .codec_dai_name = "wm8580-hifi-capture",
> > +               .platform_name = "samsung-audio",
> > +               .codec_name = "wm8580-codec.0-001b",
> > +               .ops = &smdk_wm8580_pcm_ops,
> > +       },
> > +};
> 
> IIRC the PCM DAI is connected to Secondary i/f of WM8580
> on some SMDKs. Isn't it smdk6410 ?

Yes, Your remember is right. SMDK6410 has WM8580 PCM DAI.
But, In this time, I couldn't test on SMDK6410.
After testing on SMDK6410, I will submit related patch.

Thanks and regards,
SB Kim

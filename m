From: Sangbeom Kim <sbkim73@samsung.com>
Subject: RE: [alsa-devel] [PATCH 1/4] ASoC: SAMSUNG: Modify I2S driver to
	support idma
Date: Mon, 13 Jun 2011 16:58:52 +0900
Message-ID: <005101cc299f$bde608d0$39b21a70$@com>
References: <1307606950-8310-1-git-send-email-sbkim73@samsung.com>
 <1307606950-8310-2-git-send-email-sbkim73@samsung.com>
 <BANLkTikbB6RG5Q+xGUEtxDzFGWSpe+c+6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:24043 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753085Ab1FMH6v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Jun 2011 03:58:51 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LMP00J7HY4DYHA0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 13 Jun 2011 16:58:50 +0900 (KST)
Received: from DOSBKIM7301 ([12.23.119.77])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LMP00BZCY61NS@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 13 Jun 2011 16:58:49 +0900 (KST)
In-reply-to: <BANLkTikbB6RG5Q+xGUEtxDzFGWSpe+c+6Q@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jassi Brar' <jassisinghbrar@gmail.com>
Cc: alsa-devel@alsa-project.org, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, lrg@slimlogic.co.uk

On Thu, Jun 9, 2011 at 8:31 PM, Jassi Brar wrote:
> 
> >        case 2:
> > +               if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> > +                       i2s->dma_playback.dma_size = 4;
> > +               else
> > +                       i2s->dma_capture.dma_size = 4;
> > +               break;
> 
> Why do we need this ?
This code don't need here, I will delete it.
> 
> 
> 
> > +       case 1:
> > +               if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> > +                       i2s->dma_playback.dma_size = 2;
> > +               else
> > +                       i2s->dma_capture.dma_size = 2;
> 
> I2S doesn't support Mono.
Yes, But some application require mono recording.
It is needed mono recording support.

> 
> >  #define SAMSUNG_I2S_RCLKSRC_0  0
> >  #define SAMSUNG_I2S_RCLKSRC_1  1
> > -#define SAMSUNG_I2S_CDCLK              2
> > +#define SAMSUNG_I2S_CDCLK      2
> Please avoid inconsequential changes.
OK,

> The need of i2s.h is for machine drivers. Please move these register/bit
> definitions to a new header(say i2s-regs.h) if we have to share them with
> idma.c
OK, I2S register have to share with idma, I will create new header file.

> 
> > +#define msecs_to_loops(t)      (loops_per_jiffy / 1000 * HZ * t)
> > +
> > +#define ST_RUNNING             (1<<0)
> > +#define ST_OPENED              (1<<1)
> These should be moved to the c file that uses them.
I will move it.

Thanks,

From: Sangbeom Kim <sbkim73@samsung.com>
Subject: RE: [alsa-devel] [PATCH 3/4] ASoC: SAMSUNG: Change platform driver for
 SMDKs
Date: Mon, 13 Jun 2011 10:47:21 +0900
Message-ID: <004401cc296b$d62fd440$828f7cc0$@com>
References: <1307606950-8310-1-git-send-email-sbkim73@samsung.com>
 <1307606950-8310-4-git-send-email-sbkim73@samsung.com>
 <BANLkTinUk6CRdh8mYAk7fbd9Ga6iBRfcaA@mail.gmail.com>
 <000a01cc273e$49dc4610$dd94d230$@com>
 <BANLkTikswO-5LOreJq=OXutya_CzYUkh1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:58885 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754543Ab1FMBrT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 12 Jun 2011 21:47:19 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LMP00DXTGYS4EE0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 13 Jun 2011 10:47:17 +0900 (KST)
Received: from DOSBKIM7301 ([12.23.119.77])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LMP00J1ZGYT92@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 13 Jun 2011 10:47:17 +0900 (KST)
In-reply-to: <BANLkTikswO-5LOreJq=OXutya_CzYUkh1g@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jassi Brar' <jassisinghbrar@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, ben-linux@fluff.org, lrg@slimlogic.co.uk

On Thu, Jun 10, 2011 at 4:27 PM, Jassi Brar wrote:
> Though if then everything works fine with system and internal DMA,
> maybe it is better to assign platform_name string at runtime from some
> module parameter, and leaving the default to normal system DMA ?
OK, I will leaving the default to system DMA,
 
> > But I had found some problem and want to share.
> > Like this patch, If different platform driver is used for each channel,
> > 1st channel is overwritten by platform driver of 2nd channel.
> > Have you ever experienced before like this problem?
> IIRC, I successfully tested using system DMA with primary and iDMA
> with secondary channel. Only the sec chan would keep playing when
> the system went to suspend. Though tt was long time ago and I don't
> remember
> which Samsung kernel version.
Your test condition is little different with my test condition.
You are using wrapper architecture. 
But I used each driver architecture.
Like in this patch, I assigned like below

{ /* Primary DAI i/f */
                .name = "WM8994 AIF1",
                .stream_name = "Pri_Dai",
                .cpu_dai_name = "samsung-i2s.0",
                .codec_dai_name = "wm8994-aif1",
                .platform_name = "samsung-audio",
                .codec_name = "wm8994-codec",
                .init = smdk_wm8994_init_paiftx,
                .ops = &smdk_ops,
        },
        { /* Sec_Fifo Playback i/f */
                .name = "Sec_FIFO TX",
                .stream_name = "Sec_Dai",
                .cpu_dai_name = "samsung-i2s.4",
                .codec_dai_name = "wm8994-aif1",
                .platform_name = "samsung-idma",
                .codec_name = "wm8994-codec",
                .ops = &smdk_ops,
        },

Primary is used by system dma,
Secondary is used by idma,

I try to use secondary by aplay, It can work fine.
============================================================================
==============
[root@samsung ~]# /mars/bin/aplay -Dplughw:0,1,0
/mars/share/sounds/alsa/Front_Center.wav
Entered idma_open
Playing WAVE '/mars/share/sounds/alsa/Front_Center.wav' [I2S] Initialize
sec_fifo idma
[I2S] Done hw params 
Entered idma_hw_params
idma_setcallbk:125 dma_period=2000
DmaAddr=@2020000 Total=96000bytes PrdSz=8192 #Prds=11 dma_area=0xd0840000
Entered idma_mmap
Entered idma_prepare
: Signed 16 bit Little Endian, Rate 48000 Hz, Mono
Entered idma_trigger
Entered idma_pointer, regs=d0822000
Pointer 2020004 
Snip.................
Entered idma_pointer, regs=d0822000
Pointer 202e00c 
Entered idma_pointer, regs=d0822000
Pointer 203000c 
Entered idma_pointer, regs=d0822000
Pointer 203200c 
Entered idma_pointer, regs=d0822000
Pointer 203400c 
Entered idma_pointer, regs=d0822000
Pointer 203600c 
Entered idma_trigger
Entered idma_hw_free
Entered idma_hw_free
Entered idma_close, prtd = cedb8bc0
[root@Samsung ~]#
============================================================================
==============
There is no problem and sound is good,

But If I try to use primary i/f, It can't work properly.
============================================================================
==============
[root@samsung ~]# /mars/bin/aplay -Dplughw:0,0,0
/mars/share/sounds/alsa/Front_Center.wav
Entered dma_open
Playing WAVE '/mars/share/sounds/alsa/Front_Center.wav' : Signed 16 bit
Little Endian, Rate 48000 Hz, Mono
[I2S] Done hw params 
Entered dma_hw_params
params cf82e6b0, client cf82e6b0, channel 16
Entered idma_mmap
Entered dma_prepare
Entered dma_enqueue
dma_enqueue: loaded 0, limit 12
dma_loaded: 0
dma_loaded: 1
dma_loaded: 2
dma_loaded: 3
dma_loaded: 4
dma_loaded: 5
dma_loaded: 6
dma_loaded: 7
dma_loaded: 8
dma_loaded: 9
dma_loaded: 10
dma_loaded: 11
Entered dma_trigger
Entered idma_pointer, regs=d0822000
Pointer 2020000 
Entered audio_buffdone

Snip....................

Pointer 2020000 
Entered audio_buffdone
Entered idma_pointer, regs=d0822000
Pointer 2020000 
Entered dma_trigger
Entered audio_buffdone
Entered dma_prepare
Entered audio_buffdone
Entered audio_buffdone
Entered dma_enqueue
dma_enqueue: loaded 0, limit 12
dma_loaded: 0
dma_loaded: 1
dma_loaded: 2
dma_loaded: 3
dma_loaded: 4
dma_loaded: 5
dma_loaded: 6
dma_loaded: 7
dma_loaded: 8
dma_loaded: 9
dma_loaded: 10
dma_loaded: 11
underrun!!! (at least 0.072 ms long)
Entered dma_trigger
Entered idma_pointer, regs=d0822000
Pointer 2020000 
Entered audio_buffdone
Entered idma_pointer, regs=d0822000
Pointer 2020000 
Snip................
Entered audio_buffdone
Entered idma_pointer, regs=d0822000
Pointer 2020000 
Entered dma_trigger
Entered audio_buffdone
Entered dma_prepare
Entered audio_buffdone
Entered audio_buffdone
Entered audio_buffdone
Entered audio_buffdone
Entered dma_enqueue
dma_enqueue: loaded 0, limit 12
dma_loaded: 0
dma_loaded: 1
dma_loaded: 2
dma_loaded: 3
dma_loaded: 4
dma_loaded: 5
dma_loaded: 6
dma_loaded: 7
dma_loaded: 8
dma_loaded: 9
dma_loaded: 10
dma_loaded: 11
Entered dma_trigger
underrun!!! (at least 0.030 ms long)
Entered audio_buffdone
Entered idma_pointer, regs=d0822000
Pointer 2020000 
Entered audio_buffdone
Entered idma_pointer, regs=d0822000
Pointer 2020000 
Entered audio_buffdone
Snip ............
Entered audio_buffdone
Entered idma_pointer, regs=d0822000
Pointer 2020000 
Entered dma_trigger
Entered audio_buffdone
Entered dma_hw_free
Entered audio_buffdone
Entered audio_buffdone
Entered audio_buffdone
Entered audio_buffdone
Entered audio_buffdone
Entered dma_hw_free
Entered dma_close
============================================================================
====
As you see above debugging log, Although system dma is assigned, instead
using dma api, idma api is used.
This is not a dma & idma driver's bug. This is platform driver handling
bugs. 
There is no machine driver using different platform driver in the ASoC.
So I guess that It is never confirmed before.
I want to share this problem. and I want to fix this problem. 
So I want to get your opinion.
Please check the above debug log and give your advice.

Thanks,
SB Kim

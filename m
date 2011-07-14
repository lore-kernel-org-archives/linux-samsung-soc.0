From: Marco Sinigaglia <marco.sinigaglia@csr.com>
Subject: AC97 on S3C6410
Date: Thu, 14 Jul 2011 16:04:54 +0000 (UTC)
Message-ID: <loom.20110714T180046-429@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:33414 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755350Ab1GNQUN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Jul 2011 12:20:13 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glks-linux-samsung-soc@m.gmane.org>)
	id 1QhOe0-00074d-Jf
	for linux-samsung-soc@vger.kernel.org; Thu, 14 Jul 2011 18:20:08 +0200
Received: from 193.128.72.68 ([193.128.72.68])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jul 2011 18:20:08 +0200
Received: from marco.sinigaglia by 193.128.72.68 with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jul 2011 18:20:08 +0200
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hi,

I am rying to implement the AC97, on S3C6410, using the WM9714.
I have done some big step forward but I am now hitting another issue.

The kernel can see the WM9714:
<6>ALSA device list:
<6>  #0: SMDK (WM9713)

Anyway, after that, i cannot see anymore activity on the AC97 bus.
I got, indeed, these errors:

<3>s3c-ac97: req addr = 12, rep addr = 00
[...]
<3>s3c-ac97: req addr = 12, rep addr = 00

When I try to play something, i got this :


<7>Entered s3c_dma_open
<7>asoc: AC97 HiFi <-> s3c-ac97 info:
<7>asoc: rate mask 0xd6
<7>asoc: min ch 2 max ch 2
<7>asoc: min rate 8000 max rate 48000
<7>Entered s3c_dma_hw_params
<7>params c0665190, client c0665278, channel 22
<7>dma22: s3c2410_request_dma: client=AC97 PCMOut, dev=(null)
<7>MS10 channel number 22 
<7>DMA8: 00000000->00000000 L 00000000 C 00000000,00000000 S 00000000
<7>s3c2410_dma_request: channel initialised, c06779c8
<7>Entered s3c_dma_prepare
<7>s3c2410_dma_devconfig: channel 22, source 1, dev 7f001018, chan c06779c8
<7>s3c2410_dma_devconfig: peripheral 6
<7>s3c2410_dma_devconfig: config 0000c980
<7>DMA8: 00000000->00000000 L 00000000 C 00000000,00000000 S 0000c980
<7>s3c64xx_dma_flush: flushing channel
<7>Entered s3c_dma_enqueue
<7>s3c_dma_enqueue: loaded 0, limit 11
<7>dma_loaded: 0
<7>dma enqueue channel num 22, reg cf00c100
<7>s3c2410_dma_enqueue: buff c6e4f4e0, dp 5e740000 lli (ffcd6000, 56ea3000) 8192
<7>enquing onto empty channel num 22
<7>s3c64xx_lli_to_regs: LLI ffcd6000 => regs
<7>LLI[ffcd6000] 5e740000->7f001018, NL 00000000 C 96480000,00000800
<7>LLI[ffcd6000] 5e740000->7f001018, NL 00000000 C 96480000,00000800
<7>DMA8: 5e740000->7f001018 L 00000000 C 96480000,00000000 S 0000c980
<7>DMA8: buffs next c6e4f4e0, curr c6e4f4e0, end c6e4f4e0
<7>dma_loaded: 1
<7>dma enqueue channel num 22, reg cf00c100
<7>s3c2410_dma_enqueue: buff c6e4f540, dp 5e742000 lli (ffcd6020, 56ea3020) 8192
<7>enquing onto channel num 22
<7>LLI[ffcd6000] 5e740000->7f001018, NL 56ea3020 C 96480000,00000800
<7>LLI[ffcd6020] 5e742000->7f001018, NL 56ea3000 C 96480000,00000800
<7>DMA8: 5e740000->7f001018 L 56ea3020 C 96480000,00000000 S 0000c980
<7>DMA8: buffs next c6e4f540, curr c6e4f4e0, end c6e4f540
<7>dma_loaded: 2
<7>dma enqueue channel num 22, reg cf00c100
<7>s3c2410_dma_enqueue: buff c6e4f560, dp 5e744000 lli (ffcd6040, 56ea3040) 8192
<7>enquing onto channel num 22
<7>LLI[ffcd6020] 5e742000->7f001018, NL 56ea3040 C 96480000,00000800
<7>LLI[ffcd6040] 5e744000->7f001018, NL 56ea3000 C 96480000,00000800
<7>DMA8: 5e740000->7f001018 L 56ea3020 C 96480000,00000000 S 0000c980
<7>DMA8: buffs next c6e4f540, curr c6e4f4e0, end c6e4f560
<7>dma_loaded: 3
<7>dma enqueue channel num 22, reg cf00c100
<7>s3c2410_dma_enqueue: buff c6e4f580, dp 5e746000 lli (ffcd6060, 56ea3060) 8192
<7>enquing onto channel num 22
<7>LLI[ffcd6040] 5e744000->7f001018, NL 56ea3060 C 96480000,00000800
<7>LLI[ffcd6060] 5e746000->7f001018, NL 56ea3000 C 96480000,00000800
<7>DMA8: 5e740000->7f001018 L 56ea3020 C 96480000,00000000 S 0000c980
<7>DMA8: buffs next c6e4f540, curr c6e4f4e0, end c6e4f580
<7>dma_loaded: 4
<7>dma enqueue channel num 22, reg cf00c100
<7>s3c2410_dma_enqueue: buff c6e4f5a0, dp 5e748000 lli (ffcd6080, 56ea3080) 8192
<7>enquing onto channel num 22
<7>LLI[ffcd6060] 5e746000->7f001018, NL 56ea3080 C 96480000,00000800
<7>LLI[ffcd6080] 5e748000->7f001018, NL 56ea3000 C 96480000,00000800
<7>DMA8: 5e740000->7f001018 L 56ea3020 C 96480000,00000000 S 0000c980
<7>DMA8: buffs next c6e4f540, curr c6e4f4e0, end c6e4f5a0
<7>dma_loaded: 5
<7>dma enqueue channel num 22, reg cf00c100
<7>s3c2410_dma_enqueue: buff c6e4f5c0, dp 5e74a000 lli (ffcd60a0, 56ea30a0) 8192
<7>enquing onto channel num 22
<7>LLI[ffcd6080] 5e748000->7f001018, NL 56ea30a0 C 96480000,00000800
<7>LLI[ffcd60a0] 5e74a000->7f001018, NL 56ea3000 C 96480000,00000800
<7>DMA8: 5e740000->7f001018 L 56ea3020 C 96480000,00000000 S 0000c980
<7>DMA8: buffs next c6e4f540, curr c6e4f4e0, end c6e4f5c0
<7>dma_loaded: 6
<7>dma enqueue channel num 22, reg cf00c100
<7>s3c2410_dma_enqueue: buff c6e4f5e0, dp 5e74c000 lli (ffcd60c0, 56ea30c0) 8192
<7>enquing onto channel num 22
<7>LLI[ffcd60a0] 5e74a000->7f001018, NL 56ea30c0 C 96480000,00000800
<7>LLI[ffcd60c0] 5e74c000->7f001018, NL 56ea3000 C 96480000,00000800
<7>DMA8: 5e740000->7f001018 L 56ea3020 C 96480000,00000000 S 0000c980
<7>DMA8: buffs next c6e4f540, curr c6e4f4e0, end c6e4f5e0
<7>dma_loaded: 7
<7>dma enqueue channel num 22, reg cf00c100
<7>s3c2410_dma_enqueue: buff c6e4f600, dp 5e74e000 lli (ffcd60e0, 56ea30e0) 8192
<7>enquing onto channel num 22
<7>LLI[ffcd60c0] 5e74c000->7f001018, NL 56ea30e0 C 96480000,00000800
<7>LLI[ffcd60e0] 5e74e000->7f001018, NL 56ea3000 C 96480000,00000800
<7>DMA8: 5e740000->7f001018 L 56ea3020 C 96480000,00000000 S 0000c980
<7>DMA8: buffs next c6e4f540, curr c6e4f4e0, end c6e4f600
<7>dma_loaded: 8
<7>dma enqueue channel num 22, reg cf00c100
<7>s3c2410_dma_enqueue: buff c6e4f620, dp 5e750000 lli (ffcd6100, 56ea3100) 8192
<7>enquing onto channel num 22
<7>LLI[ffcd60e0] 5e74e000->7f001018, NL 56ea3100 C 96480000,00000800
<7>LLI[ffcd6100] 5e750000->7f001018, NL 56ea3000 C 96480000,00000800
<7>DMA8: 5e740000->7f001018 L 56ea3020 C 96480000,00000000 S 0000c980
<7>DMA8: buffs next c6e4f540, curr c6e4f4e0, end c6e4f620
<7>dma_loaded: 9
<7>dma enqueue channel num 22, reg cf00c100
<7>s3c2410_dma_enqueue: buff c6e4f640, dp 5e752000 lli (ffcd6120, 56ea3120) 8192
<7>enquing onto channel num 22
<7>LLI[ffcd6100] 5e750000->7f001018, NL 56ea3120 C 96480000,00000800
<7>LLI[ffcd6120] 5e752000->7f001018, NL 56ea3000 C 96480000,00000800
<7>DMA8: 5e740000->7f001018 L 56ea3020 C 96480000,00000000 S 0000c980
<7>DMA8: buffs next c6e4f540, curr c6e4f4e0, end c6e4f640
<7>dma_loaded: 10
<7>dma enqueue channel num 22, reg cf00c100
<7>s3c2410_dma_enqueue: buff c6e4f660, dp 5e754000 lli (ffcd6140, 56ea3140) 8192
<7>enquing onto channel num 22
<7>LLI[ffcd6120] 5e752000->7f001018, NL 56ea3140 C 96480000,00000800
<7>LLI[ffcd6140] 5e754000->7f001018, NL 56ea3000 C 96480000,00000800
<7>DMA8: 5e740000->7f001018 L 56ea3020 C 96480000,00000000 S 0000c980
<7>DMA8: buffs next c6e4f540, curr c6e4f4e0, end c6e4f660
<7>Entered s3c_dma_trigger
<7>DMA8: 5e740000->7f001018 L 56ea3020 C 96480000,00000000 S 0000c980
<7>s3c64xx_dma_start: clearing interrupts, chan number 8, reg cf00c100 
<7>s3c64xx_dma_start: starting channel
<7>s3c64xx_dma_start: writing config 0000c981
<7>Entered s3c_dma_pointer
<7>Pointer 5e740010 7f001018
<7>Entered s3c_dma_pointer
<7>Pointer 5e740010 7f001018
<7>ALSA sound/core/pcm_lib.c:1755: playback write error (DMA or IRQ trouble?)
<7>Entered s3c_dma_pointer
<7>Pointer 5e740010 7f001018
<7>ALSA sound/core/pcm_lib.c:1755: playback write error (DMA or IRQ trouble?)
<7>Entered s3c_dma_trigger
<7>s3c64xx_dma_stop: stopping channel
<7>DMA8: 5e740010->7f001018 L 56ea3020 C 96480000,00000800 S 0002c981



I have the feeling that, for some reasons, the DMA is not doing its job.
I have added the following line on the init of dma.c but it does not fix the 
error:
s3c64xx_dma_init1(8, DMACH_AC97_PCMOUT, IRQ_DMA1, 0x75100000);

Can someone, please, give me some feedback?

I am using kernel 2.6.35 and the head of Android.

Cheers
Marco 

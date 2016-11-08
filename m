From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH RFC 0/7] DMA: S3C64XX: Conversion to the new channel
 request API
Date: Tue, 8 Nov 2016 15:39:49 +0000
Message-ID: <20161108153949.GF1575@localhost.localdomain>
References: <1478276094-19135-1-git-send-email-s.nawrocki@samsung.com>
 <1478276094-19135-2-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:51239 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752737AbcKHPkN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Nov 2016 10:40:13 -0500
Content-Disposition: inline
In-Reply-To: <1478276094-19135-2-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, vinod.koul@intel.com, broonie@kernel.org, ym0914@gmail.com, arnd@arndb.de, kgene@kernel.org, javier@osg.samsung.com, andi.shyti@samsung.com, sbkim73@samsung.com

On Fri, Nov 04, 2016 at 05:14:47PM +0100, Sylwester Nawrocki wrote:
> This patch series aims to convert the s3c64xx platform to use
> the new universal DMA channel request API, i.e. this is only
> meaningful for non-dt systems using s3c64xx SoCs.
> 
> I'm sending the whole series as RFC since I didn't test it
> yet, I'm going to prepare smd6410 for testing this series.
> It would be great if someone else could also test it,
> either SPI or sound functionality verification would be 
> useful.
> 
> Then we could queue the first two patches in this series
> for v4.10-rc1 and the remaining patches for subsequent
> release.
> 
> The whole series can be pulled from git repository:
>  git://linuxtv.org/snawrocki/samsung.git 
>  branch: for-v4.10/dma/pl080-s3c64xx
> 
> Thanks.
> 
> Sylwester Nawrocki (7):
>   dma: pl08x: Add support for the DMA slave map
>   ARM: S3C64XX: Add DMA slave maps for PL080 devices
>   spi: s3c64xx: Do not use platform_data for DMA parameters
>   ASoC: samsung: i2s: Do not use platform_data for DMA parameters
>   ASoC: samsung: pcm: Do not use platform_data for DMA parameters
>   ARM: S3C64XX: Drop unused DMA fields from struct s3c64xx_spi_csinfo
>   ARM: S3C64XX: Drop initialization of unused struct s3c_audio_pdata
>     fields
> 

Hmm... fixing the bug I mentioned in my other email this still
seems to cause some problems with my SPI on Cragganmore:

[  200.210213] wm0010 spi0.0: I/O Error: rx-1 tx-1 res:rx-f tx-f len-2632
[  200.211275] wm0010 spi0.0: SPI transfer failed: -5

I am still looking into it, without your patches work the wm0010
comes up. A few other small things seem to have been broken in
mainline since last time I fired up this board as well which is
slowing me down a little (network seems to have stopped coming
up and one of the regulators on the SD card is spamming me with
warnings).

Thanks,
Charles

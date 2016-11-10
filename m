From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH RFC 2/7] ARM: S3C64XX: Add DMA slave maps for PL080
 devices
Date: Thu, 10 Nov 2016 15:18:16 +0000
Message-ID: <20161110151816.GI1575@localhost.localdomain>
References: <1478276094-19135-1-git-send-email-s.nawrocki@samsung.com>
 <1478276094-19135-4-git-send-email-s.nawrocki@samsung.com>
 <20161108144445.GD1575@localhost.localdomain>
 <CGME20161108145620epcas2p4b8e2ec5ffdd4bf04ab3bf0728b46e3f2@epcas2p4.samsung.com>
 <20161108145534.GE1575@localhost.localdomain>
 <f53d533d-163f-31f3-4efb-0e39d201589d@samsung.com>
 <20161110110323.GG1575@localhost.localdomain>
 <b654d5f7-7b67-7216-760f-d29e49a29296@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:60289 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S933991AbcKJPSr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Nov 2016 10:18:47 -0500
Content-Disposition: inline
In-Reply-To: <b654d5f7-7b67-7216-760f-d29e49a29296@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, vinod.koul@intel.com, broonie@kernel.org, ym0914@gmail.com, arnd@arndb.de, kgene@kernel.org, javier@osg.samsung.com, andi.shyti@samsung.com, sbkim73@samsung.com

On Thu, Nov 10, 2016 at 04:10:56PM +0100, Sylwester Nawrocki wrote:
> On 11/10/2016 12:03 PM, Charles Keepax wrote:
> >> On Tue, Nov 08, 2016 at 04:53:40PM +0100, Sylwester Nawrocki wrote:
> [...]
> >> I pushed now to branch for-v4.10/dma/pl080-s3c64xx-v2 with this
> >> issue fixed and added initialization of the filer function.
> > 
> > Apologies for the delay got somewhat swamped with internal stuff
> > yesterday. Yeah using that branch it looks good to me, the SPI and
> > I2S are both working fine. I can download code to the wm0010
> > which should be a good work out of the SPI and play audio
> > correctly so the I2S should be fine. So for the series:
> > 
> > Tested-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> 
> Great, thanks a lot!  I'm going to post the next iteration with
> modified pl080 DMAC patches, addressing comments from Arnd.
> I would be grateful if you could confirm it also works on your
> platform.
> 

Yeah, no problem, I should be able to find time to test those as
well.

Thanks,
Charles

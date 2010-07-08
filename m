From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: S3C2416 fixes (gpiolib, SDHCI, compilation without FB device)
Date: Thu, 08 Jul 2010 09:23:59 +0200
Message-ID: <000201cb1e6e$8b3f7a20$a1be6e60$%szyprowski@samsung.com>
References: <1277212585-25605-1-git-send-email-jekhor@gmail.com>
 <4C248B23.7060905@gmail.com>
 <000001cb1687$638b2310$2aa16930$%szyprowski@samsung.com>
 <4C3361BC.2040204@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:48059 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754179Ab0GHHZO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Jul 2010 03:25:14 -0400
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L5800FCM9Y0BP90@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 Jul 2010 16:25:13 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L580054L9XWPR@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 Jul 2010 16:25:12 +0900 (KST)
In-reply-to: <4C3361BC.2040204@gmail.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Darius Augulis' <augulis.darius@gmail.com>
Cc: 'Yauhen Kharuzhy' <jekhor@gmail.com>, 'Vasily Khoruzhick' <anarsoul@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Ben Dooks' <ben-linux@fluff.org>

Hello,

On Tuesday, July 06, 2010 7:03 PM Darius Augulis wrote:

> On 06/28/2010 09:01 AM, Marek Szyprowski wrote:
> > Hello,
> >
> > On Friday, June 25, 2010 12:56 PM Darius Augulis wrote:
> >
> >> On 06/22/2010 04:16 PM, Yauhen Kharuzhy wrote:
> >>> This patch series fixes SDHCI on S3C2416. I got SD card working with
> this
> >> patches
> >>> and with patches for GPIO card detection support by Marek Szyprowski.
> >>>
> >>
> >> Unfortunately I did not get SD card working with these patches. I'm
> >> using custom board, not SMDK2416, but SD slot connection and schematics
> >> are the same like in SMDK2416. I've tried to debug a bit this problem
> >> and this is what I got: kernel do detection of card insert/remove,
> >> driver prints messages:
> >>
> >> s3c-sdhci s3c-sdhci.1: card inserted.
> >> s3c-sdhci s3c-sdhci.1: card removed.
> >>
> >> Then I put some printk in s3c-sdhci driver and MMC core and found that
> >> mmc_rescan() is called only once at startup and no more when
> >> inserting/removing SD card. Also mmc_rescan() stops at that point where
> >> mmc_power_up() is called and does not return. And mmc_power_up() stops
> >> where mmc_delay(10) is called and does not return too.
> >> Every time when inserting/removing SD card only functions
> >> sdhci_tasklet_card() and mmc_detect_change() are called, and nothing
> >> happens. Kernel doesn't detect the card inserted.
> >> Maybe this info could help to debug where the problem is - in my custom
> >> board or in your patches?
> >
> > Have you tried with polled card detection method (SDHCI_CD_NONE)? If it
> > doesn't work I suspect something with the hardware. Checking with mmc
> debug
> > enabled might also help figuring this issue out.
> 
> yes, I've tried that, but didn't get sd card working. I got schematics
> from China manufacturer, SD card connection is the same like in
> smdk2416. with mmc debug enabled I found that SD card is detected when
> inserted or removed, but after detection card initialisation is not
> performed.

Does it work without my patches or with other Linux kernel? You can try to 
check the custom Linux 2.6.29 from 
git://git.kernel.org/pub/scm/linux/kernel/git/kki_ap/linux-2.6-samsung.git

I would like to know whether my patches cause the problem or there is some
kind of hardware issue with your board.

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center

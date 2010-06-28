From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: S3C2416 fixes (gpiolib, SDHCI, compilation without FB device)
Date: Mon, 28 Jun 2010 08:01:40 +0200
Message-ID: <000001cb1687$638b2310$2aa16930$%szyprowski@samsung.com>
References: <1277212585-25605-1-git-send-email-jekhor@gmail.com>
 <4C248B23.7060905@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:54967 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753548Ab0F1GDF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jun 2010 02:03:05 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L4P00KXXNGMXGD0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Jun 2010 15:02:46 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L4P00CTUNGIZ8@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Jun 2010 15:02:46 +0900 (KST)
In-reply-to: <4C248B23.7060905@gmail.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Darius Augulis' <augulis.darius@gmail.com>, 'Yauhen Kharuzhy' <jekhor@gmail.com>
Cc: 'Vasily Khoruzhick' <anarsoul@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Ben Dooks' <ben-linux@fluff.org>

Hello,

On Friday, June 25, 2010 12:56 PM Darius Augulis wrote:

> On 06/22/2010 04:16 PM, Yauhen Kharuzhy wrote:
> > This patch series fixes SDHCI on S3C2416. I got SD card working with this
> patches
> > and with patches for GPIO card detection support by Marek Szyprowski.
> >
> 
> Unfortunately I did not get SD card working with these patches. I'm
> using custom board, not SMDK2416, but SD slot connection and schematics
> are the same like in SMDK2416. I've tried to debug a bit this problem
> and this is what I got: kernel do detection of card insert/remove,
> driver prints messages:
> 
> s3c-sdhci s3c-sdhci.1: card inserted.
> s3c-sdhci s3c-sdhci.1: card removed.
> 
> Then I put some printk in s3c-sdhci driver and MMC core and found that
> mmc_rescan() is called only once at startup and no more when
> inserting/removing SD card. Also mmc_rescan() stops at that point where
> mmc_power_up() is called and does not return. And mmc_power_up() stops
> where mmc_delay(10) is called and does not return too.
> Every time when inserting/removing SD card only functions
> sdhci_tasklet_card() and mmc_detect_change() are called, and nothing
> happens. Kernel doesn't detect the card inserted.
> Maybe this info could help to debug where the problem is - in my custom
> board or in your patches?

Have you tried with polled card detection method (SDHCI_CD_NONE)? If it
doesn't work I suspect something with the hardware. Checking with mmc debug
enabled might also help figuring this issue out.

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center

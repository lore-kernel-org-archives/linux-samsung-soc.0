From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 08/17] ARM: S5PC100: no more support S5PC100 SoC
Date: Tue, 01 Jul 2014 14:35:39 +0200
Message-ID: <5607904.sLYTrVXTVU@wuerfel>
References: <1404210076-2362-1-git-send-email-kgene.kim@samsung.com> <5806444.UHVgoFeOY3@wuerfel> <03ef01cf9526$83e93b70$8bbbb250$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:61738 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751497AbaGAMgR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Jul 2014 08:36:17 -0400
In-Reply-To: <03ef01cf9526$83e93b70$8bbbb250$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Russell King' <rmk+kernel@arm.linux.org.uk>, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org

On Tuesday 01 July 2014 21:18:07 Kukjin Kim wrote:
> > 
> > >  config SAMSUNG_DMADEV
> > >        bool "Use legacy Samsung DMA abstraction"
> > > -       depends on CPU_S5PV210 || CPU_S5PC100 || ARCH_S3C64XX
> > > +       depends on CPU_S5PV210 || ARCH_S3C64XX
> > >         select DMADEVICES
> > >         default y
> > >        help
> > 
> > It would be good to just kill this one off now, as nothing uses it
> > any more, but that's also a separate patch.
> > 
> Maybe it is still used for s5pv210 and s3c64xx? If I misunderstand your
> comments, please kindly let me know.

samsung-dmadev used to be used in a number of device drivers, but I believe
they have all been converted to using dmaengine interfaces now.

	Arnd

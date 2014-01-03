From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: Boot hang on Origen with (!SMP && CPU_IDLE)
Date: Fri, 03 Jan 2014 14:58:05 +0100
Message-ID: <2428340.zXRbG18t7N@amdc1227>
References: <CAHbNUh1LF9+v1en==t8znAL518ERWE2LffTDykAEb2HST+WKTw@mail.gmail.com>
 <201401031437.10624.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:59213 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751242AbaACN6L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Jan 2014 08:58:11 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MYT00HNKW4XJT80@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 03 Jan 2014 13:58:09 +0000 (GMT)
In-reply-to: <201401031437.10624.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Tushar Behera <tushar.behera@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kgene Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Friday 03 of January 2014 14:37:10 Arnd Bergmann wrote:
> On Friday 03 January 2014, Tushar Behera wrote:
> > Hi,
> > 
> > We are getting boot-time system hang on Exynos4210-based Origen board
> > if the kernel (right now testing v3.13-rc6) is built using
> > exynos_defconfig, disabling SMP support and enabling CPU_IDLE support.
> > The boot log can be found here[1].
> > 
> > Git bisect points to following commit.
> > 
> > commit 87107d89052bcec1fe91b309631de4ed294a5171
> > Author: Arnd Bergmann <arnd@arndb.de>
> > Date:   Wed Jun 19 01:36:52 2013 +0900
> > 
> >     ARM: EXYNOS: Remove legacy L2X0 initialization
> > 
> >     Since Exynos is now supporting only DT-based boot, the old L2X0
> >     initialization code is not needed anymore, so exynos4_l2x0_cache_init()
> >     can be greatly simplified.
> > 
> >     Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >     Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> >     Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> >     Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > 
> > Reverting the changes, the kernel boots up.
> > 
> > Any idea what else we might be missing?
> > 
> > [1] http://pastebin.com/0mP6ML4y
> 
> Hmm, the boot log contains no message about the l2 cache controller getting
> initialized, which means that l2x0_of_init probably failed before calling
> l2x0_init. It also seems that the dts files distributed with the kernel
> are lacking nodes for the l2x0 device, which is indeed a perfectly good
> explanation although it doesn't explain at all why it ever worked on
> any system with my patch.
> 
> Can you check if there is a correct cache controller node in your device
> tree, and whether it works when you add one? If so, we should probably
> add a couple of stable backport patches to the dts files. It would also
> be a good time to get rid of the L2_AUX_VAL and L2_AUX_MASK defines and
> just read the respective settings from DT.

Tushar, do you maybe also have CONFIG_CACHE_L2X0 enabled?

Generally I can see two different issues here:

1) Broken handling of L2 cache in plat-samsung/sleep.S. It assumes that
whenever CONFIG_CACHE_L2X0 is enabled, L2 cache is enabled too.

This needs to go away. On normal resume from sleep, there is no need to
do anything with L2X0 at such early stage. This reinitialization can be
safely done later, by calling generic outer_resume().

The problem shows up when you look at AFTR and LPA idle modes. They keep
L2 cache contents, but L2X0 registers must be restored to let the cache
operate normally. This must happen early enough to keep cache data
consistent. Still, the code doing this must consider whether the cache
was enabled before entering AFTR/LPA and whether secure firmware is used
(see below), so this is a bit tricky.

2) There is no L2 cache controller node in Exynos4*.dtsi.

It should be added, but L2 cache can't be enabled on all boards yet,
since on boards where secure firmware is enabled, special configuration
involving SMC calls is required. Patches for this are queued on my work
queue, but it's quite tricky due to 1), which needs to consider whether
secure firmware is enabled or not.

Best regards,
Tomasz

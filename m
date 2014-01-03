From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Boot hang on Origen with (!SMP && CPU_IDLE)
Date: Fri, 3 Jan 2014 14:37:10 +0100
Message-ID: <201401031437.10624.arnd@arndb.de>
References: <CAHbNUh1LF9+v1en==t8znAL518ERWE2LffTDykAEb2HST+WKTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:60508 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751086AbaACNhQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Jan 2014 08:37:16 -0500
In-Reply-To: <CAHbNUh1LF9+v1en==t8znAL518ERWE2LffTDykAEb2HST+WKTw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kgene Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Friday 03 January 2014, Tushar Behera wrote:
> Hi,
> 
> We are getting boot-time system hang on Exynos4210-based Origen board
> if the kernel (right now testing v3.13-rc6) is built using
> exynos_defconfig, disabling SMP support and enabling CPU_IDLE support.
> The boot log can be found here[1].
> 
> Git bisect points to following commit.
> 
> commit 87107d89052bcec1fe91b309631de4ed294a5171
> Author: Arnd Bergmann <arnd@arndb.de>
> Date:   Wed Jun 19 01:36:52 2013 +0900
> 
>     ARM: EXYNOS: Remove legacy L2X0 initialization
> 
>     Since Exynos is now supporting only DT-based boot, the old L2X0
>     initialization code is not needed anymore, so exynos4_l2x0_cache_init()
>     can be greatly simplified.
> 
>     Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>     Signed-off-by: Tomasz Figa <t.figa@samsung.com>
>     Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>     Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> 
> Reverting the changes, the kernel boots up.
> 
> Any idea what else we might be missing?
> 
> [1] http://pastebin.com/0mP6ML4y

Hmm, the boot log contains no message about the l2 cache controller getting
initialized, which means that l2x0_of_init probably failed before calling
l2x0_init. It also seems that the dts files distributed with the kernel
are lacking nodes for the l2x0 device, which is indeed a perfectly good
explanation although it doesn't explain at all why it ever worked on
any system with my patch.

Can you check if there is a correct cache controller node in your device
tree, and whether it works when you add one? If so, we should probably
add a couple of stable backport patches to the dts files. It would also
be a good time to get rid of the L2_AUX_VAL and L2_AUX_MASK defines and
just read the respective settings from DT.

	Arnd

From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: Boot hang on Origen with (!SMP && CPU_IDLE)
Date: Mon, 6 Jan 2014 16:01:42 +0530
Message-ID: <CAHbNUh18WkH4CFcaeP1Tdjm3L-Rr0xVzgCnAHoPbbCFRWjKyxg@mail.gmail.com>
References: <CAHbNUh1LF9+v1en==t8znAL518ERWE2LffTDykAEb2HST+WKTw@mail.gmail.com>
	<201401031437.10624.arnd@arndb.de>
	<2428340.zXRbG18t7N@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:56082 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752082AbaAFKbm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Jan 2014 05:31:42 -0500
Received: by mail-ob0-f174.google.com with SMTP id wn1so18086585obc.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jan 2014 02:31:42 -0800 (PST)
In-Reply-To: <2428340.zXRbG18t7N@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kyungmin Park <kyungmin.park@samsung.com>, Kgene Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 3 January 2014 19:28, Tomasz Figa <t.figa@samsung.com> wrote:
> On Friday 03 of January 2014 14:37:10 Arnd Bergmann wrote:
>> On Friday 03 January 2014, Tushar Behera wrote:

[ ... ]

>> Hmm, the boot log contains no message about the l2 cache controller getting
>> initialized, which means that l2x0_of_init probably failed before calling
>> l2x0_init. It also seems that the dts files distributed with the kernel
>> are lacking nodes for the l2x0 device, which is indeed a perfectly good
>> explanation although it doesn't explain at all why it ever worked on
>> any system with my patch.
>>
>> Can you check if there is a correct cache controller node in your device
>> tree, and whether it works when you add one? If so, we should probably
>> add a couple of stable backport patches to the dts files. It would also

The device tree node for l2x0 device was missing. After adding a node
as below I can start booting Origen board.

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts
b/arch/arm/boot/dts/exynos4210-origen.dts
index 1a12fb2..675f323 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -32,6 +32,13 @@

+       l2-cache-controller@10502000 {
+               compatible = "arm,pl310-cache";
+               reg = <0x10502000 0x1000>;
+               cache-unified;
+               cache-level = <2>;
+       };
+

>> be a good time to get rid of the L2_AUX_VAL and L2_AUX_MASK defines and
>> just read the respective settings from DT.

Ok.

>
> Tushar, do you maybe also have CONFIG_CACHE_L2X0 enabled?
>

Yes, this config option is enabled. If this is disabled, I don't see
this problem.

> Generally I can see two different issues here:
>
> 1) Broken handling of L2 cache in plat-samsung/sleep.S. It assumes that
> whenever CONFIG_CACHE_L2X0 is enabled, L2 cache is enabled too.
>
> This needs to go away. On normal resume from sleep, there is no need to
> do anything with L2X0 at such early stage. This reinitialization can be
> safely done later, by calling generic outer_resume().
>
> The problem shows up when you look at AFTR and LPA idle modes. They keep
> L2 cache contents, but L2X0 registers must be restored to let the cache
> operate normally. This must happen early enough to keep cache data
> consistent. Still, the code doing this must consider whether the cache
> was enabled before entering AFTR/LPA and whether secure firmware is used
> (see below), so this is a bit tricky.
>
> 2) There is no L2 cache controller node in Exynos4*.dtsi.
>
> It should be added, but L2 cache can't be enabled on all boards yet,
> since on boards where secure firmware is enabled, special configuration
> involving SMC calls is required. Patches for this are queued on my work
> queue, but it's quite tricky due to 1), which needs to consider whether
> secure firmware is enabled or not.
>

In that case, would it be ok to add the node for Origen board only?

-- 
Tushar Behera

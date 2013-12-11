From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 3/5] clk: max77686: Replace is_enabled() with is_prepared
 call-back
Date: Wed, 11 Dec 2013 13:24:32 +0100
Message-ID: <20396343.nNtkmZyqTH@amdc1227>
References: <1386763029-8516-1-git-send-email-a.kesavan@samsung.com>
 <1386763029-8516-4-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:52700 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751058Ab3LKMYq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Dec 2013 07:24:46 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MXN00IYJ6H8TC50@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Dec 2013 12:24:44 +0000 (GMT)
In-reply-to: <1386763029-8516-4-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <a.kesavan@samsung.com>
Cc: dianders@chromium.org, olof@lixom.net, kgene.kim@samsung.com, jonghwa3.lee@samsung.com, yadi.brar@samsung.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org

Hi Abhilash,

On Wednesday 11 of December 2013 17:27:07 Abhilash Kesavan wrote:
> Following messages are observed when unused PMIC clocks are being
> disabled during boot-up:
> [ 2921.969560] BUG: scheduling while atomic: swapper/0/1/0x00000002
> [ 2921.974080] Modules linked in:
> [ 2921.977120] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 3.13.0-rc1-00018-g8465d57 #27
> [ 2921.984772] [<c0013c80>] (unwind_backtrace+0x0/0xf8) from [<c00110cc>] (show_stack+0x10/0x14)
> [ 2921.993269] [<c00110cc>] (show_stack+0x10/0x14) from [<c032c10c>] (dump_stack+0x64/0xa4)
> [ 2922.001340] [<c032c10c>] (dump_stack+0x64/0xa4) from [<c0329b00>] (__schedule_bug+0x48/0x60)
> [ 2922.009758] [<c0329b00>] (__schedule_bug+0x48/0x60) from [<c032d414>] (__schedule+0x468/0x504)
> [ 2922.018351] [<c032d414>] (__schedule+0x468/0x504) from [<c032caac>] (schedule_timeout+0x114/0x19c)
> [ 2922.027294] [<c032caac>] (schedule_timeout+0x114/0x19c) from [<c0255c00>] (s3c24xx_i2c_xfer+0x1cc/0x320)
> [ 2922.036754] [<c0255c00>] (s3c24xx_i2c_xfer+0x1cc/0x320) from [<c0252e08>] (__i2c_transfer+0x44/0x7c)
> [ 2922.045868] [<c0252e08>] (__i2c_transfer+0x44/0x7c) from [<c025416c>] (i2c_transfer+0x74/0x98)
> [ 2922.054462] [<c025416c>] (i2c_transfer+0x74/0x98) from [<c021ed38>] (regmap_i2c_read+0x48/0x64)
> [ 2922.063142] [<c021ed38>] (regmap_i2c_read+0x48/0x64) from [<c021b41c>] (_regmap_raw_read+0xa8/0xfc)
> [ 2922.072168] [<c021b41c>] (_regmap_raw_read+0xa8/0xfc) from [<c021b780>] (_regmap_bus_read+0x28/0x48)
> [ 2922.081281] [<c021b780>] (_regmap_bus_read+0x28/0x48) from [<c0219d30>] (_regmap_read+0x5c/0xc4)
> [ 2922.090048] [<c0219d30>] (_regmap_read+0x5c/0xc4) from [<c0219ddc>] (regmap_read+0x44/0x5c)
> [ 2922.098383] [<c0219ddc>] (regmap_read+0x44/0x5c) from [<c0290bdc>] (max77686_clk_is_enabled+0x20/0x3c)
> [ 2922.107670] [<c0290bdc>] (max77686_clk_is_enabled+0x20/0x3c) from [<c028cfdc>] (clk_disable_unused_subtree+0x6c/0xa8)
> [ 2922.118258] [<c028cfdc>] (clk_disable_unused_subtree+0x6c/0xa8) from [<c028dc90>] (clk_disable_unused+0x30/0xd8)
> [ 2922.128414] [<c028dc90>] (clk_disable_unused+0x30/0xd8) from [<c00087a8>] (do_one_initcall+0x38/0x160)
> 
> Fix it by replacing is_enabled call-back with is_prepared as the i2c driver may
> sleep during a transfer.
> 
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> ---
>  drivers/clk/clk-max77686.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

This has been already fixed as a part of series I sent a while ago to
fix max77686 clock driver. Unfortunately nobody seems to have applied
it.

Please refer to following thread:
http://thread.gmane.org/gmane.linux.kernel.samsung-soc/24153

I plan to rebase and resent the series soon.

Best regards,
Tomasz

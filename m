From: Sangbeom Kim <sbkim73@samsung.com>
Subject: RE: [PATCH V3 0/5] Avoid passing clks through platform data
Date: Fri, 23 Nov 2012 18:27:19 +0900
Message-ID: <000101cdc95c$c2575550$4705fff0$@com>
References: <1352177317-16395-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:63465 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758092Ab2KWJ12 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Nov 2012 04:27:28 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDX0078WOX3OHX0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Nov 2012 18:27:27 +0900 (KST)
Received: from DOSBKIM7302 ([12.23.120.118])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDX00BMYOXH0C00@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Nov 2012 18:27:26 +0900 (KST)
In-reply-to: <1352177317-16395-1-git-send-email-padma.v@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Padmavathi Venna' <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, olofj@google.com

On Tue, Nov 6, 2012 at 1:49 PM, Padmavathi Venna wrote:

> I2S controller has an internal mux for RCLK source clks. The list
> of source clk names were passed through platform data in non-dt case.
> The variable holding the list of RCLK source clk names is not
> required, as the list of clks need to be registered with clkdev
> using generic connection id. This is required as part of adding DT
> support for I2S controller driver.
> 
> In the below series of patches, registered the existed clks with
> clkdev using generic connection id and removed the variable which
> holds those clk names. This is done for s3c64xx,s5pc100,s5p64x0,
> s5pv210 and exynos4 series. But tested the sound card detection
> only on smdk6410 board. On remaining all platforms it was just
> build tested.
> 
> Padmavathi Venna (5):
>   ARM: S3C64XX: Add I2S clkdev support
>   ARM: S5PC100: Add I2S clkdev support
>   ARM: S5P64x0: Add I2S clkdev support
>   ARM: S5PV210: Avoid passing the clks through platform data
>   ARM: Exynos: Avoid passing the clks through platform data

As I2S driver is changed for support DT, 
These patch series should be applied.
Adding ack all patches.

Acked-by: Sangbeom Kim <sbkim73@samsung.com>

Thanks,
Sangbeom.

From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: remove num-slots from exynos platforms
Date: Tue, 18 Jul 2017 07:14:27 +0200
Message-ID: <20170718051427.GA22637@kozik-book>
References: <1499160322-73008-1-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:36727 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750730AbdGRFOh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jul 2017 01:14:37 -0400
Received: by mail-pg0-f68.google.com with SMTP id y129so1394783pgy.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jul 2017 22:14:37 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1499160322-73008-1-git-send-email-shawn.lin@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jaehoon Chung <jh80.chung@samsung.com>

On Tue, Jul 04, 2017 at 05:25:22PM +0800, Shawn Lin wrote:
> dwmmc driver deprecated num-slots and plan to get rid
> of it finally. Just move a step to cleanup it from DT.
> 
> Cc: Jaehoon Chung <jh80.chung@samsung.com>
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> ---
> 
>  arch/arm/boot/dts/exynos3250-artik5-eval.dts    | 1 -
>  arch/arm/boot/dts/exynos3250-artik5.dtsi        | 1 -
>  arch/arm/boot/dts/exynos3250-monk.dts           | 1 -
>  arch/arm/boot/dts/exynos3250-rinato.dts         | 1 -
>  arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi | 1 -
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 1 -
>  arch/arm/boot/dts/exynos4412-origen.dts         | 1 -
>  arch/arm/boot/dts/exynos4412-trats2.dts         | 1 -
>  arch/arm/boot/dts/exynos5250-arndale.dts        | 2 --
>  arch/arm/boot/dts/exynos5250-smdk5250.dts       | 2 --
>  arch/arm/boot/dts/exynos5250-snow-common.dtsi   | 3 ---
>  arch/arm/boot/dts/exynos5250-spring.dts         | 2 --
>  arch/arm/boot/dts/exynos5260-xyref5260.dts      | 2 --
>  arch/arm/boot/dts/exynos5410-smdk5410.dts       | 2 --
>  arch/arm/boot/dts/exynos5420-peach-pit.dts      | 3 ---
>  arch/arm/boot/dts/exynos5800-peach-pi.dts       | 3 ---
>  16 files changed, 27 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof

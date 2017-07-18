From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] arm64: dts: exynos: remove num-slots from exynos
 platforms
Date: Tue, 18 Jul 2017 07:15:13 +0200
Message-ID: <20170718051513.GB22637@kozik-book>
References: <1499159859-67028-1-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:33318 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751026AbdGRFPX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jul 2017 01:15:23 -0400
Received: by mail-pf0-f193.google.com with SMTP id e199so1370810pfh.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jul 2017 22:15:23 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1499159859-67028-1-git-send-email-shawn.lin@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jaehoon Chung <jh80.chung@samsung.com>

On Tue, Jul 04, 2017 at 05:17:39PM +0800, Shawn Lin wrote:
> dwmmc driver deprecated num-slots and plan to get rid
> of it finally. Just move a step to cleanup it from DT.
> 
> Cc: Jaehoon Chung <jh80.chung@samsung.com>
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> ---
> 
>  arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 2 --
>  arch/arm64/boot/dts/exynos/exynos7-espresso.dts       | 2 --
>  2 files changed, 4 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof

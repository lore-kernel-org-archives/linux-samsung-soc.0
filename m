From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 3/4] ARM: dts: exynos: Fix the active of reset gpios
 from rinato dts
Date: Fri, 16 Jun 2017 18:20:47 +0200
Message-ID: <20170616162047.mrm73b2cd4ffovox@kozik-lap>
References: <1497521010-8429-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170615100342epcas1p4feeb3d12bb9e120bf40dc5945c4b2460@epcas1p4.samsung.com>
 <1497521010-8429-4-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:34367 "EHLO
        mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750820AbdFPQUv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Jun 2017 12:20:51 -0400
Content-Disposition: inline
In-Reply-To: <1497521010-8429-4-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: thierry.reding@gmail.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, kgene@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, javier@osg.samsung.com, a.hajda@samsung.com

On Thu, Jun 15, 2017 at 07:03:29PM +0900, Hoegeun Kwon wrote:
> This reset gpios is active low, therefore fix from active high to low.
> 
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250-rinato.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Thanks, applied this one only. As mentioned before, 4/4 will wait for
driver.

Best regards,
Krzysztof

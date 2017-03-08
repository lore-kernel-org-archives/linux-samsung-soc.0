From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v5 2/5] arm: dts: Add the burst and esc clock frequency
 properties to DSI node
Date: Wed, 8 Mar 2017 08:58:57 +0200
Message-ID: <20170308065857.fe26iwlu3r5cmesx@kozik-lap>
References: <1488948852-5380-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170308045502epcas1p26f050caaf6eeb79bc88afcb0e2eaeac2@epcas1p2.samsung.com>
 <1488948852-5380-3-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1488948852-5380-3-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, airlied@linux.ie, kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, javier@osg.samsung.com, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, a.hajda@samsung.com, andi.shyti@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Mar 08, 2017 at 01:54:09PM +0900, Hoegeun Kwon wrote:
> Add the burst and esc clock frequency properties to the parent (DSI node).
> Currently the clock is parsed from the port node, while it should be
> taken from the dsi node.
> 
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> Reviewed-by: Andi Shyti <andi.shyti@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250-rinato.dts | 2 ++
>  arch/arm/boot/dts/exynos4210-trats.dts  | 2 ++
>  arch/arm/boot/dts/exynos4412-trats2.dts | 2 ++
>  3 files changed, 6 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof

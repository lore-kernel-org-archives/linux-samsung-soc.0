From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: exynos: Update x and y properties for
 mms114 touchscreen
Date: Sun, 13 May 2018 15:20:42 +0200
Message-ID: <20180513132042.go3xqkcyox76qocs@kozik-lap>
References: <20180510212533.27163-1-andi.shyti@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180510212533.27163-1-andi.shyti@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>
Cc: Simon Shields <simon@lineageos.org>, Rob Herring <robh+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi@etezian.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, May 11, 2018 at 06:25:33AM +0900, Andi Shyti wrote:
> The mms114 binding [1] specifies that the 'x' and 'y' should be
> called respectively 'touchscreen-size-x' and 'touchscreen-size-y'
> in coherence with the touchscreen [2] binding.
> 
> Update the mms114 node for trats2 and trats dts according to the
> binding.
> 
> [1] Documentation/devicetree/bindings/input/touchscreen/mms114.txt
> [2] Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
> 
> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4210-trats.dts      | 4 ++--
>  arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof

From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: fix property values of LDO15/17 for
 ODROID-XU3/4
Date: Mon, 30 Oct 2017 21:55:10 +0100
Message-ID: <20171030205510.o337fohl7fx26gbr@kozik-lap>
References: <20171028173329.15368-1-tobetter@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171028173329.15368-1-tobetter@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tobetter@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Oct 28, 2017 at 01:32:48PM -0400, tobetter@gmail.com wrote:
> From: Dongjin Kim <tobetter@gmail.com>
> 
> Looking at the schematic, LDO15 and LDO17 are tied as a power source of a
> builtin network chipset. The voltage on LDO15 is corrected to 3.3V and the
> name of LDO17 is corrected to "vdd_ldo17".
> 
> Signed-off-by: Dongjin Kim <tobetter@gmail.com>
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)


Looks OK, I will queue it after merge window. For my own reference:

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

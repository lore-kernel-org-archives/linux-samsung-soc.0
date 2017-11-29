From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [REBASED PATCH] ARM: dts: exynos: fix property values of
 LDO15/17 for ODROID-XU3/4
Date: Wed, 29 Nov 2017 19:27:44 +0100
Message-ID: <20171129182744.6brikrehd6sejwab@kozik-lap>
References: <20171128001501.12740-1-tobetter@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171128001501.12740-1-tobetter@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dongjin Kim <tobetter@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Nov 27, 2017 at 07:15:01PM -0500, Dongjin Kim wrote:
> Looking at the schematic, LDO15 and LDO17 are tied as a power source of a
> builtin network chipset. The voltage on LDO15 is corrected to 3.3V and the
> name of LDO17 is corrected to "vdd_ldo17".
> 
> Signed-off-by: Dongjin Kim <tobetter@gmail.com>
> ---
>  arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof

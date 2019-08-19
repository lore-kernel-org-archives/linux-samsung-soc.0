From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] MAINTAINERS: Extend patterns for Samsung SoC, Security
 Subsystem and clock drivers
Date: Tue, 20 Aug 2019 08:48:07 +0900
Message-ID: <0bc1c3a5-cdf2-eeab-e547-97598ca1fbd1@samsung.com>
References: <CGME20190818172803epcas1p32db0707cb391c5ca1795ba2690284a56@epcas1p3.samsung.com>
        <20190818172750.20921-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190818172750.20921-1-krzk@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, Kamil Konieczny <k.konieczny@partner.samsung.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, linux-clk@vger.kernel.org, "cpgs (cpgs@samsung.com)" <cpgs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 19. 8. 19. 오전 2:27, Krzysztof Kozlowski wrote:
> Extend the patterns to cover all related files in respective
> categories:
> 1. Samsung Exynos ARM architecture: add soc drivers headers and make
>    directory matches consistent,
> 2. Samsung Security SubSystem driver (crypto): add bindings,
> 3. Samsung SoC clock drivers: add S3C24xx, S3C64xx and S5Pv210 bindings.
> 
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Vladimir Zapolskiy <vz@mleia.com>
> Cc: Kamil Konieczny <k.konieczny@partner.samsung.com>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-crypto@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> ---
>  MAINTAINERS | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 420567d1519a..35a4002ac58b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2199,8 +2199,9 @@ F:	drivers/*/*s3c24*
>  F:	drivers/*/*/*s3c24*
>  F:	drivers/*/*s3c64xx*
>  F:	drivers/*/*s5pv210*
> -F:	drivers/memory/samsung/*
> -F:	drivers/soc/samsung/*
> +F:	drivers/memory/samsung/
> +F:	drivers/soc/samsung/
> +F:	include/linux/soc/samsung/
>  F:	Documentation/arm/samsung/
>  F:	Documentation/devicetree/bindings/arm/samsung/
>  F:	Documentation/devicetree/bindings/sram/samsung-sram.txt
> @@ -14174,6 +14175,8 @@ M:	Kamil Konieczny <k.konieczny@partner.samsung.com>
>  L:	linux-crypto@vger.kernel.org
>  L:	linux-samsung-soc@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/crypto/samsung-slimsss.txt
> +F:	Documentation/devicetree/bindings/crypto/samsung-sss.txt
>  F:	drivers/crypto/s5p-sss.c
>  
>  SAMSUNG S5P/EXYNOS4 SOC SERIES CAMERA SUBSYSTEM DRIVERS
> @@ -14194,6 +14197,8 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git
>  F:	drivers/clk/samsung/
>  F:	include/dt-bindings/clock/exynos*.h
>  F:	Documentation/devicetree/bindings/clock/exynos*.txt
> +F:	Documentation/devicetree/bindings/clock/samsung,s3c*
> +F:	Documentation/devicetree/bindings/clock/samsung,s5p*
>  
>  SAMSUNG SPI DRIVERS
>  M:	Kukjin Kim <kgene@kernel.org>
> 

For clock part,
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics

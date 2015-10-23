From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH v2] MAINTAINERS: ARM: EXYNOS: Add documentation and dt-bindings
Date: Sat, 24 Oct 2015 04:48:12 +0900
Message-ID: <562A8EFC.9010408@kernel.org>
References: <1445477299-560-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445477299-560-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Jonathan Corbet <corbet@lwn.net>, arm@kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 10/22/15 10:28, Krzysztof Kozlowski wrote:
> Extend the Samsung Exynos maintainer entry to match SoC documentation
> and SoC dt-bindings directories. Without that some files, like
> bindings/arm/samsung/pmu.txt, are not matched by existing patterns.
> 
> This also may serve as a hint where new documentation and bindings (not
> matching specific subsystem) should be put.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> 
> Changes since v1:
> 1. Added Javier's reviewed-by
> 2. Cover also power domain and sram bindings located now in separate
>    directory.
> ---
>  MAINTAINERS | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b556aad90930..6339926c77d6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1459,6 +1459,10 @@ F:	drivers/*/*s3c2410*
>  F:	drivers/*/*/*s3c2410*
>  F:	drivers/spi/spi-s3c*
>  F:	sound/soc/samsung/*
> +F:	Documentation/arm/Samsung/
> +F:	Documentation/devicetree/bindings/arm/samsung/
> +F:	Documentation/devicetree/bindings/sram/samsung-sram.txt
> +F:	Documentation/devicetree/bindings/power/pd-samsung.txt
>  N:	exynos
>  
>  ARM/SAMSUNG MOBILE MACHINE SUPPORT

Applied, thanks.

- Kukjin

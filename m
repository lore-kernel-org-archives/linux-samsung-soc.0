From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: Consolidate Exynos SoC bindings
Date: Sat, 24 Oct 2015 05:13:57 +0900
Message-ID: <562A9505.6010009@kernel.org>
References: <1445564361-16974-1-git-send-email-k.kozlowski@samsung.com> <1445564361-16974-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445564361-16974-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 10/23/15 10:39, Krzysztof Kozlowski wrote:
> Exynos SoC Device Tree bindings are spread over arm/exynos/ and
> arm/samsung/ directories. There is no need for that separation and it
> actually confuses. Put power domain bindings under power/ and
> remaining samsung-boards.txt under arm/samsung/.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> 
> Changes since v2:
> 1. Update path pointing to pd-samsung.txt in samsung,sysmmu.txt.
> 
> Changes since v1:
> 1. Move power_domain.txt to power/pd-samsung.txt.
> 2. The smp-sysram.txt is moved in previous patch to sram/ directory
>    (Suggested by Rob Herring).
> 3. Added Javier's reviewed-by. Although there are some differences since
>    v1 but this is merely re-organization. Please let me know if the
>    review tag is no longer valid.
> ---
>  Documentation/devicetree/bindings/arm/{ => samsung}/samsung-boards.txt  | 0
>  Documentation/devicetree/bindings/iommu/samsung,sysmmu.txt              | 2 +-
>  .../bindings/{arm/exynos/power_domain.txt => power/pd-samsung.txt}      | 0
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/arm/{ => samsung}/samsung-boards.txt (100%)
>  rename Documentation/devicetree/bindings/{arm/exynos/power_domain.txt => power/pd-samsung.txt} (100%)
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung-boards.txt b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/arm/samsung-boards.txt
> rename to Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
> diff --git a/Documentation/devicetree/bindings/iommu/samsung,sysmmu.txt b/Documentation/devicetree/bindings/iommu/samsung,sysmmu.txt
> index 729543c47046..bc620fe32a70 100644
> --- a/Documentation/devicetree/bindings/iommu/samsung,sysmmu.txt
> +++ b/Documentation/devicetree/bindings/iommu/samsung,sysmmu.txt
> @@ -47,7 +47,7 @@ Required properties:
>  - clocks: Required if the System MMU is needed to gate its clock.
>  - power-domains: Required if the System MMU is needed to gate its power.
>  	  Please refer to the following document:
> -	  Documentation/devicetree/bindings/arm/exynos/power_domain.txt
> +	  Documentation/devicetree/bindings/power/pd-samsung.txt
>  
>  Examples:
>  	gsc_0: gsc@13e00000 {
> diff --git a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt b/Documentation/devicetree/bindings/power/pd-samsung.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/arm/exynos/power_domain.txt
> rename to Documentation/devicetree/bindings/power/pd-samsung.txt

Applied 2/3 and 3/3.

Thanks,
Kukjin

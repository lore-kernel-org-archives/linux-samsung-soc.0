From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4] dt-bindings: iommu: Convert Samsung Exynos IOMMU H/W,
  System MMU to dt-schema
Date: Fri, 27 Sep 2019 11:20:14 -0500
Message-ID: <20190927162014.GA2946@bogus>
References: <20190917192113.GA26604@bogus>
 <CGME20190919132002eucas1p19ceac65f49939be3152affb4d6a426a1@eucas1p1.samsung.com>
 <20190919131944.11007-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190919131944.11007-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Maciej Falkowski <m.falkowski@samsung.com>, krzk@kernel.org, mark.rutland@arm.com, robh@kernel.org, a.hajda@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 19 Sep 2019 15:19:44 +0200, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> Convert Samsung Exynos IOMMU H/W, System Memory Management Unit
> to newer dt-schema format.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v4:
> - Rename commit message to match common style
> - Remove '"pclk", "aclk"' option from clock-names property.
>   Some of bindings are incompatible with that and they will be fixed with
>   another patch.
> - Remove unneeded description of clock-names property.
> - Remove type description from power-domains property as it is
>   already a common property.
> - Rename node names to match generic names,
>   specifically: sysmmu -> iommu, gsc -> scaler
> 
> - Add include directive in examples to include
>   clock macros. This increases readability of the example
>   as clock macros do not have to be substituted with numerical values
>   which makes examples more self-explanatory and natural.
> 
> Best regards,
> Maciej Falkowski
> ---
>  .../bindings/iommu/samsung,sysmmu.txt         |  67 -----------
>  .../bindings/iommu/samsung,sysmmu.yaml        | 108 ++++++++++++++++++
>  2 files changed, 108 insertions(+), 67 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iommu/samsung,sysmmu.txt
>  create mode 100644 Documentation/devicetree/bindings/iommu/samsung,sysmmu.yaml
> 

Applied, thanks.

Rob

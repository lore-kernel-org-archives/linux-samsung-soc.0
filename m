From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: arm: samsung: Convert Samsung Exynos
 IOMMU H/W, System MMU to dt-schema
Date: Wed, 11 Sep 2019 13:36:29 +0200
Message-ID: <CAJKOXPeZ2usT+bx23n-hXxsLsbZqr-0JEtyagK8sfsLaFiaH5w@mail.gmail.com>
References: <CGME20190911110500eucas1p2e1304a19e2e75ee43d80fcdc3b871237@eucas1p2.samsung.com>
 <CAJKOXPeojuk1UrYo9Wakaaq4VJt3Ts22Vi-V5xzwAXoFU5+tcA@mail.gmail.com> <20190911110446.32058-1-m.falkowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190911110446.32058-1-m.falkowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maciej Falkowski <m.falkowski@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, robh+dt@kernel.org, mark.rutland@arm.com, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 11 Sep 2019 at 13:05, Maciej Falkowski <m.falkowski@samsung.com> wrote:
>
> Convert Samsung Exynos IOMMU H/W, System Memory Management Unit
> to newer dt-schema format.
>
> Update clock description.
>
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
> Hi Krzysztof,
>
> Thank you for feedback.
>
> v3:
>
> - remove obsolete interrupts description and
> set its maxItems to one. There are some incompatible
> files which will be fixed with another patch.

Driver stopped supporting two IRQ lines in commit
7222e8db2d506197ee183de0f9b76b3ad97e8c18 (iommu/exynos: Fix build
errors). The second IRQ line in Exynos3250 DTS seems to be ignored.

The patch now looks good to me:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

However for some reasons you did not CC the IOMMU maintainers. Please
use scripts/get_maintainer.pl to get the list of folks to CC.

Best regards,
Krzysztof

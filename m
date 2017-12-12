From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4] ARM: dts: exynos: Add nodes for True Random Number
 Generator
Date: Tue, 12 Dec 2017 18:44:08 +0100
Message-ID: <20171212174408.bnyedkd2qebqtpiq@kozik-lap>
References: <20171204125351.26805-4-l.stelmach@samsung.com>
 <CGME20171212120906eucas1p23883590efde24a67800473b0d34871e5@eucas1p2.samsung.com>
 <20171212120902.16561-1-l.stelmach@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:43449 "EHLO
        mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751612AbdLLRoM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 Dec 2017 12:44:12 -0500
Content-Disposition: inline
In-Reply-To: <20171212120902.16561-1-l.stelmach@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>
Cc: "Andrew F . Davis" <afd@ti.com>, PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>, Rob Herring <robh+dt@kernel.org>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Tue, Dec 12, 2017 at 01:09:02PM +0100, Łukasz Stelmach wrote:
> Add nodes for the True Random Number Generator found in Samsung Exynos
> 5250+ SoCs.
> 
> Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
> ---
> Changes since v3:
> 
> - Rebased accroding to Krzysztof Kozłowski's request
> 
>  arch/arm/boot/dts/exynos5.dtsi    | 5 +++++
>  arch/arm/boot/dts/exynos5250.dtsi | 5 +++++
>  arch/arm/boot/dts/exynos5410.dtsi | 5 +++++
>  arch/arm/boot/dts/exynos5420.dtsi | 5 +++++
>  4 files changed, 20 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof

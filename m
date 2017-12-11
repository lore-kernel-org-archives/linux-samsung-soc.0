From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3] ARM: dts: exynos: add DT nodes for PRNG in Exynos5
 SoCs
Date: Mon, 11 Dec 2017 19:47:31 +0100
Message-ID: <20171211184731.qjeo3wwqn2zon55z@kozik-lap>
References: <20171204120429.22892-1-l.stelmach@samsung.com>
 <CGME20171211085422eucas1p19a7e20669d9d3d4d41cf1b96c7039a33@eucas1p1.samsung.com>
 <20171211085415.27947-1-l.stelmach@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:44870 "EHLO
        mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752316AbdLKSrf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 11 Dec 2017 13:47:35 -0500
Received: by mail-wm0-f48.google.com with SMTP id t8so16346948wmc.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Dec 2017 10:47:35 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20171211085415.27947-1-l.stelmach@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>
Cc: kgene@kernel.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, b.zolnierkie@samsung.com

On Mon, Dec 11, 2017 at 09:54:15AM +0100, Łukasz Stelmach wrote:
> Add nodes for PRNG in dts files decribing Exynos5 chips.
> 
> Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
> ---
> Changes since v2:
> 
> - Rebased according to Krzysztof Kozłowski's request.
> 
> Changes since v1:
> 
> - Use "rng" as the node-name for all RNG regardles of their type.
> - Introduce "samsung,exynos5250-prng" compatible (binding documentation
>   will follow).
> 
>  arch/arm/boot/dts/exynos5.dtsi    | 6 ++++++
>  arch/arm/boot/dts/exynos5250.dtsi | 5 +++++
>  arch/arm/boot/dts/exynos5410.dtsi | 5 +++++
>  arch/arm/boot/dts/exynos5420.dtsi | 5 +++++
>  4 files changed, 21 insertions(+)
> 

Thanks, applied (with removal of one unneeded empty line in patch and
minor change in msg).

Best regards,
Krzysztof

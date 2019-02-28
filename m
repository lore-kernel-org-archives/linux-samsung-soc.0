From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH v4 0/3] add AES support for Exynos5433
Date: Thu, 28 Feb 2019 14:36:03 +0800
Message-ID: <20190228063603.5qgkmhk4sbp674h5@gondor.apana.org.au>
References: <CGME20190222122203eucas1p1e87a8066d4348be4beb3ff035ea55828@eucas1p1.samsung.com>
 <20190222122144.19024-1-k.konieczny@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190222122144.19024-1-k.konieczny@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc: "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Feb 22, 2019 at 01:21:41PM +0100, Kamil Konieczny wrote:
> Add slimSSS node to DT and crypto AES support for Exynos5433. Tested on
> Exynos5433 board with crypto run-time self tests and with tcrypt with
> command insmod tcrypt.ko mode=500 sec=1
> 
> Changes since v3:
> - moved bindings documentation out from samsung-sss.txt into separate file
>   samsung-slimsss.txt
> 
> Changes since v2:
> - address Corentine Labbe note: add "const" to char* in declaration of
>   struct samsung_aes_variant
> 
> Changes since v1:
> - address Krzysztof Kozlowski review: add missing comma in struct
>   definition, add goto for error code path, correct indentation,
>   in documentation add that Exynos5433 has both slimSSS and SSS IPs.
> 
> Kamil Konieczny (3):
>   arm64: dts: exynos: add SlimSSS for Exynos5433
>   dt-bindings: crypto: document Exynos5433 SlimSSS
>   crypto: s5p: add AES support for Exynos5433
> 
>  .../bindings/crypto/samsung-slimsss.txt       | 19 +++++++
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi    |  9 ++++
>  drivers/crypto/s5p-sss.c                      | 50 +++++++++++++++++--
>  3 files changed, 74 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/crypto/samsung-slimsss.txt

Patches 2-3 applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

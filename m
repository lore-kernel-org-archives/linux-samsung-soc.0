From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: rng: exynos4-rng: Convert Exynos PRNG
 bindings to json-schema
Date: Thu, 10 Oct 2019 13:41:02 -0500
Message-ID: <20191010184102.GA16673@bogus>
References: <20191002161340.11846-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191002161340.11846-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed,  2 Oct 2019 18:13:40 +0200, Krzysztof Kozlowski wrote:
> Convert Samsung Exynos Pseudo Random Number Generator bindings to DT
> schema format using json-schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v2:
> 1. Add additionalProperties false,
> 2. Include clock header and use defines instead of clock numbers.
> 
> Changes since v1:
> 1. Indent example with four spaces (more readable).
> ---
>  .../bindings/rng/samsung,exynos4-rng.txt      | 19 --------
>  .../bindings/rng/samsung,exynos4-rng.yaml     | 45 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 46 insertions(+), 20 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rng/samsung,exynos4-rng.txt
>  create mode 100644 Documentation/devicetree/bindings/rng/samsung,exynos4-rng.yaml
> 

Applied, thanks.

Rob

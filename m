From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: crypto: samsung: Convert SSS and SlimSSS
 bindings to json-schema
Date: Thu, 10 Oct 2019 16:25:25 -0500
Message-ID: <20191010212525.GA10949@bogus>
References: <20190920163635.9186-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190920163635.9186-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Vladimir Zapolskiy <vz@mleia.com>, Kamil Konieczny <k.konieczny@partner.samsung.com>, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 20 Sep 2019 18:36:35 +0200, Krzysztof Kozlowski wrote:
> Convert Samsung Exynos Security SubSystem (SSS) and SlimSSS hardware
> crypto accelerator bindings to DT schema format using json-schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Rebased on linux-next due to conflicting change in MAINTAINERS file
> coming through arm-soc tree.
> 
> Changes since v1:
> 1. Add additionalProperties:false
> ---
>  .../bindings/crypto/samsung-slimsss.txt       | 19 ------
>  .../bindings/crypto/samsung-slimsss.yaml      | 47 +++++++++++++++
>  .../bindings/crypto/samsung-sss.txt           | 32 ----------
>  .../bindings/crypto/samsung-sss.yaml          | 58 +++++++++++++++++++
>  MAINTAINERS                                   |  4 +-
>  5 files changed, 107 insertions(+), 53 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/crypto/samsung-slimsss.txt
>  create mode 100644 Documentation/devicetree/bindings/crypto/samsung-slimsss.yaml
>  delete mode 100644 Documentation/devicetree/bindings/crypto/samsung-sss.txt
>  create mode 100644 Documentation/devicetree/bindings/crypto/samsung-sss.yaml
> 

Applied, thanks.

Rob

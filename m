From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: samsung: Convert Exynos System
 Registers bindings to json-schema
Date: Fri, 27 Sep 2019 12:58:38 -0500
Message-ID: <20190927175838.GA20682@bogus>
References: <20190920162600.7486-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190920162600.7486-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 20 Sep 2019 18:25:59 +0200, Krzysztof Kozlowski wrote:
> Convert Samsung Exynos System Registers (SYSREG) bindings to DT schema
> format using json-schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v2:
> 1. Use select to skip other syscon nodes,
> 2. Indent example with four spaces (more readable),
> ---
>  .../bindings/arm/samsung/sysreg.txt           | 19 --------
>  .../bindings/arm/samsung/sysreg.yaml          | 45 +++++++++++++++++++
>  2 files changed, 45 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/samsung/sysreg.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/samsung/sysreg.yaml
> 

Applied, thanks.

Rob

From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: arm: samsung: Convert Exynos PMU
 bindings to json-schema
Date: Fri, 27 Sep 2019 13:00:47 -0500
Message-ID: <20190927180047.GA24461@bogus>
References: <20190920162600.7486-1-krzk@kernel.org>
 <20190920162600.7486-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190920162600.7486-2-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 20 Sep 2019 18:26:00 +0200, Krzysztof Kozlowski wrote:
> Convert Samsung Exynos Power Management Unit (PMU) bindings to DT schema
> format using json-schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v2:
> 1. Use select to skip other syscon nodes,
> 2. Indent example with four spaces (more readable),
> 3. Use pattern for clkoutN property,
> 4. Include header with clock IDs in example to bring it closer to real DTS.
> 
> Changes since v1:
> 1. Fix clock-names to match all elements against schema (any number of
>    any clkoutN values).
>    This currently fails:
>        properties:clock-names:items: {'enum': ['clkout0', 'clkout1', 'clkout2',
>        'clkout3', 'clkout4', 'clkout5', 'clkout6', 'clkout7', 'clkout8',
>        'clkout9', 'clkout10', 'clkout11', 'clkout12', 'clkout13', 'clkout14',
>        'clkout15', 'clkout16']} is not of type 'array
> 
> 2. Add syscon reboot and poweroff nodes.
> ---
>  .../devicetree/bindings/arm/samsung/pmu.txt   |  72 ------------
>  .../devicetree/bindings/arm/samsung/pmu.yaml  | 105 ++++++++++++++++++
>  2 files changed, 105 insertions(+), 72 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/samsung/pmu.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/samsung/pmu.yaml
> 

Applied, thanks.

Rob

From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 10/11] dt-bindings: iio: adc: exynos: Convert Exynos
 ADC bindings to json-schema
Date: Wed, 18 Sep 2019 07:58:02 -0500
Message-ID: <20190918125802.GA1051@bogus>
References: <20190907092007.9946-1-krzk@kernel.org>
 <20190907092007.9946-10-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190907092007.9946-10-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sat,  7 Sep 2019 11:20:06 +0200, Krzysztof Kozlowski wrote:
> Convert Samsung Exynos Analog to Digital Converter bindings to DT schema
> format using json-schema.
> 
> This is a direct conversion of existing bindings so it also copies the
> existing error in the bindings regarding the requirement of two register
> address ranges for certain compatibles.  The inconsistency in binding
> was caused by commit fafb37cfae6d ("iio: exyno-adc: use syscon for PMU
> register access").
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Rework reg, clocks and clock-names matching for specific compatibles,
> 2. Make samsung,syscon-phandle required only on certain compatibles,
> 3. Fix indentation.
> ---
>  .../bindings/iio/adc/samsung,exynos-adc.txt   | 107 ------------
>  .../bindings/iio/adc/samsung,exynos-adc.yaml  | 163 ++++++++++++++++++
>  2 files changed, 163 insertions(+), 107 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> 

Applied, thanks.

Rob

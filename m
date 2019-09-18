From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 06/11] dt-bindings: arm: samsung: Convert Exynos
 Chipid bindings to json-schema
Date: Wed, 18 Sep 2019 07:57:07 -0500
Message-ID: <20190918125707.GA31634@bogus>
References: <20190907092007.9946-1-krzk@kernel.org>
 <20190907092007.9946-6-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190907092007.9946-6-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sat,  7 Sep 2019 11:20:02 +0200, Krzysztof Kozlowski wrote:
> Convert Samsung Exynos Chipid bindings to DT schema format using
> json-schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../bindings/arm/samsung/exynos-chipid.txt    | 12 ---------
>  .../bindings/arm/samsung/exynos-chipid.yaml   | 25 +++++++++++++++++++
>  2 files changed, 25 insertions(+), 12 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/samsung/exynos-chipid.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/samsung/exynos-chipid.yaml
> 

Applied, thanks.

Rob

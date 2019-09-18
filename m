From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 03/11] dt-bindings: arm: samsung: Convert Samsung
 board/soc bindings to json-schema
Date: Wed, 18 Sep 2019 07:56:19 -0500
Message-ID: <20190918125619.GA29595@bogus>
References: <20190907092007.9946-1-krzk@kernel.org>
 <20190907092007.9946-3-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190907092007.9946-3-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sat,  7 Sep 2019 11:19:59 +0200, Krzysztof Kozlowski wrote:
> Convert Samsung S5P and Exynos SoC bindings to DT schema format using
> json-schema.  This is purely conversion of already documented bindings
> so it does not cover all of DTS in the Linux kernel (few S5P/Exynos and
> all S3C are missing).
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Make Google boards latest revision as const.
> 2. Split secure firmware into separate schema.
> ---
>  .../bindings/arm/samsung/samsung-boards.txt   |  83 ---------
>  .../bindings/arm/samsung/samsung-boards.yaml  | 165 ++++++++++++++++++
>  .../arm/samsung/samsung-secure-firmware.yaml  |  31 ++++
>  3 files changed, 196 insertions(+), 83 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/samsung/samsung-secure-firmware.yaml
> 

Applied, thanks.

Rob

From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 09/11] dt-bindings: rtc: s3c: Convert S3C/Exynos RTC
 bindings to json-schema
Date: Wed, 18 Sep 2019 07:57:44 -0500
Message-ID: <20190918125744.GA391@bogus>
References: <20190907092007.9946-1-krzk@kernel.org>
 <20190907092007.9946-9-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190907092007.9946-9-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sat,  7 Sep 2019 11:20:05 +0200, Krzysztof Kozlowski wrote:
> Convert Samsung S3C/Exynos Real Time Clock bindings to DT schema format
> using json-schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Use deprecated property instead of custom select,
> 2. Rework clocks and clock-names matching for specific compatibles.
> ---
>  .../devicetree/bindings/rtc/s3c-rtc.txt       | 31 -------
>  .../devicetree/bindings/rtc/s3c-rtc.yaml      | 85 +++++++++++++++++++
>  2 files changed, 85 insertions(+), 31 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/s3c-rtc.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/s3c-rtc.yaml
> 

Applied, thanks.

Rob

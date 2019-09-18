From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 01/11] dt-bindings: power: syscon-reboot: Convert
 bindings to json-schema
Date: Wed, 18 Sep 2019 07:55:55 -0500
Message-ID: <20190918125555.GA28572@bogus>
References: <20190907092007.9946-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190907092007.9946-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sat,  7 Sep 2019 11:19:57 +0200, Krzysztof Kozlowski wrote:
> Convert the Syscon reboot bindings to DT schema format using
> json-schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Remove unneeded maxItems from uint32 fields,
> 2. Simplify if-else-then.
> ---
>  .../bindings/power/reset/syscon-reboot.txt    | 30 ----------
>  .../bindings/power/reset/syscon-reboot.yaml   | 60 +++++++++++++++++++
>  2 files changed, 60 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/power/reset/syscon-reboot.txt
>  create mode 100644 Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
> 

Applied, thanks.

Rob

From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH V2 3/4] clk: max77686: Add DT binding details for PMIC
 MAX77620
Date: Fri, 17 Jun 2016 07:59:58 +0200
Message-ID: <576391DE.603@samsung.com>
References: <1466083407-28793-1-git-send-email-ldewangan@nvidia.com>
 <1466083407-28793-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1466083407-28793-4-git-send-email-ldewangan@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, javier@osg.samsung.com, mturquette@baylibre.com, robh+dt@kernel.org, linux@armlinux.org.uk
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier@dowhile0.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 06/16/2016 03:23 PM, Laxman Dewangan wrote:
> Maxim has used the same clock IP on multiple PMICs like MAX77686,
> MAX77802, MAX77620. Only differences are the number of clocks
> from these PMICs like MAX77686 has 3 clocks output, MAX776802 have
> two clock output and MAX77620 has one clock output.
> 
> Add clock binding details and DT example for the MAX77620.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> CC: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> CC: Javier Martinez Canillas <javier@dowhile0.org>
> 
> ---
> Changes from V1:
> - Use proper comment for the ::::
> - Added dt binding preprocessor file as maxim,max77620.h for max77620
>   inline with the other chip.
> - Refer the dt binding header for the supported clock index.
> ---
>  .../devicetree/bindings/clock/maxim,max77686.txt   | 52 +++++++++++++++++-----
>  include/dt-bindings/clock/maxim,max77620.h         | 21 +++++++++
>  2 files changed, 63 insertions(+), 10 deletions(-)
>  create mode 100644 include/dt-bindings/clock/maxim,max77620.h

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof



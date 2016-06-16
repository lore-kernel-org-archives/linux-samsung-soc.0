From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 4/5] clk: max77686: Add support for MAX77620 clocks
Date: Thu, 16 Jun 2016 15:02:36 +0200
Message-ID: <5762A36C.3040703@samsung.com>
References: <1466000018-16784-1-git-send-email-ldewangan@nvidia.com>
 <1466000018-16784-5-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1466000018-16784-5-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, javier@osg.samsung.com, mturquette@baylibre.com, robh+dt@kernel.org, linux@armlinux.org.uk
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier@dowhile0.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 06/15/2016 04:13 PM, Laxman Dewangan wrote:
> Maxim Max77620 has one 32KHz clock output and the clock HW
> IP used on this PMIC is same as what it is there in the MAX77686.
> 
> Add clock driver support for MAX77620 on the MAX77686 driver.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> CC: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> CC: Javier Martinez Canillas <javier@dowhile0.org>
> ---
>  drivers/clk/Kconfig        |  7 ++++---
>  drivers/clk/clk-max77686.c | 16 ++++++++++++++++
>  2 files changed, 20 insertions(+), 3 deletions(-)

Tested on max77686 and max77802:
Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

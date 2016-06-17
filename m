From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH V2 1/4] clk: max77686: Combine Maxim max77686 and max77802
 driver
Date: Fri, 17 Jun 2016 08:01:57 +0200
Message-ID: <57639255.3010403@samsung.com>
References: <1466083407-28793-1-git-send-email-ldewangan@nvidia.com>
 <1466083407-28793-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1466083407-28793-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, javier@osg.samsung.com, mturquette@baylibre.com, robh+dt@kernel.org, linux@armlinux.org.uk
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier@dowhile0.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 06/16/2016 03:23 PM, Laxman Dewangan wrote:
> The clock IP used on the Maxim PMICs max77686 and max77802 are
> same. The configuration of clock register is also same except
> the number of clocks.
> 
> Part of common code utilisation, there is 3 files for these chips
> clock driver, one for common and two files for driver registration.
> 
> Combine both drivers into single file and move common code into
> same common file reduces the 2 files and make max77686 and max77802
> clock driver in single fine. This driver does not depends on the
> parent driver structure. The regmap handle is acquired through
> regmap APIs for the register access.
> 
> This combination of driver helps on adding clock driver for different
> Maxim PMICs which has similar clock IP like MAX77620 and MAX20024.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> CC: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> CC: Javier Martinez Canillas <javier@dowhile0.org>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> ---
> Changes from V1:
> - Collected RB and TB from Javier.
> - Change the max_gen to max77686.
> - Rename structure and avoid duplication for reg and mask.
> - Taken care of comment from Krzysztof on coding.
> ---
>  drivers/clk/Kconfig        |  15 +--
>  drivers/clk/Makefile       |   2 -
>  drivers/clk/clk-max-gen.c  | 194 -----------------------------------
>  drivers/clk/clk-max-gen.h  |  32 ------
>  drivers/clk/clk-max77686.c | 244 ++++++++++++++++++++++++++++++++++++++++++---
>  drivers/clk/clk-max77802.c |  96 ------------------
>  6 files changed, 234 insertions(+), 349 deletions(-)
>  delete mode 100644 drivers/clk/clk-max-gen.c
>  delete mode 100644 drivers/clk/clk-max-gen.h
>  delete mode 100644 drivers/clk/clk-max77802.c


Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof



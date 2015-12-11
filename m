From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 03/20] ARM: dts: Add DMC bus node for Exynos3250
Date: Fri, 11 Dec 2015 15:36:29 +0900
Message-ID: <566A6EED.5090706@samsung.com>
References: <1449810479-14763-1-git-send-email-cw00.choi@samsung.com>
 <1449810479-14763-4-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-reply-to: <1449810479-14763-4-git-send-email-cw00.choi@samsung.com>
Sender: linux-pm-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, myungjoo.ham@samsung.com, kgene@kernel.org
Cc: kyungmin.park@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, tjakobi@math.uni-bielefeld.de, linux.amoon@gmail.com, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 11.12.2015 14:07, Chanwoo Choi wrote:
> This patch adds the DMC (Dynamic Memory Controller) bus node for Exynos3250 SoC.
> The DMC is an AMBA AXI-compliant slave to interface external JEDEC standard
> SDRAM devices. The bus includes the OPP tables and the source clock for DMC
> block.
> 
> Following list specifies the detailed relation between the clock and DMC block:
> - The source clock of DMC block : div_dmc
> 
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250.dtsi | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof


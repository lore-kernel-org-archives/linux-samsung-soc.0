From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4 11/15] clk: exynos5420: correct sysmmu-mfc parent clocks
Date: Tue, 06 May 2014 19:44:57 +0200
Message-ID: <53691F99.5060406@gmail.com>
References: <1399393610-23394-1-git-send-email-shaik.ameer@samsung.com> <1399393610-23394-12-git-send-email-shaik.ameer@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f45.google.com ([74.125.83.45]:44454 "EHLO
	mail-ee0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750829AbaEFRpJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 May 2014 13:45:09 -0400
In-Reply-To: <1399393610-23394-12-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shaik Ameer Basha <shaik.ameer@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, joshi@samsung.com, shaik.samsung@gmail.com, r.sh.open@gmail.com, alim.akhtar@samsung.com

Shaik,

On 06.05.2014 18:26, Shaik Ameer Basha wrote:
> This patch corrects the wrong parent-child relationship
> between sysmmu-mfc clocks.
>
> Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>   drivers/clk/samsung/clk-exynos5420.c |   11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 6d88ae2..1449aee 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -82,6 +82,7 @@
>   #define SCLK_DIV_ISP0		0x10580
>   #define SCLK_DIV_ISP1		0x10584
>   #define DIV2_RATIO0		0x10590
> +#define DIV4_RATIO		0x105a0
>   #define GATE_BUS_TOP		0x10700
>   #define GATE_BUS_GEN		0x1073c
>   #define GATE_BUS_FSYS0		0x10740
> @@ -176,6 +177,7 @@ static unsigned long exynos5420_clk_regs[] __initdata = {
>   	SCLK_DIV_ISP0,
>   	SCLK_DIV_ISP1,
>   	DIV2_RATIO0,
> +	DIV4_RATIO,
>   	GATE_BUS_TOP,
>   	GATE_BUS_GEN,
>   	GATE_BUS_FSYS0,
> @@ -626,6 +628,9 @@ static struct samsung_div_clock exynos5420_div_clks[] __initdata = {
>   	DIV(0, "dout_spi1", "mout_spi1", DIV_PERIC1, 24, 4),
>   	DIV(0, "dout_spi2", "mout_spi2", DIV_PERIC1, 28, 4),
>
> +	/* Mfc Block */
> +	DIV(0, "dout_mfc_blk", "mout_user_aclk333", DIV4_RATIO, 0, 2),
> +
>   	/* PCM */
>   	DIV(0, "dout_pcm1", "dout_audio1", DIV_PERIC2, 16, 8),
>   	DIV(0, "dout_pcm2", "dout_audio2", DIV_PERIC2, 24, 8),
> @@ -946,8 +951,10 @@ static struct samsung_gate_clock exynos5420_gate_clks[] __initdata = {
>   			GATE_TOP_SCLK_ISP, 12, CLK_SET_RATE_PARENT, 0),
>
>   	GATE(CLK_MFC, "mfc", "aclk333", GATE_IP_MFC, 0, 0, 0),
> -	GATE(CLK_SMMU_MFCL, "smmu_mfcl", "aclk333", GATE_IP_MFC, 1, 0, 0),
> -	GATE(CLK_SMMU_MFCR, "smmu_mfcr", "aclk333", GATE_IP_MFC, 2, 0, 0),
> +	GATE(CLK_SMMU_MFCL, "smmu_mfcl", "dout_mfc_blk",
> +			GATE_IP_MFC, 1, CLK_SET_RATE_PARENT, 0),
> +	GATE(CLK_SMMU_MFCR, "smmu_mfcr", "dout_mfc_blk",
> +			GATE_IP_MFC, 2, CLK_SET_RATE_PARENT, 0),

As I mentioned in my comments to previous patches, I don't think this is 
a valid usage of the CLK_SET_RATE_PARENT flag.

Best regards,
Tomasz

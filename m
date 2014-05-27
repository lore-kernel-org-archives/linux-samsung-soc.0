From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] clk: exynos4: Add PPMU IP block source clocks.
Date: Tue, 27 May 2014 12:51:11 +0200
Message-ID: <53846E1F.1080201@gmail.com>
References: <1401179737-27521-1-git-send-email-jonghwa3.lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f46.google.com ([74.125.82.46]:62825 "EHLO
	mail-wg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751726AbaE0KvQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 May 2014 06:51:16 -0400
In-Reply-To: <1401179737-27521-1-git-send-email-jonghwa3.lee@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jonghwa Lee <jonghwa3.lee@samsung.com>, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, mturquette@linaro.org, Chanwoo Choi <cw00.choi@samsung.com>, Myungjoo Ham <myungjoo.ham@samsung.com>

Hi Jonghwa,

On 27.05.2014 10:35, Jonghwa Lee wrote:
> Exynos4 has saveral PPMUs and each of them has operation clock which
> can be gated through CMU's SFR control.
> 
> New clocks are listed below. All clocks are added as a gate-typed clock.
> 
> CLK_PPMULEFT, CLK_PPMURIGHT, CLK_PPMUG3D, CLK_PPMUCAMIF, CLK_PPMUTV,
> CLK_PPMUMFC_L, CLK_PPMUMFC_R, CLK_PPMUIMAGE, CLK_PPMULCD0, CLK_PPMULCD1,
> CLK_PPMUFILE, CLK_PPMUGPS, CLK_PPMUCPU, CLK_PPMUACP, CLK_PPMUDMC0,
> CLK_PPMUDMC1
> 
> Signed-off-by: Jonghwa Lee <jonghwa3.lee@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Myungjoo Ham <myungjoo.ham@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos4.c   |   20 ++++++++++++++++++++
>  include/dt-bindings/clock/exynos4.h |   18 ++++++++++++++++++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
> index b4f9672..5648437 100644
> --- a/drivers/clk/samsung/clk-exynos4.c
> +++ b/drivers/clk/samsung/clk-exynos4.c
> @@ -852,6 +852,22 @@ static struct samsung_gate_clock exynos4_gate_clks[] __initdata = {
>  			0, 0),
>  	GATE(CLK_AC97, "ac97", "aclk100", GATE_IP_PERIL, 27,
>  			0, 0),
> +	GATE(CLK_PPMULEFT, "ppmuleft", "aclk200", GATE_IP_LEFTBUS, 1, 0, 0),
> +	GATE(CLK_PPMURIGHT, "ppmuright", "aclk200", GATE_IP_RIGHTBUS,
> +			1, 0, 0),
> +	GATE(CLK_PPMUG3D, "ppmug3d", "aclk200", GATE_IP_G3D,
> +			1, 0, 0),
> +	GATE(CLK_PPMUCAMIF, "ppmucamif", "aclk160", GATE_IP_CAM, 16, 0, 0),
> +	GATE(CLK_PPMUTV, "ppmutv", "aclk160", GATE_IP_TV, 5, 0, 0),
> +	GATE(CLK_PPMUMFC_L, "ppmumfc_l", "aclk100", GATE_IP_MFC, 3, 0, 0),
> +	GATE(CLK_PPMUMFC_R, "ppmumfc_r", "aclk100", GATE_IP_MFC, 4, 0, 0),
> +	GATE(CLK_PPMULCD0, "ppmulcd0", "aclk160", GATE_IP_LCD0, 5, 0, 0),
> +	GATE(CLK_PPMUFILE, "ppmufile", "aclk133", GATE_IP_FSYS, 17, 0, 0),
> +	GATE(CLK_PPMUGPS, "ppmugps", "aclk200", GATE_IP_GPS, 2, 0, 0),
> +	GATE(CLK_PPMUCPU, "ppmucpu", "aclk133", GATE_IP_DMC, 10, 0, 0),
> +	GATE(CLK_PPMUACP, "ppmuacp", "aclk133", GATE_IP_DMC, 16, 0, 0),
> +	GATE(CLK_PPMUDMC0, "ppmudmc0", "aclk133", GATE_IP_DMC, 8, 0, 0),
> +	GATE(CLK_PPMUDMC1, "ppmudmc1", "aclk133", GATE_IP_DMC, 9, 0, 0),

Please keep the clocks sorted. It should be by register address
ascending and then by bit field position ascending. I know that it went
a bit out of control and there are unsorted entries, but we should try
to keep it clean when adding new ones.

>  };
>  
>  /* list of gate clocks supported in exynos4210 soc */
> @@ -896,6 +912,9 @@ static struct samsung_gate_clock exynos4210_gate_clks[] __initdata = {
>  			CLK_SET_RATE_PARENT, 0),
>  	GATE(CLK_TMU_APBIF, "tmu_apbif", "aclk100", E4210_GATE_IP_PERIR, 17, 0,
>  		0),
> +	GATE(CLK_PPMUIMAGE, "ppmuimage", "aclk200", E4210_GATE_IP_IMAGE, 9,
> +		0, 0),
> +	GATE(CLK_PPMULCD1, "ppmulcd1", "aclk160", E4210_GATE_IP_LCD1, 5, 0, 0),

Ditto.

>  };
>  
>  /* list of gate clocks supported in exynos4x12 soc */
> @@ -1001,6 +1020,7 @@ static struct samsung_gate_clock exynos4x12_gate_clks[] __initdata = {
>  	GATE(CLK_G2D, "g2d", "aclk200", GATE_IP_DMC, 23, 0, 0),
>  	GATE(CLK_TMU_APBIF, "tmu_apbif", "aclk100", E4X12_GATE_IP_PERIR, 17, 0,
>  		0),
> +	GATE(CLK_PPMUIMAGE, "ppmuimage", "aclk200", E4X12_GATE_IP_IMAGE, 9, 0, 0),

Ditto.

>  };
>  
>  static struct samsung_clock_alias exynos4_aliases[] __initdata = {
> diff --git a/include/dt-bindings/clock/exynos4.h b/include/dt-bindings/clock/exynos4.h
> index 75aff33..9f331f1 100644
> --- a/include/dt-bindings/clock/exynos4.h
> +++ b/include/dt-bindings/clock/exynos4.h
> @@ -230,6 +230,24 @@
>  #define CLK_MOUT_G3D		394
>  #define CLK_ACLK400_MCUISP	395 /* Exynos4x12 only */
>  
> +/* gate clocks - ppmu */
> +#define CLK_PPMULEFT		400
> +#define CLK_PPMURIGHT		401
> +#define CLK_PPMUG3D		402
> +#define CLK_PPMUCAMIF		403
> +#define CLK_PPMUTV		404
> +#define CLK_PPMUMFC_L		405
> +#define CLK_PPMUMFC_R		406
> +#define CLK_PPMUIMAGE		407
> +#define CLK_PPMULCD0		408
> +#define CLK_PPMULCD1		409

A comment saying that this clock is only for Exynos4210 might be nice,
as several Exynos4x12-specific clocks already have.

Best regards,
Tomasz

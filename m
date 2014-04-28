From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH v3 05/16] clk: exynos5420: update clocks for G2D block
Date: Mon, 28 Apr 2014 11:48:49 +0530
Message-ID: <CAGOxZ50rLg-0ebkcgDUMzWENrZiVUjYFEy-T6OxjO8imXbiTCQ@mail.gmail.com>
References: <1398344632-18623-1-git-send-email-shaik.ameer@samsung.com> <1398344632-18623-6-git-send-email-shaik.ameer@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f169.google.com ([209.85.160.169]:41814 "EHLO
	mail-yk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753340AbaD1GTa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Apr 2014 02:19:30 -0400
In-Reply-To: <1398344632-18623-6-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shaik Ameer Basha <shaik.ameer@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Ameer Basha Shaik <shaik.samsung@gmail.com>, Mike Turquette <mturquette@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>, Rahul Sharma <rahul.sharma@samsung.com>

Hi Shaik,

On Thu, Apr 24, 2014 at 6:33 PM, Shaik Ameer Basha
<shaik.ameer@samsung.com> wrote:
> Addign more G2D block clocks.
>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5420.c   |   10 ++++++++++
>  include/dt-bindings/clock/exynos5420.h |    3 +++
>  2 files changed, 13 insertions(+)
>  mode change 100644 => 100755 include/dt-bindings/clock/exynos5420.h
>
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 9da85ac..ab07299 100755
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -815,6 +815,10 @@ static struct samsung_gate_clock exynos5420_gate_clks[] __initdata = {
>         GATE(CLK_ROTATOR, "rotator", "aclk266", GATE_IP_GEN, 1, 0, 0),
>         GATE(CLK_JPEG, "jpeg", "aclk300_jpeg", GATE_IP_GEN, 2, 0, 0),
>         GATE(CLK_JPEG2, "jpeg2", "aclk300_jpeg", GATE_IP_GEN, 3, 0, 0),
> +       GATE(CLK_MDMA0, "mdma0", "aclk266_g2d",
> +                       GATE_IP_G2D, 1, CLK_IGNORE_UNUSED, 0),
> +       GATE(CLK_SMMU_MDMA0, "smmu_mdma0", "aclk266_g2d",
> +                       GATE_IP_G2D, 5, CLK_IGNORE_UNUSED, 0),
>         GATE(CLK_MDMA1, "mdma1", "aclk266", GATE_IP_GEN, 4, 0, 0),
>         GATE(CLK_SMMU_ROTATOR, "smmu_rotator", "aclk266", GATE_IP_GEN, 6, 0, 0),
>         GATE(CLK_SMMU_JPEG, "smmu_jpeg", "aclk300_jpeg", GATE_IP_GEN, 7, 0, 0),
> @@ -842,6 +846,11 @@ static struct samsung_gate_clock exynos5420_gate_clks[] __initdata = {
>                         "mout_user_aclk333_432_isp0", GATE_BUS_TOP, 5, 0, 0),
>         GATE(0, "aclk333_432_isp",
>                         "mout_user_aclk333_432_isp", GATE_BUS_TOP, 8, 0, 0),
> +       /* G2D */
> +       GATE(CLK_G2D, "g2d", "aclk333_g2d",
> +                       GATE_IP_G2D, 3, CLK_IGNORE_UNUSED, 0),
> +       GATE(CLK_SMMU_G2D, "smmu_g2d", "aclk333_g2d",
> +                       GATE_IP_G2D, 7, CLK_IGNORE_UNUSED, 0),
>         /* ISP */
>         GATE(0, "sclk_pwm_isp", "dout_pwm_isp", GATE_TOP_SCLK_ISP, 3, 0, 0),
>         GATE(0, "sclk_uart_isp", "dout_uart_isp", GATE_TOP_SCLK_ISP, 0, 0, 0),
> @@ -858,6 +867,7 @@ static struct samsung_gate_clock exynos5420_gate_clks[] __initdata = {
>
>         /* SSS */
>         GATE(CLK_SSS, "sss", "aclk266_g2d", GATE_IP_G2D, 2, 0, 0),
> +       GATE(CLK_SMMU_SSS, "smmu_sss", "aclk266_g2d", GATE_IP_G2D, 6, 0, 0),
Probably couple of G2D block clocks are still missing, can you please
take a look?
>  };
>
>  static struct samsung_pll_clock exynos5420_plls[nr_plls] __initdata = {
> diff --git a/include/dt-bindings/clock/exynos5420.h b/include/dt-bindings/clock/exynos5420.h
> old mode 100644
> new mode 100755
> index 223925f..6631dc1
> --- a/include/dt-bindings/clock/exynos5420.h
> +++ b/include/dt-bindings/clock/exynos5420.h
> @@ -175,6 +175,9 @@
>  #define CLK_ACLK_G3D           500
>  #define CLK_G3D                        501
>  #define CLK_SMMU_MIXER         502
> +#define CLK_SMMU_G2D           503
> +#define CLK_SMMU_MDMA0         504
> +#define CLK_SMMU_SSS           505
>
>  /* mux clocks */
>  #define CLK_MOUT_HDMI          640
> --
> 1.7.9.5
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



-- 
Regards,
Alim

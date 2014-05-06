From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4 01/15] clk: exynos5420: Rename mux parent arrays
Date: Tue, 06 May 2014 20:01:11 +0200
Message-ID: <53692367.30907@gmail.com>
References: <1399393610-23394-1-git-send-email-shaik.ameer@samsung.com> <1399393610-23394-2-git-send-email-shaik.ameer@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f53.google.com ([74.125.83.53]:59404 "EHLO
	mail-ee0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751679AbaEFSBY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 May 2014 14:01:24 -0400
In-Reply-To: <1399393610-23394-2-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shaik Ameer Basha <shaik.ameer@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, joshi@samsung.com, shaik.samsung@gmail.com, r.sh.open@gmail.com, alim.akhtar@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>

Shaik,

On 06.05.2014 18:26, Shaik Ameer Basha wrote:
> This patch renames the mux parent arrays as per the naming
> convension followed by the other exynos specific clock drivers.
>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>   drivers/clk/samsung/clk-exynos5420.c |  359 ++++++++++++++++++----------------
>   1 file changed, 186 insertions(+), 173 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 7a9e3b4..831670d 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c

[snip]

>   static struct samsung_mux_clock exynos5420_mux_clks[] __initdata = {
> -	MUX(0, "mout_mspll_kfc", mspll_cpu_p, SRC_TOP7, 8, 2),
> -	MUX(0, "mout_mspll_cpu", mspll_cpu_p, SRC_TOP7, 12, 2),
> -	MUX(0, "mout_apll", apll_p, SRC_CPU, 0, 1),
> -	MUX(0, "mout_cpu", cpu_p, SRC_CPU, 16, 1),
> -	MUX(0, "mout_kpll", kpll_p, SRC_KFC, 0, 1),
> -	MUX(0, "mout_cpu_kfc", kfc_p, SRC_KFC, 16, 1),
> +	MUX(0, "mout_mspll_kfc", mout_mspll_cpu_p, SRC_TOP7, 8, 2),
> +	MUX(0, "mout_mspll_cpu", mout_mspll_cpu_p, SRC_TOP7, 12, 2),
> +	MUX(0, "mout_apll", mout_apll_p, SRC_CPU, 0, 1),
> +	MUX(0, "mout_cpu", mout_cpu_p, SRC_CPU, 16, 1),
> +	MUX(0, "mout_kpll", mout_kpll_p, SRC_KFC, 0, 1),
> +	MUX(0, "mout_kfc", mout_kfc_p, SRC_KFC, 16, 1),

Here the clock name is also changed, but I'll just fix the commit 
message when applying, assuming that this change doesn't break anything.

>
> -	MUX(0, "sclk_bpll", bpll_p, SRC_CDREX, 0, 1),
> +	MUX(0, "sclk_bpll", mout_bpll_p, SRC_CDREX, 0, 1),

[snip]

>   static struct samsung_div_clock exynos5420_div_clks[] __initdata = {
>   	DIV(0, "div_arm", "mout_cpu", DIV_CPU0, 0, 3),
>   	DIV(0, "sclk_apll", "mout_apll", DIV_CPU0, 24, 3),
>   	DIV(0, "armclk2", "div_arm", DIV_CPU0, 28, 3),
> -	DIV(0, "div_kfc", "mout_cpu_kfc", DIV_KFC0, 0, 3),
> +	DIV(0, "div_kfc", "mout_kfc", DIV_KFC0, 0, 3),

Same here.

Best regards,
Tomasz

From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 2/3] clk: exynos5420: Add IDs for clocks used in PD mfc
Date: Fri, 23 May 2014 23:53:19 +0200
Message-ID: <537FC34F.6090206@gmail.com>
References: <1400821692-22370-1-git-send-email-arun.kk@samsung.com> <1400821692-22370-3-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:44372 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751057AbaEWVx0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 17:53:26 -0400
In-Reply-To: <1400821692-22370-3-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: t.figa@samsung.com, kgene.kim@samsung.com, mark.rutland@arm.com, pawel.moll@arm.com, swarren@wwwdotorg.org, prathyush.k@samsung.com, abrestic@chromium.org, arunkk.samsung@gmail.com

Hi Arun,

On 23.05.2014 07:08, Arun Kumar K wrote:
> Adds IDs for MUX clocks to be used by power domain for MFC
> for doing re-parenting while pd on/off.
> 
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5420.c   |    6 ++++--
>  include/dt-bindings/clock/exynos5420.h |    2 ++
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 9d7d7ee..c899dbe 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -631,7 +631,8 @@ static struct samsung_mux_clock exynos5x_mux_clks[] __initdata = {
>  			SRC_TOP4, 16, 1),
>  	MUX(0, "mout_user_aclk266", mout_user_aclk266_p, SRC_TOP4, 20, 1),
>  	MUX(0, "mout_user_aclk166", mout_user_aclk166_p, SRC_TOP4, 24, 1),
> -	MUX(0, "mout_user_aclk333", mout_user_aclk333_p, SRC_TOP4, 28, 1),
> +	MUX(CLK_MOUT_USER_ACLK333, "mout_user_aclk333", mout_user_aclk333_p,
> +							SRC_TOP4, 28, 1),

Please keep the indentation consistent. As you can see below, just two
extra tabs are used on wrapped lines.

>  
>  	MUX(0, "mout_user_aclk400_disp1", mout_user_aclk400_disp1_p,
>  			SRC_TOP5, 0, 1),
> @@ -684,7 +685,8 @@ static struct samsung_mux_clock exynos5x_mux_clks[] __initdata = {
>  			SRC_TOP11, 12, 1),
>  	MUX(0, "mout_sw_aclk266", mout_sw_aclk266_p, SRC_TOP11, 20, 1),
>  	MUX(0, "mout_sw_aclk166", mout_sw_aclk166_p, SRC_TOP11, 24, 1),
> -	MUX(0, "mout_sw_aclk333", mout_sw_aclk333_p, SRC_TOP11, 28, 1),
> +	MUX(CLK_MOUT_SW_ACLK333, "mout_sw_aclk333", mout_sw_aclk333_p,
> +						SRC_TOP11, 28, 1),

Ditto.

Best regards,
Tomasz

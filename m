From: Sylwester Nawrocki <snjw23@gmail.com>
Subject: Re: [PATCH 5/6] ARM: SAMSUNG: Correct M-5MOLS sensor clock frequency
 on Nuri board
Date: Wed, 25 Jan 2012 20:50:48 +0100
Message-ID: <4F205D18.7070509@gmail.com>
References: <1327501407-1927-1-git-send-email-s.nawrocki@samsung.com> <1327501407-1927-6-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:32975 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751089Ab2AYTuw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jan 2012 14:50:52 -0500
Received: by eekc14 with SMTP id c14so2774412eek.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2012 11:50:51 -0800 (PST)
In-Reply-To: <1327501407-1927-6-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, riverful.kim@samsung.com, sw0312.kim@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>

oops, it's for Universal C210 so the subject should be:

ARM: SAMSUNG: Correct M-5MOLS sensor clock frequency on Universal C210 board

Should I resend or would you fix it when applying.

--
Regards,
Sylwester

On 01/25/2012 03:23 PM, Sylwester Nawrocki wrote:
> In order to keep the sensor's master clock frequency in valid range
> when FIMC parent clock is xusbxti, the specified frequency must be
> exactly 24MHZ, otherwise it's being set to too low value due to
> rounding.
> 
> Signed-off-by: Sylwester Nawrocki<s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
> ---
>   arch/arm/mach-exynos/mach-universal_c210.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
> index 44fc43e..0e3aeb9 100644
> --- a/arch/arm/mach-exynos/mach-universal_c210.c
> +++ b/arch/arm/mach-exynos/mach-universal_c210.c
> @@ -973,7 +973,7 @@ static struct s5p_fimc_isp_info universal_camera_sensors[] = {
>   		.bus_type	= FIMC_MIPI_CSI2,
>   		.board_info	=&m5mols_board_info,
>   		.i2c_bus_num	= 0,
> -		.clk_frequency	= 21600000UL,
> +		.clk_frequency	= 24000000UL,
>   		.csi_data_align	= 32,
>   	},
>   };

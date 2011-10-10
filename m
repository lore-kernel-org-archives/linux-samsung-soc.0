From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Enable regulator support for HDMI on Origen
Date: Mon, 10 Oct 2011 13:27:42 +0900
Message-ID: <034901cc8704$f3b0f020$db12d060$%kim@samsung.com>
References: <1317987936-4461-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:42191 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750721Ab1JJE1o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Oct 2011 00:27:44 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSU00KSH1PINVG0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Oct 2011 13:27:42 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSU00KSJ1Q63P60@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 10 Oct 2011 13:27:42 +0900 (KST)
In-reply-to: <1317987936-4461-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> This patch enables the regulators for HDMI on Origen board.
> 
> Since the DC5V line is connected directly to the HDMI connector,
> "hdmi-en" regulator would become a dummy regulator on origen board
> (by defining REGULATOR_DUMMY in the kernel config file).
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-exynos4/mach-origen.c |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/mach-origen.c
b/arch/arm/mach-exynos4/mach-
> origen.c
> index 18909cf..39d8d4e 100644
> --- a/arch/arm/mach-exynos4/mach-origen.c
> +++ b/arch/arm/mach-exynos4/mach-origen.c
> @@ -89,6 +89,8 @@ static struct s3c2410_uartcfg origen_uartcfgs[]
__initdata = {
> 
>  static struct regulator_consumer_supply __initdata ldo3_consumer[] = {
>  	REGULATOR_SUPPLY("vdd11", "s5p-mipi-csis.0"), /* MIPI */
> +	REGULATOR_SUPPLY("vdd", "exynos4-hdmi"), /* HDMI */
> +	REGULATOR_SUPPLY("vdd_pll", "exynos4-hdmi"), /* HDMI */
>  };
>  static struct regulator_consumer_supply __initdata ldo6_consumer[] = {
>  	REGULATOR_SUPPLY("vdd18", "s5p-mipi-csis.0"), /* MIPI */
> @@ -98,6 +100,7 @@ static struct regulator_consumer_supply __initdata
> ldo7_consumer[] = {
>  };
>  static struct regulator_consumer_supply __initdata ldo8_consumer[] = {
>  	REGULATOR_SUPPLY("vdd", "s5p-adc"), /* ADC */
> +	REGULATOR_SUPPLY("vdd_osc", "exynos4-hdmi"), /* HDMI */
>  };
>  static struct regulator_consumer_supply __initdata ldo9_consumer[] = {
>  	REGULATOR_SUPPLY("dvdd", "swb-a31"), /* AR6003 WLAN & CSR 8810
> BT */
> --
> 1.7.4.1

Looks ok to me, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

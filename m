From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: EXYNOS: origen: Add missing USB regulators
Date: Fri, 09 Nov 2012 19:09:06 +0900
Message-ID: <0e8201cdbe62$409dfaa0$c1d9efe0$%kim@samsung.com>
References: <11762974.EgWP4VdH3P@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:50438 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751550Ab2KIKJH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Nov 2012 05:09:07 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD700727TINF5S0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 Nov 2012 19:09:06 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MD70001OTJ6HD90@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 Nov 2012 19:09:06 +0900 (KST)
In-reply-to: <11762974.EgWP4VdH3P@amdc1227>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>
Cc: 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, jhkim@insignal.co.kr

Tomasz Figa wrote:
> 
> This patch adds missing USB OTG regulators needed for s3c-hsotg driver
> to work on Origen board.
> 
> Confirmed with schematics of and tested on Origen board.
> 
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  arch/arm/mach-exynos/mach-origen.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-
> exynos/mach-origen.c
> index d8dc6d7..bf34704 100644
> --- a/arch/arm/mach-exynos/mach-origen.c
> +++ b/arch/arm/mach-exynos/mach-origen.c
> @@ -100,6 +100,7 @@ static struct regulator_consumer_supply __initdata
> ldo3_consumer[] = {
>  	REGULATOR_SUPPLY("vddcore", "s5p-mipi-csis.0"), /* MIPI */
>  	REGULATOR_SUPPLY("vdd", "exynos4-hdmi"), /* HDMI */
>  	REGULATOR_SUPPLY("vdd_pll", "exynos4-hdmi"), /* HDMI */
> +	REGULATOR_SUPPLY("vusb_a", "s3c-hsotg"), /* OTG */
>  };
>  static struct regulator_consumer_supply __initdata ldo6_consumer[] = {
>  	REGULATOR_SUPPLY("vddio", "s5p-mipi-csis.0"), /* MIPI */
> @@ -110,6 +111,7 @@ static struct regulator_consumer_supply __initdata
> ldo7_consumer[] = {
>  static struct regulator_consumer_supply __initdata ldo8_consumer[] = {
>  	REGULATOR_SUPPLY("vdd", "s5p-adc"), /* ADC */
>  	REGULATOR_SUPPLY("vdd_osc", "exynos4-hdmi"), /* HDMI */
> +	REGULATOR_SUPPLY("vusb_d", "s3c-hsotg"), /* OTG */
>  };
>  static struct regulator_consumer_supply __initdata ldo9_consumer[] = {
>  	REGULATOR_SUPPLY("dvdd", "swb-a31"), /* AR6003 WLAN & CSR 8810 BT
> */
> --
> 1.8.0

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: dts: smdk5250: Specify MAX77686 pmic interrupt
Date: Wed, 30 Jul 2014 08:01:24 +0900
Message-ID: <53D827C4.1000708@samsung.com>
References: <1406608029-8538-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:51751 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754258AbaG2XBo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jul 2014 19:01:44 -0400
Received: by mail-pa0-f48.google.com with SMTP id et14so388100pad.35
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Jul 2014 16:01:43 -0700 (PDT)
In-Reply-To: <1406608029-8538-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

On 07/29/14 13:27, Thomas Abraham wrote:
> The IRQB interrupt pin of MAX77686 PMIC is connected to GPX3[2] pin of
> Exynos5250 on the Exynos5250 SMDK board. Specify this connection using
> interrupts property for the max77686 pmic node.
>
> Signed-off-by: Thomas Abraham<thomas.ab@samsung.com>
> ---
>   arch/arm/boot/dts/exynos5250-smdk5250.dts |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> index 695f5ad..cf38808 100644
> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> @@ -50,6 +50,8 @@
>   		max77686@09 {
>   			compatible = "maxim,max77686";
>   			reg =<0x09>;
> +			interrupt-parent =<&gpx3>;
> +			interrupts =<2 0>;
>
>   			voltage-regulators {
>   				ldo1_reg: LDO1 {

Applied, thanks.

- Kukjin

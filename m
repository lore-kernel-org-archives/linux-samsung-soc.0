From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: dts: add clock provider for mshc node for Exynos4412
 SOC
Date: Sat, 21 Dec 2013 05:44:24 +0900
Message-ID: <52B4AC28.3070404@samsung.com>
References: <1358764755-21470-1-git-send-email-thomas.abraham@linaro.org> <000201cefd7f$d8b7c840$8a2758c0$%jun@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:64035 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750938Ab3LTUo3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Dec 2013 15:44:29 -0500
Received: by mail-pd0-f177.google.com with SMTP id q10so2943579pdj.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2013 12:44:29 -0800 (PST)
In-Reply-To: <000201cefd7f$d8b7c840$8a2758c0$%jun@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Seungwon Jeon <tgih.jun@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, jh80.chung@samsung.com, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

On 12/20/13 21:34, Seungwon Jeon wrote:
> Clock lookup information is required as driver can manipulate
> clock rate properly.
>
> Signed-off-by: Seungwon Jeon<tgih.jun@samsung.com>
> ---
>   arch/arm/boot/dts/exynos4412.dtsi |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
> index ec1b166..9cbe59a 100644
> --- a/arch/arm/boot/dts/exynos4412.dtsi
> +++ b/arch/arm/boot/dts/exynos4412.dtsi
> @@ -41,5 +41,7 @@
>   		interrupts =<0 77 0>;
>   		#address-cells =<1>;
>   		#size-cells =<0>;
> +		clocks =<&clock 301>,<&clock 149>;
> +		clock-name = "biu", "ciu";
>   	};
>   };

Applied, thanks.

- Kukjin

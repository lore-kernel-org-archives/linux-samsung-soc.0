From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: dts: Add mfc node for exynos5800
Date: Fri, 23 May 2014 03:36:33 +0900
Message-ID: <537E43B1.1090703@samsung.com>
References: <1400152709-16845-1-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f54.google.com ([209.85.160.54]:57883 "EHLO
	mail-pb0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750917AbaEVSgi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 14:36:38 -0400
Received: by mail-pb0-f54.google.com with SMTP id jt11so2897016pbb.27
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 May 2014 11:36:38 -0700 (PDT)
In-Reply-To: <1400152709-16845-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, k.debski@samsung.com, arunkk.samsung@gmail.com

On 05/15/14 20:18, Arun Kumar K wrote:
> Adds the mfc node to exynos5800 which uses MFCv8.
>
> Signed-off-by: Arun Kumar K<arun.kk@samsung.com>
> ---
> The driver side patch adding support for MFCv8 is under
> review [1]. This is based on the linux-samsung for-next branch.
> [1] https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg30670.html
> ---
>   arch/arm/boot/dts/exynos5800.dtsi |    4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5800.dtsi b/arch/arm/boot/dts/exynos5800.dtsi
> index 6979fc7..c0bb356 100644
> --- a/arch/arm/boot/dts/exynos5800.dtsi
> +++ b/arch/arm/boot/dts/exynos5800.dtsi
> @@ -22,3 +22,7 @@
>   &clock {
>   	compatible = "samsung,exynos5800-clock";
>   };
> +
> +&mfc {
> +	compatible = "samsung,mfc-v8";
> +};

Applied, thanks.

- Kukjin

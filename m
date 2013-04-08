From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: dts: Fix build error in exynos5250-smdk5250.dts
Date: Tue, 09 Apr 2013 03:33:16 +0900
Message-ID: <51630D6C.6030809@samsung.com>
References: <1365397281-32217-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:35323 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935501Ab3DHSdY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Apr 2013 14:33:24 -0400
Received: by mail-pa0-f43.google.com with SMTP id hz11so3414621pad.30
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Apr 2013 11:33:24 -0700 (PDT)
In-Reply-To: <1365397281-32217-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

On 04/08/13 14:01, Sachin Kamat wrote:
> Fixes the following build error:
> Error: arch/arm/boot/dts/exynos5250-smdk5250.dts:250.3-251.1 syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [arch/arm/boot/dts/exynos5250-smdk5250.dtb] Error 1
> make: *** [dtbs] Error 2
>
> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
> ---
> Based on Kukjin's for-next tree.
> ---
>   arch/arm/boot/dts/exynos5250-smdk5250.dts |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> index 4be14df..26d856b 100644
> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> @@ -239,6 +239,7 @@
>   			vback-porch =<4>;
>   			vfront-porch =<4>;
>   			vsync-len =<4>;
> +		};
>   	};
>
>   	fixed-rate-clocks {

Current for-next has no problem with re-sorting out the branch.

Anyway, thanks for your checking and if any problems, please let me know.

Thanks.

- Kukjin

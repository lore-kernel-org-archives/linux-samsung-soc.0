From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] MAINTAINERS: Add DTS files to patterns for Samsung platform
Date: Tue, 08 Oct 2013 07:16:56 +0900
Message-ID: <525332D8.6020408@samsung.com>
References: <1379425337-24078-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:43308 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751485Ab3JGWRA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Oct 2013 18:17:00 -0400
Received: by mail-pa0-f45.google.com with SMTP id rd3so7897973pab.32
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Oct 2013 15:17:00 -0700 (PDT)
In-Reply-To: <1379425337-24078-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@linaro.org>

On 09/17/13 22:42, Mark Brown wrote:
> From: Mark Brown<broonie@linaro.org>
>
> Help ensure that updates to the Samsung device trees get sent to the
> Samsung maintainers for review by adding file patterns to MAINTAINERS.
>
> Signed-off-by: Mark Brown<broonie@linaro.org>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6d0dabe..50e3b1f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1154,6 +1154,8 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>   L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
>   W:	http://www.fluff.org/ben/linux/
>   S:	Maintained
> +F:	arch/arm/boot/dts/s3c*
> +F:	arch/arm/boot/dts/exynos*
>   F:	arch/arm/plat-samsung/
>   F:	arch/arm/mach-s3c24*/
>   F:	arch/arm/mach-s3c64xx/

Applied, thanks.
Kukjin

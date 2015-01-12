From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH RESEND] ARM: EXYNOS: Recognize Samsung MFC v8 devices
Date: Mon, 12 Jan 2015 17:45:58 +0900
Message-ID: <54B389C6.5050701@kernel.org>
References: <1420671974-25938-1-git-send-email-sjoerd.simons@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:33358 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752217AbbALIqF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Jan 2015 03:46:05 -0500
In-Reply-To: <1420671974-25938-1-git-send-email-sjoerd.simons@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Cc: Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

On 01/08/15 08:06, Sjoerd Simons wrote:
> Also setup memory allocations for version 8 of the MFC as present in
> Samsung Exynos 5422/5800 SoCs
> 
> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
> ---
>  arch/arm/mach-exynos/exynos.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
> index c13d083..b343a1a 100644
> --- a/arch/arm/mach-exynos/exynos.c
> +++ b/arch/arm/mach-exynos/exynos.c
> @@ -282,6 +282,7 @@ static void __init exynos_reserve(void)
>  		"samsung,mfc-v5",
>  		"samsung,mfc-v6",
>  		"samsung,mfc-v7",
> +		"samsung,mfc-v8",
>  	};
>  
>  	for (i = 0; i < ARRAY_SIZE(mfc_mem); i++)

Applied, thanks.

- Kukjin

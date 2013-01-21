From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: plat-samsung: using vsnprintf instead of vsprintf
	for the limit buffer length 256
Date: Mon, 21 Jan 2013 16:00:08 +0000
Message-ID: <20130121160008.GO23505@n2100.arm.linux.org.uk>
References: <50FD178E.9090105@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:51194 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755214Ab3AUQAj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jan 2013 11:00:39 -0500
Content-Disposition: inline
In-Reply-To: <50FD178E.9090105@asianux.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chen Gang <gang.chen@asianux.com>
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Mon, Jan 21, 2013 at 06:25:18PM +0800, Chen Gang wrote:
> 
>   the buff size is 256, so need use vsnprintf instead of vsprintf.
> 
> Signed-off-by: Chen Gang <gang.chen@asianux.com>
> ---
>  arch/arm/plat-samsung/pm.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/plat-samsung/pm.c b/arch/arm/plat-samsung/pm.c
> index 1507028..8d07b45 100644
> --- a/arch/arm/plat-samsung/pm.c
> +++ b/arch/arm/plat-samsung/pm.c
> @@ -51,7 +51,7 @@ void s3c_pm_dbg(const char *fmt, ...)
>  	char buff[256];
>  
>  	va_start(va, fmt);
> -	vsprintf(buff, fmt, va);
> +	vsnprintf(buff, 256, fmt, va);

sizeof(buff) would be better here so that it depends on the actual buffer
size.

From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: plat-samsung: using vsnprintf instead of vsprintf
 for the limit buffer length 256
Date: Fri, 25 Jan 2013 10:29:42 -0800
Message-ID: <013d01cdfb29$f3595000$da0bf000$@samsung.com>
References: <50FE0D8B.7010908@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:56891 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932368Ab3AYSaF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jan 2013 13:30:05 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MH70041N2245T00@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 26 Jan 2013 03:30:04 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MH700HZC221OT60@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 26 Jan 2013 03:30:03 +0900 (KST)
In-reply-to: <50FE0D8B.7010908@asianux.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Chen Gang' <gang.chen@asianux.com>, ben-linux@fluff.org, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: 'Ben Dooks' <ben@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Chen Gang wrote:
> 
> 
>   the buff is 256 limited, so need use vsnprintf instead of vsprintf
> 
> Signed-off-by: Chen Gang <gang.chen@asianux.com>
> Cc: Ben Dooks <ben@fluff.org>
> ---
>  arch/arm/plat-samsung/pm.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/plat-samsung/pm.c b/arch/arm/plat-samsung/pm.c
> index 1507028..d896add 100644
> --- a/arch/arm/plat-samsung/pm.c
> +++ b/arch/arm/plat-samsung/pm.c
> @@ -51,7 +51,7 @@ void s3c_pm_dbg(const char *fmt, ...)
>  	char buff[256];
> 
>  	va_start(va, fmt);
> -	vsprintf(buff, fmt, va);
> +	vsnprintf(buff, sizeof(buff), fmt, va);
>  	va_end(va);
> 
>  	printascii(buff);
> --
> 1.7.10.4

Applied, thanks.

- Kukjin

From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH][RESEND] ARM: SAMSUNG: make SAMSUNG_PM_DEBUG select DEBUG_LL
Date: Thu, 22 Mar 2012 07:39:06 -0700
Message-ID: <4F6B398A.8040703@samsung.com>
References: <201203202120.45806.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:54198 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751335Ab2CVOjM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Mar 2012 10:39:12 -0400
Received: by ghrr11 with SMTP id r11so1790851ghr.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Mar 2012 07:39:12 -0700 (PDT)
In-Reply-To: <201203202120.45806.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Maurus Cuelenaere <mcuelenaere@gmail.com>

On 03/20/12 13:20, Heiko St=FCbner wrote:
> From: Maurus Cuelenaere<mcuelenaere@gmail.com>
>
> When selecting SAMSUNG_PM_DEBUG, it complains about a missing printas=
cii()
> function if you do not select DEBUG_LL, so make the former select the=
 latter.
>
> Signed-off-by: Maurus Cuelenaere<mcuelenaere@gmail.com>
> Acked-by: Heiko Stuebner<heiko@sntech.de>
> ---
> This was originally sent in september 2010, but seems to have been fo=
rgotten.
> As this problem has bitten me today, here it is again.
>
Yeah, missed. Looks good to me and will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

>   arch/arm/plat-samsung/Kconfig |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kc=
onfig
> index 6a2abe6..ec84c1a 100644
> --- a/arch/arm/plat-samsung/Kconfig
> +++ b/arch/arm/plat-samsung/Kconfig
> @@ -302,6 +302,7 @@ comment "Power management"
>   config SAMSUNG_PM_DEBUG
>   	bool "S3C2410 PM Suspend debug"
>   	depends on PM
> +	select DEBUG_LL
>   	help
>   	  Say Y here if you want verbose debugging from the PM Suspend and
>   	  Resume code. See<file:Documentation/arm/Samsung-S3C24XX/Suspend.=
txt>

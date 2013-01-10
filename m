From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/5 v3] Add samsung-time support for s3c24xx
Date: Wed, 09 Jan 2013 19:03:27 -0800
Message-ID: <00f201cdeedf$11cc6ce0$356546a0$@samsung.com>
References: <50885608.1030503@openwide.fr> <201212101359.51974.heiko@sntech.de>
 <50CCEEE7.4090203@openwide.fr> <6825637.7rn5o5FT8e@flatron>
 <50EDF2AC.6070203@openwide.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:30084 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758079Ab3AJDDp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jan 2013 22:03:45 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGE00IM7362OKM0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Jan 2013 12:03:41 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGE006MZ361JH60@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Jan 2013 12:03:40 +0900 (KST)
In-reply-to: <50EDF2AC.6070203@openwide.fr>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Romain Naour' <romain.naour@openwide.fr>, 'Tomasz Figa' <tomasz.figa@gmail.com>
Cc: =?iso-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>

Romain Naour wrote:

[...]

> diff --git a/arch/arm/mach-s3c24xx/mach-osiris.c b/arch/arm/mach-
> s3c24xx/mach-osiris.c
> index 1eeeee4..c9bd133 100644
> --- a/arch/arm/mach-s3c24xx/mach-osiris.c
> +++ b/arch/arm/mach-s3c24xx/mach-osiris.c
> @@ -44,6 +44,7 @@
>  #include <plat/devs.h>
>  #include <plat/gpio-cfg.h>
>  #include <plat/regs-serial.h>
> +#include <plat/samsung-timer.h>

Just note,

Happens build error:

arch/arm/mach-s3c24xx/mach-osiris.c:47:32: fatal error:
plat/samsung-timer.h: No such file or directory
compilation terminated.
make[2]: *** [arch/arm/mach-s3c24xx/mach-osiris.o] Error 1
make[2]: *** Waiting for unfinished jobs....

So, should be
+#include <plat/samsung-time.h>

I fixed when I applied.

[...]

Thanks.

- Kukjin

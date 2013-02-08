From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C24XX: osiris: add missing platform_device.h include
Date: Fri, 08 Feb 2013 14:45:28 -0800
Message-ID: <1a5a01ce064d$ff75c600$fe615200$@samsung.com>
References: <201302052250.18818.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:59366 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760366Ab3BHWpp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Feb 2013 17:45:45 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHX000TNB87SK00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 09 Feb 2013 07:45:44 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHX00GKBB867V60@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 09 Feb 2013 07:45:44 +0900 (KST)
In-reply-to: <201302052250.18818.heiko@sntech.de>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=C3=BCbner wrote:
>=20
> The missing include led to a implcit declaration warning.
>=20
Yes, this fixes following:

In file included from arch/arm/mach-s3c24xx/mach-osiris.c:34:0:
include/linux/platform_data/i2c-s3c2410.h:37:26: warning: 'struct platf=
orm_device' declared inside parameter list [enabled by default]
include/linux/platform_data/i2c-s3c2410.h:37:26: warning: its scope is =
only this definition or declaration, which is probably not what you wan=
t [enabled by default]
include/linux/platform_data/i2c-s3c2410.h:66:38: warning: 'struct platf=
orm_device' declared inside parameter list [enabled by default]
include/linux/platform_data/i2c-s3c2410.h:67:38: warning: 'struct platf=
orm_device' declared inside parameter list [enabled by default]
include/linux/platform_data/i2c-s3c2410.h:68:38: warning: 'struct platf=
orm_device' declared inside parameter list [enabled by default]
include/linux/platform_data/i2c-s3c2410.h:69:38: warning: 'struct platf=
orm_device' declared inside parameter list [enabled by default]
include/linux/platform_data/i2c-s3c2410.h:70:38: warning: 'struct platf=
orm_device' declared inside parameter list [enabled by default]
include/linux/platform_data/i2c-s3c2410.h:71:38: warning: 'struct platf=
orm_device' declared inside parameter list [enabled by default]
include/linux/platform_data/i2c-s3c2410.h:72:38: warning: 'struct platf=
orm_device' declared inside parameter list [enabled by default]
include/linux/platform_data/i2c-s3c2410.h:73:38: warning: 'struct platf=
orm_device' declared inside parameter list [enabled by default]

Applied with adding fixed warning message.

Thanks.

- Kukjin

> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/arm/mach-s3c24xx/mach-osiris.c |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/mach-s3c24xx/mach-osiris.c b/arch/arm/mach-
> s3c24xx/mach-osiris.c
> index c2dc032..7d73626 100644
> --- a/arch/arm/mach-s3c24xx/mach-osiris.c
> +++ b/arch/arm/mach-s3c24xx/mach-osiris.c
> @@ -21,6 +21,7 @@
>  #include <linux/clk.h>
>  #include <linux/i2c.h>
>  #include <linux/io.h>
> +#include <linux/platform_device.h>
>=20
>  #include <linux/i2c/tps65010.h>
>=20
> --
> 1.7.10.4

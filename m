From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/3] pinctrl: s3c24xx: use correct header for chained_irq
 functions
Date: Mon, 17 Jun 2013 22:16:08 +0900
Message-ID: <1a1801ce6b5c$d5395270$7fabf750$%kim@samsung.com>
References: <201306140044.15568.heiko@sntech.de>
 <201306140045.51206.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:36726 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932799Ab3FQNQL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 09:16:11 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOJ007RHGUY35G0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Jun 2013 22:16:10 +0900 (KST)
In-reply-to: <201306140045.51206.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Grant Likely' <grant.likely@linaro.org>, linus.walleij@linaro.org

Heiko St=C3=BCbner wrote:
>=20
> chained_irq_enter and chained_irq_exit moved to a real header under
> linux/pinctrl instead of asm/.
>=20
> Update the pinctrl driver to use the correct header and fix the build
> error.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/pinctrl/pinctrl-s3c24xx.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-s3c24xx.c b/drivers/pinctrl/pinc=
trl-
> s3c24xx.c
> index c8b0399..24446da 100644
> --- a/drivers/pinctrl/pinctrl-s3c24xx.c
> +++ b/drivers/pinctrl/pinctrl-s3c24xx.c
> @@ -19,12 +19,11 @@
>  #include <linux/irqdomain.h>
>  #include <linux/irq.h>
>  #include <linux/of_irq.h>
> +#include <linux/irqchip/chained_irq.h>
>  #include <linux/io.h>
>  #include <linux/slab.h>
>  #include <linux/err.h>
>=20
> -#include <asm/mach/irq.h>
> -
>  #include "pinctrl-samsung.h"
>=20
>  #define NUM_EINT	24
> --
> 1.7.10.4

Hmm, would be nice if I could take 1st and 2nd into samsung tree :-)

Linus, if any problems, please let me know.

Thanks,
- Kukjin

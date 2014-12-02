From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 3/3] clk: samsung: remove unnecessary inclusion of header
 files from clk.h
Date: Tue, 02 Dec 2014 16:23:57 +0100
Message-ID: <547DD98D.3000101@samsung.com>
References: <1411796519-19417-1-git-send-email-pankaj.dubey@samsung.com>
 <1411796519-19417-4-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:9554 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751508AbaLBPYM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Dec 2014 10:24:12 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NFY000HEO916QA0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 02 Dec 2014 15:27:01 +0000 (GMT)
In-reply-to: <1411796519-19417-4-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org, naushad@samsung.com

Hi Pankaj,

On 27/09/14 07:41, Pankaj Dubey wrote:
> Let's remove unnecessary include of header files from clk.h and add
> required one in clk.c
>=20
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  drivers/clk/samsung/clk.c |    3 ++-
>  drivers/clk/samsung/clk.h |    4 ----
>  2 files changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> index 31bf391..952f9ec 100644
> --- a/drivers/clk/samsung/clk.c
> +++ b/drivers/clk/samsung/clk.c
> @@ -11,7 +11,8 @@
>   * clock framework for Samsung platforms.
>  */
> =20
> -#include <linux/syscore_ops.h>

I've dropped this change when applying since it causes a build break:

drivers/clk/samsung/clk.c:338:15: error: variable =91samsung_clk_syscor=
e_ops=92 has initializer but incomplete type
drivers/clk/samsung/clk.c:339:2: error: unknown field =91suspend=92 spe=
cified in initializer
drivers/clk/samsung/clk.c:339:2: warning: excess elements in struct ini=
tializer [enabled by default]
drivers/clk/samsung/clk.c:339:2: warning: (near initialization for =91s=
amsung_clk_syscore_ops=92) [enabled by default]
drivers/clk/samsung/clk.c:340:2: error: unknown field =91resume=92 spec=
ified in initializer
drivers/clk/samsung/clk.c:340:2: warning: excess elements in struct ini=
tializer [enabled by default]
drivers/clk/samsung/clk.c:340:2: warning: (near initialization for =91s=
amsung_clk_syscore_ops=92) [enabled by default]  CC      drivers/dma/vi=
rt-dma.o

drivers/clk/samsung/clk.c: In function =91samsung_clk_sleep_init=92:
drivers/clk/samsung/clk.c:359:3: error: implicit declaration of functio=
n =91register_syscore_ops=92 [-Werror=3Dimplicit-function-declaration]

Please make sure there is no build breaks with various configs when
sending patches.

--
Regards,
Sylwester

From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] S3C2443: Fix bit-reset in setrate of clk_armdiv
Date: Mon, 26 Sep 2011 13:26:37 +0900
Message-ID: <00d601cc7c04$7b30f060$7192d120$%kim@samsung.com>
References: <201109222309.00068.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:13195 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750937Ab1IZE0i convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Sep 2011 00:26:38 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LS400CVP4C01KN0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Sep 2011 13:26:37 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LS400GMT4CCLG40@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 26 Sep 2011 13:26:37 +0900 (KST)
In-reply-to: <201109222309.00068.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=FCbner wrote:
>=20
> The changed statement should set the old armdiv bits to 0
> and not everything else, before setting the new value.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/arm/mach-s3c2443/clock.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/arch/arm/mach-s3c2443/clock.c b/arch/arm/mach-s3c2443/cl=
ock.c
> index 966bde5..27549c4 100644
> --- a/arch/arm/mach-s3c2443/clock.c
> +++ b/arch/arm/mach-s3c2443/clock.c
> @@ -124,7 +124,7 @@ static int s3c2443_armclk_setrate(struct clk *clk=
,
unsigned
> long rate)
>  		unsigned long clkcon0;
>=20
>  		clkcon0 =3D __raw_readl(S3C2443_CLKDIV0);
> -		clkcon0 &=3D S3C2443_CLKDIV0_ARMDIV_MASK;
> +		clkcon0 &=3D ~S3C2443_CLKDIV0_ARMDIV_MASK;
>  		clkcon0 |=3D val << S3C2443_CLKDIV0_ARMDIV_SHIFT;
>  		__raw_writel(clkcon0, S3C2443_CLKDIV0);
>  	}
> --
> 1.7.2.3

Hi Heiko,

Yes, you're right.
Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

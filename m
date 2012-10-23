From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] ARM: samsung: call clk_get_rate for debugfs rate files
Date: Tue, 23 Oct 2012 20:01:59 +0900
Message-ID: <01b901cdb10d$d2daac90$789005b0$%kim@samsung.com>
References: <004b01cd8cc9$72a4f1e0$57eed5a0$%choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:10156 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753946Ab2JWLCB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Oct 2012 07:02:01 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCC00BBZEN85EC0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Oct 2012 20:01:59 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCC0016HENBSJ20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Oct 2012 20:01:59 +0900 (KST)
In-reply-to: <004b01cd8cc9$72a4f1e0$57eed5a0$%choi@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ks_c_5601-1987?B?J8PWwb7Iryc=?= <jhbird.choi@samsung.com>, inux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, 'Colin Cross' <ccross@android.com>

=C3=D6=C1=BE=C8=AF wrote:
>=20
> From: Colin Cross <ccross@android.com>
>=20
> c->rate is rarely set, call clk_get_rate on the clock to print
> the value in /d/clock/.../rate.
>=20
> Signed-off-by: Colin Cross <ccross@android.com>
> Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
> ---
>  arch/arm/plat-samsung/clock.c |   10 +++++++++-
>  1 files changed, 9 insertions(+), 1 deletions(-)
>=20
> diff --git a/arch/arm/plat-samsung/clock.c b/arch/arm/plat-samsung/cl=
ock.c
> index 9392959..b8ec1cf 100644
> --- a/arch/arm/plat-samsung/clock.c
> +++ b/arch/arm/plat-samsung/clock.c
> @@ -454,6 +454,14 @@ static const struct file_operations clock_tree_f=
ops =3D
> {
>         .release        =3D single_release,
>  };
>=20
> +static int clock_rate_show(void *data, u64 *val)
> +{
> +       struct clk *c =3D data;
> +       *val =3D clk_get_rate(c);
> +       return 0;
> +}
> +DEFINE_SIMPLE_ATTRIBUTE(clock_rate_fops, clock_rate_show, NULL,
"%llu\n");
> +
>  static int clk_debugfs_register_one(struct clk *c)
>  {
>         int err;
> @@ -480,7 +488,7 @@ static int clk_debugfs_register_one(struct clk *c=
)
>                 goto err_out;
>         }
>=20
> -       d =3D debugfs_create_u32("rate", S_IRUGO, c->dent, (u32 *)&c-=
>rate);
> +       d =3D debugfs_create_file("rate", S_IRUGO, c->dent, c,
> &clock_rate_fops);
>         if (!d) {
>                 err =3D -ENOMEM;
>                 goto err_out;
> --
> 1.7.1

Looks good to me, applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: fix infinite loop issue incurred by no pair
Date: Tue, 18 Nov 2014 22:31:28 +0900
Message-ID: <546B4A30.7090504@samsung.com>
References: <1416280832-24609-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:17926 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753943AbaKRNb3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Nov 2014 08:31:29 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NF800MSELKG3900@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Nov 2014 22:31:28 +0900 (KST)
In-reply-to: <1416280832-24609-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: dri-devel@lists.freedesktop.org, airlied@linux.ie, linux-samsung-soc@vger.kernel.org, khilman@deeprootsystems.com

On 2014=EB=85=84 11=EC=9B=94 18=EC=9D=BC 12:20, Inki Dae wrote:
> This patch fixes a infinite loop issue incurred when
> it doesn't have a pair of crtc and connector drivers,
> which was reported by Kevin Hilman like below,
>       http://www.spinics.net/lists/linux-samsung-soc/msg39050.html
>=20
> cdev->conn_dev could be NULL by exynos_drm_component_del call in case
> that connector driver is failed while probing after compoments to crt=
c
> and connector drivers are added to specific drm_compoment_list.
> In this case, exynos_drm_match_add returns -EPROBE_DEFER error and
> Exynos drm driver will try the defered probe over and over again.
>=20
> This patch makes the deferred probe is tried up to 3 times in maximum=
=2E
> However, this is considered only for Exynos drm so I think other SoC
> drivers could also produce same issue. Therefore, the best way to res=
olve
> this issue, infinite loop incurred by defered probe, would be that dd=
 core
> is fixed up corrrectly.

Ignore this patch. I will post other patch set soon, which supports ful=
l
separated sub driver modules.

Thanks,
Inki Dae

>=20
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c |    8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/dr=
m/exynos/exynos_drm_drv.c
> index eab12f0..4d84f3a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -38,6 +38,8 @@
>  #define DRIVER_MAJOR	1
>  #define DRIVER_MINOR	0
> =20
> +#define MAX_TRY_PROBE_DEFER	3
> +
>  static struct platform_device *exynos_drm_pdev;
> =20
>  static DEFINE_MUTEX(drm_component_lock);
> @@ -481,6 +483,7 @@ static struct component_match *exynos_drm_match_a=
dd(struct device *dev)
>  	struct component_match *match =3D NULL;
>  	struct component_dev *cdev;
>  	unsigned int attach_cnt =3D 0;
> +	static unsigned int try_probe_defer;
> =20
>  	mutex_lock(&drm_component_lock);
> =20
> @@ -527,6 +530,11 @@ out_lock:
> =20
>  	mutex_unlock(&drm_component_lock);
> =20
> +	if (++try_probe_defer > MAX_TRY_PROBE_DEFER) {
> +		try_probe_defer =3D 0;
> +		return ERR_PTR(-ENODEV);
> +	}
> +
>  	return attach_cnt ? match : ERR_PTR(-EPROBE_DEFER);
>  }
> =20
>=20

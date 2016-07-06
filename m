From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] memory: samsung: exynos-srom: fix wrong count of registers
Date: Wed, 06 Jul 2016 09:12:18 +0900
Message-ID: <577C4CE2.2090103@samsung.com>
References: <CGME20160705114058epcas1p103f3f6d7cd39bf6d99f36f0fea2493f0@epcas1p1.samsung.com>
 <1467718817-19239-1-git-send-email-sw0312.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:40178 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750840AbcGFAM0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2016 20:12:26 -0400
In-reply-to: <1467718817-19239-1-git-send-email-sw0312.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Seung-Woo Kim <sw0312.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, k.kozlowski@samsung.com, kgene@kernel.org

On 2016=EB=85=84 07=EC=9B=94 05=EC=9D=BC 20:40, Seung-Woo Kim wrote:
> This patch fixes wrong count of array for srom registers from probe
> function.
>=20
> Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
> ---
>  drivers/memory/samsung/exynos-srom.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/memory/samsung/exynos-srom.c b/drivers/memory/sa=
msung/exynos-srom.c
> index 96756fb..c66d2bd 100644
> --- a/drivers/memory/samsung/exynos-srom.c
> +++ b/drivers/memory/samsung/exynos-srom.c
> @@ -134,7 +134,7 @@ static int exynos_srom_probe(struct platform_devi=
ce *pdev)
>  	platform_set_drvdata(pdev, srom);
> =20
>  	srom->reg_offset =3D exynos_srom_alloc_reg_dump(exynos_srom_offsets=
,
> -			sizeof(exynos_srom_offsets));
> +			ARRAY_SIZE(exynos_srom_offsets));
>  	if (!srom->reg_offset) {
>  		iounmap(srom->reg_base);
>  		return -ENOMEM;
>=20

On the exynos-srom.c, use the ARRAY_SIZE to get the number of array ent=
ry.
Looks good to me.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks,
Chanwoo Choi

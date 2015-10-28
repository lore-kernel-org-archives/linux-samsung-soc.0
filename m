From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 3/7] ARM: exynos_defconfig: enable Exynos DRM Mixer driver
Date: Wed, 28 Oct 2015 15:15:13 +0900
Message-ID: <563067F1.3030801@samsung.com>
References: <1445861025-23266-1-git-send-email-a.hajda@samsung.com>
 <1445861025-23266-4-git-send-email-a.hajda@samsung.com>
 <5630668A.8030909@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:35021 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753192AbbJ1GP0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Oct 2015 02:15:26 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NWX016P52PDUMC0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Oct 2015 15:15:13 +0900 (KST)
In-reply-to: <5630668A.8030909@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>



2015=EB=85=84 10=EC=9B=94 28=EC=9D=BC 15:09=EC=97=90 Krzysztof Kozlowsk=
i =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> On 26.10.2015 21:03, Andrzej Hajda wrote:
>> Mixer driver is selected by CONFIG_DRM_EXYNOS_HDMI option. Since Exy=
nos5433
>> HDMI does not require Mixer. There will be separate options to selec=
t Mixer
>> and HDMI. Adding new option to defconfig before Kconfig will allow t=
o keep
>> bisectability.
>>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> ---
>>  arch/arm/configs/exynos_defconfig | 1 +
>>  1 file changed, 1 insertion(+)
>=20
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>=20
> I guess this will go with rest of patchset through Exynos DRM tree:
> Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Thanks for ack. I will pick it up.

Thanks,
Inki Dae

>=20
>=20
> Best regards,
> Krzysztof
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

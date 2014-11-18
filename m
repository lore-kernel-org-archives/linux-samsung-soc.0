From: Inki Dae <inki.dae@samsung.com>
Subject: Re: exynos boot falures in linux-next
Date: Tue, 18 Nov 2014 11:30:18 +0900
Message-ID: <546AAF3A.5090604@samsung.com>
References: <E1XqKYI-0000pQ-4b@ip-10-35-177-41.ec2.internal>
 <7hoas54y7k.fsf@deeprootsystems.com> <7hlhn9zcse.fsf@deeprootsystems.com>
 <546A83D6.9060504@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:23162 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752045AbaKRCa0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Nov 2014 21:30:26 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NF7009J1QYJ3J70@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Nov 2014 11:30:19 +0900 (KST)
In-reply-to: <546A83D6.9060504@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kevin Hilman <khilman@deeprootsystems.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>

Hello all,

On 2014=EB=85=84 11=EC=9B=94 18=EC=9D=BC 08:25, Javier Martinez Canilla=
s wrote:
> Hello Kevin,
>=20
> On 11/17/2014 11:24 PM, Kevin Hilman wrote:
>>
>> As might have been expected, reverting the change that enables the
>> DRM/display options in exynos_defconfig fixes the problem.
>>
>> Kevin
>>
>=20
> I'm sorry for causing a boot failure but when I first posted that pat=
ch,
> the Exynos DRM driver was working correctly (at least on the Exynos b=
oards
> I've access to) so it seems the regression was introduced while the p=
atch
> was posted but not yet picked.
>=20
> I'm not sure what is the correct step in this case but I'm OK with
> reverting the patch until the Exynos DRM driver bug is fixed.

I found out a bug of Exynos DRM, which is infinite loop issue incurred
by -EPROBE_DEFER. I thought that we resolved this issue with some fixup=
s
but not yet. The problem is because -EPROBE_DEFER is returned in case o=
f
adding a component of a crtc device but one of a connector device. I
will fix it up soon.

Thanks for report,
Inki Dae

>=20
> Best regards,
> Javier
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

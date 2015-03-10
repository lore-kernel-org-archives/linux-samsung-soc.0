From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 1/1] ARM: exynos_defconfig: Disable IOMMU support
Date: Tue, 10 Mar 2015 11:50:02 +0900
Message-ID: <54FE5BDA.5030707@samsung.com>
References: <1424173109-30347-1-git-send-email-javier.martinez@collabora.co.uk>
 <7hioehu8cn.fsf@linaro.org> <54F6C746.606@samsung.com>
 <54F6DD79.9070009@collabora.co.uk> <54F9AC76.1000305@samsung.com>
 <54F9C29C.7050608@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:53150 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751579AbbCJCuF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Mar 2015 22:50:05 -0400
In-reply-to: <54F9C29C.7050608@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kevin Hilman <khilman@kernel.org>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Andreas Faerber <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, tyler.baker@linaro.org, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <daeinki@gmail.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

On 2015=EB=85=84 03=EC=9B=94 07=EC=9D=BC 00:07, Javier Martinez Canilla=
s wrote:
> Hello Inki,
>=20
> On 03/06/2015 02:32 PM, Inki Dae wrote:
>>>
>>> Another interesting data point is that the error in next-20150303 f=
or
>>> these 2 boards was the NULL pointer dereference in exynos_plane_des=
troy
>>> that I got with 4.0-rc2 (when IOMMU is disabled) in Snow and Peach =
Pit.
>>
>> I think the NULL pointer dereference issue may be fixed with below p=
atch
>> I merged to exynos-drm-fixes just a while ago,
>> https://lkml.org/lkml/2015/2/17/434
>>
>> Could you test it with this patch again?
>>
>=20
> Thanks, I tested v4.0-rc2 + the patch to disable IOMMU + the patch yo=
u
> mentioned and the crash does not happen anymore in Peach Pit and Snow=
=2E
>=20
>>>
>>> Another thing that may be useful to detect these issues early is to=
 have
>>> exynos-drm-next be pulled by linux-next since otherwise the integra=
tion
>>> is not tested until the changes are picked by the DRM maintainer.
>>>
>=20
> I know that I may sound like a broken record but could you please mak=
e
> sure that your tree is included in linux-next?

Got it. I got several requests before. I have created a new branch -
exynos-drm/for-next - based on top of drm-next, which would have same
patch set as existing exynos-drm-next.

I will request Stephen Rothwell to merge remote-tracking branch,
'exynos-drm/for-next'.

Thanks,
Inki Dae

>=20
> That way the fix could be tested by all the machines that are testing
> linux-next daily since right now Exynos will still be broken until yo=
u
> send a pull request to the DRM maintainer.
>=20
> So it would be nice to get the changes as soon as possible into -next
> to avoid a recurrent error to mask other possible new issues.
>=20
> Best regards,
> Javier
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

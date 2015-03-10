From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 1/1] ARM: exynos_defconfig: Disable IOMMU support
Date: Tue, 10 Mar 2015 06:23:58 +0100
Message-ID: <54FE7FEE.7020607@collabora.co.uk>
References: <1424173109-30347-1-git-send-email-javier.martinez@collabora.co.uk> <7hioehu8cn.fsf@linaro.org> <54F6C746.606@samsung.com> <54F6DD79.9070009@collabora.co.uk> <54F9AC76.1000305@samsung.com> <54F9C29C.7050608@collabora.co.uk> <54FE5BDA.5030707@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:43200 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751187AbbCJFYG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Mar 2015 01:24:06 -0400
In-Reply-To: <54FE5BDA.5030707@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kevin Hilman <khilman@kernel.org>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Andreas Faerber <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, tyler.baker@linaro.org, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <daeinki@gmail.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hello Inki,

On 03/10/2015 03:50 AM, Inki Dae wrote:
> On 2015=EB=85=84 03=EC=9B=94 07=EC=9D=BC 00:07, Javier Martinez Canil=
las wrote:
>>>>
>>>> Another thing that may be useful to detect these issues early is t=
o have
>>>> exynos-drm-next be pulled by linux-next since otherwise the integr=
ation
>>>> is not tested until the changes are picked by the DRM maintainer.
>>>>
>>=20
>> I know that I may sound like a broken record but could you please ma=
ke
>> sure that your tree is included in linux-next?
>=20
> Got it. I got several requests before. I have created a new branch -
> exynos-drm/for-next - based on top of drm-next, which would have same
> patch set as existing exynos-drm-next.
>=20
> I will request Stephen Rothwell to merge remote-tracking branch,
> 'exynos-drm/for-next'.
>

Great new, thanks a lot.
=20
> Thanks,
> Inki Dae
>=20

Best regards,
Javier

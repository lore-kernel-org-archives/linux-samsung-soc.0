From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 1/1] ARM: exynos_defconfig: Disable IOMMU support
Date: Fri, 06 Mar 2015 22:32:38 +0900
Message-ID: <54F9AC76.1000305@samsung.com>
References: <1424173109-30347-1-git-send-email-javier.martinez@collabora.co.uk>
 <7hioehu8cn.fsf@linaro.org> <54F6C746.606@samsung.com>
 <54F6DD79.9070009@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:11944 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753449AbbCFNcl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Mar 2015 08:32:41 -0500
In-reply-to: <54F6DD79.9070009@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kevin Hilman <khilman@kernel.org>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Andreas Faerber <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, tyler.baker@linaro.org, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <daeinki@gmail.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi all,

On 2015=EB=85=84 03=EC=9B=94 04=EC=9D=BC 19:24, Javier Martinez Canilla=
s wrote:
> +Gustavo which has been looking at the issues
>=20
> Hello,
>=20
> On 03/04/2015 09:50 AM, Marek Szyprowski wrote:
>> Hello,
>>
>> On 2015-03-03 21:36, Kevin Hilman wrote:
>>> Javier Martinez Canillas <javier.martinez@collabora.co.uk> writes:
>>>
>>>> Enabling Exynos DRM IOMMU support for Exynos is currently broken a=
nd
>>>> causes a BUG on exynos-iommu driver. This was not an issue since t=
he
>>>> options was disabled in exynos_defconfig but after commit 8dcc14f8=
2f06
>>>> ("drm/exynos: IOMMU support should not be selectable by user"), it=
 is
>>>> selected if EXYNOS_IOMMU is enabled which is in exynos_defconfig.
>>>>
>>>> So a kernel built using exynos_defconfig after the mentioned commi=
t
>>>> fails to boot [0]. Disable IOMMU support in Exynos defconfig until
>>>> things get sorted out.
>>> So some other exynos boards started failing in next-20150303[1], an=
d
>>> appear are DRM failures.
>>>
>>> Interestingly, (re)enabling CONFIG_EXYNOS_IOMMU for these cause thi=
ngs to
>>> work again.  Even more intersting, with IOMMU enabled, peach-pi is
>>>
>=20
> I built both 4.0-rc2 and linux-next (tag next-20150303) with and with=
out
> CONFIG_EXYNOS_IOMMU and boot tested on Snow, Peach Pit and Pi.
>=20
> We still don't have a Peach Pit hooked in LAVA so I tested it locally
> and pasted the boot logs.
>=20
> 4.0-rc2 (which has CONFIG_EXYNOS_IOMMU enabled)
> -----------------------------------------------
>=20
>  * Snow: NULL pointer dereference at fimd_wait_for_vblank [0]
>=20
>  * Peach Pi: kernel BUG at drivers/iommu/exynos-iommu.c:481 [1]
>=20
>  * Peach Pit: NULL pointer dereference at fimd_wait_for_vblank [2]
>=20
> 4.0-rc2 + CONFIG_EXYNOS_IOMMU disabled
> --------------------------------------
>=20
>  * Snow: NULL pointer dereference at exynos_plane_destroy [3]
>=20
>  * Peach Pi: no error, kernel booted successfully [4]
>=20
>  * Peach Pit: NULL pointer dereference at exynos_plane_destroy [5]
>=20
> next-20150303 (which has CONFIG_EXYNOS_IOMMU disabled)
> -----------------------------------------------------
>=20
>  * Snow: no error, kernel booted successfully [6]
>  * Peach Pi: no error, kernel booted successfully [7]
>  * Peach Pit: no error, kernel booted successfully [8]
>=20
> next-20150303 + CONFIG_EXYNOS_IOMMU (re)enabled
> -----------------------------------------------
>=20
> Snow: no error, kernel booted successfully [9]
> Peach Pi: no error, kernel booted successfully [10]
> Peach Pit: no error, kernel booted successfully [11]
>=20
> Is interesting that the only Exynos5 machines that failed to boot in
> next-20150303 were exynos5250-arndale and exynos5422-odroidxu3 [12].
>=20
> Also, only the exynos5250-arndale failed to boot with next-20150304 [=
13]
> while exynos5422-odroidxu3 booted successfully and there were no chan=
ges
> for the exynos drm driver between next-20150303 and next-20150304.
>=20
> Another interesting data point is that the error in next-20150303 for
> these 2 boards was the NULL pointer dereference in exynos_plane_destr=
oy
> that I got with 4.0-rc2 (when IOMMU is disabled) in Snow and Peach Pi=
t.

I think the NULL pointer dereference issue may be fixed with below patc=
h
I merged to exynos-drm-fixes just a while ago,
https://lkml.org/lkml/2015/2/17/434

Could you test it with this patch again?

Thanks,
Inki Dae

>=20
> So it appears the error is not consistent and may be a race condition=
=2E
>=20
>>> I'm starting to think it's the DRM driver that needs to be disabled
>>> until it actually gets some testing, rathre than disabling IOMMU.
>>
>=20
> It's true that there are a lot of issues with the Exynos DRM driver
> but OTOH those are exposed because the config is enabled by default.
>=20
> My fear is that if we disable the driver, it could silently break
> and be noticed much later when a user enables the option.
>=20
>> Well, this only shows that broken patch has been merged to exynos-dr=
m-next
>> kernel tree. I think that we should keep Exynos DRM enabled and give=
 Exynos
>> DRM developers a chance to fix their stuff and then test their stuff=
=2E
>>
>=20
> Agree, hopefully all these issues are sorted out during the -rc cycle=
 but
> if not then I think we would have to disable the driver as Kevin sugg=
ests.
>=20
> Another thing that may be useful to detect these issues early is to h=
ave
> exynos-drm-next be pulled by linux-next since otherwise the integrati=
on
> is not tested until the changes are picked by the DRM maintainer.
>=20
>> Best regards
>>
>=20
> Best regards,
> Javier
>=20
> [0]: https://lava.collabora.co.uk/scheduler/job/8559/log_file
> [1]: https://lava.collabora.co.uk/scheduler/job/8558/log_file
> [2]: http://hastebin.com/gupoworepa.xml
> [3]: https://lava.collabora.co.uk/scheduler/job/8560/log_file
> [4]: https://lava.collabora.co.uk/scheduler/job/8566/log_file
> [5]: http://hastebin.com/ziyiruretu.xml
> [6]: https://lava.collabora.co.uk/scheduler/job/8570/log_file
> [7]: https://lava.collabora.co.uk/scheduler/job/8571/log_file
> [8]: http://hastebin.com/felopehimi.vhdl
> [9]: https://lava.collabora.co.uk/scheduler/job/8572/log_file
> [10]: https://lava.collabora.co.uk/scheduler/job/8573/log_file
> [11]: http://hastebin.com/kazupucufu.vhdl
> [12]: http://kernelci.org/boot/?next-20150303&fail
> [13]: http://kernelci.org/boot/?next-20150304&fail
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

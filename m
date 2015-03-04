From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH 1/1] ARM: exynos_defconfig: Disable IOMMU support
Date: Wed, 04 Mar 2015 09:39:25 -0800
Message-ID: <7htwy0k6gi.fsf@deeprootsystems.com>
References: <1424173109-30347-1-git-send-email-javier.martinez@collabora.co.uk>
	<7hioehu8cn.fsf@linaro.org> <54F6C746.606@samsung.com>
	<54F6DD79.9070009@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54F6DD79.9070009@collabora.co.uk> (Javier Martinez Canillas's
	message of "Wed, 04 Mar 2015 11:24:57 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Andreas Faerber <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, tyler.baker@linaro.org, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <daeinki@gmail.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

Javier Martinez Canillas <javier.martinez@collabora.co.uk> writes:

> +Gustavo which has been looking at the issues
>
> Hello,
>
> On 03/04/2015 09:50 AM, Marek Szyprowski wrote:
>> Hello,
>> 
>> On 2015-03-03 21:36, Kevin Hilman wrote:
>>> Javier Martinez Canillas <javier.martinez@collabora.co.uk> writes:
>>>
>>>> Enabling Exynos DRM IOMMU support for Exynos is currently broken and
>>>> causes a BUG on exynos-iommu driver. This was not an issue since the
>>>> options was disabled in exynos_defconfig but after commit 8dcc14f82f06
>>>> ("drm/exynos: IOMMU support should not be selectable by user"), it is
>>>> selected if EXYNOS_IOMMU is enabled which is in exynos_defconfig.
>>>>
>>>> So a kernel built using exynos_defconfig after the mentioned commit
>>>> fails to boot [0]. Disable IOMMU support in Exynos defconfig until
>>>> things get sorted out.
>>> So some other exynos boards started failing in next-20150303[1], and
>>> appear are DRM failures.
>>>
>>> Interestingly, (re)enabling CONFIG_EXYNOS_IOMMU for these cause things to
>>> work again.  Even more intersting, with IOMMU enabled, peach-pi is
>>>
>
> I built both 4.0-rc2 and linux-next (tag next-20150303) with and without
> CONFIG_EXYNOS_IOMMU and boot tested on Snow, Peach Pit and Pi.
>
> We still don't have a Peach Pit hooked in LAVA so I tested it locally
> and pasted the boot logs.
>
> 4.0-rc2 (which has CONFIG_EXYNOS_IOMMU enabled)
> -----------------------------------------------
>
>  * Snow: NULL pointer dereference at fimd_wait_for_vblank [0]
>
>  * Peach Pi: kernel BUG at drivers/iommu/exynos-iommu.c:481 [1]
>
>  * Peach Pit: NULL pointer dereference at fimd_wait_for_vblank [2]
>
> 4.0-rc2 + CONFIG_EXYNOS_IOMMU disabled
> --------------------------------------
>
>  * Snow: NULL pointer dereference at exynos_plane_destroy [3]
>
>  * Peach Pi: no error, kernel booted successfully [4]
>
>  * Peach Pit: NULL pointer dereference at exynos_plane_destroy [5]
>
> next-20150303 (which has CONFIG_EXYNOS_IOMMU disabled)
> -----------------------------------------------------
>
>  * Snow: no error, kernel booted successfully [6]
>  * Peach Pi: no error, kernel booted successfully [7]
>  * Peach Pit: no error, kernel booted successfully [8]
>
> next-20150303 + CONFIG_EXYNOS_IOMMU (re)enabled
> -----------------------------------------------
>
> Snow: no error, kernel booted successfully [9]
> Peach Pi: no error, kernel booted successfully [10]
> Peach Pit: no error, kernel booted successfully [11]
>
> Is interesting that the only Exynos5 machines that failed to boot in
> next-20150303 were exynos5250-arndale and exynos5422-odroidxu3 [12].
>
> Also, only the exynos5250-arndale failed to boot with next-20150304 [13]
> while exynos5422-odroidxu3 booted successfully and there were no changes
> for the exynos drm driver between next-20150303 and next-20150304.

My odroid-xu3 failed, but yours and Tyler's booted.  We have different
u-boot versions (mine is mainline), so there may be something bootloader
realted going on with DRM as well:

   http://kernelci.org/boot/?exynos_defconfig&exynos5422-odroid

> Another interesting data point is that the error in next-20150303 for
> these 2 boards was the NULL pointer dereference in exynos_plane_destroy
> that I got with 4.0-rc2 (when IOMMU is disabled) in Snow and Peach Pit.
>
> So it appears the error is not consistent and may be a race condition.
>
>>> I'm starting to think it's the DRM driver that needs to be disabled
>>> until it actually gets some testing, rathre than disabling IOMMU.
>>
>
> It's true that there are a lot of issues with the Exynos DRM driver
> but OTOH those are exposed because the config is enabled by default.
>
> My fear is that if we disable the driver, it could silently break
> and be noticed much later when a user enables the option.

This is a concern, but at the same time, exynos has been pretty
consistently broken in -next and in mainline during this cycle (have a
look at this, and set "boot reports per page" to 100": 
http://kernelci.org/boot/?exynos_defconfig

This kind of constant breakage causes one form of breakage to mask
others, and we end up getting stuck in situations like this in the -rc
cycle when we should be fixing regressions, not problems that have been
around for months already.

>> Well, this only shows that broken patch has been merged to exynos-drm-next
>> kernel tree. I think that we should keep Exynos DRM enabled and give Exynos
>> DRM developers a chance to fix their stuff and then test their stuff.
>
> Agree, hopefully all these issues are sorted out during the -rc cycle but
> if not then I think we would have to disable the driver as Kevin suggests.

I don't mind so much the brokenness in -next, that's what it's for.  The
brokenness in mainline during this part of the -rc cycle is worrisome,
even more so because it's been broken for most of the cycle.

At this point for v4.0-rc, I don't expect there is time to sort out the
proper DRM and have it broadly tested.  It's time to fix the regression
in mainline (maybe by disabling some options), and sort out the right
fix in -next.

> Another thing that may be useful to detect these issues early is to have
> exynos-drm-next be pulled by linux-next since otherwise the integration
> is not tested until the changes are picked by the DRM maintainer.

Agreed.

Kevin

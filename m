From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 1/1] ARM: exynos_defconfig: Disable IOMMU support
Date: Wed, 04 Mar 2015 09:50:14 +0100
Message-ID: <54F6C746.606@samsung.com>
References: <1424173109-30347-1-git-send-email-javier.martinez@collabora.co.uk>
 <7hioehu8cn.fsf@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <7hioehu8cn.fsf@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Andreas Faerber <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, tyler.baker@linaro.org, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <daeinki@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

On 2015-03-03 21:36, Kevin Hilman wrote:
> Javier Martinez Canillas <javier.martinez@collabora.co.uk> writes:
>
>> Enabling Exynos DRM IOMMU support for Exynos is currently broken and
>> causes a BUG on exynos-iommu driver. This was not an issue since the
>> options was disabled in exynos_defconfig but after commit 8dcc14f82f06
>> ("drm/exynos: IOMMU support should not be selectable by user"), it is
>> selected if EXYNOS_IOMMU is enabled which is in exynos_defconfig.
>>
>> So a kernel built using exynos_defconfig after the mentioned commit
>> fails to boot [0]. Disable IOMMU support in Exynos defconfig until
>> things get sorted out.
> So some other exynos boards started failing in next-20150303[1], and
> appear are DRM failures.
>
> Interestingly, (re)enabling CONFIG_EXYNOS_IOMMU for these cause things to
> work again.  Even more intersting, with IOMMU enabled, peach-pi is
>
> I'm starting to think it's the DRM driver that needs to be disabled
> until it actually gets some testing, rathre than disabling IOMMU.

Well, this only shows that broken patch has been merged to exynos-drm-next
kernel tree. I think that we should keep Exynos DRM enabled and give Exynos
DRM developers a chance to fix their stuff and then test their stuff.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

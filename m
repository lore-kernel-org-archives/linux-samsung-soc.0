From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos5422-odroid*: remove fimd node
Date: Thu, 26 Nov 2015 15:29:19 +0100
Message-ID: <5657173F.6070301@samsung.com>
References: <1447151049-25370-1-git-send-email-m.szyprowski@samsung.com>
 <56428F34.7060003@samsung.com> <56531B1F.9050502@osg.samsung.com>
 <5653DEA2.6060802@samsung.com> <5653E851.4070608@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:62975 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750786AbbKZO3X (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Nov 2015 09:29:23 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NYF00KZREWWKL00@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Nov 2015 14:29:20 +0000 (GMT)
In-reply-to: <5653E851.4070608@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello,

On 2015-11-24 05:32, Javier Martinez Canillas wrote:
> Hello Krzysztof,
>
> On 11/24/2015 12:50 AM, Krzysztof Kozlowski wrote:
>> On 23.11.2015 22:56, Javier Martinez Canillas wrote:
>>> Hello Krzysztof,
>>>
>>> On 11/10/2015 09:43 PM, Krzysztof Kozlowski wrote:
>>>
>>> [snip]
>>>
>>>> BTW, do you know why we don't have EXYNOS_IOMMU enabled in defconfig?
>>>> Any reasons against?
>>> It was explicitly disabled by commit 6562f3bd396a ("ARM: exynos_defconfig:
>>> Disable IOMMU support") because Exynos IOMMU support was broken and caused
>>> a BUG on boot, the discussion of the patch is [0].
>> Right, now I remember.
>>
>>
>>> But I just tested booting a v4.4-rc2 kernel on an Exynos5800 Peach Pi with
>>> Exynos IOMMU enabled and the machine boots, display is working and
>>> /sys/kernel/iommu_grups/*/devices shows that the devices were correctly
>>> attached to an IOMMU group so things seems to have been sorted out now.
>>>
>>> So it seems that EXYNOS_IOMMU could be enabled again. It would be good to
>>> give such a patch a spin at kernelci before posting IMHO though just to be
>>> sure there are no issues remaining.
>> Yes for enabling. No for testing only on kernelci. Booting is not a
>> sufficient test in this case. I would expect testing also display - at
> Sorry if I didn't explain myself clearly. I didn't mean that kernelci was
> enough to test Exynos IOMMU support, what I said is that would be nice to
> have some boot coverage besides the normal manual (or automated) display
> testing that someone could do on available platforms as discussed over IRC.
>
>> least some frame buffer console on DP or HDMI (or whatever output could
>> be generated... Xorg/Wayland would be better of course). You need it
> Yes, as I mentioned in the previous email, I tested display (with X) on an
> Exynos5800 Peach Pi. I don't have a rootfs with wayland/weston handy but I
> could prepare one tomorrow to give a try.
>
>> because display and camera (including complementary modules like JPEG,
>> MFC etc) are actually the only users of Exynos IOMMU in mainline.
>>
> Do you have some test cases for MFC? I know that Gstreamer has support
> for it but I don't know what Gst pipelines I can use to test if all is
> working correctly.

Please note that mainline driver for MFC doesn't work with IOMMU enabled 
yet.
I plan to finish a patch for it when I find some free time.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos5422-odroid*: remove fimd node
Date: Tue, 24 Nov 2015 01:32:17 -0300
Message-ID: <5653E851.4070608@osg.samsung.com>
References: <1447151049-25370-1-git-send-email-m.szyprowski@samsung.com>
 <56428F34.7060003@samsung.com> <56531B1F.9050502@osg.samsung.com>
 <5653DEA2.6060802@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:48732 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751814AbbKXEcX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Nov 2015 23:32:23 -0500
In-Reply-To: <5653DEA2.6060802@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello Krzysztof,

On 11/24/2015 12:50 AM, Krzysztof Kozlowski wrote:
> On 23.11.2015 22:56, Javier Martinez Canillas wrote:
>> Hello Krzysztof,
>>
>> On 11/10/2015 09:43 PM, Krzysztof Kozlowski wrote:
>>
>> [snip]
>>
>>>
>>>
>>> BTW, do you know why we don't have EXYNOS_IOMMU enabled in defconfig?
>>> Any reasons against?
>>>
>>
>> It was explicitly disabled by commit 6562f3bd396a ("ARM: exynos_defconfig:
>> Disable IOMMU support") because Exynos IOMMU support was broken and caused
>> a BUG on boot, the discussion of the patch is [0].
> 
> Right, now I remember.
> 
> 
>> But I just tested booting a v4.4-rc2 kernel on an Exynos5800 Peach Pi with
>> Exynos IOMMU enabled and the machine boots, display is working and
>> /sys/kernel/iommu_grups/*/devices shows that the devices were correctly
>> attached to an IOMMU group so things seems to have been sorted out now.
>>
>> So it seems that EXYNOS_IOMMU could be enabled again. It would be good to
>> give such a patch a spin at kernelci before posting IMHO though just to be
>> sure there are no issues remaining.
> 
> Yes for enabling. No for testing only on kernelci. Booting is not a
> sufficient test in this case. I would expect testing also display - at

Sorry if I didn't explain myself clearly. I didn't mean that kernelci was
enough to test Exynos IOMMU support, what I said is that would be nice to
have some boot coverage besides the normal manual (or automated) display
testing that someone could do on available platforms as discussed over IRC.

> least some frame buffer console on DP or HDMI (or whatever output could
> be generated... Xorg/Wayland would be better of course). You need it

Yes, as I mentioned in the previous email, I tested display (with X) on an
Exynos5800 Peach Pi. I don't have a rootfs with wayland/weston handy but I
could prepare one tomorrow to give a try.

> because display and camera (including complementary modules like JPEG,
> MFC etc) are actually the only users of Exynos IOMMU in mainline.
>

Do you have some test cases for MFC? I know that Gstreamer has support
for it but I don't know what Gst pipelines I can use to test if all is
working correctly.

> Best regards,
> Krzysztof
>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America

From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2] ARM: EXYNOS4: Add support for M-5MOLS camera on Nuri
 board
Date: Wed, 12 Oct 2011 16:04:53 +0200
Message-ID: <4E959E85.7070504@samsung.com>
References: <034f01cc8705$199b0dc0$4cd12940$%kim@samsung.com>
 <1318238959-28012-1-git-send-email-s.nawrocki@samsung.com>
 <069701cc88dc$7a484100$6ed8c300$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:40859 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751188Ab1JLOE4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Oct 2011 10:04:56 -0400
Received: from euspt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LSY003Q4HS62Q50@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 12 Oct 2011 15:04:54 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LSY00CQAHS64O@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 12 Oct 2011 15:04:54 +0100 (BST)
In-reply-to: <069701cc88dc$7a484100$6ed8c300$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, riverful.kim@samsung.com, sw0312.kim@samsung.com, 'Kyungmin Park' <kyungmin.park@samsung.com>

Hi Kgene,

On 10/12/2011 02:43 PM, Kukjin Kim wrote:
> Kukjin Kim wrote:
>> Sylwester Nawrocki wrote:
>>>
>>> Add voltage regulator and platform data definition for M-5MOLS sensor
>>> and MIPI-CSI receiver drivers. Add CAM power domain dependencies for
>>> FIMC device and set up camera port A GPIO. Configure I2C0 bus timings.
>>>
>>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>>> Signed-off-by: HeungJun Kim <riverful.kim@samsung.com>
>>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>>> ---
>>> Hi Kgene,
>>>
>>> I have corrected the white space issues as you pointed out and removed
>>> unnecessary gpio_free() in this patch.
>>>
>>> Thanks,
>>>  Sylwester
>>> ---
>>>  arch/arm/mach-exynos4/Kconfig     |    8 ++
>>>  arch/arm/mach-exynos4/mach-nuri.c |  156
>>> +++++++++++++++++++++++++++++++++++++
>>>  2 files changed, 164 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/arch/arm/mach-exynos4/Kconfig
> b/arch/arm/mach-exynos4/Kconfig
>>> index dd660eb..4bc4b1f 100644
>>> --- a/arch/arm/mach-exynos4/Kconfig
>>> +++ b/arch/arm/mach-exynos4/Kconfig
> 
> (snip)
> 
>>> +static struct s5p_platform_fimc fimc_md_platdata = {
>>> +	.isp_info	= nuri_camera_sensors,
>>> +	.num_clients	= ARRAY_SIZE(nuri_camera_sensors),
>>> +};
> 
> Hi Sylwester,
> 
> You need to move 'struct platform_device s5p_device_fimc_md' to
> plat-samsung/devs.c or add 'static' because following error is happened.

Yes, indeed there is an issue with multiple device definition, and the
boards should really not create their own instance.
I'll prepare a patch moving s5p_fimc_device_md to plat-samsung/devs.c
This device instance is also needed for the aggregate FIMC driver to be
initialized on other boards, even if they use only video mem-to-mem.
So the patch should fix the driver initialization issue on these boards.

Sorry about the trouble.

> 
> arch/arm/mach-exynos4/mach-nuri.o: In function `  CC      kernel/sysctl.o
> .LANCHOR1':
> mach-nuri.c:(.data+0x38): multiple definition of `s5p_device_fimc_md'
> arch/arm/mach-exynos4/mach-universal_c210.o:mach-universal_c210.c:(.data+0x1
> 8): first defined here
> make[2]: *** [arch/arm/mach-exynos4/built-in.o] Error 1
> make[1]: *** [arch/arm/mach-exynos4] Error 2
> make[1]: *** Waiting for unfinished jobs....

Regards,
-- 
Sylwester Nawrocki
Samsung Poland R&D Center

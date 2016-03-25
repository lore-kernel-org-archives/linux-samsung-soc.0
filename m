From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2] ARM: exynos_defconfig: Enable Samsung media platform
 drivers as modules
Date: Fri, 25 Mar 2016 00:15:31 -0300
Message-ID: <56F4AD53.2020307@osg.samsung.com>
References: <1458779208-6144-1-git-send-email-javier@osg.samsung.com>
 <56F33C46.8060501@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:57044 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751966AbcCYDPi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Mar 2016 23:15:38 -0400
In-Reply-To: <56F33C46.8060501@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Kukjin Kim <kgene@kernel.org>

Hello Krzysztof,

On 03/23/2016 10:00 PM, Krzysztof Kozlowski wrote:
> On 24.03.2016 09:26, Javier Martinez Canillas wrote:
>> There are a bunch of media platform drivers under drivers/media/platform/
>> that are for Samsung SoCs but are not being built with exynos_defconfig.
>>
>> This patch enables them as a module to improve build coverage for these
>> drivers and also to allow people use them with proper hardware if modules
>> are installed. The S5P MFC driver wasn't enabled since it fails to probe.
>>
>> Only the boolean Kconfig symbols are enabled as built-in, since drivers
>> are not critical and also to keep the kernel binary image size as small
>> as possible.
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>
>> ---
>>
>> Changes in v2:
>> - Remove S5P G2D and GSC symbols since overlaps with Exynos DRM functionality.
>>   Suggested by Tobias Jakobi
>>
>>  arch/arm/configs/exynos_defconfig | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
> 
> Looks good.
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>

Thanks for the review.
 
> 
> How about doing the same for multi_v7?
>

I didn't consider multi_v7 because media drivers aren't necessary for booting
the boards and so it could increase build times for not real benefits in most
machines. But I can enable it in multi_v7 as a follow-up if you think that it
makes sense there too.
 
> 
> Best regards,
> 
> Krzysztof
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America

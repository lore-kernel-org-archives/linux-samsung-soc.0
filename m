From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v3 1/2] ARM: exynos_defconfig: Enable Samsung media
 platform drivers as modules
Date: Mon, 25 Apr 2016 12:44:22 -0400
Message-ID: <571E4966.4010407@osg.samsung.com>
References: <1461270946-7825-1-git-send-email-javier@osg.samsung.com>
 <571DF1E8.8010803@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:53852 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752389AbcDYQod (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Apr 2016 12:44:33 -0400
In-Reply-To: <571DF1E8.8010803@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Kukjin Kim <kgene@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kevin Hilman <khilman@baylibre.com>, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>

Hello Krzysztof,

On 04/25/2016 06:31 AM, Krzysztof Kozlowski wrote:
> On 04/21/2016 10:35 PM, Javier Martinez Canillas wrote:
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
>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>
>> ---
>>
>> Changes in v3:
>> - Added Krzysztof Kozlowski's reviewed by tag.
>>
>> Changes in v2:
>> - Remove S5P G2D and GSC symbols since overlaps with Exynos DRM functionality.
>>   Suggested by Tobias Jakobi
>>
>>  arch/arm/configs/exynos_defconfig | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
> 
> It seems these mails did not reach the mailing lists. I don't see them
> on LKML nor in the patchwork. Could you resend?
>

Strange, LKML is in cc but it's true that didn't end in patchwork...

I'll resend the patches again, thanks for pointing it out.
 
> BR,
> Krzysztof
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America

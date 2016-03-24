From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [RFC PATCH] ARM: exynos_defconfig: Enable Samsung media platform
 drivers as modules
Date: Wed, 23 Mar 2016 21:29:19 -0300
Message-ID: <56F334DF.4050805@osg.samsung.com>
References: <1458745109-21036-1-git-send-email-javier@osg.samsung.com>
 <56F32AFF.60102@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:56788 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751556AbcCXA32 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Mar 2016 20:29:28 -0400
In-Reply-To: <56F32AFF.60102@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>

Hello Krzysztof,

On 03/23/2016 08:47 PM, Krzysztof Kozlowski wrote:
> On 23.03.2016 23:58, Javier Martinez Canillas wrote:
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
>> Hello Kukjin and Krzysztof,
>>
>> I'm posting this as a RFC because I don't know if it will add too much bloat
>> to a kernel built with exynos_defconfig.
>>
>> I think it doesn't since the image size only increased 15 KiB which seems to
>> be a small price for having these built, but you may have another opinion.
> 
> I like enabling as modules whatever look necessary or useful. I don't
> see problems if it requires turning other things to built-in. Please go
> ahead with the patch (and follow up after Tobias comments).
> 

Thanks a lot for your feedback. I went and posted a v2 then addressing
Tobias comments.

> Best regards,
> Krzysztof

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America

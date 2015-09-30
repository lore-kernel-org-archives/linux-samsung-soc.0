From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable WiFi-Ex as a module instead
 built-in
Date: Wed, 30 Sep 2015 16:37:41 +0900
Message-ID: <560B9145.6070606@samsung.com>
References: <1443530546-3066-1-git-send-email-javier@osg.samsung.com>
 <560B2EA4.8050406@samsung.com> <560B8DA3.6060507@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:9209 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753907AbbI3Hhu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Sep 2015 03:37:50 -0400
In-reply-to: <560B8DA3.6060507@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Thierry Reding <treding@nvidia.com>, Anand Moon <linux.amoon@gmail.com>, Russell King <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, Andreas Faerber <afaerber@suse.de>, Lukasz Majewski <l.majewski@samsung.com>, linux-arm-kernel@lists.infradead.org

On 30.09.2015 16:22, Javier Martinez Canillas wrote:
> Hello Krzysztof,
> 
> On 09/30/2015 02:36 AM, Krzysztof Kozlowski wrote:
>> On 29.09.2015 21:42, Javier Martinez Canillas wrote:
>>> The Marvell WiFi-Ex driver tries to load a firmware on probe. So if the
>>> driver is built-in and probed before a firmware is available, this is
>>> not loaded and the chip does not work.
>>>
>>> This happens for example if an initramfs isn't used since the driver is
>>> probed before the root filesystem is mounted.
>>>
>>> Change the default config since the driver isn't needed for machines to
>>> boot and is more convenient to have it enabled as a module to avoid
>>> requiring an initramfs or to have the firmware built into the kernel.
>>>
>>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>>
>>> ---
>>>
>>>  arch/arm/configs/exynos_defconfig | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> The user-space can always initiate re-probing of device - just re-bind
> 
> It is true that you can force a re-probing from user-space by doing:
> 
> $ echo "mmc2:0001:1" > /sys/bus/sdio/drivers/mwifiex_sdio/unbind
> $ echo "mmc2:0001:1" > /sys/bus/sdio/drivers/mwifiex_sdio/bind

I suppose the unbind won't be needed, because device aborted the
probe... so only one another bind.

> 
> but:
> 
> a) This is not obvious. In fact, I didn't think that possibility
> before you mentioned and I've been using Linux for many years :)

Eh, questionable. Obvious for me :)

> 
> b) This is not something that isn't done automatically by init systems.

Right.

> 
> So what users will see is that the driver was probed successfully but
> the firmware fails to load later (since the driver users the async
> request_firmware_nowait function to request the firmware).

Okay.

> 
>> it. However I assume that driver cannot work without firmware?
>>
> 
> Yes, it doesn't. I explained this in the commit message. Do you
> think it should be made more clear?

No, its OK, I agree.

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

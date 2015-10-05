From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/2] ARM: exynos_defconfig: Enable rtl8152 ethernet driver
 for Odroid-XU4
Date: Mon, 05 Oct 2015 16:06:33 +0900
Message-ID: <56122179.1050403@samsung.com>
References: <1444026570-14076-1-git-send-email-linux.amoon@gmail.com>
 <56121AF4.6020202@samsung.com>
 <CANAwSgSCfy_X+HD2NdoeGxSV5srv_a+vzw8Gs94PgVkwn2ZjwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:59037 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751283AbbJEHGu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Oct 2015 03:06:50 -0400
In-reply-to: <CANAwSgSCfy_X+HD2NdoeGxSV5srv_a+vzw8Gs94PgVkwn2ZjwA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Thierry Reding <treding@nvidia.com>, Andreas Faerber <afaerber@suse.de>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Geert Uytterhoeven <geert+renesas@glider.be>, Lee Jones <lee.jones@linaro.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Ray Jui <rjui@broadcom.com>, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On 05.10.2015 16:04, Anand Moon wrote:
> hi Krzysztof,
> 
> On 5 October 2015 at 12:08, Krzysztof Kozlowski <k.kozlowski@samsung.com> wrote:
>> On 05.10.2015 15:29, Anand Moon wrote:
>>> Enable CONFIG_USB_RTL8152 for Odroid-XU4.
>>
>> Why?
>>
>> Best regards,
>> Krzysztof
>>
>>>
>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>>> ---
>>>  arch/arm/configs/exynos_defconfig | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
>>> index 1ff2bfa..5d1937b 100644
>>> --- a/arch/arm/configs/exynos_defconfig
>>> +++ b/arch/arm/configs/exynos_defconfig
>>> @@ -61,6 +61,7 @@ CONFIG_BLK_DEV_DM=y
>>>  CONFIG_DM_CRYPT=m
>>>  CONFIG_NETDEVICES=y
>>>  CONFIG_SMSC911X=y
>>> +CONFIG_USB_RTL8152=y
>>>  CONFIG_USB_USBNET=y
>>>  CONFIG_USB_NET_SMSC75XX=y
>>>  CONFIG_USB_NET_SMSC95XX=y
>>>
>>
> 
> Odroid XU4 supports RTL8152/RTL8153 Based USB 3.0 Ethernet Adapters.
> 
> Will send v2 version of the patch.

Right, just add that sentence to both of the patches. It will be enough.

Best regards,
Krzysztof

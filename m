From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCHv3 1/2] ARM: exynos_defconfig: Enable rtl8152 ethernet
 driver for Odroid-XU4
Date: Thu, 08 Oct 2015 16:46:27 +0900
Message-ID: <56161F53.50505@samsung.com>
References: <1444276117-3657-1-git-send-email-linux.amoon@gmail.com>
 <5077751.tKglqqEUaI@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:48051 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752550AbbJHHq3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Oct 2015 03:46:29 -0400
In-reply-to: <5077751.tKglqqEUaI@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Anand Moon <linux.amoon@gmail.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 08.10.2015 16:41, Arnd Bergmann wrote:
> On Thursday 08 October 2015 03:48:36 Anand Moon wrote:
>> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
>> index 1ff2bfa..5d1937b 100644
>> --- a/arch/arm/configs/exynos_defconfig
>> +++ b/arch/arm/configs/exynos_defconfig
>> @@ -61,6 +61,7 @@ CONFIG_BLK_DEV_DM=y
>>  CONFIG_DM_CRYPT=m
>>  CONFIG_NETDEVICES=y
>>  CONFIG_SMSC911X=y
>> +CONFIG_USB_RTL8152=y
>>  CONFIG_USB_USBNET=y
>>  CONFIG_USB_NET_SMSC75XX=y
>>  CONFIG_USB_NET_SMSC95XX=y
> 
> Can we make that a loadable module for multi_v7_defconfig?

What about nfsroot boots? We were discussing this also here:
http://linux-arm-kernel.infradead.narkive.com/lG5g4hrB/patch-arm-multi-v7-defconfig-enable-usb3503

and actually I would be happy to see a confirmed policy about that.
Everything should be a module for multi_v7?

Best regards,
Krzysztof

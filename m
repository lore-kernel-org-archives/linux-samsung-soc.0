From: Przemyslaw Marczak <p.marczak@samsung.com>
Subject: Re: [PATCH v2 0/4] Add Exynos4412 based Odroid X2 and U2/U3/U3+ support
Date: Fri, 18 Jul 2014 17:40:27 +0200
Message-ID: <53C93FEB.2030507@samsung.com>
References: <1403702773-9141-1-git-send-email-m.szyprowski@samsung.com>
 <53B0F6D1.4090006@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:20838 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965094AbaGRPlD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Jul 2014 11:41:03 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N8W00JG0ZK64370@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jul 2014 16:40:54 +0100 (BST)
In-reply-to: <53B0F6D1.4090006@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Przemyslaw Marczak <p.marczak@samsung.com>, Olof Johansson <olof@lixom.net>

Hello,

On 06/30/2014 07:34 AM, Marek Szyprowski wrote:
> Hello,
>
> On 2014-06-25 15:26, Marek Szyprowski wrote:
>> Hello,
>>
>> This is the second version of the initial patch series adding support
>> for Exynos 4412 based Odroid X2 and U2/U3/U3+ boards and improving
>> support for Odroid X.
>>
>> Complete USB support for Odroid U2/U3/U3+ still requires some fixes in
>> Exynos4 USB2 Phy driver and clock driver for CLKOUT:
>> http://thread.gmane.org/gmane.linux.kernel/1731843/
>> http://www.spinics.net/lists/linux-usb/msg109587.html
>> The above changes however don't affect Odroid DTS files, but without
>> them, usb3503 hub is not yet functional.
>>
>> Support for audio codec will be posted separately by Sylwester Nawrocki
>> soon. Support for HDMI video output will be also posted separately
>> together with the required ExynosDRM-HDMI fixes.
>>
>> If one is interested in more complete and open-source Odroid board
>> support, there are also patches for u-boot project:
>> http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/188295/focus=188610
>>
>
> Just to let everyone knows - updated Odroid patches for uboot has been
> posted in the following thread:
> http://www.mail-archive.com/u-boot@lists.denx.de/msg141234.html
> You can also download them here:
> http://patchwork.ozlabs.org/project/uboot/list/?submitter=23519
>
> Best regards

Please follow the link to the new U-boot Odroid U3/X2 patches:

http://www.mail-archive.com/u-boot@lists.denx.de/msg142507.html

Regards,
-- 
Przemyslaw Marczak
Samsung R&D Institute Poland
Samsung Electronics
p.marczak@samsung.com

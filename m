From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: ARM: dts: exynos: Add MFC memory banks for Peach boards
Date: Thu, 26 May 2016 08:14:29 -0400
Message-ID: <869bee66-9aa8-6c17-d140-3e6644acaf91@osg.samsung.com>
References: <1461871311-18344-1-git-send-email-javier@osg.samsung.com>
 <57456344.7020708@samsung.com>
 <d045b880-4a44-acd8-f7f6-e521caf374aa@osg.samsung.com>
 <574670E7.3060508@samsung.com>
 <476edff1-9f3e-fc5b-4385-d04ae917b58e@osg.samsung.com>
 <5746BD94.3070903@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:48761 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752083AbcEZMOo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 May 2016 08:14:44 -0400
In-Reply-To: <5746BD94.3070903@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "pankaj.dubey" <pankaj.dubey@samsung.com>, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Kevin Hilman <khilman@baylibre.com>

Hello Pankaj,

On 05/26/2016 05:10 AM, pankaj.dubey wrote:

[snip]

>>> [    0.000000] Kernel command line: cros_legacy console=ttySAC3,115200
>>> debug earlyprintk cros_debug no_console_suspend root=/dev/ram0 rw
>>> ramdisk=32768 initrd=0x42000000,3
>>> 2M
>>
>> I see that you are loading an initrd at 0x42000000 with size of 32 MiB.
>>
>> [...]
>>
>>> [    1.121421] Trying to unpack rootfs image as initramfs...
>>> [    1.126940] rootfs image is not initramfs (junk in compressed
>>> archive); looks like an initrd
>>> [    1.160139] Unable to handle kernel paging request at virtual address
>>> e3000000
>>
>> So I wonder if the problem is that the memblock_remove() is called very
>> early and so the kernel is not able to copy the initrd from 0x42000000
>> to 0x44000000 since overlaps with the mfc-r mem (0x43000000-0x43800000).
>>
>> Specially since the NULL pointer dereference below happens in the
>> populate_rootfs() function when calling xwrite() to do the copy.
>>
>> Could you please try to change the load address for your initrd, or
>> change the mfc-r start address to see if that prevents the issue?
>>
> 
> Yes, you are correct. This was the case.
> I changed initrd location from 0x42000000 to 0x44000000, and it is able
> to boot without any crash.
>

Great, good to confirm that this was causing your boot failure.
 
> Thanks,
> Pankaj Dubey
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America

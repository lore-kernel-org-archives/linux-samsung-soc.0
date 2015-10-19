From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [RFC PATCH] ARM: exynos_defconfig: Increase
 CONFIG_BLK_DEV_RAM_SIZE to 64K
Date: Mon, 19 Oct 2015 17:23:13 +0530
Message-ID: <5624D9A9.1030506@samsung.com>
References: <1445251715-9725-1-git-send-email-alim.akhtar@samsung.com>
 <5624D87D.4090901@osg.samsung.com>
 <20151019115150.GY32532@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:60479 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751095AbbJSMCX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 08:02:23 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NWG02VXUURXGA10@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Oct 2015 21:02:21 +0900 (KST)
In-reply-to: <20151019115150.GY32532@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>, Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, k.kozlowski@samsung.com, kgene@kernel.org, linux-arm-kernel@lists.infradead.org

Hi Russell,

On 10/19/2015 05:21 PM, Russell King - ARM Linux wrote:
> On Mon, Oct 19, 2015 at 01:48:13PM +0200, Javier Martinez Canillas wrote:
>> Hello Alim,
>>
>> On 10/19/2015 12:48 PM, Alim Akhtar wrote:
>>> CONFIG_BLK_DEV_RAM_SIZE is currently set to 8K, which is a bit on the
>>> smaller side, lets bump it up to 64K so that a bigger RAM_DISK can
>>> be used with defconfig.
>>>
>>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>>> ---
>>
>> I agree that 8KiB is too small and that should be bumped, I'm also
>> not sure what the best size would be but 64KiB sounds reasonable
>> to me. So for this patch:
>
> It's _not_ 8KiB or 64KiB.
>
> config BLK_DEV_RAM_SIZE
>          int "Default RAM disk size (kbytes)"
>
> It's 8MiB or 64MiB - the value you place here is in units of 1024 bytes.
>
Thanks for correcting, will correct it.

From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [RFC PATCH] ARM: exynos_defconfig: Increase
 CONFIG_BLK_DEV_RAM_SIZE to 64K
Date: Wed, 21 Oct 2015 10:26:56 +0530
Message-ID: <56271B18.7030000@samsung.com>
References: <1445251715-9725-1-git-send-email-alim.akhtar@samsung.com>
 <4039144.iLSv7qv3SU@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:47616 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752694AbbJUFGB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Oct 2015 01:06:01 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NWK02L5H0TYHO60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Oct 2015 14:05:58 +0900 (KST)
In-reply-to: <4039144.iLSv7qv3SU@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, javier@osg.samsung.com, k.kozlowski@samsung.com, kgene@kernel.org

Hi Arnd

On 10/19/2015 06:52 PM, Arnd Bergmann wrote:
> On Monday 19 October 2015 16:18:35 Alim Akhtar wrote:
>> Spam Status: CRM114
>> CONFIG_BLK_DEV_RAM_SIZE is currently set to 8K, which is a bit on the
>> smaller side, lets bump it up to 64K so that a bigger RAM_DISK can
>> be used with defconfig.
>>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> ---
>> Every time I build exynos_defconfig, I need to manually change RAM_SIZE
>> to match my ramdisk image size. I am not sure what is the best ramdisk size
>> might be, but bumping it to 64K might be a reasonable one.
>
> Is there still a reason to use ramdisks these days? If 8MB is not
> enough to have a useful initrd, that might mean that everyone else
> uses initramfs and you should just do the same thing?
>
There is not specific reason to still use ramdisks, but I feel till we 
remove this config, lets modify it to be used by few like me.
I am ok with either way.
Thanks
> Then we can also remove this option here.
>
> 	Arnd
>

From: Kukjin Kim <kgene@kernel.org>
Subject: RE: exynos boot falures in linux-next
Date: Thu, 20 Nov 2014 10:55:31 +0900
Message-ID: <00ae01d00465$10d9edb0$328dc910$@kernel.org>
References: <E1XqKYI-0000pQ-4b@ip-10-35-177-41.ec2.internal>
 <7hoas54y7k.fsf@deeprootsystems.com> <7hlhn9zcse.fsf@deeprootsystems.com>
 <546A83D6.9060504@collabora.co.uk> <7hfvdhyxqi.fsf@deeprootsystems.com>
 <CAMAWPa8D-oRp2yC=n+Rgw_wtwV4+Go0OQi62y3iGRYxi0sow+g@mail.gmail.com>
 <546CCE2F.8030108@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:63645 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755334AbaKTBzd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Nov 2014 20:55:33 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NFB007EAEOJJYB0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Nov 2014 10:55:31 +0900 (KST)
In-reply-to: <546CCE2F.8030108@collabora.co.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>, 'Kevin Hilman' <khilman@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org, 'Olof Johansson' <olof@lixom.net>

Javier Martinez Canillas wrote:

+ Olof,

> Hello Kevin,
> 
Hi,

> On 11/19/2014 06:01 PM, Kevin Hilman wrote:
>>>>
>>>> I'm not sure what is the correct step in this case but I'm OK with
>>>> reverting the patch until the Exynos DRM driver bug is fixed.
>>>
>>> I didn't have time to dig, but I'd rather someone track down the DRM
>>> problem and fix that, since it was known to be working. I'm guessing
>>> it's something simple that can be fixed before the merge window opens.
>> 
>> OK, so this DRM problem is turning out to be non-trivial, so I think
>> the defconfig patch should be reverted until the DRM issue is sorted
>> out.
>> 
>> Otherwise, we risk having boot failures in linux-next which may be
>> hiding other problems.
>> 
>> Kevin
>> 
> 
> Agreed with the config revert, so many issues with Exynos DRM in
linux-next :(
>
Yeah, it could be a best solution at this moment. Let me revert the commit
0ef76aea7a34 ("ARM: exynos_defconfig: Enable options for display panel
support")
from -next in samsung tree.

Thanks,
Kukjin

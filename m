From: "pankaj.dubey" <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v5 0/8] Add support for Exynos SROM Controller driver
Date: Tue, 17 Nov 2015 10:29:10 +0530
Message-ID: <564AB41E.4090107@samsung.com>
References: <1445332540-12814-1-git-send-email-pankaj.dubey@samsung.com>
 <5626DD9A.9030603@samsung.com> <00ba01d10d78$177c1720$46744560$@samsung.com>
 <562A7A03.8040704@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:36306 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751132AbbKQE7J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Nov 2015 23:59:09 -0500
In-reply-to: <562A7A03.8040704@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Pavel Fedin <p.fedin@samsung.com>
Cc: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, thomas.ab@samsung.com, andi.shyti@samsung.com

Hi Kukjin

On Friday 23 October 2015 11:48 PM, Kukjin Kim wrote:
> On 10/23/15 18:49, Pavel Fedin wrote:
>>  Hello!
>>
>>>> This patchset, I have tested on Peach-Pi (Exynos5880) based chromebook for boot
>>>> and S2R functionality.
>>>>
>>>
>>> Entire patchset tested on Trats2 (Exynos4412) board. Unless Kukjin picks
>>> it also, I plan to take it for v4.5.
>>
>>  Tested on SMDK5410. By the way, what is current status? If this is final revision, can i post my Ethernet support patchset on top
>> of it?
>>
>>  Tested-by: Pavel Fedin <p.fedin@samsung.com>
>>
> Applied, this whole series.
> 

I just pulled your tree, and I can't find these SROM patches in for-next
(earlier they were present). Also I can see samsung for-next is pointing
to linus/master branch. As this series not landed in linus tree due last
moment changes, So do I need to rebase SROM patches on top of latest
for-next, and send it once again?

Thanks,
Pankaj Dubey

> Thanks,
> Kukjin
> 

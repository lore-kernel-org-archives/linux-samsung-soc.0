From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH] ARM: exynos: Bring back reboot on Exynos5410
Date: Thu, 29 Oct 2015 14:28:13 +0530
Message-ID: <5631DFA5.8040208@samsung.com>
References: <1446024965-8508-1-git-send-email-p.fedin@samsung.com>
 <56317960.9070608@samsung.com>
 <CAGcde9H4WVt34rn6_9H+sVu2Bp2xq4awMiwV1zgv1D6posPWSg@mail.gmail.com>
 <006c01d11218$d6e2d500$84a87f00$@samsung.com> <5631D8E5.6090506@samsung.com>
 <002801d11225$dedab4a0$9c901de0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:34312 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756322AbbJ2I5n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Oct 2015 04:57:43 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NWZ01XLE4W5XG00@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Oct 2015 17:57:41 +0900 (KST)
In-reply-to: <002801d11225$dedab4a0$9c901de0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pavel Fedin <p.fedin@samsung.com>, 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>
Cc: 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 'Kukjin Kim' <kgene@kernel.org>



On Thursday 29 October 2015 02:13 PM, Pavel Fedin wrote:
>   Hello!
>
>> These patches are not adding any new code, except DT entry. Infact
>> restart handler will be removed from PMU driver and we will be using
>> generic syscon based implementation for reboot, which is already present
>> in Linux kernel.
>
>   Ah, got it. So syscon is a very generic thing, allowing to describe whatever reset register for whatever board, since we are specifying both address and value to write there. Is my understanding correct? If so, then, OK, you can do this too.
>

Yes, syscon-reboot does exactly same. We just need to provide 
"syscon-provider" in our case it's PMU device node, register/offset and 
value to be written, and syscon-reboot driver will take care from 
registered restart-handler.

Thanks,
Pankaj Dubey
> Kind regards,
> Pavel Fedin
> Expert Engineer
> Samsung Electronics Research center Russia
>
>
>

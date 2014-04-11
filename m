From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 08/27] pinctrl: exynos: Add driver data for Exynos3250
Date: Fri, 11 Apr 2014 09:44:32 +0900
Message-ID: <53473AF0.1060103@samsung.com>
References: <1397122124-15690-1-git-send-email-cw00.choi@samsung.com>
 <1397122124-15690-9-git-send-email-cw00.choi@samsung.com>
 <CACRpkdYiFCHFifkpRwDhdAGqBrGTU5E4mfdGE8u1c=zrim17aA@mail.gmail.com>
 <5346EE5A.3070408@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:17040 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750922AbaDKAoc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Apr 2014 20:44:32 -0400
In-reply-to: <5346EE5A.3070408@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, inki.dae@samsung.com, sw0312.kim@samsung.com, hyunhee.kim@samsung.com, yj44.cho@samsung.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi, 

On 04/11/2014 04:17 AM, Tomasz Figa wrote:
> Hi,
> 
> On 10.04.2014 20:42, Linus Walleij wrote:
>> On Thu, Apr 10, 2014 at 11:28 AM, Chanwoo Choi <cw00.choi@samsung.com> wrote:
>>
>>> From: Tomasz Figa <t.figa@samsung.com>
>>>
>>> This patch adds driver data (bank list and EINT layout) for Exynos3250
>>> to pinctrl-exynos driver. Exynos3250 includes 158 multi-functional input/output
>>> ports. There are 23 general port groups.
>>>
>>> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
>>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>>
>> Ugh can Tomasz send out his patches himself, I get confused...
>> It was also sent two times, the second time with CC:s added.
>> Tomasz, shall I merge this?
> 
> I'm fine with this patch being sent by Chanwoo, although he should have probably added his sign-off to the list, as the person sending it.
> 
> Chanwoo, can you make sure that there is your sign-off on all the patches from this series?
> 

OK, I'll add my sign-off to all the patches on next posting(v2).

Best Regards,
Chanwoo Choi

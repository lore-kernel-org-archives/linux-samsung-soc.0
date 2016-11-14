From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: Add level for cpu dt node for exynos7
Date: Mon, 14 Nov 2016 11:28:34 +0530
Message-ID: <5829528A.5070307@samsung.com>
References: <1478945832-1826-1-git-send-email-alim.akhtar@samsung.com>
 <8a63bfe0-b23c-3583-6e5e-c17fe412e34d@osg.samsung.com>
 <CAGOxZ50Ttd1hP0x+Z527wc7mLLpz+Dom0TXFk08+mL0vnaxWwA@mail.gmail.com>
 <CGME20161112191322epcas2p2a32e062f978b5a59b5ba22aa920ccd0c@epcas2p2.samsung.com>
 <CAJKOXPc5aJi9nVv4rd3pB_dkkoJWUjmkEyXF2Kxtp+6Y7VZdWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:40649 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752875AbcKNGA0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Nov 2016 01:00:26 -0500
In-reply-to: <CAJKOXPc5aJi9nVv4rd3pB_dkkoJWUjmkEyXF2Kxtp+6Y7VZdWg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@gmail.com>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, will.deacon@arm.com, "catalin.marinas" <catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, robin.murphy@arm.com

Hi Krzysztof,

On 11/13/2016 12:43 AM, Krzysztof Kozlowski wrote:
> On Sat, Nov 12, 2016 at 6:00 PM, Alim Akhtar <alim.akhtar@gmail.com> wrote:
>> Hi Javier,
>>
>> On Sat, Nov 12, 2016 at 7:54 PM, Javier Martinez Canillas
>> <javier@osg.samsung.com> wrote:
>>> Hello Alim,
>>>
>>> On 11/12/2016 07:17 AM, Alim Akhtar wrote:
>>>> This patch adds level for cpu dt node, so that these levels can be used
>>>
>>> Do you mean s/level/label here? I'm asking because you are using level
>>> consistently in the subject line and commit message but I'm not sure
>>> what it means in this context.
>>>
>>
>> Ah!! my bad. Its __label__. If required, will respin.
>> Thanks for review.
>
> I think there is no need of respin because this should be squashed
> with previous patch. This is quite small and there are no functional
> changes here (labels are transparent, except of course conflict
> cases). Without the 2/2,  this patch does not have much sense yet.
>
The reason why I kept the _label_ changes are separate patch is to keep 
git bisect happy. If you think there won't be a case for that, then lets 
merge the two in single patch.
Let me know if you want me to respin or you will take care.

> Best regards,
> Krzysztof
>
>
>

From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: Add level for cpu dt node for exynos7
Date: Sat, 12 Nov 2016 21:30:50 +0530
Message-ID: <CAGOxZ50Ttd1hP0x+Z527wc7mLLpz+Dom0TXFk08+mL0vnaxWwA@mail.gmail.com>
References: <1478945832-1826-1-git-send-email-alim.akhtar@samsung.com> <8a63bfe0-b23c-3583-6e5e-c17fe412e34d@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:35381 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938806AbcKLQBc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 12 Nov 2016 11:01:32 -0500
In-Reply-To: <8a63bfe0-b23c-3583-6e5e-c17fe412e34d@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, will.deacon@arm.com, "catalin.marinas" <catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, robin.murphy@arm.com

Hi Javier,

On Sat, Nov 12, 2016 at 7:54 PM, Javier Martinez Canillas
<javier@osg.samsung.com> wrote:
> Hello Alim,
>
> On 11/12/2016 07:17 AM, Alim Akhtar wrote:
>> This patch adds level for cpu dt node, so that these levels can be used
>
> Do you mean s/level/label here? I'm asking because you are using level
> consistently in the subject line and commit message but I'm not sure
> what it means in this context.
>

Ah!! my bad. Its __label__. If required, will respin.
Thanks for review.

>> as a phandle whenever required. For example, adding a "interrupt-affinity"
>> for arm pmu node.
>>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> ---
>
> The change looks good to me though.
>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
>
> Best regards,
> --
> Javier Martinez Canillas
> Open Source Group
> Samsung Research America
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Regards,
Alim

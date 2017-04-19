From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] i2c: exynos5: simplify timings calculation
Date: Wed, 19 Apr 2017 15:36:39 -0400
Message-ID: <41071a5a-5a13-2bdc-a36c-909f15abadf3@osg.samsung.com>
References: <CGME20170223164733eucas1p11ad37a2334fe709a062ecc82b5224e1a@eucas1p1.samsung.com>
 <1487868446-5339-1-git-send-email-a.hajda@samsung.com>
 <0e74abb3-9706-b5e4-2428-553d33a61ef4@samsung.com>
 <20170419191719.bzp2nt3l7nxwdzfn@ninjato>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:60924
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S934549AbdDSTgr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Apr 2017 15:36:47 -0400
In-Reply-To: <20170419191719.bzp2nt3l7nxwdzfn@ninjato>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, Andrzej Hajda <a.hajda@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Hello Wolfram,

On 04/19/2017 03:17 PM, Wolfram Sang wrote:
> On Fri, Apr 14, 2017 at 11:24:16AM +0200, Andrzej Hajda wrote:
>> Hi Wolfram,
>>
>> Ping, 7 weeks passed.
> 
> Known issue, there are not enough reviewers for I2C for a timely
> response. I was hoping for some tags from other users of this hardware,
> but that didn't happen. And I don't know this hardware, at all. So, I'll
> apply your patches early in the next cycle, and we will see what happens
> once they are in -next. Best would be if you could find other people to
> donate tags.
>

I got a try to this patch on an Exynos5800 Peach Pi Chromebook and all
the I2C devices are working properly, so:

Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

> Thanks,
> 
>    Wolfram
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America

From: "pankaj.dubey" <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v8 1/8] soc: samsung: add exynos chipid driver support
Date: Wed, 21 Dec 2016 13:22:15 +0530
Message-ID: <fe649525-72de-327b-e11c-72aaa1afc810@samsung.com>
References: <1481375323-29724-1-git-send-email-pankaj.dubey@samsung.com>
 <1481375323-29724-2-git-send-email-pankaj.dubey@samsung.com>
 <CGME20161219120000epcas1p1904dfec707de0ce20341279f354d74dc@epcas1p1.samsung.com>
 <ceba534d-108d-9ac4-d29c-c2a55af49849@fivetechno.de>
 <9b64f5c0-e289-9091-c784-ae4bfad3caf5@samsung.com>
 <CAJKOXPciOBSWFxcB-sYAXwFdyXqKzs=5duZBPjsL2gtt1Xz-cw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:47911 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754356AbcLUHtn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 21 Dec 2016 02:49:43 -0500
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OII031CHZ2S3WB0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Dec 2016 16:49:40 +0900 (KST)
In-reply-to: <CAJKOXPciOBSWFxcB-sYAXwFdyXqKzs=5duZBPjsL2gtt1Xz-cw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Markus Reichl <m.reichl@fivetechno.de>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, geert+renesas@glider.be, Marek Szyprowski <m.szyprowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, kgene@kernel.org, thomas.ab@samsung.com, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>

Hi Markus, Krzysztof,

On Monday 19 December 2016 11:33 PM, Krzysztof Kozlowski wrote:
> On Mon, Dec 19, 2016 at 3:29 PM, pankaj.dubey <pankaj.dubey@samsung.com> wrote:
>>
>> Hi Markus,
>>
>> On Monday 19 December 2016 05:29 PM, Markus Reichl wrote:
>>> Hi Pankaj,
>>>
>>> tested your patches 1/8 and 2/8 + Javiers diff for verbose output:
>>> https://www.spinics.net/lists/linux-samsung-soc/msg56576.html
>>>
>>> on Odroid U3:
>>> [    0.080178] Exynos: CPU[UNKNOWN] CPU_REV[0x20] PKG_ID[0x602d058] AUX_INFO[0x0]
>>> on Odroid X:
>>> [    0.080169] Exynos: CPU[UNKNOWN] CPU_REV[0x11] PKG_ID[0x1b0f6008] AUX_INFO[0x0]
> 
> Hmm.... this needs fixes.
> 

Ah.. I missed to notice this.

I found issue as:  in case of Exynos4412 CPU_ID is mentioned wrong as
(0xE4412000) in the driver code which caused this issue. Correct value
of CPU_ID is 0xE4412200. I will fix this in next version. Once again
thanks for testing and letting me know about this issue.

Thanks,
Pankaj Dubey

> Best regards,
> Krzysztof
> 
> 
> 

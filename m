From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Enable SPI on 4412 based odroid-X and
 -X2 boards.
Date: Fri, 25 Nov 2016 15:45:10 +0100
Message-ID: <44d79467-11ee-f414-1f50-8b4b2bb23723@samsung.com>
References: <CGME20161124141334epcas4p438d988d4762321a072ceb2d02a3450cd@epcas4p4.samsung.com>
 <5ffdcde0-547f-3da6-2371-c0b0cab69b6b@fivetechno.de>
 <8c29f896-9f9d-ebe6-e9ab-991137300502@samsung.com>
 <57c36298-aebe-7a32-a783-0844d2c72726@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:23355 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754421AbcKYOpR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Nov 2016 09:45:17 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OH7003IACZCJA10@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Nov 2016 14:45:12 +0000 (GMT)
In-reply-to: <57c36298-aebe-7a32-a783-0844d2c72726@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Markus Reichl <m.reichl@fivetechno.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Hi Markus,


On 2016-11-25 15:02, Markus Reichl wrote:
> Am 25.11.2016 um 14:39 schrieb Marek Szyprowski:
>> On 2016-11-24 15:13, Markus Reichl wrote:
>>> Odroid-X and -X2 have SPI_1 routed to an external connector.
>>> Enable SPI_1 on X and -X2.
>>>
>>> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
>> Thanks for this patch. Maybe it would make sense also to enable I2C controller,
>> which is also available on the external connector?
> On -X and -X2 I2C-1 is routed to the connector. This bus has been already enabled,
> because the onboard MAX98090 codec is connected to it, too.

Right, I was convinced that there is a second i2c bus routed there on 
X/X2, but it
turned out to be the same bus a the one used for audio codec.

> On U3 there is no native I2C-Bus on the connector. One would have to emulate it
> with the provided GPIOs using i2c-gpio. I think that should not go into the generic
> DTS.

Right. No point adding software emulated buses.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

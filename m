From: Markus Reichl <m.reichl@fivetechno.de>
Subject: Re: [PATCH] ARM: dts: exynos: Enable SPI on 4412 based odroid-X and
 -X2 boards.
Date: Fri, 25 Nov 2016 15:53:39 +0100
Message-ID: <3020d4e7-6a56-1971-6907-a2f98bf26459@fivetechno.de>
References: <CGME20161124141334epcas4p438d988d4762321a072ceb2d02a3450cd@epcas4p4.samsung.com>
 <5ffdcde0-547f-3da6-2371-c0b0cab69b6b@fivetechno.de>
 <8c29f896-9f9d-ebe6-e9ab-991137300502@samsung.com>
 <57c36298-aebe-7a32-a783-0844d2c72726@fivetechno.de>
 <44d79467-11ee-f414-1f50-8b4b2bb23723@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:35120 "EHLO
        wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754213AbcKYOxs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Nov 2016 09:53:48 -0500
In-Reply-To: <44d79467-11ee-f414-1f50-8b4b2bb23723@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Hi Marek,

Am 25.11.2016 um 15:45 schrieb Marek Szyprowski:
> On 2016-11-25 15:02, Markus Reichl wrote:
>> Am 25.11.2016 um 14:39 schrieb Marek Szyprowski:
>>> On 2016-11-24 15:13, Markus Reichl wrote:
>>>> Odroid-X and -X2 have SPI_1 routed to an external connector.
>>>> Enable SPI_1 on X and -X2.
>>>>
>>>> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
>>> Thanks for this patch. Maybe it would make sense also to enable I2C controller,
>>> which is also available on the external connector?
>> On -X and -X2 I2C-1 is routed to the connector. This bus has been already enabled,
>> because the onboard MAX98090 codec is connected to it, too.
> 
> Right, I was convinced that there is a second i2c bus routed there on X/X2, but it
> turned out to be the same bus a the one used for audio codec.

You are right, there is a second i2c bus (I2C-5) on the header pins 7/8.
I will send a patch to enable I2C-5 when I have had the chance to successfully 
test it with a sensor.

--
Markus
> 
>> On U3 there is no native I2C-Bus on the connector. One would have to emulate it
>> with the provided GPIOs using i2c-gpio. I think that should not go into the generic
>> DTS.
> 
> Right. No point adding software emulated buses.
> 
> Best regards

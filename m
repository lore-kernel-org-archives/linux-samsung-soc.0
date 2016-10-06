From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: Problem: "clk: max77686: Migrate to clk_hw based OF and
 registration APIs" breaks s3c-rtc on Odroid U3
Date: Thu, 6 Oct 2016 12:02:10 -0300
Message-ID: <e9455976-3dcd-0276-2c54-374ac0eb9845@osg.samsung.com>
References: <29925ac0-3c97-df1d-0700-de25f1191082@fivetechno.de>
 <57F63554.1050703@math.uni-bielefeld.de>
 <48b59954-02c6-424f-c485-02edd637ef6d@osg.samsung.com>
 <ebf78227-c0d2-d268-298b-1c952c434023@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:57058
        "EHLO s-opensource.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755752AbcJFPCV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Oct 2016 11:02:21 -0400
In-Reply-To: <ebf78227-c0d2-d268-298b-1c952c434023@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Markus Reichl <m.reichl@fivetechno.de>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org, stephen.boyd@linaro.org, krzk@kernel.org
Cc: ldewangan@nvidia.com

Hello Markus,

On 10/06/2016 10:59 AM, Markus Reichl wrote:
> Hi Javier,
> 
> Am 06.10.2016 um 15:44 schrieb Javier Martinez Canillas:
>> Hello,
>>
>> On 10/06/2016 08:28 AM, Tobias Jakobi wrote:
>>> Hello,
>>>
>>> I quickly went over the commit, and I don't see the 'num_clks' fields
>>> being initialized anywhere. So that's probably the reason why it's
>>> always zero and the check in of_clk_max77686_get() fails.
>>>
>>
>> Tobias is correct, that's the issue. I wonder why it worked for me when
>> I tested the patch, probably because the bootloader enables the clocks
>> so I didn't see the difference...
>>
>> Anyways, following is a patch [0] as suggested by Tobias. I don't have
>> access to my platform now to test but if it fixes the issue I can post
>> it as a proper patch.
> 
> Thanks, this fixes the issue on Odroid U3.
>
> Tested-by: Markus Reichl <m.reichl@fivetechno.de>
>

Thanks for testing. I've posted as a proper patch with your Tested-by tag.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America

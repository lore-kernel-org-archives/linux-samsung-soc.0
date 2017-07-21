From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: USB 3.0 is broken on Odroid Xu4 on latest kernel
Date: Fri, 21 Jul 2017 13:14:23 +0200
Message-ID: <c43153ef-bdcd-df59-4fa7-4fe4f0af3ae1@samsung.com>
References: <CANAwSgSoo7g=RN4wQ96+NJRYZYy2WeHwPA-xJ2JY7yt25irDfA@mail.gmail.com>
        <87zic0b8hi.fsf@linux.intel.com>
        <20170721075616.ma57ixucid7233bm@vis.informatik.uni-osnabrueck.de>
        <CGME20170721081040epcas5p463abb05b4b663fc20cbf9ebb06cdacb1@epcas5p4.samsung.com>
        <87vamm43dc.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:26080 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750802AbdGULOb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Jul 2017 07:14:31 -0400
In-reply-to: <87vamm43dc.fsf@linux.intel.com>
Content-language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>, Anand Moon <linux.amoon@gmail.com>
Cc: Jochen Sprickerhof <jochen@sprickerhof.de>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>

Hi,

On 07/21/2017 10:10 AM, Felipe Balbi wrote:
> Jochen Sprickerhof<jochen@sprickerhof.de>  writes:

>> I've send a patch for this some time ago here:
>> http://marc.info/?l=linux-usb&m=149945465112440&w=2
>>
>> This goes along with the patch in this thread:
>> http://marc.info/?l=linux-usb&m=149983203023058&w=2
>>
>> Would be great if you could give it a try and report back.
>>
>> @Felipe can I do anything more to get it accepted upstream?
> you got rid of*all*  context. I have no idea what you're replying
> to. Looking at the patch, though, I think this may be caused by the
> regression on the order of when to get the PHY. That was fixed by TI,
> patch is already on next and greg's queue for next -rc. Please check if
> commit 541768b08a400d9d292cfd9c898401b8178856ac helps you guys.

I tested with that commit on top of v4.13-rc1 and USB seems to
be working properly on Odroid XU4, the mouse is working.

-- 
Regards,
Sylwester

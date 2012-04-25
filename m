From: Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/2] i2c-s3c2410: Rework device type handling
Date: Wed, 25 Apr 2012 13:38:55 +0200
Message-ID: <4F97E24F.5030500@samsung.com>
References: <1335198241-19344-1-git-send-email-k.lewandowsk@samsung.com>
 <1335198241-19344-2-git-send-email-k.lewandowsk@samsung.com>
 <20120423182033.GB2767@pengutronix.de> <4F966711.7080608@samsung.com>
 <20120424144407.GA9007@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20120424144407.GA9007-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 24.04.2012 16:44, Wolfram Sang wrote:

> On Tue, Apr 24, 2012 at 10:40:49AM +0200, Karol Lewandowski wrote:
>> On 23.04.2012 20:20, Wolfram Sang wrote:


>>>> +	if (pdev->dev.of_node) {
>>>> +		const struct of_device_id *match;
>>>> +		match = of_match_node(&s3c24xx_i2c_match, pdev->dev.of_node);
>>>
>>> I'd appreciate a comment explaining why match can't be NULL here (as to
>>> my understanding, it can't). Or just check for it, but this way it looks
>>> a bit fishy and people (hopefully ;)) will ask about it.
>>
>>
>> My understanding is that it can't be null for exactly same reason why
>> platform_get_device_id(pdev) can't be null either (see below).
>>
>> I.e. prerequisite for this code to be run at all (as it's called from
>> driver's .probe()) is to be already matched against very same match
>> table.
> 
> Yes, I agree. Yet, this is not obvious and people might try to fix it
> (especially since programs like smatch report it as potentially
> dangerous). Ah, whatever, I could simply apply the fix then :) OK.


Great! I hope it won't cause any problems. :)

Regards,
-- 
Karol Lewandowski | Samsung Poland R&D Center | Linux/Platform

From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: exynos4412: powerdomain issues with HDMI PHY and VP
Date: Tue, 27 May 2014 18:55:04 +0200
Message-ID: <5384C368.1040909@gmail.com>
References: <538104FF.7070601@gmx.net> <53810E0D.5010802@gmail.com> <7hwqd79nf5.fsf@paris.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:57798 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751615AbaE0QzI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 May 2014 12:55:08 -0400
Received: by mail-wi0-f176.google.com with SMTP id n15so2160682wiw.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 May 2014 09:55:06 -0700 (PDT)
In-Reply-To: <7hwqd79nf5.fsf@paris.lan>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@linaro.org>
Cc: Tobias Jakobi <liquid.acid@gmx.net>, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, arun.kk@samsung.com, Tomasz Stanislawski <t.stanislaws@samsung.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On 27.05.2014 18:49, Kevin Hilman wrote:
> Tomasz Figa <tomasz.figa@gmail.com> writes:
> 
>> Hi Tobias,
>>
>> First of all, big thanks for investigating this issue. Hopefully we can
>> have it fixed in upstream soon.
>>
>> I've added Tomasz Stanislawski to CC list, as he's been doing some work
>> to enable HDMI support on Exynos4 using Exynos DRM.
>>
>> On 24.05.2014 22:45, Tobias Jakobi wrote:
>>> Hello,
>>>
>>> I'm still working on getting HDMI output on my ODROID-X2 board (based on
>>> Exynos4412 Prime) working. My tree is a 3.15-rc6 with some patches on
>>> top to get it boot on the board.
>>>
>>> You can find the tree here:
>>> https://github.com/tobiasjakobi/linux-odroid/commits/odroid-3.15.y
>>>
>>> Here is the DTS:
>>> https://github.com/tobiasjakobi/linux-odroid/blob/odroid-3.15.y/arch/arm/boot/dts/exynos4412-odroidx2.dts
>>>
>>> I encountered two issues with powerdomains. On related to HDMI PHY and
>>> the other one related to the VP (video processor).
>>>
>>> The pd the mixer is in, is currently set to pd_tv. I can't seem to
>>> specify multiple powerdomains for one device. However the PHY seems to
>>> need both TV and LCD0 pd to function properly.
>>
>> We've discovered this issue too. Unfortunately the Linux implementation
>> of generic power domain core (genpd) doesn't support multiple power
>> domains per device, so we ended up with a hack in our internal tree.
>>
>> Generic power domain bindings aren't going to help too much, because
>> even though they account for this, the implementation will use only the
>> first domain.
>>
>> I have CC'ed Rafael, Kevin and Ulf, as they might have some ideas how to
>> solve this.
> 
> Hmm, this seems a bit strange.  How is this implemented in hardware?  It
> seems rather unlikely that the same IP block is getting power from two
> different power rails.  So I don't think what you really want is to have
> the device modeled in 2 power domains.
> 
> Rather, I suspect there's some functional dependency going on that's not
> directly a function of the power domain itself.  Taking a wild shot in
> the dark, it wouldn't be too surprising if the IP block in question
> depends on a clock coming from a device in another power domain?  Since
> this sounds display related, is the pixel clock required coming from an
> IP block in the other power domain?
> 
> If it's something like a clock dependency, then that needs to be modeled
> so what when the clock is enabled, the power domain containg the device
> providing that clock cannot be shut down.

Unfortunately we don't have any more detailed information about this
right now. This dependency is not described in documentation and was
discovered experimentally.

Right now I'm on holidays, so I won't be able to get any details about
this, but Marek and Tomasz S. might be able to come up with something.

Best regards,
Tomasz

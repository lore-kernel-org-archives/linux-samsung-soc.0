From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3] clk: exynos5420: Remove aclk66_peric from the clock
 tree description
Date: Thu, 5 Jun 2014 17:46:23 -0700
Message-ID: <CAD=FV=UQhBh68Bgv=kfUROCOxg1dS1OnZ1ir+wouewKoDFE_1g@mail.gmail.com>
References: <1401467562-5585-1-git-send-email-dianders@chromium.org>
	<1402000514-30752-1-git-send-email-dianders@chromium.org>
	<20140606000324.10062.10257@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f180.google.com ([209.85.128.180]:42010 "EHLO
	mail-ve0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751384AbaFFAqY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Jun 2014 20:46:24 -0400
Received: by mail-ve0-f180.google.com with SMTP id db12so2226150veb.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Jun 2014 17:46:23 -0700 (PDT)
In-Reply-To: <20140606000324.10062.10257@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rahul Sharma <rahul.sharma@samsung.com>, Shaik Ameer Basha <shaik.ameer@samsung.com>, Arun Kumar <arun.kk@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, a.hajda@samsung.com, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

Mike,

On Thu, Jun 5, 2014 at 5:03 PM, Mike Turquette <mturquette@linaro.org> wrote:
> Quoting Doug Anderson (2014-06-05 13:35:14)
>> The "aclk66_peric" clock is a gate clock with a whole bunch of gates
>> underneath it.  This big gate isn't very useful to include in our
>> clock tree.  If any of the children need to be turned on then the big
>> gate will need to be on anyway.  ...and there are plenty of other "big
>> gates" that aren't described in our clock tree, some of which shut off
>> collections of clocks that have no relationship in the hierarchy so
>> are hard to model.
>
> I think this is a common problem. On OMAP we have something similar to
> this called "clock domains" or "clkdm" and it has been historically
> handled outside of the Linux clock framework[1]. There is a relationship
> to the clock framework of course and in the future it might be
> worthwhile to see if there is a generic way to handle this stuff.

That sounds like something that would be nice to solve, but it's not
going to happen now.

On the off chance that the user manual mentioned the existence of one
of these "big gate" bits, it tends to not be very specific about
_exactly_ which sets of clocks it disables.

Tracking down every one of these would be hugely time consuming.
Also: as Tomasz has indicated they don't provide a huge amount of
benefit since we're already dealing with clocks on a more fine-grained
level...


>> "aclk66_peric" is causing earlyprintk problems since it gets disabled
>> as part of the boot process, so let's just remove it.
>>
>> Strangely (and for no good reason) this clock is exported as part of
>> the common clock bindings.  Remove it since there are no in-kernel
>> device trees using it and no reason anyone out of tree should refer to
>> it either.
>
> So Linux has no control over the big gate now, correct? You are
> dependent on the bootloader to ungate this thing?

A better way to put it is that you're dependent on the bootloader not
to gate it.

...but that's also true for pretty much any clock marked IGNORE_UNUSED
and not explicitly enabled anywhere.


Are you opposed to this landing as-is to unblock things and people can
continue to work on the clock driver to make it even better?

-Doug

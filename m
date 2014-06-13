From: Doug Anderson <dianders@google.com>
Subject: Re: [PATCH 3/3] ARM: dts: Enable audio support for Peach-pi board
Date: Fri, 13 Jun 2014 10:13:57 -0700
Message-ID: <CAD=FV=VvkvH1TPiKttm9VXbBRnBo7kmTVK8bZZvexK=bAvaO4Q@mail.gmail.com>
References: <1402464739-19044-1-git-send-email-tushar.b@samsung.com>
	<1402464739-19044-4-git-send-email-tushar.b@samsung.com>
	<CAD=FV=XqqP7+xDOAKCixivzgaO0xvJX7L+CCN+unAEuf-6aUbQ@mail.gmail.com>
	<20140613170511.GA20112@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f173.google.com ([209.85.220.173]:45178 "EHLO
	mail-vc0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753678AbaFMRN6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Jun 2014 13:13:58 -0400
Received: by mail-vc0-f173.google.com with SMTP id lf12so2610882vcb.32
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jun 2014 10:13:58 -0700 (PDT)
In-Reply-To: <20140613170511.GA20112@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Tushar Behera <tushar.b@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Russell King <linux@arm.linux.org.uk>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Kevin Hilman <khilman@linaro.org>, Tushar Behera <trblinux@gmail.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>

Mark,

On Fri, Jun 13, 2014 at 10:05 AM, Mark Brown <broonie@kernel.org> wrote:
> On Fri, Jun 13, 2014 at 10:03:50AM -0700, Doug Anderson wrote:
>> On Tue, Jun 10, 2014 at 10:32 PM, Tushar Behera <tushar.b@samsung.com> wrote:
>
>> > Peach-pi board has MAX98090 audio codec connected on HSI2C-7 bus.
>
>> If you want to be a stickler about it, peach-pi actually has a
>> max98091.  That requires code changes to the i2c driver, though.
>> ...and unfortunately listing two compatible strings for i2c devices is
>> broken.  :(
>
> It is?  We should fix that if it's the case...

Yah, I mentioned it to Mark Rutland at the last ELC and he said he
might take a look at it, but I probably should have posted something
up to the i2c list.

I made a half-assed attempt to fix it locally in the ChromeOS but
quickly found that it was going to be a much bigger job than I had
time for...

https://chromium-review.googlesource.com/#/c/184406/

IIRC i2c_new_device didn't return an error like I thought it would,
probably trying to deal with the fact that devices might show up at a
later point in time.


Hrm, now that I think about it I wonder if the right answer is just to
call i2c_new_device for all the compatible strings even if it doesn't
return an error.  I'd have to go back and try that and re-explore this
code...

-Doug

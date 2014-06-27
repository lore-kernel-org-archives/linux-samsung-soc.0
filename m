From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/2] usb: host: Kconfig: Select PHY drivers for Exynos EHCI/OHCI
Date: Fri, 27 Jun 2014 08:55:31 -0700
Message-ID: <CAD=FV=Xaf-vH79a88q94vOgc+nDhxhtnFdnRMxi1pmLd-mKYBg@mail.gmail.com>
References: <1403761178-5371-1-git-send-email-sachin.kamat@samsung.com>
	<20140627154608.GI8069@saruman.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f172.google.com ([209.85.128.172]:36846 "EHLO
	mail-ve0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751150AbaF0Pzc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jun 2014 11:55:32 -0400
Received: by mail-ve0-f172.google.com with SMTP id jz11so5477701veb.17
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jun 2014 08:55:31 -0700 (PDT)
In-Reply-To: <20140627154608.GI8069@saruman.home>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>
Cc: Sachin Kamat <sachin.kamat@samsung.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vivek Gautam <gautam.vivek@samsung.com>, Sachin Kamat <spk.linux@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>

Felipe,

On Fri, Jun 27, 2014 at 8:46 AM, Felipe Balbi <balbi@ti.com> wrote:
> On Thu, Jun 26, 2014 at 11:09:37AM +0530, Sachin Kamat wrote:
>> EHCI and OHCI drivers on Exynos platforms do not work without their
>> corresponding SoC specific phy drivers. Hence it makes no sense to
>> keep these phy drivers as user selectable. Instead select them from
>> the respective USB configs to make things easier for the end user.
>> While at it enable 5250 phy for Exynos 5420 SoC too.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
>> Cc: Kishon Vijay Abraham I <kishon@ti.com>
>
> no more selects, please. We've already had way too many issues because
> of misused selects.

I'll admit to not having been involved with the previous discussions,
but this seems strange to me.  Are we throwing in the towel and
deciding that it's too hard to get the Kconfigs right and that we'll
just rely on individual users to figure out the right answer for
themselves?

Certainly the Exynos USB driver is not useful without the Exynos USB
Phy driver, so it seems awfully strange to allow the user to select
one without getting the other...  ...and if including an extra USB Phy
driver will break something then it seems like we have bigger problems
(aren't we supposed to have one kernel that works across a wide
variety of boards?)

-Doug

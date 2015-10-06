From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH RESEND] phy: exynos-usb2: add vbus regulator support
Date: Tue, 6 Oct 2015 17:02:00 +0200
Message-ID: <5613E268.30508@osg.samsung.com>
References: <1444138860-23595-1-git-send-email-m.szyprowski@samsung.com>
 <CAJKOXPdZ+ed7UacrAChfMS+SfQxPZgvkshoJiSd0_yxRTSpTSA@mail.gmail.com>
 <5613D5FF.4040702@samsung.com> <5613DAC2.7050508@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:47487 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751190AbbJFPCH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Oct 2015 11:02:07 -0400
In-Reply-To: <5613DAC2.7050508@ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Hello Kishon,

On 10/06/2015 04:29 PM, Kishon Vijay Abraham I wrote:
> On Tuesday 06 October 2015 07:39 PM, Marek Szyprowski wrote:

[snip]

>>
>> This was a pure resend, no changes to the patch has been made. I just
>> noticed
>> that it is over 6 weeks since the initial submission and the patch is still
>> not in linux-next...
> 
> It won't be in linux-next. I've just merged this patch to linux-phy
> -next and will be sent during the next merge window. Only fixes will be
> merged during the -rc releases.
>

When patches are pushed to mainline it's somehow orthogonal to what is
exposed in -next. Only fixes for regressions will be pushed during the
-rc cycle and new features will be pushed during the next merge window
of course but that should not prevent accepted patches to get some test
coverage under -next.

In fact, ideally patches should sit in -next for a couple of weeks before
are pushed to mainline since there is a lot of automated (0day, kernelci,
etc) and manual testing that happen on that tree to detect issues earlier.

I noticed that linux-phy isn't shown in [0] though, probably should be added?

> Thanks
> Kishon
> --

[0]: http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/Next/Trees?id=HEAD

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America

From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/3] arm64: Add Kconfig option for Samsung GH7 SoC family
Date: Tue, 18 Feb 2014 19:13:47 +0100
Message-ID: <6032891.ndY8FikAMY@wuerfel>
References: <1392100183-30930-1-git-send-email-kgene.kim@samsung.com> <5302B306.8090503@samsung.com> <CAOesGMhnUDcUL7hREV=EYEGr5YG-ZLL6v9NiGcrBr6477WfdyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:55906 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750800AbaBRSO0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Feb 2014 13:14:26 -0500
In-Reply-To: <CAOesGMhnUDcUL7hREV=EYEGr5YG-ZLL6v9NiGcrBr6477WfdyQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, John Stultz <john.stultz@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Ilho Lee <ilho215.lee@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>

On Tuesday 18 February 2014 08:16:13 Olof Johansson wrote:
> On Mon, Feb 17, 2014 at 5:10 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > On 02/15/14 02:06, Arnd Bergmann wrote:
> >> My feeling is that we don't need to use the levels for Kconfig, although
> >> we might want to use them DT compatible strings, even if it ends up
> >> looking
> >> a little funny when you do
> >>
> >>         compatible = "arm,sbsa-l3", "arm,sbsa-l2", "arm,sbsa-l1";
> >>
> >>> What kind of features are you expecting though? More IP
> >>> blocks/devices? Those are just kernel config options to enable,
> >>> ideally as modules.
> >>
> >>
> >> Right, I think we can just put them into defconfig. No need to
> >> "select" them from Kconfig since the extra options wouldn't be
> >> required for booting or using the system.
> >>
> > As I commented above, how about MCT? Samsung has a plan to use MCT on ARMv8,
> > it is not for used for GH7 though...
> 
> It looks like the clocksource drivers are all based around being
> enabled based on platforms instead of individually selectable. That
> causes a problem here. I think we should change the clocksource
> Kconfig instead. Then it's just a matter of making sure your defconfig
> has the needed driver enabled.
> 
> (Adding Daniel and Thomas in case they have objections to that approach)

+John Stultz

IIRC it was John who insisted on doing it the current way, although
I can't remember his reasoning.

	Arnd

From: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH 2/3] arm64: Add Kconfig option for Samsung GH7 SoC family
Date: Tue, 18 Feb 2014 11:52:25 -0800
Message-ID: <CALAqxLX6STNqUeVO2G18bm_HKabpoRxZTa3uK6i-JP97zEYVZg@mail.gmail.com>
References: <1392100183-30930-1-git-send-email-kgene.kim@samsung.com>
	<5302B306.8090503@samsung.com>
	<CAOesGMhnUDcUL7hREV=EYEGr5YG-ZLL6v9NiGcrBr6477WfdyQ@mail.gmail.com>
	<6032891.ndY8FikAMY@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f171.google.com ([209.85.220.171]:33378 "EHLO
	mail-vc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750832AbaBRTw1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Feb 2014 14:52:27 -0500
Received: by mail-vc0-f171.google.com with SMTP id le5so13619233vcb.16
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Feb 2014 11:52:26 -0800 (PST)
In-Reply-To: <6032891.ndY8FikAMY@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Ilho Lee <ilho215.lee@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>

On Tue, Feb 18, 2014 at 10:13 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tuesday 18 February 2014 08:16:13 Olof Johansson wrote:
>> On Mon, Feb 17, 2014 at 5:10 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
>> > On 02/15/14 02:06, Arnd Bergmann wrote:
>> >> My feeling is that we don't need to use the levels for Kconfig, although
>> >> we might want to use them DT compatible strings, even if it ends up
>> >> looking
>> >> a little funny when you do
>> >>
>> >>         compatible = "arm,sbsa-l3", "arm,sbsa-l2", "arm,sbsa-l1";
>> >>
>> >>> What kind of features are you expecting though? More IP
>> >>> blocks/devices? Those are just kernel config options to enable,
>> >>> ideally as modules.
>> >>
>> >>
>> >> Right, I think we can just put them into defconfig. No need to
>> >> "select" them from Kconfig since the extra options wouldn't be
>> >> required for booting or using the system.
>> >>
>> > As I commented above, how about MCT? Samsung has a plan to use MCT on ARMv8,
>> > it is not for used for GH7 though...
>>
>> It looks like the clocksource drivers are all based around being
>> enabled based on platforms instead of individually selectable. That
>> causes a problem here. I think we should change the clocksource
>> Kconfig instead. Then it's just a matter of making sure your defconfig
>> has the needed driver enabled.
>>
>> (Adding Daniel and Thomas in case they have objections to that approach)
>
> +John Stultz
>
> IIRC it was John who insisted on doing it the current way, although
> I can't remember his reasoning.

Are we really expecting there to be SoC specific clocksources here? I
thought we were getting away from that sort of stuff with the
architecture timer?

I'm fine with clocksources being selected by other functionality
options (ie: on x86 ACPI PM timer clocksource doesn't have a prompt,
but depends on the ACPI option). I just don't want to force users to
have to navigate through tons of deep menus to select clocksource
options that logically duplicate other selections already made.

But again, I handed this maintainership over to Daniel, so I can be
considered just a crank yelling from the sidelines :)

thanks
-john

From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 2/4] ARM: dts: exynos5250: cypress,cyapa trackpad is
 Snow only
Date: Wed, 30 Jul 2014 08:06:40 +0900
Message-ID: <53D82900.1050409@samsung.com>
References: <1405704009-8430-1-git-send-email-afaerber@suse.de>	<1405704009-8430-3-git-send-email-afaerber@suse.de> <CAD=FV=VAWG=H9=mwKZfip9zvAROU3aVXihnaBUBr0GNSzDoWFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:46349 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753131AbaG2XGr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jul 2014 19:06:47 -0400
In-Reply-To: <CAD=FV=VAWG=H9=mwKZfip9zvAROU3aVXihnaBUBr0GNSzDoWFw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "moderated list:ARM/SAMSUNG ARM A..." <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

On 07/30/14 01:16, Doug Anderson wrote:
> Andreas,
>
> On Fri, Jul 18, 2014 at 10:20 AM, Andreas F=C3=A4rber<afaerber@suse.d=
e>  wrote:
>> Move it from exynos5250-cros-common.dtsi to exynos5250-snow.dts.
>> Spring does not need it, it uses an Atmel maXTouch instead.
>>
>> Signed-off-by: Andreas F=C3=A4rber<afaerber@suse.de>
>> ---
>>   v2: New (Doug Anderson)
>>
>>   arch/arm/boot/dts/exynos5250-cros-common.dtsi |  8 --------
>>   arch/arm/boot/dts/exynos5250-snow.dts         | 10 ++++++++++
>>   2 files changed, 10 insertions(+), 8 deletions(-)
>
> Reviewed-by: Doug Anderson<dianders@chromium.org>
>
> Kukjin could apply this now if he wanted to avoid future conflicts.

OK, I read your comments on another this series and I've applied 1/4 an=
d=20
2/4 as per your suggestion with your reviewed by tag ;)

And I think, Andreas is going to re-spin remains for exynos5250-spring=20
based on updated my -next?

Thanks,
Kukjin

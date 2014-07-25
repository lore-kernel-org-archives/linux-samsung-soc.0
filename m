From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 1/4] ARM: dts: exynos5250: max77686 is Snow only
Date: Fri, 25 Jul 2014 08:13:07 -0700
Message-ID: <CAD=FV=VeBP=1CiKesp738anZzSJNZCGkg68RBUUCyJ5U6_Y75w@mail.gmail.com>
References: <1405704009-8430-1-git-send-email-afaerber@suse.de>
	<1405704009-8430-2-git-send-email-afaerber@suse.de>
	<08fe01cfa7c9$341cc700$9c565500$@samsung.com>
	<CAD=FV=VUkU7HWjwCKO=WOrKosUtmv3YE_8pxc5uoQg0cHr-AKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:62973 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752507AbaGYPNI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jul 2014 11:13:08 -0400
Received: by mail-vc0-f174.google.com with SMTP id la4so7394529vcb.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Jul 2014 08:13:08 -0700 (PDT)
In-Reply-To: <CAD=FV=VUkU7HWjwCKO=WOrKosUtmv3YE_8pxc5uoQg0cHr-AKQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Ben Dooks <ben-linux@fluff.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "moderated list:ARM/SAMSUNG ARM A..." <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Andreas,

On Fri, Jul 25, 2014 at 8:08 AM, Doug Anderson <dianders@chromium.org> =
wrote:
> Hi,
>
> On Thu, Jul 24, 2014 at 10:28 PM, Kukjin Kim <kgene.kim@samsung.com> =
wrote:
>> Andreas F=C3=A4rber wrote:
>>>
>>> Move it from exynos5250-cros-common.dtsi to exynos5250-snow.dts.
>>> Spring does not need it, it uses an s5m8767 instead.
>>>
>>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>>> ---
>>
>> Hi Andreas,
>>
>> I think this should be reviewed by chrome guys.
>>
>>
>> Doug, can you have a look this series for exynos5250-chromebook?
>> I'm not sure exynos5250-cros-common is still useful for exynos5250-s=
pring...
>
> Sorry, I've been on vacation and am now playing catchup.
>
> Right.  The current suggestion is to rework to just duplicate things
> and don't use exynos5250-cros-common.

Oh, it actually looks like your patch series ends up there, but the
first patch confused me.  Why move just the maxim PMIC first?  Move
everything at once and be done with the common file, then do
cleanup...

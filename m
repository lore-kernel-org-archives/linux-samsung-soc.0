From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 1/4] ARM: dts: exynos5250: max77686 is Snow only
Date: Fri, 25 Jul 2014 08:08:27 -0700
Message-ID: <CAD=FV=VUkU7HWjwCKO=WOrKosUtmv3YE_8pxc5uoQg0cHr-AKQ@mail.gmail.com>
References: <1405704009-8430-1-git-send-email-afaerber@suse.de>
	<1405704009-8430-2-git-send-email-afaerber@suse.de>
	<08fe01cfa7c9$341cc700$9c565500$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f175.google.com ([209.85.220.175]:64162 "EHLO
	mail-vc0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751732AbaGYPI2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jul 2014 11:08:28 -0400
Received: by mail-vc0-f175.google.com with SMTP id hu12so7427346vcb.6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Jul 2014 08:08:27 -0700 (PDT)
In-Reply-To: <08fe01cfa7c9$341cc700$9c565500$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Ben Dooks <ben-linux@fluff.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "moderated list:ARM/SAMSUNG ARM A..." <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Hi,

On Thu, Jul 24, 2014 at 10:28 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> Andreas F=C3=A4rber wrote:
>>
>> Move it from exynos5250-cros-common.dtsi to exynos5250-snow.dts.
>> Spring does not need it, it uses an s5m8767 instead.
>>
>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>> ---
>
> Hi Andreas,
>
> I think this should be reviewed by chrome guys.
>
>
> Doug, can you have a look this series for exynos5250-chromebook?
> I'm not sure exynos5250-cros-common is still useful for exynos5250-sp=
ring...

Sorry, I've been on vacation and am now playing catchup.

Right.  The current suggestion is to rework to just duplicate things
and don't use exynos5250-cros-common.  I would structure the series
as:

1. Fold the current exynos5250-cros-common directly into the snow
device tree file.

2. If desired, cleanup the snow device tree file.

3. Create the spring device tree file based on snow.  There will be
duplication, but so be it.  Please try to minimize diffs between the
snow ad spring device tree files.

4. If possible, identify "fragments" like "cros-ec-keyboard.dtsi" and
factor them out of both spring and snow device tree files.


You could certainly reorder some of the above steps if you wish (you
could split out fragments before creating the spring device tree, for
instance).


Please make sure to CC Javier (now on CC) since he's helping with
Chromebook upstreaming and he may have a lower latency in responding
than I do.

-Doug

From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 1/4] ARM: dts: exynos5250: max77686 is Snow only
Date: Fri, 25 Jul 2014 09:02:41 -0700
Message-ID: <CAD=FV=WpT28oz9XYRNP2w4y_eZESvuN4QaRfR=Q8wPM75inJ+g@mail.gmail.com>
References: <1405704009-8430-1-git-send-email-afaerber@suse.de>
	<1405704009-8430-2-git-send-email-afaerber@suse.de>
	<08fe01cfa7c9$341cc700$9c565500$@samsung.com>
	<CAD=FV=VUkU7HWjwCKO=WOrKosUtmv3YE_8pxc5uoQg0cHr-AKQ@mail.gmail.com>
	<CAD=FV=VeBP=1CiKesp738anZzSJNZCGkg68RBUUCyJ5U6_Y75w@mail.gmail.com>
	<53D27804.40601@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f178.google.com ([209.85.220.178]:57886 "EHLO
	mail-vc0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760646AbaGYQCo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jul 2014 12:02:44 -0400
Received: by mail-vc0-f178.google.com with SMTP id la4so7690243vcb.37
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Jul 2014 09:02:43 -0700 (PDT)
In-Reply-To: <53D27804.40601@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Ben Dooks <ben-linux@fluff.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "ARM/SAMSUNG ARM A..." <linux-arm-kernel@lists.infradead.org>, "OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Andreas,

On Fri, Jul 25, 2014 at 8:30 AM, Andreas F=C3=A4rber <afaerber@suse.de>=
 wrote:
> Hi Doug,
>
> Am 25.07.2014 17:13, schrieb Doug Anderson:
>> On Fri, Jul 25, 2014 at 8:08 AM, Doug Anderson <dianders@chromium.or=
g> wrote:
>>> On Thu, Jul 24, 2014 at 10:28 PM, Kukjin Kim <kgene.kim@samsung.com=
> wrote:
>>>> Andreas F=C3=A4rber wrote:
>>>>>
>>>>> Move it from exynos5250-cros-common.dtsi to exynos5250-snow.dts.
>>>>> Spring does not need it, it uses an s5m8767 instead.
>>>>>
>>>>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>>>>> ---
>>>>
>>>> Doug, can you have a look this series for exynos5250-chromebook?
>>>> I'm not sure exynos5250-cros-common is still useful for exynos5250=
-spring...
>>>
>>> Right.  The current suggestion is to rework to just duplicate thing=
s
>>> and don't use exynos5250-cros-common.
>>
>> Oh, it actually looks like your patch series ends up there, but the
>> first patch confused me.
>
> NP, guess you just started reading in the middle. ;)

Yeah, I had this on my list to look at but ended up looking at this
one first due to Kukjin's response.


>>  Why move just the maxim PMIC first?
>
> Review of the movements surely is easier this way, and it did not yet
> seem a done deal that we would drop -cros-common. The merge patch nic=
ely
> shows which common parts need to be copied into spring.

That's fine.  I can review it this way now that I realize what's going =
on.

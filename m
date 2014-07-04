From: Olof Johansson <olof@lixom.net>
Subject: Re: ASoC: samsung: MACH_SMDK6450
Date: Thu, 3 Jul 2014 20:39:41 -0700
Message-ID: <CAOesGMjdVrOfyrF6X3KoMQxBBYzNZskUsaMaHH653LJgwqpA+Q@mail.gmail.com>
References: <1404287238.12021.7.camel@x220>
	<20140702092347.GB410@sirena.org.uk>
	<53B48993.5020809@samsung.com>
	<20140703111442.GW410@sirena.org.uk>
	<023d01cf9720$5ed32fc0$1c798f40$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f172.google.com ([209.85.220.172]:53843 "EHLO
	mail-vc0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752120AbaGDDjl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Jul 2014 23:39:41 -0400
Received: by mail-vc0-f172.google.com with SMTP id hy10so1083843vcb.31
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Jul 2014 20:39:41 -0700 (PDT)
In-Reply-To: <023d01cf9720$5ed32fc0$1c798f40$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, Paul Bolle <pebolle@tiscali.nl>, Ben Dooks <ben-linux@fluff.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>

On Thu, Jul 3, 2014 at 5:39 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Mark Brown wrote:
>>
>> On Thu, Jul 03, 2014 at 07:37:07AM +0900, Kukjin Kim wrote:
>> > On 07/02/14 18:23, Mark Brown wrote:
>>
>> > >This also wasn't sent to me for review, please always send patches to
>> > >maintainers.
>>
>> > Mark, I always send patches to regarding maintainers and in this case the
>> > patch missed the change. I'm resending new patch and if any problems, please
>> > let me know. Just note, I just wanted to check whether there is no problem
>> > with other maintainers' tree early in -next tree.
>>
>> It looks like you've sent it to broonie@linaro.org not broonie@kernel.org
>> which is listed in MAINTAINERS and what I use for e-mail - upstream mail
>> that goes to my work address often just gets dropped on the floor (and
>> generally ends up at the bottom of my queue to look at) since it ends up
>> in a completely different place to my personal mail.
>
> Mark, oh, I see. But I checked your e-mail address from recent your sign-off
> in git commit so, just thought it should be fine.
>
> I will use kernel.org for your e-mail address next time ;-)

Mark is the _only_ linux developer in the world who will give you crap
for sending him patches to the very same email that he signs off all
his work with.

I really wish Linaro would just let him sign off with his
long-standing kernel.org email address instead so the rest of us
wouldn't have to keep track of this. :(


-Olof

From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: ASoC: samsung: MACH_SMDK6450
Date: Fri, 04 Jul 2014 11:01:52 +0200
Message-ID: <4203198.qV4EZfpui2@wuerfel>
References: <1404287238.12021.7.camel@x220> <023d01cf9720$5ed32fc0$1c798f40$@samsung.com> <CAOesGMjdVrOfyrF6X3KoMQxBBYzNZskUsaMaHH653LJgwqpA+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:58557 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751412AbaGDJCl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jul 2014 05:02:41 -0400
In-Reply-To: <CAOesGMjdVrOfyrF6X3KoMQxBBYzNZskUsaMaHH653LJgwqpA+Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, Paul Bolle <pebolle@tiscali.nl>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>, Ben Dooks <ben-linux@fluff.org>

On Thursday 03 July 2014 20:39:41 Olof Johansson wrote:
> On Thu, Jul 3, 2014 at 5:39 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > Mark Brown wrote:
> >>
> >> On Thu, Jul 03, 2014 at 07:37:07AM +0900, Kukjin Kim wrote:
> >> > On 07/02/14 18:23, Mark Brown wrote:
> >>
> >> > >This also wasn't sent to me for review, please always send patches to
> >> > >maintainers.
> >>
> >> > Mark, I always send patches to regarding maintainers and in this case the
> >> > patch missed the change. I'm resending new patch and if any problems, please
> >> > let me know. Just note, I just wanted to check whether there is no problem
> >> > with other maintainers' tree early in -next tree.
> >>
> >> It looks like you've sent it to broonie@linaro.org not broonie@kernel.org
> >> which is listed in MAINTAINERS and what I use for e-mail - upstream mail
> >> that goes to my work address often just gets dropped on the floor (and
> >> generally ends up at the bottom of my queue to look at) since it ends up
> >> in a completely different place to my personal mail.
> >
> > Mark, oh, I see. But I checked your e-mail address from recent your sign-off
> > in git commit so, just thought it should be fine.
> >
> > I will use kernel.org for your e-mail address next time 
> 
> Mark is the _only_ linux developer in the world who will give you crap
> for sending him patches to the very same email that he signs off all
> his work with.
> 
> I really wish Linaro would just let him sign off with his
> long-standing kernel.org email address instead so the rest of us
> wouldn't have to keep track of this. 

FWIW David Miller has a similar policy: he only applies networking
patches that are sent to the netdev mailing list. This seems like
a good idea in general (to ensure they are getting exposed to the
public).

Mark, any chance we could convince to pick up patches from
alsa-devel in the future even if they are sent to the wrong
personal email account of yours? I would assume that would only
require a small change in your filter rules, not a change in your
workflow.

	Arnd

From: Alban Browaeys <alban.browaeys@gmail.com>
Subject: Re: [PATCH] [RFC PATCH] dmaengine: pl330: residual - do not reset
 on last descriptor.
Date: Tue, 07 Jul 2015 14:13:55 +0200
Message-ID: <1436271235.26922.6.camel@gmail.com>
References: <1436267131-19556-1-git-send-email-prahal@yahoo.com>
	 <CAJKOXPcGbzhOJLrS9FJqOou0tcEt69X3aYsUQO0VzrpteeX-ZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:35810 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753984AbbGGMN7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jul 2015 08:13:59 -0400
In-Reply-To: <CAJKOXPcGbzhOJLrS9FJqOou0tcEt69X3aYsUQO0VzrpteeX-ZA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Vinod Koul <vinod.koul@intel.com>, gabriel@unseen.is, linux-samsung-soc@vger.kernel.org, dmaengine@vger.kernel.org, sylvester.nawrocki@gmail.com, Robert Baldyga <r.baldyga@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Le mardi 07 juillet 2015 =C3=A0 20:53 +0900, Krzysztof Kozlowski a =C3=A9=
crit :
> 2015-07-07 20:05 GMT+09:00 Alban Browaeys <alban.browaeys@gmail.com>:
> > Removed the residual rest to zero on last descriptor.
> >=20
> > Also set residue granularity to BURST instead of SEGMENT.
> > This last item needs more investigation before I could give a=20
> > rationale
> > for it.
> >=20
> > Signed-off-by: Alban Browaeys <prahal@yahoo.com>
> > Reported-by: gabriel@unseen.is
> > Reported-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > Fixes: aee4d1fac887 ("dmaengine: pl330: improve pl330_tx_status()
> > function")
> >=20
>=20
> Hi,
>=20
> I am not quite sure what bug you are trying to fix here. It isn't
> described in commit message. Also I don't get why the residue=3D0 is
> being removed. This will break the residue calculation...
>=20
> Some time ago I posted a patch fixing sound issues on Odroid XU3.
> Today Vinod applied it:
> https://git.kernel.org/cgit/linux/kernel/git/vkoul/slave
> -dma.git/commit/?h=3Dfixes&id=3D5dd90e5b91e0f5c925b12b132c7cd27538870=
256
>=20
> I don't know if this is the same issue... can you describe exactly
> what you are trying to fix, why and how?
>=20
>=20

This was about "choppy sound" issue left after the dma pause fix:
https://www.mail-archive.com/linux-samsung
-soc%40vger.kernel.org/msg44567.html

=46rom a glance at the commit you mention I would say it is the same
issue. Will try this commit instead in a few hours and report.


Thanks
Alban


> choppy sound) on Odroid XU3-Lite. On current linux-next
> (next-20150612) the sound is awful (choppy) after few seconds of=20
> play.
> For example first four of:
> $ aplay /usr/share/sounds/alsa/Front_Right.wav
> work fine. But then it just gets worse and underruns are reported:
> $ Playing WAVE '/usr/share/sounds/alsa/Front_Right.wav' : Signed 16
> bit Little Endian, Rate 48000 Hz, Mono
> $ underrun!!! (at least 0.095 ms long)

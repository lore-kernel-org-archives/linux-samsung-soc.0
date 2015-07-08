From: Alban Browaeys <alban.browaeys@gmail.com>
Subject: Re: [PATCH] [RFC PATCH] dmaengine: pl330: residual - do not reset
 on last descriptor.
Date: Wed, 08 Jul 2015 12:54:44 +0200
Message-ID: <1436352884.1160.6.camel@gmail.com>
References: <1436267131-19556-1-git-send-email-prahal@yahoo.com>
	 <CAJKOXPcGbzhOJLrS9FJqOou0tcEt69X3aYsUQO0VzrpteeX-ZA@mail.gmail.com>
	 <1436271235.26922.6.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:35517 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758749AbbGHKy7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Jul 2015 06:54:59 -0400
In-Reply-To: <1436271235.26922.6.camel@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Vinod Koul <vinod.koul@intel.com>, gabriel@unseen.is, linux-samsung-soc@vger.kernel.org, dmaengine@vger.kernel.org, sylvester.nawrocki@gmail.com, Robert Baldyga <r.baldyga@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Le mardi 07 juillet 2015 =C3=A0 14:13 +0200, Alban Browaeys a =C3=A9cri=
t :
> Le mardi 07 juillet 2015 =C3=A0 20:53 +0900, Krzysztof Kozlowski a =C3=
=A9crit=20

> > >=20
> > I am not quite sure what bug you are trying to fix here. It isn't
> > described in commit message. Also I don't get why the residue=3D0 i=
s
> > being removed. This will break the residue calculation...
> >=20
> > Some time ago I posted a patch fixing sound issues on Odroid XU3.
> > Today Vinod applied it:
> > https://git.kernel.org/cgit/linux/kernel/git/vkoul/slave
> > -dma.git/commit/?h=3Dfixes&id=3D5dd90e5b91e0f5c925b12b132c7cd275388=
7025
> > 6
> >=20
> > I don't know if this is the same issue... can you describe exactly
> > what you are trying to fix, why and how?
> >=20
> >=20
>=20
> This was about "choppy sound" issue left after the dma pause fix:
> https://www.mail-archive.com/linux-samsung
> -soc%40vger.kernel.org/msg44567.html
>=20
> From a glance at the commit you mention I would say it is the same
> issue. Will try this commit instead in a few hours and report.

The commit of yours, that is=20
https://git.kernel.org/cgit/linux/kernel/git/vkoul/slave-dma.git/commit
/?h=3Dfixes&id=3D5dd90e5b91e0f5c925b12b132c7cd2753887025 ,
fixes  Odroid U2/U3 "choppy sound" too.


Thanks.
Alban=20

>=20
> > choppy sound) on Odroid XU3-Lite. On current linux-next
> > (next-20150612) the sound is awful (choppy) after few seconds of=20
> > play.
> > For example first four of:
> > $ aplay /usr/share/sounds/alsa/Front_Right.wav
> > work fine. But then it just gets worse and underruns are reported:
> > $ Playing WAVE '/usr/share/sounds/alsa/Front_Right.wav' : Signed 16
> > bit Little Endian, Rate 48000 Hz, Mono

From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: mainline boot: 64 boots: 62 pass, 2 fail (v3.16-rc1-2-gebe0618)
Date: Thu, 26 Jun 2014 19:04:19 +0200
Message-ID: <53AC5293.90209@suse.de>
References: <539fdd37.e7bc420a.76b9.ffffb583@mx.google.com>	<CAGa+x85nqPbH-sye28ni=gUEdgjGdUDqHhv1+0pV5aO8y1+wHQ@mail.gmail.com>	<53A106F1.10201@gmail.com>	<CAGa+x8527FEPk6fg5kv-fbOzK3MzcFooFGE9Me12b9C_Pv=UzA@mail.gmail.com>	<53A2AE11.2050208@gmail.com>	<53A2BE94.2010308@gmail.com>	<53A7A579.4010702@gmail.com>	<CAGa+x85H510fNGTXJHGYfQybRa2FGgg2NyCgJ8rmjJ6TE7GNbA@mail.gmail.com>	<53A9B99F.4040806@codeaurora.org>	<53A9FBB5.60709@codeaurora.org>	<53AABCF5.4050403@gmail.com>	<53AB45D1.90909@codeaurora.org>	<53ABC13C.8030908@gmail.com> <CAGa+x84UTbmFc2Twg9zEcr+ZP2xsq68gFvk=385+_cFM5hvGHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:38953 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757295AbaFZREW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jun 2014 13:04:22 -0400
In-Reply-To: <CAGa+x84UTbmFc2Twg9zEcr+ZP2xsq68gFvk=385+_cFM5hvGHg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@linaro.org>, Tushar Behera <trblinux@gmail.com>
Cc: Laura Abbott <lauraa@codeaurora.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, kernel-build-reports@lists.linaro.org, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Kevin and Tushar,

Am 26.06.2014 16:59, schrieb Kevin Hilman:
>> IMO, the bug is in u-boot and we should fix that.
>=20
> I agree that the u-boot bug needs to be fixed, and FWIW, I updated my
> u-boot and haven't seen the boot failure yet after several boots with
> next-20140625.

Could you clarify your test setup: Are you using the original InSignal
SPL [1] with just your own u-boot.bin? Or do you have access to some
newer Samsung-signed SPL?

> That being said, since it's not always feasible/practical to update
> u-boot, and when it comes down to it, this is still a kernel
> regression, we should also fix the kernel to sanity check the values
> coming from u-boot, like it was doing before.

Sounds good.

Apart from this memory issue here, I noticed that CPUs don't appear to
be in HYP mode for virtualization, which had required a signed SPL
update for the ODROID-XU [2]. And to me it looks as if there's no
Arndale Octa support in upstream U-Boot [3], no real maintenance on the
InSignal fork [4] and a policy of not cooperating with others [5].

Thanks,
Andreas

[1] http://forum.insignal.co.kr/viewtopic.php?f=3D6&t=3D3199
[2] http://forum.odroid.com/viewtopic.php?f=3D64&t=3D2778&start=3D40#p3=
2581
[3]
http://git.denx.de/?p=3Du-boot.git;a=3Dblob;f=3Dboards.cfg;h=3D947f2bc5=
ba2794c94b3b2cea04664f005e025f9f;hb=3DHEAD#l286
[4] http://git.insignal.co.kr/insignal/arndale_octa-jb_mr1.1/u-boot/
[5] http://forum.insignal.co.kr/viewtopic.php?f=3D40&t=3D3613

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg

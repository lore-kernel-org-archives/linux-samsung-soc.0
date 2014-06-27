From: Tushar Behera <trblinux@gmail.com>
Subject: Re: mainline boot: 64 boots: 62 pass, 2 fail (v3.16-rc1-2-gebe0618)
Date: Fri, 27 Jun 2014 08:58:31 +0530
Message-ID: <53ACE4DF.3040603@gmail.com>
References: <539fdd37.e7bc420a.76b9.ffffb583@mx.google.com>	<CAGa+x85nqPbH-sye28ni=gUEdgjGdUDqHhv1+0pV5aO8y1+wHQ@mail.gmail.com>	<53A106F1.10201@gmail.com>	<CAGa+x8527FEPk6fg5kv-fbOzK3MzcFooFGE9Me12b9C_Pv=UzA@mail.gmail.com>	<53A2AE11.2050208@gmail.com>	<53A2BE94.2010308@gmail.com>	<53A7A579.4010702@gmail.com>	<CAGa+x85H510fNGTXJHGYfQybRa2FGgg2NyCgJ8rmjJ6TE7GNbA@mail.gmail.com>	<53A9B99F.4040806@codeaurora.org>	<53A9FBB5.60709@codeaurora.org>	<53AABCF5.4050403@gmail.com>	<53AB45D1.90909@codeaurora.org>	<53ABC13C.8030908@gmail.com> <CAGa+x84UTbmFc2Twg9zEcr+ZP2xsq68gFvk=385+_cFM5hvGHg@mail.gmail.com> <53AC5293.90209@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f48.google.com ([209.85.160.48]:36133 "EHLO
	mail-pb0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752446AbaF0D2h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jun 2014 23:28:37 -0400
Received: by mail-pb0-f48.google.com with SMTP id rq2so3973110pbb.35
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jun 2014 20:28:36 -0700 (PDT)
In-Reply-To: <53AC5293.90209@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>, Kevin Hilman <khilman@linaro.org>
Cc: Laura Abbott <lauraa@codeaurora.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, kernel-build-reports@lists.linaro.org, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 06/26/2014 10:34 PM, Andreas F=E4rber wrote:
> Hi Kevin and Tushar,
>=20
> Am 26.06.2014 16:59, schrieb Kevin Hilman:
>>> IMO, the bug is in u-boot and we should fix that.
>>
>> I agree that the u-boot bug needs to be fixed, and FWIW, I updated m=
y
>> u-boot and haven't seen the boot failure yet after several boots wit=
h
>> next-20140625.
>=20
> Could you clarify your test setup: Are you using the original InSigna=
l
> SPL [1] with just your own u-boot.bin? Or do you have access to some
> newer Samsung-signed SPL?
>=20

The u-boot changes for Arndale-Octa was done as part of an activity
within Linaro. Insignal had signed the SPL binary for us. You can
extract the signed SPL binary from following hwpack[6] (tar xfz and the=
n
within u_boot folder[7]).

The source code for this u-boot can be found here.[8]

Just in case, commands to flash u-boot binaries are listed here.[9]

>> That being said, since it's not always feasible/practical to update
>> u-boot, and when it comes down to it, this is still a kernel
>> regression, we should also fix the kernel to sanity check the values
>> coming from u-boot, like it was doing before.
>=20
> Sounds good.
>=20
> Apart from this memory issue here, I noticed that CPUs don't appear t=
o
> be in HYP mode for virtualization, which had required a signed SPL
> update for the ODROID-XU [2]. And to me it looks as if there's no
> Arndale Octa support in upstream U-Boot [3], no real maintenance on t=
he
> InSignal fork [4] and a policy of not cooperating with others [5].
>=20

Adding Arndale-Octa support to upstream U-Boot was on a TODO list, but
that didn't materialize because of some other reasons.

> Thanks,
> Andreas
>=20
> [1] http://forum.insignal.co.kr/viewtopic.php?f=3D6&t=3D3199
> [2] http://forum.odroid.com/viewtopic.php?f=3D64&t=3D2778&start=3D40#=
p32581
> [3]
> http://git.denx.de/?p=3Du-boot.git;a=3Dblob;f=3Dboards.cfg;h=3D947f2b=
c5ba2794c94b3b2cea04664f005e025f9f;hb=3DHEAD#l286
> [4] http://git.insignal.co.kr/insignal/arndale_octa-jb_mr1.1/u-boot/
> [5] http://forum.insignal.co.kr/viewtopic.php?f=3D40&t=3D3613
>=20
[6]
http://snapshots.linaro.org/kernel-hwpack/linux-linaro-tracking-ll-arnd=
ale-octa/442/hwpack_linaro-arndale-octa_20140626-442_armhf_supported.ta=
r.gz
[7] <path_to_extracted_folder>/u_boot/usr/lib/u-boot/arndale_octa
[8]
git.linaro.org/landing-teams/working/samsung/u-boot.git/shortlog/refs/h=
eads/tracking-arndale_octa
[9] http://pastebin.com/pfGF2giq

Thanks,
--=20
Tushar Behera

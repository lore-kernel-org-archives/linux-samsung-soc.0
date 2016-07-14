From: Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: Odroid U2 Kernel 4.7rc7+ Hang on reboot
Date: Thu, 14 Jul 2016 16:33:28 -0400
Message-ID: <1468528408.4843.9.camel@ndufresne.ca>
References: <1468525055.4843.4.camel@ndufresne.ca>
 <1468525558.4843.6.camel@ndufresne.ca>
	 <5787EF8E.2010401@math.uni-bielefeld.de>
Reply-To: nicolas@ndufresne.ca
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-O29LiQsCSoblS4v0Lmgr"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43719 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751734AbcGNUde (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Jul 2016 16:33:34 -0400
In-Reply-To: <5787EF8E.2010401@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>


--=-O29LiQsCSoblS4v0Lmgr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 14 juillet 2016 =C3=A0 22:01 +0200, Tobias Jakobi a =C3=A9crit=C2=
=A0:
> Hi Nicolas,
>=20
> do you have the reset and poweroff drivers activated?
>=20
> CONFIG_POWER_RESET_SYSCON=3Dy
> CONFIG_POWER_RESET_SYSCON_POWEROFF=3Dy

Yes, both.

>=20
> With best wishes,
> Tobias
>=20
>=20
> Nicolas Dufresne wrote:
> > Le jeudi 14 juillet 2016 =C3=A0 15:37 -0400, Nicolas Dufresne a =C3=A9c=
rit :
> > > Hi,
> > >=20
> > > I'm using the Odroid U2 to test some features implemented in
> > > GStreamer.
> > > The parts I need mostly works in mainline kernel, my main
> > > annoyance
> > > ist
> > > that reboot hangs.
> > >=20
> > > Is this issue known ? I'm booting from SD card is that matters.
> > > Any
> > > advise would be appreciated. I'm not list member, so please keep
> > > me
> > > in
> > > CC. I'm sharing my .config, in case that is my fault.
> > >=20
> > > regards,
> > > Nicolas
> >=20
> >=20
> > If that helps:
> >=20
> > [root@odroidu2-nicolas nicolas]# echo 1 > /proc/sys/kernel/sysrq
> > [root@odroidu2-nicolas nicolas]# echo b > /proc/sysrq-trigger
> > [=C2=A0=C2=A0153.605514] sysrq: SysRq : Resetting
> > [=C2=A0=C2=A0153.605665] CPU0: stopping
> > [=C2=A0=C2=A0153.606194] CPU: 0 PID: 247 Comm: NetworkManager Not taint=
ed
> > 4.7.0-rc7-00034-gb569927-dirty #9
> > [=C2=A0=C2=A0153.614764] Hardware name: SAMSUNG EXYNOS (Flattened Devic=
e
> > Tree)
> > [=C2=A0=C2=A0153.620922] [<c010e480>] (unwind_backtrace) from [<c010ad1=
8>]
> > (show_stack+0x10/0x14)
> > [=C2=A0=C2=A0153.628605] [<c010ad18>] (show_stack) from [<c032bf38>]
> > (dump_stack+0x78/0x8c)
> > [=C2=A0=C2=A0153.635799] [<c032bf38>] (dump_stack) from [<c010d2a8>]
> > (handle_IPI+0x198/0x1ac)
> > [=C2=A0=C2=A0153.643171] [<c010d2a8>] (handle_IPI) from [<c010150c>]
> > (gic_handle_irq+0x94/0x98)
> > [=C2=A0=C2=A0153.650722] [<c010150c>] (gic_handle_irq) from [<c010b7d4>=
]
> > (__irq_svc+0x54/0x90)
> > [=C2=A0=C2=A0153.658168] Exception stack(0xec91dc78 to 0xec91dcc0)
> > [=C2=A0=C2=A0153.663207]
> > dc60:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ee4263b
> > 0 edc6e400
> > [=C2=A0=C2=A0153.671383] dc80: 00000000 000021f0 ee4263b0 ffffe000 0010=
200d
> > 00000000 ee4263b0 ee426268
> > [=C2=A0=C2=A0153.679541] dca0: ee4261c0 ec91dd08 00000003 ec91dcc8 c06c=
fc30
> > c0159f68 60000053 ffffffff
> > [=C2=A0=C2=A0153.687711] [<c010b7d4>] (__irq_svc) from [<c0159f68>]
> > (do_raw_spin_unlock+0x7c/0x11c)
> > [=C2=A0=C2=A0153.695608] [<c0159f68>] (do_raw_spin_unlock) from [<c06cf=
c30>]
> > (_raw_spin_unlock+0x8/0x3c)
> > [=C2=A0=C2=A0153.703951] [<c06cfc30>] (_raw_spin_unlock) from [<c0210a3=
4>]
> > (__find_get_block_slow+0xd4/0x1a0)
> > [=C2=A0=C2=A0153.712710] [<c0210a34>] (__find_get_block_slow) from
> > [<c0211d04>] (__find_get_block+0x170/0x2dc)
> > [=C2=A0=C2=A0153.721560] [<c0211d04>] (__find_get_block) from [<c02124a=
c>]
> > (__getblk_gfp+0x24/0x54)
> > [=C2=A0=C2=A0153.729455] [<c02124ac>] (__getblk_gfp) from [<c0251b0c>]
> > (ext4_getblk+0x6c/0x174)
> > [=C2=A0=C2=A0153.737000] [<c0251b0c>] (ext4_getblk) from [<c0251c20>]
> > (ext4_bread+0xc/0x98)
> > [=C2=A0=C2=A0153.744210] [<c0251c20>] (ext4_bread) from [<c025a9d8>]
> > (__ext4_read_dirblock+0x2c/0x3b0)
> > [=C2=A0=C2=A0153.752366] [<c025a9d8>] (__ext4_read_dirblock) from
> > [<c025ad90>] (dx_probe+0x34/0x55c)
> > [=C2=A0=C2=A0153.760350] [<c025ad90>] (dx_probe) from [<c025c828>]
> > (ext4_find_entry+0x450/0x5f4)
> > [=C2=A0=C2=A0153.767991] [<c025c828>] (ext4_find_entry) from [<c025fbcc=
>]
> > (ext4_unlink+0x20/0x258)
> > [=C2=A0=C2=A0153.775815] [<c025fbcc>] (ext4_unlink) from [<c01ee210>]
> > (vfs_unlink+0xb8/0x190)
> > [=C2=A0=C2=A0153.783188] [<c01ee210>] (vfs_unlink) from [<c01f186c>]
> > (do_unlinkat+0x214/0x26c)
> > [=C2=A0=C2=A0153.790655] [<c01f186c>] (do_unlinkat) from [<c01076c0>]
> > (ret_fast_syscall+0x0/0x3c)
> > [=C2=A0=C2=A0153.798355] CPU2: stopping
> > [=C2=A0=C2=A0153.801062] CPU: 2 PID: 0 Comm: swapper/2 Not tainted 4.7.=
0-rc7-
> > 00034-gb569927-dirty #9
> > [=C2=A0=C2=A0153.809022] Hardware name: SAMSUNG EXYNOS (Flattened Devic=
e
> > Tree)
> > [=C2=A0=C2=A0153.815156] [<c010e480>] (unwind_backtrace) from [<c010ad1=
8>]
> > (show_stack+0x10/0x14)
> > [=C2=A0=C2=A0153.822858] [<c010ad18>] (show_stack) from [<c032bf38>]
> > (dump_stack+0x78/0x8c)
> > [=C2=A0=C2=A0153.830053] [<c032bf38>] (dump_stack) from [<c010d2a8>]
> > (handle_IPI+0x198/0x1ac)
> > [=C2=A0=C2=A0153.837429] [<c010d2a8>] (handle_IPI) from [<c010150c>]
> > (gic_handle_irq+0x94/0x98)
> > [=C2=A0=C2=A0153.844977] [<c010150c>] (gic_handle_irq) from [<c010b7d4>=
]
> > (__irq_svc+0x54/0x90)
> > [=C2=A0=C2=A0153.852425] Exception stack(0xee8b7f88 to 0xee8b7fd0)
> > [=C2=A0=C2=A0153.857476] 7f80:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
00000001 00000000 00000000
> > c01141c0 ee8b6000 c0b02454
> > [=C2=A0=C2=A0153.865640] 7fa0: 00000000 00000000 c0a623f8 c0b024b8 c0b3=
ecdb
> > c0b024c0 00003e4e ee8b7fd8
> > [=C2=A0=C2=A0153.873787] 7fc0: c01081b0 c01081b4 600f0053 ffffffff
> > [=C2=A0=C2=A0153.878840] [<c010b7d4>] (__irq_svc) from [<c01081b4>]
> > (arch_cpu_idle+0x38/0x3c)
> > [=C2=A0=C2=A0153.886234] [<c01081b4>] (arch_cpu_idle) from [<c0153578>]
> > (cpu_startup_entry+0x1c0/0x238)
> > [=C2=A0=C2=A0153.894463] [<c0153578>] (cpu_startup_entry) from [<401015=
ac>]
> > (0x401015ac)
> > [=C2=A0=C2=A0153.901384] CPU1: stopping
> > [=C2=A0=C2=A0153.904089] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 4.7.=
0-rc7-
> > 00034-gb569927-dirty #9
> > [=C2=A0=C2=A0153.912054] Hardware name: SAMSUNG EXYNOS (Flattened Devic=
e
> > Tree)
> > [=C2=A0=C2=A0153.918188] [<c010e480>] (unwind_backtrace) from [<c010ad1=
8>]
> > (show_stack+0x10/0x14)
> > [=C2=A0=C2=A0153.925889] [<c010ad18>] (show_stack) from [<c032bf38>]
> > (dump_stack+0x78/0x8c)
> > [=C2=A0=C2=A0153.933086] [<c032bf38>] (dump_stack) from [<c010d2a8>]
> > (handle_IPI+0x198/0x1ac)
> > [=C2=A0=C2=A0153.940462] [<c010d2a8>] (handle_IPI) from [<c010150c>]
> > (gic_handle_irq+0x94/0x98)
> > [=C2=A0=C2=A0153.948010] [<c010150c>] (gic_handle_irq) from [<c010b7d4>=
]
> > (__irq_svc+0x54/0x90)
> > [=C2=A0=C2=A0153.955457] Exception stack(0xee8b5f88 to 0xee8b5fd0)
> > [=C2=A0=C2=A0153.960508] 5f80:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
00000001 00000000 00000000
> > c01141c0 ee8b4000 c0b02454
> > [=C2=A0=C2=A0153.968672] 5fa0: 00000000 00000000 c0a623f8 c0b024b8 c0b3=
ecdb
> > c0b024c0 00003e62 ee8b5fd8
> > [=C2=A0=C2=A0153.976819] 5fc0: c01081b0 c01081b4 60070053 ffffffff
> > [=C2=A0=C2=A0153.981869] [<c010b7d4>] (__irq_svc) from [<c01081b4>]
> > (arch_cpu_idle+0x38/0x3c)
> > [=C2=A0=C2=A0153.989260] [<c01081b4>] (arch_cpu_idle) from [<c0153578>]
> > (cpu_startup_entry+0x1c0/0x238)
> > [=C2=A0=C2=A0153.997490] [<#
> >=20
>=20
--=-O29LiQsCSoblS4v0Lmgr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEABECAAYFAleH9xgACgkQcVMCLawGqBxLbQCg0XDkd4bJXYxTKGvO5dhf/1fF
kTAAoNlPoLDhd0LOA7pEenzz47TWJqSp
=wsBZ
-----END PGP SIGNATURE-----

--=-O29LiQsCSoblS4v0Lmgr--

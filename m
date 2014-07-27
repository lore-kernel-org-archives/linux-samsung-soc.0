From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [RESEND][PATCHv2 0/3] Fix for buggy u-boot memory banks
Date: Sun, 27 Jul 2014 07:39:48 +0200
Message-ID: <53D490A4.1060302@suse.de>
References: <1405443816-29917-1-git-send-email-lauraa@codeaurora.org>	<53D3FB9C.9080908@suse.de> <CAK5sBcFeaHrLLoSYCvrSMBX+eGYWoGPrCH0Uxy3Ao2OAYXoTNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:33667 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750856AbaG0Fjx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 27 Jul 2014 01:39:53 -0400
In-Reply-To: <CAK5sBcFeaHrLLoSYCvrSMBX+eGYWoGPrCH0Uxy3Ao2OAYXoTNA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <spk.linux@gmail.com>, Laura Abbott <lauraa@codeaurora.org>
Cc: Tushar Behera <trblinux@gmail.com>, Russell King <linux@arm.linux.org.uk>, Kevin Hilman <khilman@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robherring2@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

Am 27.07.2014 06:28, schrieb Sachin Kamat:
>=20
>=20
> On Sunday, July 27, 2014, Andreas F=C3=A4rber <afaerber@suse.de
> <mailto:afaerber@suse.de>> wrote:
>=20
>     Hi Laura,
>=20
>     Am 15.07.2014 19:03, schrieb Laura Abbott:
>     > This is a resend of the series to fix the uboot bug exposed by =
the
>     removal
>     > of meminfo. I haven't gotten any acks though.
>     >
>     > Please help with review/acks. Grant/Rob, I'd still like this to=
 go
>     through
>     > the devicetree tree if possible.
>=20
>     Sorry for the delay in testing.
>=20
>     With this v2 applied on top of kgene's for-next branch (plus
>     https://patchwork.kernel.org/patch/4297431/ as build fix) I get:
>=20
>     [    9.699985] Unhandled fault: asynchronous external abort (0x21=
1) at
>     0x00000000
>=20
>=20
> If this is on Arndale octa board,

It is, sorry, that was the board that prompted the series.

> please try disabling MCPM option.

Interestingly without MCPM I then get:

drivers/built-in.o: In function `bl_enter_powerdown':
/home/andreas/linux/drivers/cpuidle/cpuidle-big_little.c:134: undefined
reference to `mcpm_cpu_powered_up'
drivers/built-in.o: In function `bl_powerdown_finisher':
/home/andreas/linux/drivers/cpuidle/cpuidle-big_little.c:104: undefined
reference to `mcpm_set_entry_vector'
/home/andreas/linux/drivers/cpuidle/cpuidle-big_little.c:111: undefined
reference to `mcpm_cpu_suspend'
Makefile:885: recipe for target 'vmlinux' failed
make: *** [vmlinux] Error 1

ARM_BIG_LITTLE_CPUIDLE seems to be lacking a dependency on MCPM.

Together they resolved the issue, thanks!

Tested-by: Andreas F=C3=A4rber <afaerber@suse.de>

Cheers,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg

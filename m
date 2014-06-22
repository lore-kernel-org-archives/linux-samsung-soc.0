From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: Enabling 8 cores on 5420
Date: Sun, 22 Jun 2014 23:02:17 +0200
Message-ID: <53A74459.3000100@suse.de>
References: <53884E88.2090408@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:33193 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751605AbaFVVCU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 22 Jun 2014 17:02:20 -0400
In-Reply-To: <53884E88.2090408@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>

Am 30.05.2014 11:25, schrieb Daniel Lezcano:
>=20
> Hi all,
>=20
> I am trying an upstream kernel + some patches to enable ethernet on
> arndale octa.
>=20
> Unfortunately, only 4 cores boot up. The other ones fail to boot.
>=20
> [12.179453] CPU6: failed to come online
> [13.189479] CPU7: failed to come online
> [14.199479] CPU4: failed to come online
> [15.209743] CPU5: failed to come online
>=20
> What should I do to enable those 8 cores ? Is there a patchset somewh=
ere
> to do so ?

Ping? Confirmed still present on Arndale Octa with kgene's for-next +
patch to get 2-4 up.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg

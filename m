From: Ben Gamari <ben@smart-cactus.org>
Subject: Re: Slow performance of Odroid XU4 - cpufreq-dt patch needed?
Date: Wed, 13 Jan 2016 18:16:11 +0100
Message-ID: <87h9ih5rj8.fsf@smart-cactus.org>
References: <56967861.10305@kyberraum.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.smart-cactus.org ([54.187.36.80]:52571 "EHLO
	mail.smart-cactus.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755409AbcAMRZ4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Jan 2016 12:25:56 -0500
In-Reply-To: <56967861.10305@kyberraum.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasco Steinmetz <linux@kyberraum.net>, linux-samsung-soc@vger.kernel.org

--=-=-=
Content-Type: text/plain

Vasco Steinmetz <linux@kyberraum.net> writes:

> Hello,
>
> I'm trying to get an Odroid XU4 to run a more recent (e.g. 4.4+) kernel
> than the last semiofficial 4.2 port from hardkernel (which doesn't boot
> here at all).
>
I also struggled to get my XU4 to perform to expectations with recent kernels.
Indeed it seems that the board boots to 800 MHz or so without cpufreq.
Recently I've been using this branch [1] (based on Bartlomiej's
cpufreq-v5 patchset) and this [2] configuration with reasonably good
results.

Cheers,

- Ben


[1] https://github.com/bgamari/linux/tree/odroid-xu3-cpufreq-v5
[2] http://home.smart-cactus.org/~ben/linux-xu4.config

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJWloZbAAoJEHPt6ejPuu8B13EIAJpM/2YRRvAM/oLEv5ZZgKWr
mo5TZo3xNbBnIGg8Grz5Bha9pFKniO9B+Z0tsWDUrWsK9imLqUtUZmVlxNKT9xqP
glHdWKlijaBy0N+umwnKY2jFdC3ay6sTKzoEcgt9GowHF5Gp01H74jGBGfnVWil2
Wo0g3UnTCZAypJdduVr57/4ymjDHUCEKFacaaTdbyAtYgPYo40MYY5kbb6910XRw
okQpFYAfx/v6Gz5ZsVaC0TchE2qoDDq+/RAVdkBlBNPp02IngZbHmQA8sd5xtU/p
yK1LnqFj4KRZLAk8IBy1FJBF+aBn21C2oxHkCAs763ZAK7GLAjvgm7Ru6hAeiZs=
=vNbU
-----END PGP SIGNATURE-----
--=-=-=--

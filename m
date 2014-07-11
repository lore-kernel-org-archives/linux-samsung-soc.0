From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: samsung-i2s: Maintain CDCLK settings across
 i2s_{shutdown/startup}
Date: Fri, 11 Jul 2014 14:04:21 +0100
Message-ID: <20140711130421.GR30458@sirena.org.uk>
References: <1405008673-15994-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bebzX59uVWocTrAI"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:59948 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752661AbaGKNFA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Jul 2014 09:05:00 -0400
Content-Disposition: inline
In-Reply-To: <1405008673-15994-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: drake@endlessm.com, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Chen Zhen <zhen1.chen@samsung.com>


--bebzX59uVWocTrAI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 10, 2014 at 06:11:13PM +0200, Sylwester Nawrocki wrote:
> Currently configuration of the CDCLK pad is being overwritten in
> the i2s_shutdown() callback in order to gate the SoC output clock.

Applied, thanks.

--bebzX59uVWocTrAI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTv+DSAAoJELSic+t+oim9TmUP/1AwpMpnHEM3UAVJpbmiaNhL
pW8lVaVPYAkX7GgM+9PteC5EX5bJrGvbs5rjRttFJprLN1KPiZvsThvD7C3Q3uWA
tKl8kmB6gIihtWI/9Kbnd92/DgSbjJOKDWoOPQY2fRsYgoRneJFhfIDI6pnQP7+S
yYeLJS9IX3pgOrcO/FJDuSNnPREn4Z9luB+AFSs/B4RpuJeSvpM2JC9KL2dq1c2t
Oj6q8P5/J4EZEC3/9Tz4pBdJN86nKvb7iZi6g4p8OUSfvZYyFlilixaDWO9Kb6VY
+WJ5AujMagUSt6QxuWtRw7gl+V1yIlcYMg2zySuFckl5UaUp//dIcaB5NP15fzNv
gluEeycsoyhF7/9tuAC7VGjihsbCgWENRoo5dm3Pm7LkNF938BwRTID1r0WTt7WE
kPTOHQyv2+PKrDII83lJkfb1FY8PWrzKQe1GU0svbuPUEKBEddBv+5Sgj6BzJzuP
Av2jKa466qbbAnasnTtKyInfLGXU0y+UmALJZkAfFP2fvlM+A/VlE8sOgEbyQ8L6
5djr8J8hpTLe8ewY1nxofNhWqzfOOhf56wxWznmQ/aKXH5mNtPuxvHr1Hb7fQtsu
AoO7y5+8QqEKjd9pTnxxQWRqpNdatuWdHx/VAfjWWNo830zRHwwGPGtkvsXwXsgo
hshItB0K9uKW9cm/LZNw
=tyXr
-----END PGP SIGNATURE-----

--bebzX59uVWocTrAI--

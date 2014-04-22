From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: SAMSUNG: Add sound card driver for Snow board
Date: Tue, 22 Apr 2014 19:33:10 +0100
Message-ID: <20140422183310.GD12304@sirena.org.uk>
References: <1398153834-16199-1-git-send-email-tushar.behera@linaro.org>
 <20140422104447.GK12304@sirena.org.uk>
 <CAHbNUh3G5HLaGXddPgjthWTu_VQ95xo=2Lii2BM6iSc-ipnm=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HrV55DujqS0rXGB5"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHbNUh3G5HLaGXddPgjthWTu_VQ95xo=2Lii2BM6iSc-ipnm=w@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-doc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, rdunlap@infradead.org, "robh+dt@kernel.org" <robh+dt@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org


--HrV55DujqS0rXGB5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 22, 2014 at 07:17:54PM +0530, Tushar Behera wrote:
> On 22 April 2014 16:14, Mark Brown <broonie@kernel.org> wrote:

> > In general this isn't up to modern standards, please do try to check
> > that new code is following best practices.  Did the support for setting
> > the clocking up in the device tree get merged already?

> I didn't get this point. Would you please elaborate?

The out of tree driver for these boards has a bunch of code in it which
reprograms the clock tree that parents the I2S block so that the I2S
block has inputs at suitable rates to allow it to generate useful
outputs.

> > Please do also pay attention to the CC lists when posting patches, this
> > seems to have been sent to a fairly random selection of people and
> > lists.

> Okay, I will update the CC list as per get_maintainer script during
> next revision.

Please think about the results when doing that - get_maintainers is very
useful but it does generate false positives and miss people.

> >> +     ret = snd_soc_dai_set_clkdiv(cpu_dai, SAMSUNG_I2S_DIV_BCLK, bfs);
> >> +     if (ret < 0)
> >> +             return ret;

> > Set this stuff up on probe.  I'm surprised that you need to set BCLK at
> > all...
> >

> Should I create a late_probe call for this (in line with tobermory.c)?

Yes.

--HrV55DujqS0rXGB5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTVrXjAAoJELSic+t+oim9G3sP/0ynfzYReiq/7tW6PKDDjU4K
w9FZjFKdi5Vx5WCeChOW3QMwXv6BPLbMJMDvwkq2lE5YW8saqI0lwed8DL1ghf+O
UnsfBk6nnUumk1UjwwOiK0pcIcwy3y/scEEne7ccnMp3Qku0TZ6eUlNrhYgym0VM
O7mp+YvD+ous6mC+M6pptRRXUWNotzcIk9KoYU5j7kPqtFbXt+h2aUHw3YzLXVJD
ws27lnfKdHtZ8gi9U0hSKOt7/RMmhzlaagw6oyAQBZsRpNjDYrzdtfik8ricaBx+
sDa8MbWCJQ6VZGhZzECeiQpbPa5m4KUhx/zq3LDVle1sANfC3yM0mlHfqE0GwYyh
Vtywso8bEs5fgCMrFZJ+MRW+elkdAACUy/+2ypPmuoHEGu7UJWU+z7KHGkrr5ySJ
aKrZm59Tj3FuJUQAJ6a7pyErMPQp2U4cG5AAM3B2OtkpGBLPjDm/NVVNxXLhKZnA
ST0faTDP5isFfx39ZkdjSvWPzp2XpO6iyVL1B1Ci+QahKXrYjZdLgxEkDbNZUxQ0
tPfGePF5rSNcAcqN5vM2n+/pLZn+D7OUH1tEHme5R/p9EFtXAJuy/WswDJ5YA0SJ
X78Is4ps+SIEGu+4gNnD4UpFzrgqnTTmafwbVxyMSTDJXH6zRle/lP2VZmR9v5vR
iSAwFYhCYCcu7h7A7gZ8
=5VUc
-----END PGP SIGNATURE-----

--HrV55DujqS0rXGB5--

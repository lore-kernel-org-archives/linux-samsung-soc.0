From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: samsung: Use ASoC dmaengine code
 where possible
Date: Thu, 5 Dec 2013 11:45:38 +0000
Message-ID: <20131205114538.GO29268@sirena.org.uk>
References: <1384264120-24750-2-git-send-email-broonie@kernel.org>
 <CAAgF-BcJZrwwHYtk6pKj_-+CzmbhhV4V_Z02kjHveObOR6oiFQ@mail.gmail.com>
 <20131126102311.GW14725@sirena.org.uk>
 <CAAgF-BdWLXeLyVZv-durSxxVEm4hHaC7sXQuz_pGLLY-x7XS+w@mail.gmail.com>
 <20131126122031.GA14725@sirena.org.uk>
 <CAAgF-Bc5mEmOBFZak2rSuCqs+xjcrNqnVNZc=zno8F3VOCuuwA@mail.gmail.com>
 <20131127150534.GW14725@sirena.org.uk>
 <CAAgF-BcoKDt=u51tqiWyxveb4iJSXKuV49X1VmOsWiRsSGKKpg@mail.gmail.com>
 <20131128115351.GC27568@sirena.org.uk>
 <CAAgF-Bc3fOdJ3C-Jrmw-7Vxt_9QSJHEX5kWvCEyu_WBrsMDdEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2211098120683002428=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <CAAgF-Bc3fOdJ3C-Jrmw-7Vxt_9QSJHEX5kWvCEyu_WBrsMDdEA@mail.gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Padmavathi Venna <padma.v@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, linaro-kernel@lists.linaro.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============2211098120683002428==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OE5XN2KVoD5QaTkR"
Content-Disposition: inline


--OE5XN2KVoD5QaTkR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 05, 2013 at 04:20:03PM +0530, Padma Venkat wrote:
> On Thu, Nov 28, 2013 at 5:23 PM, Mark Brown <broonie@kernel.org> wrote:

> > OK, so we can probably just reinitialise the dmaengine data after we
> > reset it?  Like below

> Yes. That works well.

Great.

> As I forgot to add SND_DMAENGINE_PCM_FLAG_NO_RESIDUE flag, I was
> getting underrun error. After adding this flag audio playback is
> working fine for smaller files on smdk5420 with pl330 dma driver.

OK, there were some patches on the thread adding residue support to the
PL330 driver yesterday - hopefully those can get merged at some point

> Except for the crash due to NULL pointer dereference in secondary
> dai(I posted a patch for the same (ASoC: samsung: Initialize the
> dma_data for secondary dai)) you can add my

> Tested By: Padmavathi Venna <padma.v@samsung.com>

Excellent, thanks - I'd squashed in your change already.  Like I say I'm
still concerned that we might need a fix for v3.13 since I can't
entirely see why the code works as-is.

--OE5XN2KVoD5QaTkR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSoGdfAAoJELSic+t+oim9s2sP/1eh9i/zxfU7ZQJVi48rv68M
zBzteoDM21/Sb3SK45B4khMbe+APIu3AlIlTbMdUCJp90obtjDlKzYsrqkC6fLSM
BVDOYNrjA5PedJMeahJTnNCAoDrn4CmfUCFJToAWDvSznfVBzJwQpX45sU8EFxai
Q9tiOUhcnlBF+ykR1g+OgOsPkW2aMiKQednMJ3xtU+3Ei6S6gaYKx05zXFhNoIlt
Ov2NhNGaz+CaMEJ7vBXq5l7sH0qfFhfzAGm75c3DXyg6vJcUds1u6wvvp9ZJU34v
WsvZcgYss+cq9Iuq6CdzXXPt8IFCRB/Yz06NHqbEJiniK4HN1GfwS+WVcan7j9Ax
LihvnW2lgXaSK9C0F0bFiBBa5RZTzAlOFva+NUB+ZvZUZ6XYpNaaPDlmwB2hLn+N
HJBQkeyzOrrA5K84EQqxlUcWQZb74fTYwlge2hf6jV7Mi6OG6gv9MXxMjXSKwvlW
NYcdkb9btr01czqzg/iUObuNM11z1RZ4eD4JlOvTj7ddaDCXZifyPf7SDanIWpTl
Cv+M0Uu0264CTEtEi/Pc+q80y+OnHhGtUCnM7Haaa6NcK0Z0CO015xV7mNwDxn2q
aCmnDjTyWBkRTJtNUvvd5PC8oWGA45U8y7txJvy2esPP6oR4a9x+E3onPYNHuYZA
gR7vRvjI+/xTL0NE4U8E
=5BF7
-----END PGP SIGNATURE-----

--OE5XN2KVoD5QaTkR--

--===============2211098120683002428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============2211098120683002428==--

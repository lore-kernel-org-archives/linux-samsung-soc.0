From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH v2 00/12] ARM: s3c64xx: Let amba-pl08x
 driver handle DMA
Date: Tue, 25 Jun 2013 11:28:18 +0100
Message-ID: <20130625102818.GA27646@sirena.org.uk>
References: <1371933764-24875-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8829163814687016632=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1371933764-24875-1-git-send-email-tomasz.figa@gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: alsa-devel@alsa-project.org, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Padmavathi Venna <padma.v@samsung.com>, Takashi Iwai <tiwai@suse.de>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Giancarlo Asnaghi <giancarlo.asnaghi@st.com>, Kukjin Kim <kgene.kim@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Vinod Koul <vinod.koul@intel.com>, Thomas Abraham <thomas.abraham@linaro.org>, Grant Likely <grant.likely@linaro.org>, Alessandro Rubini <rubini@gnudd.com>, Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-arm-kernel@lists.infradead.org, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-spi@vger.kernel.org, Dan Williams <djbw@fb.com>, Olof Johansson <olof@lixom.net>, Alban Bedel <alban.bedel@avionic-design.de>
List-Id: linux-samsung-soc@vger.kernel.org


--===============8829163814687016632==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ucH0Tl3ykwO2QBzm"
Content-Disposition: inline


--ucH0Tl3ykwO2QBzm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 22, 2013 at 10:42:32PM +0200, Tomasz Figa wrote:
> This is another version of my patches extending support of amba-pl08x
> DMA engine driver to PL080S DMA engine (PL080 modified by Samsung) found
> in Samsung S3C64xx SoCs.

On my non-DT s3c64xx system I get this when trying to use SPI for the
first time:

[    1.739385] s3c64xx-spi s3c6410-spi.0: Failed to get RX DMA channel
[    1.743437] spi_master spi0: failed to prepare transfer hardware

though I haven't yet tried your clock patches (there were some conficts
that I didn't get round to picking up yet).

--ucH0Tl3ykwO2QBzm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRyXC/AAoJELSic+t+oim9GmUP/R8DpB8DADk0acHVgQrnkpIi
ZcQs+amajUAW0+rXzmXs941w7E8lPX5Vl7vZQ8C9Kcbl+HGFzaUttRBhPz+obciI
EoM7kJAf02rn2SCgcdlLcGtP2GIjdButZudsajqm/+eiOzF2BLGFepwGswmk/yN6
R7lwO9uw+DU/AvqRgl900IQmyUsFVjt9ozdVZqqqZNPK02BI5uDnXHkUVC4vJmSc
jGdxTeKbP3qVV7QyI44hxx/o12nBPYPIacu35Wlxcp5tsL3BOnS14wIP2VtXVVUH
4QXN9yMQ2A0iSNIO0xfiTQB0xl6IPSJKsprq6wpxfivTZnPXYuGQskB2OT1+FQdq
2gH2DXTfsBHG/oz/VQcYTZRdF2bcesV2ygPiLuxzAdBY/DyyqqErCoI5VrImc8Bd
mTM4+RNOEjhj2I5Ft0NrfDq9aOpk3tpfi2wSH8Wv99fhnVNzG97md0cgwwA/zHKF
KylX/NOt5fSbLTFMqXOUuaIPSsGEVpajPDZyjstYyWf21p8Ya8Y/9x+JZCZ1HF+3
X+S1eZo6R7RNCebzEv8WFjSf4z29xdlGC4DBK0N3dy73bhQ231wtdirG64KJQHDr
ZvkfSgZYW9xDCvo05TyjtnrzQPcuQn5AjdvhL8VG8vXEIqQ3bZRUsssrZVFwgt/A
3aWOcRCy+wNQ/q7Q+llY
=A9bA
-----END PGP SIGNATURE-----

--ucH0Tl3ykwO2QBzm--

--===============8829163814687016632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============8829163814687016632==--

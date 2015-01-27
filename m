From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 2/3] ASoC: samsung: Document Trats2
 audio subsystem bindings
Date: Tue, 27 Jan 2015 18:49:10 +0000
Message-ID: <20150127184910.GL21293@sirena.org.uk>
References: <1421989410-12490-1-git-send-email-ideal.song@samsung.com>
 <1421989410-12490-3-git-send-email-ideal.song@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3948499895165194741=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1421989410-12490-3-git-send-email-ideal.song@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Inha Song <ideal.song@samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sbkim73@samsung.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.de, robh+dt@kernel.org, kgene@kernel.org, s.nawrocki@samsung.com, galak@codeaurora.org, grant.likely@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============3948499895165194741==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BupHoQMOlvKF7IyR"
Content-Disposition: inline


--BupHoQMOlvKF7IyR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 23, 2015 at 02:03:29PM +0900, Inha Song wrote:

> + - samsung,audio-routing : A list of the connections between audio
> +   components. each entry is a pair of strings, the first being the
> +   connection's sink, the second being the connection's source

The list of valid components should be specified here - reference the
CODEC bindings for anything on the CODEC but things on the board need to
be enumerated.

--BupHoQMOlvKF7IyR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJUx92lAAoJECTWi3JdVIfQJd0H/RGrpS2pSSQhGQPjNHK2GSRu
/l8yWZVaxI8SGIfcZZNetKBPv84uXrU7QUNRLttL6EfeAC0qgt0QS4XbdtY1ubeQ
YAGqUSv18N0Ym66scWiQqDGyZ3b0Qu2EEwwq+Ec7NockWutfumNG2jxFHzGRw0WF
8/0rPCaf6BnYNc02Zg2njB2WDXA3u1KKShiX/sCdQEW/Zy5gWFFpx5VuxIqh/Pxh
r3rqH74oCymM8JoarNuUtA6JMB7RVlwc3VyMRq8FjCmQpEVzVyp68/RNb6JOJJON
xLdj7bvE38HDkrnOfw2+Vr7av9K/UxNUxZOf/XRebkU+wRJm+f74ZvjJNrg1E8M=
=OLNI
-----END PGP SIGNATURE-----

--BupHoQMOlvKF7IyR--

--===============3948499895165194741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============3948499895165194741==--

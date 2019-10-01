From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 05/10] ASoC: samsung: arndale: Simplify DAI link
 initialization
Date: Tue, 1 Oct 2019 12:21:47 +0100
Message-ID: <20191001112147.GA5618@sirena.co.uk>
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130318eucas1p126cc8be60118ffbf1f332626dde1c05a@eucas1p1.samsung.com>
 <20190920130218.32690-6-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0838422296032131018=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190920130218.32690-6-s.nawrocki@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com, b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com, lgirdwood@gmail.com, krzk@kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============0838422296032131018==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 20, 2019 at 03:02:14PM +0200, Sylwester Nawrocki wrote:
> There is only one DAI link so we can drop an unnecessary loop statement.
> Use card->dai_link in place of direct static arndale_rt5631_dai[] array
> dereference as a prerequisite for adding support for other CODECs.
> Unnecessary assignment of dai_link->codecs->name to NULL is removed.

This doesn't apply against current code, please check and resend.

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2TNsoACgkQJNaLcl1U
h9B8Jgf/QOtwWNhy8BAfZQIc2REqWPl8fmuaapDD6MEvJOA3b+piDx2e6Q9YvKjq
afK2TLU5HN42PJIr5MTFPljexJovF0uhsmzekrLgYPV9UJR6KzsnoMtWq0aIccyu
KFRsyntw3MK+Ot9TxDVIpK/tGC4s2rAV+hJO7XV/t0V62Z3r91t0Ncp+wVxibwga
rxG4oFnwQYNp8aIpzKNc4GOqJ0W1A/5JOgUALtMlGtk6W7FJqOg4xmLsQH8TG1ne
j5YN7VCoJnki8nFk1JjiikxYYcvSLjxuB0nD/GlbBnP5McroJrCrKV/nJSooYkwd
+Sp8RijARqOYXpEbsVnN8K+DflY9pw==
=RFd7
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--


--===============0838422296032131018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0838422296032131018==--

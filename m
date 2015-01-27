From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 1/3] ASoC: samsung: Add machine driver
 for Trats2
Date: Tue, 27 Jan 2015 18:48:08 +0000
Message-ID: <20150127184808.GK21293@sirena.org.uk>
References: <1421989410-12490-1-git-send-email-ideal.song@samsung.com>
 <1421989410-12490-2-git-send-email-ideal.song@samsung.com>
 <54C7C653.6080904@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1588719247546816264=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <54C7C653.6080904@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sbkim73@samsung.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.de, robh+dt@kernel.org, kgene@kernel.org, galak@codeaurora.org, grant.likely@linaro.org, linux-arm-kernel@lists.infradead.org, Inha Song <ideal.song@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1588719247546816264==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="I9EedR+SylB3Jyyc"
Content-Disposition: inline


--I9EedR+SylB3Jyyc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 27, 2015 at 06:09:39PM +0100, Sylwester Nawrocki wrote:
> On 23/01/15 06:03, Inha Song wrote:

> > +	priv->clk_mclk =  of_clk_get_by_name(codec_node, "MCLK1");
> > +	if (IS_ERR(priv->clk_mclk)) {
> > +		dev_err(&pdev->dev, "Failed to get mclk clock\n");
> > +		of_node_put(codec_node);
> > +		return PTR_ERR(priv->clk_mclk);
> > +	}

> Wouldn't it also work if we added clock handling into the wm8994 codec
> driver instead? Not sure if it is correct to retrieve the codec's clock
> in the machine driver like this. Or perhaps the MCLK1 (SoC CLKOUT) clock
> should be added to the sound DT node and handled only by the machine
> driver, together with the other (MCLK2) clock?

That's definitely where we should end up but there are practical issues
with that approach since it involves coordination with all the machine
drivers using the device.

--I9EedR+SylB3Jyyc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJUx91oAAoJECTWi3JdVIfQfyUH/0/oWbQKGTYoaMNAy1uPtrKY
pUAkVYCcYAcFK/3izIRPB+blvAqT0+Pp/j85XTrlsh0W8bA950ZTnNu58tE4HPaX
NY+EDq3gB+uYwoeHo5CmXmRvm2eTpNhQ9b48jN+9VlPkZlKrIZSUjbeAP9Hk/JKW
ng68h5F9Dn0+KjVBdr0bsu3/zIUJ6ejDEe9zMrAZZ3TnR1H8QSCJ/w/u0rL1RnA/
iDAPtWNM2ADajDOIXi7AdIjjNRwBcgqNbd/Z/vBkglz6naaydqIILqGjHEplPqzW
K4VzPxCamup8wbS8X+ksKVsl3gnD4t0rYSyNbb4sKrJSbHPoAk+PrmjSatNwM18=
=s2TA
-----END PGP SIGNATURE-----

--I9EedR+SylB3Jyyc--

--===============1588719247546816264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============1588719247546816264==--

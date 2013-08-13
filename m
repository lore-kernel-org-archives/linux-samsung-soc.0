From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 10/18] spi: s3c64xx: Do not require legacy
 DMA API in case of S3C64XX
Date: Tue, 13 Aug 2013 21:29:41 +0100
Message-ID: <20130813202941.GH6427@sirena.org.uk>
References: <1376243970-6489-1-git-send-email-tomasz.figa@gmail.com>
 <20130813185547.GD6427@sirena.org.uk>
 <20130813201816.GG6427@sirena.org.uk> <1686992.nQEd3xdoHn@flatron>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5788349411129249805=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1686992.nQEd3xdoHn@flatron>
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
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Sangbeom Kim <sbkim73@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Linus Walleij <linus.walleij@linaro.org>, Padmavathi Venna <padma.v@samsung.com>, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, Kukjin Kim <kgene.kim@samsung.com>, Dan Williams <djbw@fb.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============5788349411129249805==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="t8sZUJWWzCYn6PHL"
Content-Disposition: inline


--t8sZUJWWzCYn6PHL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2013 at 10:20:19PM +0200, Tomasz Figa wrote:
> On Tuesday 13 of August 2013 21:18:16 Mark Brown wrote:

> > 	if (dev->chancnt > 1 && !dma_has_cap(DMA_PRIVATE, dev->cap_mask))
> > 		list_for_each_entry(chan, &dev->channels, device_node) {
> > 			/* some channels are already publicly allocated */
> > 			if (chan->client_count) {

> > which is happening because dma1chan0 (which is on the same DMA
> > controller as the SPI controller) and in fact every other DMA channel
> > had references grabbed by the network stack dmaengine helpers which I'd
> > enabled in config.  The fact that they do that is unhelpful, it renders
> > the API mostly useless, but is nothing to do with this series.

> I believe you just found another brokenness of current DMA channel=20
> matching.

Yeah, at first glance the reference grabbing thing seems a bit peculiar.
I didn't research why it's done that way yet.

--t8sZUJWWzCYn6PHL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSCpcxAAoJELSic+t+oim9bxAP/0QJ1lRL0/9GWqrLeXp5Sb7q
yt/beBWYPnfQyGZ0dtWZZfnD4Ftfi8x/rzEWOkGPGsm0BqmiP0Szjb7Imm9Nd5WK
rM62iGiK+eZzTfcc6EaSXWZwf5IEJyrvqcqDjWNjDqREaA4jWSz/bFIYuk+djOL9
BiB5Q9C+AfzfwL4ZG0Wm+74pd/FR5rLG87H++86tJzYgaKeGE7si3UiPmUXAiUTN
cFW8MAEKjqD/eQkUN9gRrSl/sUx7adLEPLTdc3U7nPGVqH+unD2Qis5moBe3WKfo
ZRGjk4dfi2hC56EJIuTXUr9VkMcCMtmvc63l4thYEXxk1Kw36vWnn7pasEHlWTRT
TYUHRxWTIWxIt92Vv9Bu17wPIrh+99xCOwSmw2zsVE+hTijq6VErgtDTt2onx/S7
oG6IpmetjBprM2HPk0WZxj8glFl3o80nb/eFgz8fJCc9RE6lb5lnmutKZ6izRQYR
+oGRH46+OZXCWl7WlFO11ybmuJK2ApbKUJGiqUaj7xKBe5kCNXUnzM+Hn37kMaUl
GVZ1ENzmduPOpu8G3Kcc27VCANIgcC0iCrXe7ol1Wodpdc3VxYybFLIoHCYhEx0t
sa4Mwn/ApZRZZXsZtiU2YAA9IubaBwTcqKmDUgEUOqT8nwgL7tfTQMXIRk8J3s0L
edyU0gFv7A4OeFAskC67
=dMF/
-----END PGP SIGNATURE-----

--t8sZUJWWzCYn6PHL--

--===============5788349411129249805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============5788349411129249805==--

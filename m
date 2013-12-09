From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: samsung: Use ASoC dmaengine code
 where possible
Date: Mon, 9 Dec 2013 17:59:03 +0000
Message-ID: <20131209175903.GM29268@sirena.org.uk>
References: <20131126102311.GW14725@sirena.org.uk>
 <CAAgF-BdWLXeLyVZv-durSxxVEm4hHaC7sXQuz_pGLLY-x7XS+w@mail.gmail.com>
 <20131126122031.GA14725@sirena.org.uk>
 <CAAgF-Bc5mEmOBFZak2rSuCqs+xjcrNqnVNZc=zno8F3VOCuuwA@mail.gmail.com>
 <20131127150534.GW14725@sirena.org.uk>
 <CAAgF-BcoKDt=u51tqiWyxveb4iJSXKuV49X1VmOsWiRsSGKKpg@mail.gmail.com>
 <20131128115351.GC27568@sirena.org.uk>
 <CAAgF-Bc3fOdJ3C-Jrmw-7Vxt_9QSJHEX5kWvCEyu_WBrsMDdEA@mail.gmail.com>
 <20131205114538.GO29268@sirena.org.uk>
 <CAAgF-Bc5wpwsCtvg-i=nwoSgwDb137VkLC78R1tgsf7CqY-KQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4483565007784772744=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <CAAgF-Bc5wpwsCtvg-i=nwoSgwDb137VkLC78R1tgsf7CqY-KQQ@mail.gmail.com>
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


--===============4483565007784772744==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kW8VbOAxhix4S1vC"
Content-Disposition: inline


--kW8VbOAxhix4S1vC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 09, 2013 at 11:22:39PM +0530, Padma Venkat wrote:

> I think this is what you are concern about why it is not working as-is.

OK, makes sense - thanks!

--kW8VbOAxhix4S1vC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSpgTjAAoJELSic+t+oim9S3MQAJEqI/Ks2doilofA+Uu6ZlYf
PiiX8zm4UVqsrbRBvGGrBZGxgBHm9EQafDB+wwVmqcnaHG4BCen2itWtD+fqXAWU
F1Y3m6nU/aehWrxaV3xL8grF5zyZSbbNFaVpdxRcUodanW1fnC9yes23svthArOM
2J6ZyL6lIpG7iEO4NLyjTLVAK748CUgI7VTH6ypkgXN1uR0nMiqP42izw9uTW/Vm
d2jjcW8Wbob3ut5ucCS9EVQjhX+LuIgOzkEmJ2ORkTVQCf2c6SHxq9+pts6lNBhz
9+UDcaCfzJTvvNnpqP17psiF6VShdrjm76zqmtRs3y72JkV/cKq5P3oEKqhP+TNW
xlT96sxjD1g82/z8d86y7bRbvtwWvP7JVodY/6NXhrawzN2J6crkpqthHF7rX391
Wqu5iHqSYleg5Fju5LU5T43L3Z7HSRT6sX6RZqPBzouBuEdPcuqclJPAlqEaaFpJ
I4Nw2pky0kbVxoFCprkuuy3QwRMkDLqAZPN7vAvYhW5G65sdGETUV/7IEUoRgBaj
CMKFuIwVRbNXIZR1bMtvZbpWc7RxgAw1jIG/qfYcVSvX32wHRO7upOc9Zbh8n5v8
NUwWWy/wZeKgFRFHqTGpr2TsmuYNTPZdSldzSx1UJ6WOlaRSBarRBSVzBuQmwxjn
BIAtvUAS4aQAoW+gUSRX
=biLZ
-----END PGP SIGNATURE-----

--kW8VbOAxhix4S1vC--

--===============4483565007784772744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============4483565007784772744==--

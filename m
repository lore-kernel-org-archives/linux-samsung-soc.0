From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] video: s3c2410fb: Register cpufreq notifier only on
 S3C24xx
Date: Wed, 10 Aug 2016 13:40:13 +0300
Message-ID: <48c0efad-875e-0a38-240f-d36e1c7f8d66@ti.com>
References: <1467031945-10486-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1813630833094387948=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1467031945-10486-1-git-send-email-k.kozlowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

--===============1813630833094387948==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="FQKrKSV3NLXxwwMoLhf4BssxuM99c08Vi"

--FQKrKSV3NLXxwwMoLhf4BssxuM99c08Vi
Content-Type: multipart/mixed; boundary="sBsJHwfM2HccDFvDDrSmWnOTLd9kf2BrK"
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Kukjin Kim <kgene@kernel.org>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <48c0efad-875e-0a38-240f-d36e1c7f8d66@ti.com>
Subject: Re: [PATCH] video: s3c2410fb: Register cpufreq notifier only on
 S3C24xx
References: <1467031945-10486-1-git-send-email-k.kozlowski@samsung.com>
In-Reply-To: <1467031945-10486-1-git-send-email-k.kozlowski@samsung.com>

--sBsJHwfM2HccDFvDDrSmWnOTLd9kf2BrK
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 27/06/16 15:52, Krzysztof Kozlowski wrote:
> The driver registered for CPU frequency transitions to recalculate its
> clock when ARM clock frequency changes (ratio between frequencies of
> ARM's parent clock (fclk) and clock for peripherals remains fixed).
>=20
> This is needed only on S3C24xx platform when cpufreq driver is enabled
> so limit the ifdef to respective cpufreq Kconfig.
>=20
> Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/video/fbdev/s3c2410fb.c | 2 +-
>  drivers/video/fbdev/s3c2410fb.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks, queued for v4.9.

 Tomi


--sBsJHwfM2HccDFvDDrSmWnOTLd9kf2BrK--

--FQKrKSV3NLXxwwMoLhf4BssxuM99c08Vi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXqwSNAAoJEPo9qoy8lh716DoQAIHvvl7mG/h1Y5O93Gsz7aos
Sd7fx0qK9LNLbmWE3lNgtOO0p9RJgVpc5k7fUQ/gMp1y7BzPEEb6qf8tyOOc0cRC
lDDif5B36/rzRFNxgNFXh3Wde3jKnMr4ldLED88bYJbLSbnIefr3pEK+ftv+n4RO
szwOljqrI11Q/XB6c265+HIDD0SruMI+5VoKw5s1Tm5Z62r5ceGmXQ7IUbcXfE2u
RY5lX/rDdqOZ2NXJ1A/c7Wlbb0Luyf3zYtD01u6qmXtEXfbbILgDFsNYB8uc4o4d
a5uVvRvNVTBe9WVN2KyzKWQKHLOUuwLpWnxjEHpjb+IM3gkHxk1NSx0QXboMUxqH
DeWabTg/gn5DkLIoaB4V1nKVDrTrjST3KIzlk6S4ixpvC7XyLO7gnogLclKy0jKZ
hbrk3OOjTBQXMOj9C5IqehVNwGls8gr5c9h4IZOTzzc91UNsW4RU1EL71ner/Sa6
GlhSDB/F/7n9UfR89PBQu9a6/WOp1wvdkp6G9xrILjDcUouvQVxie7HiZdhmh5L8
I004B/aNJDBKUwKPaVxucwXnFxy9r5n+oMXa8xAOBtq05fER5rF4S6CzW1963vWm
KbVgPYOlNn1JmwXcWya8+cXchsy6WoEhBmv5BOOsr/PedVt3QFvqWvumPnOI7blZ
DiEwLWp/Tao+UA4DOlOB
=cwX1
-----END PGP SIGNATURE-----

--FQKrKSV3NLXxwwMoLhf4BssxuM99c08Vi--


--===============1813630833094387948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1813630833094387948==--

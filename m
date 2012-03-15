From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 2/3] i2c-s3c2410: Rework device type handling
Date: Thu, 15 Mar 2012 12:56:30 +0000
Message-ID: <20120315125630.GK3138@opensource.wolfsonmicro.com>
References: <1331657679-31302-1-git-send-email-k.lewandowsk@samsung.com>
 <1331657679-31302-3-git-send-email-k.lewandowsk@samsung.com>
 <20120314172915.GB13393@sirena.org.uk>
 <4F61BEC8.4030008@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3471446847755934681=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F61BEC8.4030008-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============3471446847755934681==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HcccYpVZDxQ8hzPO"
Content-Disposition: inline


--HcccYpVZDxQ8hzPO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 15, 2012 at 11:04:56AM +0100, Karol Lewandowski wrote:

> Introducing separate type (TYPE_S3C2440_HDMIPHY) has been our original
> attempt to solve this issue.  However, this required adding explicit
> checks to driver code all over the place (if (type == S3C2400 ||
> type == S3c2440_HDMIPHY).

Another option is to change the type to be a pointer to a struct with
quirk flags in it.

--HcccYpVZDxQ8hzPO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPYebwAAoJEBus8iNuMP3drkYP/1PZa56oyfKw8hJd1h9L+IZv
RKBh7G8R2Z3Yx/uLDIP5PlhYoPOdMeQ9ngg4svOh27maeDvhEXgXO5jP2nzxjCOo
Su62mR8sozezGe2OO6cFkX4zaa6I48gexfiSZzkMpr16HEkRXd5Cu/aSO4ruF50R
yduSDMPZVuiI/fnlKvYpSKmkOhVUfgRNI+Zg7qbV6YqQLDjsP5EvEia7NU4h3T+B
qs1RWcZC67LRvuDBWfB3akTHtoQqPAMLGqvqXgZfFOT860erAAVTfBj4jQ/1VIwo
blaycDLtSAD6iQhtXE6HL06exP57GBtfYnXrFdxFu0OtyMRsgbpUeYFPuNE9japD
dcC+t5gmGYrG8yVYtUjF607kP3HgQnKHDD/JmbGDo66IBxQC0F7gYJh/LBNstMK2
YXZLi5JEmUMuvMlNQ/aQE7HdzVf4m0FiJHWCNaL8z7cmNF7HLERHARvW3WlT3vgJ
2SMb3vKq9EQWQs0wvCqMfdROrVEXO8pEdjYwveZdiMXqNheCEuyPIjqG8tPPjwjv
M41QcfsCTwdZIfaoJlCAPc/qiw7HmlyFOlXvFIUrOrw6d0/06XYJmSoS5h5EQhyy
z2jj70jFdWTejb7ZBixO3RRD+J4j7psa/A7LzrlgJxKoDnhiITn6OHMwaS6UAVBf
ihCC5yudMnNesehNatHt
=NmrA
-----END PGP SIGNATURE-----

--HcccYpVZDxQ8hzPO--

--===============3471446847755934681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============3471446847755934681==--

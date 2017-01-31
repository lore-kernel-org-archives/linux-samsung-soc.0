From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v8 2/3] drm/panel: Add support for S6E3HA2 panel driver
 on TM2 board
Date: Tue, 31 Jan 2017 22:51:06 +0100
Message-ID: <20170131215105.GA3515@mithrandir.ba.sec>
References: <1484116439-7275-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170111063408epcas5p2e6ec091549c3ffed8462fd95d11d3c82@epcas5p2.samsung.com>
 <1484116439-7275-3-git-send-email-hoegeun.kwon@samsung.com>
 <08c5d94b-c76f-af14-c08f-478e26a34a7c@samsung.com>
 <588FD3C3.7080508@samsung.com> <20170131085449.GA19348@ulmo.ba.sec>
 <20170131143853.GU20076@art_vandelay>
 <20170131150226.GB4519@ulmo.ba.sec>
 <87r33j85ap.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1509727373=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <87r33j85ap.fsf@eliezer.anholt.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Eric Anholt <eric@anholt.net>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Donghwa Lee <dh09.lee@samsung.com>, linux-kernel@vger.kernel.org, andi.shyti@samsung.com, jh80.chung@samsung.com, cw00.choi@samsung.com, kgene@kernel.org, dri-devel@lists.freedesktop.org, Hyungwon Hwang <human.hwang@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Hoegeun Kwon <hoegeun.kwon@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1509727373==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 31, 2017 at 10:15:10AM -0800, Eric Anholt wrote:
[...]
> As is, I'm stuck out here with my panel driver I submitted on December
> 14th completely ignored, and no other developer will look at it because
> their review doesn't count and only yours does.

For the record, until earlier today when Daniel started to review your
patches, no doubt in response to this discussion, there was exactly one
response to one of your clock driver patches in the series.

So can we please stop singling out panel drivers? This is a general
problem that we've had across the kernel, or at least the ARM and
related parts of it, for as long as I can remember.

Thierry

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliRBskACgkQ3SOs138+
s6Encg//fIp3eg2YiCpvKC3se1LoiQ8J818rtn7jgi83RdphCj0Z+cKtREFEXp5O
tXIjgJDCwywCXKOqlEf/wRho34W+mdYTTY3pheOtPyyF8yCWRptHxCbxh7jYdKez
TdpJWA47Vt5oqWJVJHRO7glwyVqpASYpP7tc2+rFS0PaiVk6eyTFlN3H2XVQGe7q
CHGtBmuPxOp6SwCjj9jACQXHwES5LxOz01OxY9qpw0YwOiEkQRaEABhJecP/GEqJ
7kxj9Dc7oDccl2wWAtXm5KGl86g4Nugy+Ix1suhlD86RFkxy9PrYBA8jZkfhUBbt
IE78pLq9q1DD9LUkw2mxdmYyjoo7k5cfSza5NwkjB75ElIdOsUI3EURioxNqz84i
g8HEy8Gup5ey7EFCyvLnG1VD2C7QLb2kPxx3h0GKWIu9ZCvLpWpVIOhghJVF5Rf5
XBbyGW7XydNhGafQxxe6c6uR2hxjfN7TmwrdnRwiHwBdNgnoeUeQsGeDXZm9VROX
44oBHGl/NOJ4YybiI91jjK07MDYHQ/9nkgtX6X2XjWIsSn0UrNj5qJqnq1t1Qa0v
K5TajXypbi/6biQXfGPEYHUyhzLnvXuodl4xJnT0TPlMh3OaUfTxr+a3anMkU2Tf
OHxdaS9YVsT1ueWntkV8u64/8O8IqZBKpUAYMOGiUW3kA/omQAA=
=q14P
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--

--===============1509727373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1509727373==--

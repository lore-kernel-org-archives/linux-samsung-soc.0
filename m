From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/3] ARM: dts: Enable audio support for Peach-pi board
Date: Fri, 13 Jun 2014 23:04:21 +0100
Message-ID: <20140613220421.GD5099@sirena.org.uk>
References: <1402464739-19044-1-git-send-email-tushar.b@samsung.com>
 <1402464739-19044-4-git-send-email-tushar.b@samsung.com>
 <CAD=FV=XqqP7+xDOAKCixivzgaO0xvJX7L+CCN+unAEuf-6aUbQ@mail.gmail.com>
 <20140613170511.GA20112@sirena.org.uk>
 <CAD=FV=VvkvH1TPiKttm9VXbBRnBo7kmTVK8bZZvexK=bAvaO4Q@mail.gmail.com>
 <CAD=FV=XCk9E-7VPV=LQrdLU5fKsFHviQf79MBmC8va3gsg=Ydw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7459033505561555662=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAD=FV=XCk9E-7VPV=LQrdLU5fKsFHviQf79MBmC8va3gsg=Ydw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Doug Anderson <dianders@google.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Tomasz Figa <t.figa@samsung.com>, Tushar Behera <tushar.b@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kevin Hilman <khilman@linaro.org>, Tushar Behera <trblinux@gmail.com>, Rob Herring <robh+dt@kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org


--===============7459033505561555662==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lZ/I5ubSOvRSGe9j"
Content-Disposition: inline


--lZ/I5ubSOvRSGe9j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 13, 2014 at 02:58:26PM -0700, Doug Anderson wrote:

> Anyway, suffice to say that the i2c core needs to be extended to
> handle the idea that a single device has more than one "compatible"
> string.  I'll leave it to an eager reader of this thread to implement
> this since we can also fix our own problem by just listing "max98091"
> in "sound/soc/codecs/max98090.c" like has always been done in the
> past.

Why do you need to register multiple compatible strings (I guess for
fallback purposes?).  A quick fix that is about as good is to take the
first compatible only.

--lZ/I5ubSOvRSGe9j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTm3ViAAoJELSic+t+oim9u4cP+gLyrS+envDYQbCSY/eJAnXp
a9lLZdgtRF9Xy8H+ong5D2qiMGJ0aQv5Xs7o3fxECrYQh0jHbUxoP41AacXzgcsq
kGKOT3jt+nXbG0nFG6IkjasWcL7QzSXvFu9ziU7Fb3hridPMe8UHfLWcTtsL4iLO
GZHn5sF3RGd+6JOSOP5dOi8cTfT4HFAD21aAhchLUTPor4VOEL6PG9LQ7/ykOxjl
MrwHbUXAAeTjsmFOIU5aLyEyUEePL5lgteV8DTaWq0IyLN5DKssdI4/KCbg5+lbc
8rVfvRsARY+hQrxzYSqz5dlTBPSglcIDepLk/Fqad3OtT+0Vufe1WXAwvWrTcC/x
er+2C7qKnFuOHcl0tM5BFSjodChqM84RqkY+lWN2SEKBRXjnpryIpCMKPs4eLpwR
jZoNGZ/umb/LYuzOy59ZUyZVcrk2Y4bbhUv8LHeS7hwmKLkFgeDI15RI8YfrAbCJ
yPV0/RY6gBdT+jZ6NZ2jQWz+zr+GJ4YxmfJio4uMRyIVzsHg80q6fgy3oCtFn94F
z8MkTh+8LhRTQcbYxo4w10JBgVLTq26QKrmWbll/wiKH0pLWHMsJAX9cgnXH2XBA
qSqoO9hbQgEXqUVdADWWsGwSLqk/pjZDI6zh7yTMk56sDCS9xtN25sxqsH/o2c3R
L5DkwPYca0G1ieVtySdY
=YGt1
-----END PGP SIGNATURE-----

--lZ/I5ubSOvRSGe9j--


--===============7459033505561555662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7459033505561555662==--

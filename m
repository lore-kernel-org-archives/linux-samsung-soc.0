From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 03/10] usb: dwc2/gadget: fix gadget unregistration in
 udc_stop() function
Date: Thu, 23 Oct 2014 10:01:33 -0500
Message-ID: <20141023150132.GI13573@saruman>
References: <1413801940-31086-1-git-send-email-m.szyprowski@samsung.com>
 <1413801940-31086-4-git-send-email-m.szyprowski@samsung.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tctmm6wHVGT/P6vA"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1413801940-31086-4-git-send-email-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--tctmm6wHVGT/P6vA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2014 at 12:45:33PM +0200, Marek Szyprowski wrote:
> udc_stop() should clear ->driver pointer unconditionally to let the UDC
> framework to work correctly with both registering/unregistering gadgets
> and enabling/disabling gadgets by writing to
> /sys/class/udc/*hsotg/soft_connect interface.
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Also here. In fact, this is much more important :-)

--=20
balbi

--tctmm6wHVGT/P6vA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUSRhMAAoJEIaOsuA1yqRE5QsQAK1FXlUXrAeGaq82BBnREtPb
5lR0GIdfTqPrOvJ1Ubu6OOreCrR9/qij0P2AUgCz9nd2/ddID7lylXKIGgQ43xfc
3EE4jyALPaAusoAzpO5Go6BsUD+aw2GY+1i998vPPH6x/rQ6FpnFZWfOvgrxSO6a
bpohsllSbdBcNFNgJPVqWlpipbCFewYI/OcO8OHv2B4Io5yGyONGMkyq/s+iPqic
Rj0IGjBHsW/padbHbUtwrjVrKKFOtjlbpoxF5mDctGrZgSEdLSkvSECzoX9sYu8k
jGY7yD2AiaU7UB9jaGKlEU9XUVg//TzB6XGLE980YGFBsuivwRTStcV4hvSsicVa
bVHtfgiCkFMX2I/6gh3d7XMpYxXDBrfGs1r6MXLmV0HwRHpw/ob3R0K1skgkSqyu
eCZBX/5BLSJFhh7gcw1m+8X5j9utYovQM+GRSQzvEpN0DRHJ3NJnV9rjGQC+gtUh
JPTCXEy7e28KjPYIXJK/CpjuANWxG5Z9M2P3kWHvg8/7mSvlOyHUP+qaGYmFMVxq
Q6BSo0kR51h9rauoec010lBHVEm7q16BKd0bLZso4uW8OsM31rL0lQUksAbZTT8g
lwfb+5Kz+n6gJOx1qFeeLoO9jl9+fPKo9/P+gDi7yzt92q9LxaDc/NytQKF9+eJ3
thNmAIQ5+0hyhEJ25E1E
=DzJQ
-----END PGP SIGNATURE-----

--tctmm6wHVGT/P6vA--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

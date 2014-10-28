From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 03/12] drm/bridge: Add helper functions for drm_bridge
Date: Tue, 28 Oct 2014 16:05:34 +0100
Message-ID: <20141028150532.GF17770@ulmo>
References: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
 <1409149783-12416-4-git-send-email-ajaykumar.rs@samsung.com>
 <20141027190137.GT26941@phenom.ffwll.local>
 <CAOw6vbLNOqp=X4epwDPb7zT-j2+oUuLoeV2S=x+oGPLQwK+Z7Q@mail.gmail.com>
 <CAEC9eQPQaYjL3ZxtDZBdKi2z5yANcHQ9s4ikYkxN95K9qvu01Q@mail.gmail.com>
 <CAKMK7uGoO5TBgLh4HSDjxUM=-WRfsQoDHusLmOYxLio-QBMEPQ@mail.gmail.com>
 <CAEC9eQNJb1TgK1ihvzvC0VjSJhm48WaFO5SVigPsqTOurK2UQw@mail.gmail.com>
 <CAKMK7uFX7rENLBmwE58rtCBXZ_pSF_uS5Poiuks7xfi+r=e9gw@mail.gmail.com>
 <20141028144126.GC17770@ulmo>
 <CAEC9eQNqDNS0HgCSCOkVBYzSypHCt+aMxYZaX1vmTr8SKn2cbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0827623051=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQNqDNS0HgCSCOkVBYzSypHCt+aMxYZaX1vmTr8SKn2cbA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ajay kumar <ajaynumb@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jingoo Han <jg1.han@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, Pannaga Bhushan Reddy Patel <bhushan.r@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============0827623051==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qp4W5+cUSnZs0RIF"
Content-Disposition: inline


--qp4W5+cUSnZs0RIF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 28, 2014 at 08:16:44PM +0530, Ajay kumar wrote:
> On Tue, Oct 28, 2014 at 8:11 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Tue, Oct 28, 2014 at 03:19:36PM +0100, Daniel Vetter wrote:
> >> On Tue, Oct 28, 2014 at 1:28 PM, Ajay kumar <ajaynumb@gmail.com> wrote:
> >> > On Tue, Oct 28, 2014 at 3:31 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
> > [...]
> >> >> Hm, if you do this can you pls also update drm_panel accordingly? It
> >> >> shouldn't be a lot of fuzz and would make things around drm+dt more
> >> >> consistent.
> >> > Are you talking about using struct device_node instead of struct device?
> >> > I guess you have misplaced the comment under the wrong section!
> >>
> >> Yeah, that should have been one up ;-)
> >
> > Like I said earlier, I don't think dropping struct device * in favour of
> > struct device_node * is a good idea.
> I am not sure about drm_panel.
> But, I am not really doing anything with the struct device pointer in
> case of bridge.
> So, just wondering if it is really needed?

I think it's useful to have it just to send the right message. DRM panel
and DRM bridge aren't specific to device tree. They are completely
generic and can work with any type of device, whether it was
instantiated from the device tree or some other infrastructure. Dropping
struct device * will make it effectively useless on anything but DT. I
don't think we should strive for that, even if only DT-enabled platforms
currently use them.

Thierry

--qp4W5+cUSnZs0RIF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUT7C8AAoJEN0jrNd/PrOheuQQAMFLYTJfiKEJAyjYSSwTjd65
GmO7PvDlNrOBk5+mHaq/9lz6k8oyyVc6sCXLIkGGitAg79kAEPQvfvS9YPyqFNXB
uWPN11Pu42k0mFZIhm+Iei3siR7x5x4mz79KfVjSvtwhy2Qy+ue0ykuc7b1ods36
UaxSTYCmGsWZaV9ectOFvV1qnnIdJsA4LMmd63jugSsN5dtsBsxZXY/fWOguK5Ii
MaqSX1REwReyoh9W5BoUfOZNANSsg2aDdGp/6+rO+KVRgVI0ymPhcNgOsLDHlBe/
bx8oiSGgOMPGh6JA+MKFruDDKWlUuHGzmxRIpdP4V39otgPUmEP3C9YIgPyVGAAx
2E+a4qZwTdYmgsRN3Nm80zL9a539ItGEsTkgw7VCCe8q7ph3cGUkLOqPi/rQe2/R
2OvANgGyGhkIvkYniL72QTGi/UGt/oAbiZrYkDflV/DzN5acp9SZEAfvq/JGOJd2
bNjjSm3/dxoqF5Qx4BxSbvBfr6Tw7v5RTm6rVJYUlS1cnHqniK8UpnekqkS/eAqa
kfzKX0wxM4T2Cf8vyqrgMsoSOWbqJBpaM/bqaOtpb0UUHyRfR5JUve3YNJ1FxWIG
5z5QrFuTNVsZ4UoJaEdxWph+QIKF37qyQ7FSp0yDnB3MDueUCv1odo4e3v8xbJZD
B3h9OBGlbXVgMObe238T
=C+9w
-----END PGP SIGNATURE-----

--qp4W5+cUSnZs0RIF--

--===============0827623051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0827623051==--

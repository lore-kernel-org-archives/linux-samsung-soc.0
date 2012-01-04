From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] ARM: Exynos: Hook up power domains to generic power
 domain infrastructure
Date: Wed, 04 Jan 2012 16:29:41 +0900
Message-ID: <000a01cccab2$a1c42ec0$e54c8c40$%kim@samsung.com>
References: <1323704789-23923-1-git-send-email-thomas.abraham@linaro.org>
 <1323704789-23923-2-git-send-email-thomas.abraham@linaro.org>
 <1323704789-23923-3-git-send-email-thomas.abraham@linaro.org>
 <4EFB66C3.4040504@gmail.com>
 <CAJuYYwQbTJTRdsa9WpQuCtSTYacbrcP3CVBFaAYHP1jLPky10A@mail.gmail.com>
 <4F022D7D.3060802@gmail.com>
 <CAJuYYwSGYnyq+hEbgpyvFoAB9LWWLhD2URaWsCC4vMyZwRQVbg@mail.gmail.com>
 <20120104070038.GA15445@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:19182 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751422Ab2ADH35 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Jan 2012 02:29:57 -0500
In-reply-to: <20120104070038.GA15445@ponder.secretlab.ca>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Grant Likely' <grant.likely@secretlab.ca>, 'Thomas Abraham' <thomas.abraham@linaro.org>
Cc: 'Sylwester Nawrocki' <snjw23@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, rjw@sisk.pl, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, broonie@opensource.wolfsonmicro.com, patches@linaro.org

Grant Likely wrote:
>=20
> On Tue, Jan 03, 2012 at 01:53:28PM +0530, Thomas Abraham wrote:
> > Hi Sylwester,
> >
> > On 3 January 2012 03:49, Sylwester Nawrocki <snjw23@gmail.com> wrot=
e:
> > > Hi Thomas,
> > >
> > > thank you for clarifying.
> > >
> > > On 01/02/2012 03:14 AM, Thomas Abraham wrote:
> > >>
> > >> The following is a snippet from the dts file used for testing.
> > >>
> > >> =A0 =A0[...]
> > >>
> > >> =A0 =A0lcd0:power-domain-lcd0 {
> > >> =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,exynos4210-pd";
> > >> =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x10023C00 0x10>;
> > >> =A0 =A0};
> > >>
> > >> =A0 =A0[...]
> > >>
> > >> =A0 =A0fimd0:display-controller {
> > >> =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,exynos4-fimd";
> > >> =A0 =A0 =A0 =A0 =A0 =A0 [...]
> > >> =A0 =A0 =A0 =A0 =A0 =A0 pd =3D <&lcd0>;
> > >> =A0 =A0};
> > >>
> > >> The fimd (display controller) driver would then do the following=
=2E
> > >>
> > >> parp =3D of_get_property(pdev->dev.of_node, "pd", NULL);
> > >> pd_np =3D of_find_node_by_phandle(be32_to_cpup(parp));
> > >> pm_genpd_of_add_device(pd_np, &pdev->dev);
> > >
> > > Sounds interesting. Currently it's platform code that adds device=
s to
> > > a corresponding power domain. But doing it at drivers might be mo=
re
> > > convenient for avoiding device/driver/power domain registration
> > > synchronization issues, especially that knowledge about power dom=
ain
> > > existence may be contained directly in DT description, not needin=
g
> > > drivers to carry platform specific data.
> > >
> > > BTW, I have a feeling that "samsung" is a bit longish prefix for =
the
> bindings.
> > > Didn't you initially consider "sec" for instance ? Probably it is
> already
> > > too late for changing that though.
> >
> > I had not thought of "sec". I agree that "sec" would have been bett=
er
> > as it is shorter and represents bindings specific to Samsung
> > Electronics. But it is not intuitive at the same time. If there is
> > greater consensus on using "sec", we could try and request for a
> > change but looks difficult to get through.
>=20
> Don't bother.  'samsung,' is fine.
>=20
Same here :)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [RFC 0/2] clk: samsung: add composite clocks
Date: Mon, 20 May 2013 20:54:48 +0200
Message-ID: <201305202054.48926.heiko@sntech.de>
References: <1369059428-26820-1-git-send-email-rahul.sharma@samsung.com> <201305201614.31103.heiko@sntech.de> <CAPdUM4Nz8LL5xvvEOVBdd7NDSyQ2+FesnYRnBuQVeGK4gRE_yQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:42729 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756068Ab3ETSyy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 May 2013 14:54:54 -0400
In-Reply-To: <CAPdUM4Nz8LL5xvvEOVBdd7NDSyQ2+FesnYRnBuQVeGK4gRE_yQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <r.sh.open@gmail.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, joshi@samsung.com

Am Montag, 20. Mai 2013, 20:19:29 schrieb Rahul Sharma:
> On Mon, May 20, 2013 at 7:44 PM, Heiko St=FCbner <heiko@sntech.de> wr=
ote:
> > Am Montag, 20. Mai 2013, 16:17:06 schrieb Rahul Sharma:
> >> This patch adds support for composite clocks for samsung SoCs.
> >> Many drivers need access to a common clock which support gating
> >> and/or muxing and/or rate control operations. For example hdmi
> >> which needs to switch between parents and call enable/disable for
> >> "sclk_hdmi".
> >>=20
> >> This patch set also adds composite clock for exyno5250 hdmi. Based
> >> on the review comment, I will extended this to other exynos SoCs
> >> clocks files.
> >=20
> > I think I remember reading somewhere that the target of the common =
clock
> > framework was to prevent every SoC from introducing their own speci=
al
> > clock types and instead  create these structures from separate cloc=
ks
> > (mux clk + gate clk) and not to have every SoC create their own cus=
tom
> > clock types.
> >=20
> > The Samsung clock drivers at the moment follow this paradigm of com=
bining
> > the existing "simple" clocks and only introduce new clock types for=
 the
> > pll clocks, that really need special handling.
> >=20
> > So it would probably good to keep it this way and define your clock=
s from
> > their individual components, as all the other Samsung clocks curren=
tly
> > do.
>=20
> Thanks Heiko, I agree, but I am not trying to introduce a new type he=
re,
> instead using the existing generic support for composite clocks for
> exynos as well.
>=20
> These have not been added for Samsung SoCs so far but I do not see an=
y
> harm in using them also. With them, drivers do not need to get and
> configure each clock component separately. This ensures less and more
> reasonable changes in the drivers during migration to CCF.
>=20
> Please help me understand about the loss when using composite clocks.

hehe ... it seems I remembered something outdated ...

The last time (before march 12th) I looked at the ccf, it was "use simp=
le=20
clocktypes". But it seems in the meantime the separate composite-clock =
you use=20
was introduced. And I didn't read your patch careful enough to see that=
 you're=20
using the (now) existing composite clock.

So, sorry for the noise :-)


Heiko

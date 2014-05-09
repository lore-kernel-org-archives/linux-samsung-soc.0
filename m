From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2.1 3/9] ARM: S3C24XX: enable usage of common dclk if common clock framework is enabled
Date: Sat, 10 May 2014 01:33:01 +0200
Message-ID: <3874492.Rok1zBObEC@phil>
References: <2104342.rkElQpXtvM@phil> <1428172.jtv2HGWM9N@phil> <536D60B1.2070906@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:34694 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752172AbaEIX3g convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 May 2014 19:29:36 -0400
In-Reply-To: <536D60B1.2070906@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Paul Bolle <pebolle@tiscali.nl>, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org

Hi Tomasz,

Am Samstag, 10. Mai 2014, 01:11:45 schrieb Tomasz Figa:
> On 10.05.2014 01:07, Heiko St=FCbner wrote:
> > Am Freitag, 9. Mai 2014, 19:53:21 schrieb Tomasz Figa:
> >> On 09.05.2014 18:49, Paul Bolle wrote:
> >>> On Wed, 2014-04-23 at 22:09 +0200, Heiko St=FCbner wrote:
> >>>> Add platform device and select the correct implementation automa=
tically
> >>>> depending on wether the old samsung_clock or the common clock fr=
amework
> >>>> is enabled.
> >>>>=20
> >>>> This is only done for machines already using the old dclk
> >>>> implementation,
> >>>> as everybody else should move to use dt anyway.
> >>>>=20
> >>>> The machine-specific settings for the external clocks will have =
to be
> >>>> set
> >>>> by somebody with knowledge about the specific hardware.
> >>>>=20
> >>>> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> >>>> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> >>>=20
> >>> It seems this one just hit linux-next (in next-20140509).
> >>=20
> >> Which is bad, because:
> >> a) it conflicts with patches already applied in samsung-clk tree,
> >=20
> > I remember seeing patches regarding more than one clk-samsung clock
> > providers. Do you need any additional changes for s3c24xx from me f=
or
> > this?
>=20
> Yes, that's the problem here. If you could do it, I would appreciate =
it,
> but if you don't have time then I can handle this. The changes needed
> are mostly trivial - basically every common samsung_clk function gets
> new argument to a context structure. The branch to base on would be
> for_3.16/exynos5260 in samsung-clk tree.
>=20
> >> b) the DT binding added by patch 4/9 has not been acked .
> >=20
> > I'm not 100% sure if this is necessary, as the binding is similar t=
o most
> > other Samsung bindings and looking through recent clock binding cha=
nges I
> > didn't find any that seemed to have a special dt-maintainer ack -
> > including
> > Exynos ones. Also if I remember correctly there was this "if we don=
't
> > respond, carry on" policy around :-) .
>=20
> Well, for me this could go as is, but rules should be followed and th=
e
> rules are ACK or 3 weeks and a ping without response. So we need to w=
ait
> at least to next Wednesday to bypass DT review.

so I only remembered the abbreviated version of this :-) [without the 3=
 weeks=20
requirement]. My guess is I should be able to adapt it to this change a=
nd also=20
fix the typo Paul found until then.


Heiko

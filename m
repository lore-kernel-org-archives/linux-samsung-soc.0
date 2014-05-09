From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2.1 3/9] ARM: S3C24XX: enable usage of common dclk if common clock framework is enabled
Date: Sat, 10 May 2014 01:07:43 +0200
Message-ID: <1428172.jtv2HGWM9N@phil>
References: <2104342.rkElQpXtvM@phil> <1399654181.19276.2.camel@x220> <536D1611.4010301@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:33694 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752172AbaEIXET convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 May 2014 19:04:19 -0400
In-Reply-To: <536D1611.4010301@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Paul Bolle <pebolle@tiscali.nl>, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org

Am Freitag, 9. Mai 2014, 19:53:21 schrieb Tomasz Figa:
> On 09.05.2014 18:49, Paul Bolle wrote:
> > On Wed, 2014-04-23 at 22:09 +0200, Heiko St=FCbner wrote:
> >> Add platform device and select the correct implementation automati=
cally
> >> depending on wether the old samsung_clock or the common clock fram=
ework
> >> is enabled.
> >>=20
> >> This is only done for machines already using the old dclk implemen=
tation,
> >> as everybody else should move to use dt anyway.
> >>=20
> >> The machine-specific settings for the external clocks will have to=
 be set
> >> by somebody with knowledge about the specific hardware.
> >>=20
> >> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> >> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> >=20
> > It seems this one just hit linux-next (in next-20140509).
>=20
> Which is bad, because:
> a) it conflicts with patches already applied in samsung-clk tree,

I remember seeing patches regarding more than one clk-samsung clock pro=
viders.
Do you need any additional changes for s3c24xx from me for this?


> b) the DT binding added by patch 4/9 has not been acked .

I'm not 100% sure if this is necessary, as the binding is similar to mo=
st=20
other Samsung bindings and looking through recent clock binding changes=
 I=20
didn't find any that seemed to have a special dt-maintainer ack - inclu=
ding=20
Exynos ones. Also if I remember correctly there was this "if we don't r=
espond,=20
carry on" policy around :-) .


Heiko

> Kukjin, might I ask you to drop this series from your tree and let me
> send you a pull request with necessary dependencies and this series
> applied properly to resolve merge conflicts, as I suggested before in
> one of my replies to this thread?
>=20
> Best regards,
> Tomasz

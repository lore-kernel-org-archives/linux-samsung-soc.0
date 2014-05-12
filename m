From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2.1 3/9] ARM: S3C24XX: enable usage of common dclk if common clock framework is enabled
Date: Tue, 13 May 2014 00:57:31 +0200
Message-ID: <233328610.kl5NEOjUm6@phil>
References: <2104342.rkElQpXtvM@phil> <3874492.Rok1zBObEC@phil> <53714F9D.3010109@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:48631 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758488AbaELWx6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 May 2014 18:53:58 -0400
In-Reply-To: <53714F9D.3010109@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: Paul Bolle <pebolle@tiscali.nl>, mturquette@linaro.org, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Kukjin,

Am Dienstag, 13. Mai 2014, 07:47:57 schrieb Kukjin Kim:
> On 05/10/14 08:33, Heiko St=FCbner wrote:
> > Hi Tomasz,
> >=20
> >>>>> It seems this one just hit linux-next (in next-20140509).
> >>>>=20
> >>>> Which is bad, because:
> >>>> a) it conflicts with patches already applied in samsung-clk tree=
,
> >>>=20
> >>> I remember seeing patches regarding more than one clk-samsung clo=
ck
> >>> providers. Do you need any additional changes for s3c24xx from me=
 for
> >>> this?
> >>=20
> >> Yes, that's the problem here. If you could do it, I would apprecia=
te it,
> >> but if you don't have time then I can handle this. The changes nee=
ded
> >> are mostly trivial - basically every common samsung_clk function g=
ets
> >> new argument to a context structure. The branch to base on would b=
e
> >> for_3.16/exynos5260 in samsung-clk tree.
>=20
> I think, would be better if we could fix the conflicts with Hekio's
> additional patches...basically nobody wants revert something for next
> tree once it is landed. But in this case, it's up to Tomasz...
>=20
> Probably, Heiko resubmitted? Is it based on the branch Tomasz memtion=
ed,
> I didn't check it yet?..
>=20
> Tomasz, do you still want me to drop this series in samsung tree now?
> Additional patches would be helpful to me because other dependency i.=
e.,
> exynos5260...for me.

I submitted a v3 series yesterday, that is based on Tomasz' branch. Thi=
s=20
prevents build errors from happening. I'll let you two decide how you w=
ant to=20
handle this :-)

I can also produce fixup patches if you two decide to keep the v2 serie=
s and=20
just fix the conflicts.


Heiko

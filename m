From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 2/7] regulator: dt-bindings: Document the ena-gpios
 property
Date: Fri, 28 Nov 2014 12:54:27 +0100
Message-ID: <1417175667.18249.26.camel@AMDC1943>
References: <1417087253-12306-1-git-send-email-k.kozlowski@samsung.com>
 <1417087253-12306-3-git-send-email-k.kozlowski@samsung.com>
 <20141127183058.GB7712@sirena.org.uk> <1417165784.18249.15.camel@AMDC1943>
 <20141128112116.GG7712@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20141128112116.GG7712-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On pi=C4=85, 2014-11-28 at 11:21 +0000, Mark Brown wrote:
> On Fri, Nov 28, 2014 at 10:09:44AM +0100, Krzysztof Kozlowski wrote:
>=20
> > I understand your concerns here however I didn't want to overengine=
er
> > this. Is the same GPIO (on more complex PMICs) used in different
> > contexts? Like enable control and something more in the same time?
>=20
> Yes, and it's often reprogrammable at runtime.

I have doubts if generalized code could support such configuration...

>=20
> > Something like:
> >  struct regulator_desc desc {
> >  	.name		=3D "LDO1
> >  	.of_match	=3D of_match_ptr("LDO1"),
> >  	.regulators_node =3D of_match_ptr("voltage-regulators"),
> >  	.ops		=3D &max77686_ldo_ops,
> > +	.of_ena_gpio	=3D of_match_ptr("ena-gpios"),
> >  ...
> >  }
>=20
> Yes, and note that this also means existing bindings can use the core
> code.

Thanks for idea,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/3] dt-bindings: regulator/mfd: Reorganize S2MPA01
 bindings
Date: Mon, 11 Jan 2016 07:56:49 +0000
Message-ID: <20160111075649.GO3331@x1>
References: <1449191405-3344-1-git-send-email-k.kozlowski@samsung.com>
 <1449191405-3344-4-git-send-email-k.kozlowski@samsung.com>
 <20151204121153.GZ26072@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151204121153.GZ26072@sirena.org.uk>
Sender: linux-clk-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 04 Dec 2015, Mark Brown wrote:

> On Fri, Dec 04, 2015 at 10:10:05AM +0900, Krzysztof Kozlowski wrote:
> > The mfd/s2mpa01.txt duplicates some of the information about bindin=
gs
> > with old mfd/s2mps11.txt. Now common part exists entirely in
> > mfd/samsung,sec-core.txt so:
>=20
> Acked-by: Mark Brown <broonie@kernel.org>
>=20
> >  - add company prefix to file name (regulator/samsung,s2mpa01.txt),
>=20
> I'm not 100% convinced about these prefixes BTW, the duplication isn'=
t
> usually an issue within a subsystem.  They don't do any harm either
> though.

I think they're ugly and would prefer not to accept them, but lots of
people are submitting them now and I can't be bothered to fight it, so
meh!

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

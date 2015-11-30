From: "Mutharaju, Prasanna (P.)" <mkarthi3@visteon.com>
Subject: Re: [PATCH v3] clk: s3c2410: removed unneeded variable in
 s3c24xx_clkout_set_parent
Date: Mon, 30 Nov 2015 09:55:27 +0000
Message-ID: <20151130095403.GA28879@jci-VirtualBox>
References: <20151130075219.GA27737@jci-VirtualBox>
 <20151130081543.GI10431@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20151130081543.GI10431@pengutronix.de>
Content-Language: en-US
Content-ID: <E546374F796C064E9DE2C671EDF431A7@eurprd06.prod.outlook.com>
Sender: linux-clk-owner@vger.kernel.org
To: =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Nov 30, 2015 at 09:15:43AM +0100, Uwe Kleine-K=F6nig wrote:
> On Mon, Nov 30, 2015 at 07:52:22AM +0000, Mutharaju, Prasanna (P.) wr=
ote:
> > From: Prasanna Karthik <mkarthi3@visteon.com>
> >=20
> > Remove unneeded variable used to store return value.
> > ---
> > v3: Modified subject and changelog comments
> > ---
> >=20
> > Signed-off-by: Prasanna Karthik <mkarthi3@visteon.com>
>=20
> Everything after the first triple-dash doesn't make it into the git
> history, so you are expected to write the S-o-b line above the list o=
f
> things changed since a previous submission.

Thanks, I resent the patch again with S-o-b before changelog.=20
>=20
> Other than that the patch looks fine.
>=20
> Uwe
>=20
> --=20
> Pengutronix e.K.                           | Uwe Kleine-K=F6nig      =
      |
> Industrial Linux Solutions                 | http://www.pengutronix.d=
e/  |
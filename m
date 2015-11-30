From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3] clk: s3c2410: removed unneeded variable in
 s3c24xx_clkout_set_parent
Date: Mon, 30 Nov 2015 09:15:43 +0100
Message-ID: <20151130081543.GI10431@pengutronix.de>
References: <20151130075219.GA27737@jci-VirtualBox>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151130075219.GA27737@jci-VirtualBox>
Sender: linux-clk-owner@vger.kernel.org
To: "Mutharaju, Prasanna (P.)" <mkarthi3@visteon.com>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Nov 30, 2015 at 07:52:22AM +0000, Mutharaju, Prasanna (P.) wrot=
e:
> From: Prasanna Karthik <mkarthi3@visteon.com>
>=20
> Remove unneeded variable used to store return value.
> ---
> v3: Modified subject and changelog comments
> ---
>=20
> Signed-off-by: Prasanna Karthik <mkarthi3@visteon.com>

Everything after the first triple-dash doesn't make it into the git
history, so you are expected to write the S-o-b line above the list of
things changed since a previous submission.

Other than that the patch looks fine.

Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |

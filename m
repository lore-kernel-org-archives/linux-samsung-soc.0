From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 1/2] clk: samsung: Change signature of exynos5_subcmus_init() function
Date: Thu, 08 Aug 2019 13:23:20 -0700
Message-ID: <20190808202320.E469D2173C@mail.kernel.org>
References: <CGME20190808144936eucas1p2e65eddc3d970de35590cb84fe200b438@eucas1p2.samsung.com> <20190808144929.18685-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190808144929.18685-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com
Cc: linux@armlinux.org.uk, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, krzk@kernel.org, cw00.choi@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Sylwester Nawrocki (2019-08-08 07:49:28)
> In order to make it easier in subsequent patch to create different subcmu
> lists for exynos5420 and exynos5800 SoCs the code is rewritten so we pass
> an array of pointers to the subcmus initialization function.
>=20
> Fixes: b06a532bf1fa ("clk: samsung: Add Exynos5 sub-CMU clock driver")
> Tested-by: Jaafar Ali <jaafarkhalaf@gmail.com>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---

Applied to clk-fixes

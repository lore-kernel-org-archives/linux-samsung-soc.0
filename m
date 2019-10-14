From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: clk: samsung: Checking a kmemdup() call in
 _samsung_clk_register_pll()
Date: Mon, 14 Oct 2019 10:05:09 +0200
Message-ID: <ecfa721b-4176-71cb-85de-2aefe0b3d30a@web.de>
References: <CGME20191012141739epcas3p31e41c151b30d49c94aeb933aa42dc9f7@epcas3p3.samsung.com>
 <c1bc5e4d-0802-4485-2c07-248bab2a3330@web.de>
 <725ace30-a4a7-25dd-2351-f007bb8b35ed@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <725ace30-a4a7-25dd-2351-f007bb8b35ed@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/clk/samsung/clk-pll.c?id=3D1c0cc5f1ae5ee5a6913704c0d75a6e99604ee3=
0a#n1275
>> https://protect2.fireeye.com/url?k=3D7e77b0ebee9a0c3e.7e763ba4-43f341fd=
fe1d32b1&u=3Dhttps://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/clk/=
samsung/clk-pll.c#L1275
=E2=80=A6
> drivers/clk/samsung/clk-pll.c considers the case of 'pll->rate_table is =
NULL'
> So, maybe just show the warning message if failed to allocate memory
> of 'pll->rate_table'.

How do you think about to recheck information sources around
the Linux allocation failure report?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?id=3Dda94001239cceb93c132a31928d6ddc4=
214862d5#n878


> Bu, IMHO, the error handling is necessary in order to support
> what 'pll_clk->rate_table' isn't NULL.

Can an other error handling strategy make sense at this place?

Regards,
Markus

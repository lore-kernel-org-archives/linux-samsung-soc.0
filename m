From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: samsung: s3c2443: Mark expected switch fall-through
Date: Thu, 21 Feb 2019 13:44:02 -0800
Message-ID: <155078544270.77512.5446420781034016673@swboyd.mtv.corp.google.com>
References: <20190211181531.GA3238@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190211181531.GA3238@embeddedor>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kees Cook <keescook@chromium.org>
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Gustavo A. R. Silva (2019-02-11 10:15:31)
> In preparation to enabling -Wimplicit-fallthrough, mark switch
> cases where we are expecting to fall through.
>=20
> This patch fixes the following warnings:
>=20
> drivers/clk/samsung/clk-s3c2443.c: In function =E2=80=98s3c2443_common_cl=
k_init=E2=80=99:
> drivers/clk/samsung/clk-s3c2443.c:390:3: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
>    samsung_clk_register_alias(ctx, s3c2450_aliases,
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      ARRAY_SIZE(s3c2450_aliases));
>      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/clk/samsung/clk-s3c2443.c:393:2: note: here
>   case S3C2416:
>   ^~~~
>=20
> Warning level 3 was used: -Wimplicit-fallthrough=3D3
>=20
> Notice that, in this particular case,  the code comment is modified
> in accordance with what GCC is expecting to find.
>=20
> This patch is part of the ongoing efforts to enable
> -Wimplicit-fallthrough.
>=20
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---

Applied to clk-next

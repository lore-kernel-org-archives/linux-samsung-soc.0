From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] clk: samsung: s3c2443: Mark expected switch fall-through
Date: Tue, 12 Feb 2019 08:40:45 +0100
Message-ID: <CAJKOXPeHp7sKkZ+jXmTXk5GEF_7G5ujfm3Lw==G3T4thfD+F7Q@mail.gmail.com>
References: <20190211181531.GA3238@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190211181531.GA3238@embeddedor>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 11 Feb 2019 at 19:40, Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
> In preparation to enabling -Wimplicit-fallthrough, mark switch
> cases where we are expecting to fall through.
>
> This patch fixes the following warnings:
>
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
>
> Warning level 3 was used: -Wimplicit-fallthrough=3D3
>
> Notice that, in this particular case,  the code comment is modified
> in accordance with what GCC is expecting to find.
>
> This patch is part of the ongoing efforts to enable
> -Wimplicit-fallthrough.

I saw this in multiple places already and I think fix is wrong. The
point is that the code is correct - the fall through is marked
properly.

It is just the GCC which has to be fixed not the code. You want to
adjust the code for specific version of GCC and what if GCC changes
its warning? For example GCC might require "fall through: "... or any
other syntax. Another point - what about clang's syntax?

Best regards,
Krzysztof

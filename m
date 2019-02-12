From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] clk: samsung: s3c2443: Mark expected switch fall-through
Date: Tue, 12 Feb 2019 10:57:05 -0800
Message-ID: <CAGXu5jLMWrb4Dszv5YSyoGt5Lb3S1oE8EnKsTou7=7Nq1rEEVQ@mail.gmail.com>
References: <20190211181531.GA3238@embeddedor> <CAJKOXPeHp7sKkZ+jXmTXk5GEF_7G5ujfm3Lw==G3T4thfD+F7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPeHp7sKkZ+jXmTXk5GEF_7G5ujfm3Lw==G3T4thfD+F7Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Feb 11, 2019 at 11:41 PM Krzysztof Kozlowski <krzk@kernel.org> wrot=
e:
>
> On Mon, 11 Feb 2019 at 19:40, Gustavo A. R. Silva
> <gustavo@embeddedor.com> wrote:
> >
> > In preparation to enabling -Wimplicit-fallthrough, mark switch
> > cases where we are expecting to fall through.
> >
> > This patch fixes the following warnings:
> >
> > drivers/clk/samsung/clk-s3c2443.c: In function =E2=80=98s3c2443_common_=
clk_init=E2=80=99:
> > drivers/clk/samsung/clk-s3c2443.c:390:3: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
> >    samsung_clk_register_alias(ctx, s3c2450_aliases,
> >    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >      ARRAY_SIZE(s3c2450_aliases));
> >      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/clk/samsung/clk-s3c2443.c:393:2: note: here
> >   case S3C2416:
> >   ^~~~
> >
> > Warning level 3 was used: -Wimplicit-fallthrough=3D3
> >
> > Notice that, in this particular case,  the code comment is modified
> > in accordance with what GCC is expecting to find.
> >
> > This patch is part of the ongoing efforts to enable
> > -Wimplicit-fallthrough.
>
> I saw this in multiple places already and I think fix is wrong. The
> point is that the code is correct - the fall through is marked
> properly.
>
> It is just the GCC which has to be fixed not the code. You want to
> adjust the code for specific version of GCC and what if GCC changes
> its warning? For example GCC might require "fall through: "... or any
> other syntax. Another point - what about clang's syntax?

-Wimplicit-fallthrough=3D3 is stricter and maps to -Wextra, hence its
choice. GCC's levels were chosen based on the existing linters, static
analyzers, etc. The patterns are unlikely to change (see the gcc
man-page).

Clang doesn't recognize anything in C mode (hopefully this will be
fixed in the future[1]).

As long as one of the compilers is able to check this, we'll avoid the
bugs associated with this mis-pattern. Gustavo's efforts here have
found kind of a lot of bugs, so I think it's worth a little churn to
add these (and make minor adjustments to existing comments).

[1] https://bugs.llvm.org/show_bug.cgi?id=3D37135

--=20
Kees Cook

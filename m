From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] clk: samsung: s3c2443: Mark expected switch fall-through
Date: Wed, 20 Feb 2019 14:26:06 -0800
Message-ID: <CAGXu5jJPfoYy20WrR5ghaSo88bsA75s-OyA4qt_3Vz0cJST_MQ@mail.gmail.com>
References: <20190211181531.GA3238@embeddedor> <CAJKOXPeHp7sKkZ+jXmTXk5GEF_7G5ujfm3Lw==G3T4thfD+F7Q@mail.gmail.com>
 <CAGXu5jLMWrb4Dszv5YSyoGt5Lb3S1oE8EnKsTou7=7Nq1rEEVQ@mail.gmail.com> <155027728836.115909.11546859472583324712@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <155027728836.115909.11546859472583324712@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Feb 15, 2019 at 4:34 PM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Kees Cook (2019-02-12 10:57:05)
> > On Mon, Feb 11, 2019 at 11:41 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >
> > > It is just the GCC which has to be fixed not the code. You want to
> > > adjust the code for specific version of GCC and what if GCC changes
> > > its warning? For example GCC might require "fall through: "... or any
> > > other syntax. Another point - what about clang's syntax?
> >
> > -Wimplicit-fallthrough=3 is stricter and maps to -Wextra, hence its
> > choice. GCC's levels were chosen based on the existing linters, static
> > analyzers, etc. The patterns are unlikely to change (see the gcc
> > man-page).
> >
> > Clang doesn't recognize anything in C mode (hopefully this will be
> > fixed in the future[1]).
> >
> > As long as one of the compilers is able to check this, we'll avoid the
> > bugs associated with this mis-pattern. Gustavo's efforts here have
> > found kind of a lot of bugs, so I think it's worth a little churn to
> > add these (and make minor adjustments to existing comments).
>
> Just curious, what compilation phase does this check run in? Could we
> gain a macro like FALLTHRU or even lowercase 'fallthru' that expanded to
> whatever the compiler wants to see and then there would only be "one
> way" to do this?  It would alleviate the above concerns, but maybe I'm
> rehashing something that's already been proposed and rejected.

When this got discussed a while back, the thinking was that since
we're also dealing with static analyzers (e.g. Coverity) and IDEs that
literally parse comments in the code, it was most sensible (at least
for now, prior to there being a formal C "fall through" statement --
there is for C++ but not yet for C), we'd stick to explicit comments.
In theory, we will be able to do a tree-wide change to add the C
statement once it exists.

> Of course, I'm happy to merge any of these patches that tweak things so
> no worries either way.

Thanks! :)

-- 
Kees Cook

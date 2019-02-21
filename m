From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] clk: samsung: s3c2443: Mark expected switch fall-through
Date: Thu, 21 Feb 2019 14:23:18 -0800
Message-ID: <CAGXu5j+_bm+usH+hK9Pz1hAS9qhmndhmt9Ue3T3Kdta3kk1LHg@mail.gmail.com>
References: <20190211181531.GA3238@embeddedor> <CAJKOXPeHp7sKkZ+jXmTXk5GEF_7G5ujfm3Lw==G3T4thfD+F7Q@mail.gmail.com>
 <CAGXu5jLMWrb4Dszv5YSyoGt5Lb3S1oE8EnKsTou7=7Nq1rEEVQ@mail.gmail.com>
 <155027728836.115909.11546859472583324712@swboyd.mtv.corp.google.com>
 <CAGXu5jJPfoYy20WrR5ghaSo88bsA75s-OyA4qt_3Vz0cJST_MQ@mail.gmail.com> <155078541292.77512.12594007340364187685@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <155078541292.77512.12594007340364187685@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Feb 21, 2019 at 1:43 PM Stephen Boyd <sboyd@kernel.org> wrote:
> Ok, thanks for the background. Looks like the perf tool already
> introduced the #define __fallthrough that they use for this purpose.
> Maybe they're hoping that it will be formalized.

Yeah, GCC has an extension for it (but it's not yet part of the C
standard -- though there are open bugs against Clang to support it).
Our adoption of the markings, thanks to Gustavo's work, has rapidly
increased lately too (we started with something like 2400 instances
and we were gaining about as many each cycle as we removed). 5.1,
though, is closing in on _0_ instances. My thinking is that once we're
to the point where we can globally enable -Wimplicit-fallthrough, then
we can depend on the compiler to enforce this (instead continuing to
depend on external tracking in Coverity and the like). It was a bit of
a chicken-and-egg and I was afraid we were going to be left with this
"partial adoption" for a long time. But we're nearly to the point
where I would be happy doing a tree-wide replacement to __fallthrough
(which should be mechanically easy).

-- 
Kees Cook

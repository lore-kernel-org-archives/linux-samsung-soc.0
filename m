From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: samsung: s3c2443: Mark expected switch fall-through
Date: Fri, 15 Feb 2019 16:34:48 -0800
Message-ID: <155027728836.115909.11546859472583324712@swboyd.mtv.corp.google.com>
References: <20190211181531.GA3238@embeddedor>
 <CAJKOXPeHp7sKkZ+jXmTXk5GEF_7G5ujfm3Lw==G3T4thfD+F7Q@mail.gmail.com>
 <CAGXu5jLMWrb4Dszv5YSyoGt5Lb3S1oE8EnKsTou7=7Nq1rEEVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAGXu5jLMWrb4Dszv5YSyoGt5Lb3S1oE8EnKsTou7=7Nq1rEEVQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kees Cook <keescook@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Michael Turquette <mturquette@baylibre.com>, Tomasz Figa <tomasz.figa@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-clk@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Kees Cook (2019-02-12 10:57:05)
> On Mon, Feb 11, 2019 at 11:41 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > It is just the GCC which has to be fixed not the code. You want to
> > adjust the code for specific version of GCC and what if GCC changes
> > its warning? For example GCC might require "fall through: "... or any
> > other syntax. Another point - what about clang's syntax?
> 
> -Wimplicit-fallthrough=3 is stricter and maps to -Wextra, hence its
> choice. GCC's levels were chosen based on the existing linters, static
> analyzers, etc. The patterns are unlikely to change (see the gcc
> man-page).
> 
> Clang doesn't recognize anything in C mode (hopefully this will be
> fixed in the future[1]).
> 
> As long as one of the compilers is able to check this, we'll avoid the
> bugs associated with this mis-pattern. Gustavo's efforts here have
> found kind of a lot of bugs, so I think it's worth a little churn to
> add these (and make minor adjustments to existing comments).

Just curious, what compilation phase does this check run in? Could we
gain a macro like FALLTHRU or even lowercase 'fallthru' that expanded to
whatever the compiler wants to see and then there would only be "one
way" to do this?  It would alleviate the above concerns, but maybe I'm
rehashing something that's already been proposed and rejected.

Of course, I'm happy to merge any of these patches that tweak things so
no worries either way.

From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 06/10] clk: samsung make clk-exynos-audss explicitly
 non-modular
Date: Tue, 5 Jul 2016 09:17:37 -0400
Message-ID: <20160705131737.GB26134@windriver.com>
References: <20160704211220.5685-1-paul.gortmaker@windriver.com>
 <20160704211220.5685-7-paul.gortmaker@windriver.com>
 <CAMuHMdX_KDxOttbuG3=RrQU5Tbp4CuNmdofOtGvOXCtr1wxyag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdX_KDxOttbuG3=RrQU5Tbp4CuNmdofOtGvOXCtr1wxyag@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Padmavathi Venna <padma.v@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

[Re: [PATCH 06/10] clk: samsung make clk-exynos-audss explicitly non-modular] On 05/07/2016 (Tue 13:02) Geert Uytterhoeven wrote:

> Hi Paul,
> 
> On Mon, Jul 4, 2016 at 11:12 PM, Paul Gortmaker
> <paul.gortmaker@windriver.com> wrote:
> > We also delete the MODULE_LICENSE tags etc. since all that information
> > is already contained at the top of the file in the comments.
> 
> But the unstructured information at the top of the file is much more difficult
> to grep for...

...which IMHO is largely a moot point, since the MODULE_<xyz> tags
aren't universally deployed and largely don't exist at all once you are
outside of the driver space.

Paul.
--

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: samsung: s3c: Mark expected switch fall-through
Date: Thu, 05 Apr 2018 13:24:31 -0700
Message-ID: <152295987121.91052.16578276622043986934@swboyd.mtv.corp.google.com>
References: <20180404010931.GA30291@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180404010931.GA30291@embeddedor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Gustavo A. R. Silva (2018-04-03 18:09:31)
> In preparation to enabling -Wimplicit-fallthrough, mark switch cases
> where we are expecting to fall through.
> 
> Notice that in this particular case I replaced the comma wiht a dash,

s/wiht/with/

> which is what GCC is expecting to find when there are other comments
> in the same line in which "fall through" appears.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
> This code was compiled with GCC 7.3.0

What's the GCC warning? Please include in the commit text.

Also what's the implicit-fallthrough level you're using? 3? Can you file
a bug so GCC can update their regex to accept a comma in addition to
whitespace characters?

And maybe we can change the level to 2 or 1 in the kernel's makefile so
we don't need to patch comments for this.

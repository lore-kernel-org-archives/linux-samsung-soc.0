From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 06/10] clk: samsung make clk-exynos-audss explicitly non-modular
Date: Tue, 5 Jul 2016 13:02:06 +0200
Message-ID: <CAMuHMdX_KDxOttbuG3=RrQU5Tbp4CuNmdofOtGvOXCtr1wxyag@mail.gmail.com>
References: <20160704211220.5685-1-paul.gortmaker@windriver.com> <20160704211220.5685-7-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:33711 "EHLO
	mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751427AbcGELCH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2016 07:02:07 -0400
In-Reply-To: <20160704211220.5685-7-paul.gortmaker@windriver.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Padmavathi Venna <padma.v@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>

Hi Paul,

On Mon, Jul 4, 2016 at 11:12 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> We also delete the MODULE_LICENSE tags etc. since all that information
> is already contained at the top of the file in the comments.

But the unstructured information at the top of the file is much more difficult
to grep for...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

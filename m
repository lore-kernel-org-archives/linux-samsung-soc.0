From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 1/2] clk: samsung: exynos5: Fix possible NULL pointer
 exception on platform_device_alloc() failure
Date: Thu, 21 Feb 2019 16:43:53 +0100
Message-ID: <CAMuHMdUcn4LtMnE75XzF+p2G8ivTxKPMp_gT6ozx0iwtQFS+Hw@mail.gmail.com>
References: <1550749552-8133-1-git-send-email-krzk@kernel.org> <1550749552-8133-2-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1550749552-8133-2-git-send-email-krzk@kernel.org>
Sender: stable-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Feb 21, 2019 at 12:47 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> During initialization of subdevices if platform_device_alloc() failed,
> returned NULL pointer will be later dereferenced.  Add proper error
> paths to exynos5_clk_register_subcmu().  The return value of this
> function is still ignored because at this stage of init there is nothing
> we can do.
>
> Fixes: b06a532bf1fa ("clk: samsung: Add Exynos5 sub-CMU clock driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

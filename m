From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v3 0/2] mark spi clocks as critical and enable spi3 clocks
Date: Mon, 4 Jul 2016 12:59:54 +0900
Message-ID: <CA+Ln22HuCdDr=g06ynK7mqjDfUVrQgG-NRkfTP_zE6h-wZk6Gw@mail.gmail.com>
References: <1467270911-10971-1-git-send-email-andi.shyti@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1467270911-10971-1-git-send-email-andi.shyti@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Andi Shyti <andi@etezian.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andi,

2016-06-30 16:15 GMT+09:00 Andi Shyti <andi.shyti@samsung.com>:
> Hi,
>
> This patchset enables spi3 clocks by marking critical clocks as
> CLK_IS_CRITICAL and in the meantime replaces the use of
> CLK_IGNORE_UNUSED for spi1 clocks.
>
> The sclk needs to be considered critical as well.
>
> The SPI3 in the tm2/tm2e boards will control an irled for remote
> controlling.
>
> Changelog:
>
> V1 -> V2
>  - the "sclk_spi3" doesn't need to be enabled in boot time as it
>   is handled by the spi driver itself.
>
>  - use the CLK_IS_CRITICAL flag for the ioclk
>
> V2 -> V3
>  - some more tests has confirmed taht "sclk_spi1,3" need to be
>    enabled as critical!

This sounds like a DTS and/or SPI and/or clock driver bug then. I'm
pretty much convinced that it might also cause other problems and this
workaround will only mask them making things even more difficult to
debug in the future. Let's not introduce more technical debt.

Best regards,
Tomasz

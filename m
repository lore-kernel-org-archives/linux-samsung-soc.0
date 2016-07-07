From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v4 0/2] mark spi clocks as critical and enable spi3 clocks
Date: Thu, 07 Jul 2016 17:26:13 +0200
Message-ID: <577E7495.2010904@samsung.com>
References: <1467893637-12573-1-git-send-email-andi.shyti@samsung.com>
 <577E56A6.6010301@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <577E56A6.6010301@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andi Shyti <andi@etezian.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 07/07/2016 03:18 PM, Sylwester Nawrocki wrote:
> On 07/07/2016 02:13 PM, Andi Shyti wrote:
>> > Andi Shyti (2):
>> >   clk: exynos5433: do not use CLK_IGNORE_UNUSED for SPI clocks
>> >   clk: exynos5433: enable sclk_ioclk for SPI3
>
> Applied both patches, thanks.

Apologies for the confusion, I had to drop these patches for reasons
explained in the other thread. We just need to simply drop
CLK_IGNORE_UNUSED flags and get the driver controlling clocks which
belong to the peripheral IP block.


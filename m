From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] clk: samsung: exynos5433: use clock_ignore_unused flag
 for SPI3 related clocks
Date: Sat, 18 Jun 2016 23:31:23 +0900
Message-ID: <CA+Ln22F9eskcpnFkrnVFc3dJqCJcJ5O-STfXC-8Om5MK-THwNg@mail.gmail.com>
References: <1466151362-2881-1-git-send-email-andi.shyti@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1466151362-2881-1-git-send-email-andi.shyti@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Andi Shyti <andi@etezian.org>, Jaehoon Chung <jh80.chung@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andi, Jaehoon,

2016-06-17 17:16 GMT+09:00 Andi Shyti <andi.shyti@samsung.com>:
> From: Jaehoon Chung <jh80.chung@samsung.com>
>
> The SPI 3 bus uses two clocks, a bus clock and an input clock.
> Do not disable the clocks when unused in order to allow access to
> the SPI 3 device.

If unused, why would access to SPI 3 device needed?

Best regards,
Tomasz

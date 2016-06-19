From: Andi Shyti <andi@etezian.org>
Subject: Re: [PATCH] clk: samsung: exynos5433: use clock_ignore_unused flag
 for SPI3 related clocks
Date: Sun, 19 Jun 2016 14:59:21 +0900
Message-ID: <20160619055921.GA424@jack.zhora.eu>
References: <1466151362-2881-1-git-send-email-andi.shyti@samsung.com>
 <CA+Ln22F9eskcpnFkrnVFc3dJqCJcJ5O-STfXC-8Om5MK-THwNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+Ln22F9eskcpnFkrnVFc3dJqCJcJ5O-STfXC-8Om5MK-THwNg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Andi Shyti <andi.shyti@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Andi Shyti <andi@etezian.org>, Jaehoon Chung <jh80.chung@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tomasz,

> > The SPI 3 bus uses two clocks, a bus clock and an input clock.
> > Do not disable the clocks when unused in order to allow access to
> > the SPI 3 device.
> 
> If unused, why would access to SPI 3 device needed?

because next I will submit a small driver which uses the SPI3.
Actually in the exynos5433 boards all the SPI are used but not all
the drivers are ported to mainline.

Thanks,
Andi

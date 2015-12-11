From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] clk: samsung: exynos542x: fix MFC clock hierarchy parent
Date: Fri, 11 Dec 2015 15:09:37 +0900
Message-ID: <CA+Ln22GSYtgsNiho-vVZMvnPCWHcn1HUJzxXA9pU-tJC2Q_xaQ@mail.gmail.com>
References: <1449581372-29378-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449581372-29378-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Mike Turquette <mturquette@baylibre.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

2015-12-08 22:29 GMT+09:00 Marek Szyprowski <m.szyprowski@samsung.com>:
> Proper source for MFC block is mout_user_aclk333 (in datasheet named
> USER_MUX_ACLK_333), not the output of CLKDIV_ACLK_333 MUX.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5420.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Acked-by: Tomasz Figa <tomasz.figa@gmail.com>

Best regards,
Tomasz

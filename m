From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: samsung: Remove unused mout_user_aclk400_mcuisp_p4x12
 variable
Date: Thu, 26 Jul 2018 08:17:03 -0700
Message-ID: <153261822377.48062.13389862802943338719@swboyd.mtv.corp.google.com>
References: <20180718195620.5331-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180718195620.5331-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Krzysztof Kozlowski (2018-07-18 12:56:20)
> Remove unused 'mout_user_aclk400_mcuisp_p4x12' variable to fix GCC warnin=
g:
> =

>     drivers/clk/samsung/clk-exynos4412-isp.c:40:27: warning:
>         'mout_user_aclk400_mcuisp_p4x12' defined but not used [-Wunused-c=
onst-variable=3D]
> =

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Applied to clk-next

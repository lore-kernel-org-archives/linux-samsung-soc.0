From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 05/61] clk: samsung: simplify getting .drvdata
Date: Tue, 15 May 2018 14:05:44 -0700
Message-ID: <152641834430.237094.6970165334408131900@swboyd.mtv.corp.google.com>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-6-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180419140641.27926-6-wsa+renesas@sang-engineering.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Wolfram Sang (2018-04-19 07:05:35)
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> =

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Applied to clk-next

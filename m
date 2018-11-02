From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 3/8] clk: clk-s3c2410-dclk: clean up clkdev lookup leak
Date: Fri, 2 Nov 2018 09:19:10 +0100
Message-ID: <CAJKOXPeM18c3a2nWeGGGw+Fn-GQ2C0ridwE3eqRsd1gVQ6zB5w@mail.gmail.com>
References: <cover.1541054985.git.matti.vaittinen@fi.rohmeurope.com> <8e396e22b328f35538a01193797fbd0d001f885d.1541054985.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8e396e22b328f35538a01193797fbd0d001f885d.1541054985.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: matti.vaittinen@fi.rohmeurope.com
Cc: corbet@lwn.net, mturquette@baylibre.com, sboyd@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, linux@armlinux.org.uk, andy.gross@linaro.org, david.brown@linaro.org, kgene@kernel.org, s.nawrocki@samsung.com, Tomasz Figa <tomasz.figa@gmail.com>, andrew.smirnov@gmail.com, sre@kernel.org, linux@roeck-us.net, robh@kernel.org, sjhuang@iluvatar.ai, Akshu.Agrawal@amd.com, rafael.j.wysocki@intel.com, djkurtz@chromium.org, mazziesaccount@gmail.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 1 Nov 2018 at 08:19, Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
>
> Use devm variant of clkdev lookup registration in order to avoid
> clkdev lookup leak at device remove.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  drivers/clk/samsung/clk-s3c2410-dclk.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

Driver has suppress_bind_attrs and it cannot be built as module so
device removal should not be possible. There is no need to use devm.

Best regards,
Krzysztof

From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 07/22] ASoC: samsung: i2s: Move clk supplier data to
 common driver data structure
Date: Mon, 11 Feb 2019 14:41:44 +0100
Message-ID: <CAJKOXPcutYaBEvRE8JwnnjG7_UB81y8dgSBiKmwCazERWkmBYA@mail.gmail.com>
References: <CGME20190207170109epcas1p20929934c01ae67a05cd6a56f13ed8486@epcas1p2.samsung.com>
 <20190207170028.720-1-s.nawrocki@samsung.com> <20190207170028.720-8-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207170028.720-8-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 7 Feb 2019 at 18:01, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> Having the clocks provider data in struct samsung_i2s_priv, i.e. per the I2S
> controller instance, rather than per CPU DAI better models the hardware and
> simplifies the code a little. The clock provider is common for both DAIs.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/i2s.c | 68 ++++++++++++++++++++---------------------
>  1 file changed, 33 insertions(+), 35 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

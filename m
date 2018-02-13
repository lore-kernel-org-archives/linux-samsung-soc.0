From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 6/7] ASoC: samsung: Add support for HDMI audio on TM2 board
Date: Tue, 13 Feb 2018 08:27:09 +0100
Message-ID: <CAJKOXPfMKH2d+c2tg2GZUAQGs7K=NUoQvh2yzFB=P80d4AUv_A@mail.gmail.com>
References: <CGME20180212161705epcas1p379d012575d9ffb52d8ec7c4d49d79102@epcas1p3.samsung.com>
 <20180212161538.22669-1-s.nawrocki@samsung.com> <20180212161538.22669-7-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180212161538.22669-7-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, jcsing.lee@samsung.com, sbkim73@samsung.com, linux-kernel@vger.kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Feb 12, 2018 at 5:15 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> This patch defines I2S1 - HDMI DAI link and implements related
> hw_params callback. The AUD PLL frequency is configured through
> the CLK_SCLK_I2S1 leaf clock, the exynos5433 clock tree
> definitions are updated in a separate patch.
>
> The device tree parsing part is changed is a way it supports older
> DTBs with just a single CPU DAI specified, without the HDMI link.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes since v1:
>  - dropped the AUD PLL frequency adjustments, only 48k, 96k,
>    192k sample rates will be supported.
> ---
>  sound/soc/samsung/tm2_wm5110.c | 152 ++++++++++++++++++++++++++++++++++-------
>  1 file changed, 129 insertions(+), 23 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

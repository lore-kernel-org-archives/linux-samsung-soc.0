From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 10/22] ASoC: samsung: i2s: Move opclk data to common
 driver data structure
Date: Mon, 11 Feb 2019 14:44:46 +0100
Message-ID: <CAJKOXPcZhHyh6Lob8tFMdUdP5mmutA2g2bysF766a9+6ucpEww@mail.gmail.com>
References: <CGME20190207170120epcas1p211e1582a6124d6b7d0e33db6c0017480@epcas1p2.samsung.com>
 <20190207170028.720-1-s.nawrocki@samsung.com> <20190207170028.720-11-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207170028.720-11-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 7 Feb 2019 at 18:01, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> The clock for generating I2S signals is also common for both CPU DAIs
> so move it to the driver's common data structure.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/i2s.c | 70 +++++++++++++++++++----------------------
>  1 file changed, 33 insertions(+), 37 deletions(-)
>

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 19/22] ASoC: samsung: Drop DAI DMA data chan_name assignments
Date: Mon, 11 Feb 2019 15:03:34 +0100
Message-ID: <CAJKOXPf05pfa-9aUGPvGa8Y7dcmPAP8Szcdbs1aUfm2tnfmArw@mail.gmail.com>
References: <CGME20190207170152epcas1p254264a82287a54dc2452f5e73daab13d@epcas1p2.samsung.com>
 <20190207170028.720-1-s.nawrocki@samsung.com> <20190207170028.720-20-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207170028.720-20-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 7 Feb 2019 at 18:01, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> There is now no need to pass DMA channel names through the DAI DMA data,
> custom DMA config of the PCM is now used for this purpose.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/i2s.c         | 4 ----
>  sound/soc/samsung/s3c2412-i2s.c | 2 --
>  sound/soc/samsung/s3c24xx-i2s.c | 2 --
>  3 files changed, 8 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

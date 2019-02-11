From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 03/22] ASoC: samsung: dmaengine: Allow to specify custom
 DMA device
Date: Mon, 11 Feb 2019 14:31:32 +0100
Message-ID: <CAJKOXPf2oAgLp9UrO7p2UHtenHBtmafwfS8wQD=dz-ze7jtTew@mail.gmail.com>
References: <CGME20190207170054epcas1p1e61320d308bc5be30187919f3360f501@epcas1p1.samsung.com>
 <20190207170028.720-1-s.nawrocki@samsung.com> <20190207170028.720-4-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207170028.720-4-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 7 Feb 2019 at 18:00, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> The additional function argument will allow to select proper DMA device
> for requesting DMA channel for the secondary CPU DAI.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/dma.h         | 3 ++-
>  sound/soc/samsung/dmaengine.c   | 4 +++-
>  sound/soc/samsung/i2s.c         | 4 ++--
>  sound/soc/samsung/pcm.c         | 2 +-
>  sound/soc/samsung/s3c2412-i2s.c | 2 +-
>  sound/soc/samsung/s3c24xx-i2s.c | 2 +-
>  sound/soc/samsung/spdif.c       | 2 +-
>  7 files changed, 11 insertions(+), 8 deletions(-)
>

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

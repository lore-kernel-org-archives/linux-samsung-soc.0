From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 18/22] ASoC: samsung: Specify DMA channel names through
 custom DMA config
Date: Mon, 11 Feb 2019 14:58:14 +0100
Message-ID: <CAJKOXPcoFaYJ_M_rDJvpGen6NiQuyO4CbanHtU24LZ5vrTujTQ@mail.gmail.com>
References: <CGME20190207170148epcas2p2e0f4a1e154cb8cd52d257978a669e84c@epcas2p2.samsung.com>
 <20190207170028.720-1-s.nawrocki@samsung.com> <20190207170028.720-19-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207170028.720-19-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 7 Feb 2019 at 18:01, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> This is a part of conversion of Samsung platforms to use the custom DMA
> config for specifying DMA channel names, in addition to passing custom
> DMA device for the secondary CPU DAI's "PCM" component for some variants
> of the I2S controller.
>
> We also don't set the SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME any more
> as setting it wouldn't allow to specify DMA channels through the custom
> DMA config.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/dmaengine.c   | 12 ++++--------
>  sound/soc/samsung/i2s.c         |  2 +-
>  sound/soc/samsung/s3c2412-i2s.c |  2 +-
>  sound/soc/samsung/s3c24xx-i2s.c |  2 +-
>  4 files changed, 7 insertions(+), 11 deletions(-)
>

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

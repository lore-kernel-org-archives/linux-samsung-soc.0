From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 02/22] ASoC: dmaengine: Extend use of chan_names provided
 in custom DMA config
Date: Mon, 11 Feb 2019 14:31:11 +0100
Message-ID: <CAJKOXPfG8=n932bg99iQ2BqvA6rCOPpv1YD+Jajx=NxyN_+Mkw@mail.gmail.com>
References: <CGME20190207170051epcas1p37a1acaef52cffb01af00c8d34dd9b1dd@epcas1p3.samsung.com>
 <20190207170028.720-1-s.nawrocki@samsung.com> <20190207170028.720-3-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207170028.720-3-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 7 Feb 2019 at 18:00, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> There are currently two ways to specify custom DMA channel names:
>  - through the SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME flag and
>    snd_dmaengine_dai_dma_data data structure,
>  - through chan_names field of struct snd_dmaengine_pcm_config.
>
> In order to replace the DAI DMA data method with the custom DMA config
> one on non-DT platforms the dmaengine_pcm_new() function is extended
> to also consider channel names specified in the custom DMA config.
> If both config->chan_names and dma_data->chan_name are provided
> the former will be used.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/soc-generic-dmaengine-pcm.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

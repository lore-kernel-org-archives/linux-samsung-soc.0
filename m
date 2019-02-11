From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 01/22] ASoC: dmaengine: Improve of_node test in dmaengine_pcm_request_chan_of()
Date: Mon, 11 Feb 2019 14:29:49 +0100
Message-ID: <CAJKOXPe5wbmKQ6bKSWL9Mxjfk_PBzQ34J-TtBGKgJe-dJ6dwEg@mail.gmail.com>
References: <CGME20190207170047epcas1p42d7ec4acfd976871c676efa5aecb33bc@epcas1p4.samsung.com>
 <20190207170028.720-1-s.nawrocki@samsung.com> <20190207170028.720-2-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207170028.720-2-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 7 Feb 2019 at 18:00, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> Currently when of_node of the "PCM" device is null
> dmaengine_pcm_request_chan_of() function will bail out, including cases
> when custom DMA device is intended to be used.  To have the channels
> properly requested when custom DMA device is provided extend the of_node
> test to also consider dma_dev->of_node.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/soc-generic-dmaengine-pcm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

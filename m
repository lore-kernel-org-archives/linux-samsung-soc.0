From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 17/22] ASoC: samsung: odroid: Add support for secondary
 CPU DAI
Date: Mon, 11 Feb 2019 16:34:42 +0100
Message-ID: <CAJKOXPcX7VgWhMbTLyoOg_1A-RK0pmJ9jPh-raSaigZDQ4J1jA@mail.gmail.com>
References: <CGME20190207170145epcas1p465da0715aa629b525c17d263c1b49a68@epcas1p4.samsung.com>
 <20190207170028.720-1-s.nawrocki@samsung.com> <20190207170028.720-18-s.nawrocki@samsung.com>
 <CAJKOXPehfWHW+Mj=xZ_N+LA7nLUnOvHAwqEmBECquzVSx1ppPQ@mail.gmail.com> <c60fb7b9-8847-7e68-2ef4-4dbbfb48e71a@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c60fb7b9-8847-7e68-2ef4-4dbbfb48e71a@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 11 Feb 2019 at 16:19, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> On 2/11/19 14:57, Krzysztof Kozlowski wrote:
> >> static struct snd_soc_dai_link odroid_card_dais[] = {
> >> +       {
> >> +               /* Primary FE <-> BE link */
> >> +               .codec_name = "snd-soc-dummy",
> >> +               .codec_dai_name = "snd-soc-dummy-dai",
> >> +               .ops = &odroid_card_fe_ops,
> >> +               .name = "Primary",
> >> +               .stream_name = "Primary",
> >> +               .platform_name = "3830000.i2s",
>
> > Why exposing address as platform_name? I think it is not used so how
> > about some friendlier name?
>
> This entry is for selecting "PCM" (DMA) component for the link.
> For proper matching we need to use names of devices for which
> the dmaengine based PCM component is registered (with a call to
> samsung_asoc_dma_platform_register()).
>
> We can't use platform_of_node because 2 PCM components ("3830000.i2s",
> "samsung-i2s-sec") are now associated with same DT node.

Thanks for explanation.
With the unneeded empty line fixup:
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

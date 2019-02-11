From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 20/22] ASoC: dmaengine: Remove unused SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME
 flag
Date: Mon, 11 Feb 2019 15:04:53 +0100
Message-ID: <CAJKOXPdznFWovWAsnc2YK+AyGRE7+GhaGCbkre7yEcA3s3R52A@mail.gmail.com>
References: <CGME20190207170155epcas1p42ba30c540d35290c010b5bfa4645e3b1@epcas1p4.samsung.com>
 <20190207170028.720-1-s.nawrocki@samsung.com> <20190207170028.720-21-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207170028.720-21-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 7 Feb 2019 at 18:01, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> There is now no users of this flag so remove it together with related
> data structure field.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  include/sound/dmaengine_pcm.h         |  6 ------
>  sound/soc/soc-generic-dmaengine-pcm.c | 21 ++++-----------------
>  2 files changed, 4 insertions(+), 23 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

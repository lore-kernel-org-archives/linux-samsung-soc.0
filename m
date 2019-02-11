From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 13/22] ASoC: samsung: i2s: Drop spinlock pointer from
 i2s_dai data structure
Date: Mon, 11 Feb 2019 14:47:32 +0100
Message-ID: <CAJKOXPd8_fA28owNtr6Rabq52dE_P3JF0NBLCrdVYcn_ftHJig@mail.gmail.com>
References: <CGME20190207170130epcas1p4809b7a8dc797ced2982dc3b305a0991b@epcas1p4.samsung.com>
 <20190207170028.720-1-s.nawrocki@samsung.com> <20190207170028.720-14-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207170028.720-14-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 7 Feb 2019 at 18:01, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> As we now have the 'priv' pointer in most of the places we can use
> priv->lock directly, dropping extra indirection in the SFR region
> spinlock access.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/i2s.c | 51 +++++++++++++++++++----------------------
>  1 file changed, 24 insertions(+), 27 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

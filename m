From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 05/22] ASoC: samsung: i2s: Convert to single component
 with multiple DAIs
Date: Mon, 11 Feb 2019 14:38:28 +0100
Message-ID: <CAJKOXPewC4XW_+_qQt92+EZqm4OMs_L-mkEOt+t8iiWYcCfWzw@mail.gmail.com>
References: <CGME20190207170102epcas1p445f2a5d8e70bc3a6e42424034c2eb34a@epcas1p4.samsung.com>
 <20190207170028.720-1-s.nawrocki@samsung.com> <20190207170028.720-6-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207170028.720-6-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 7 Feb 2019 at 18:01, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> This patch includes minimal changes as a prerequisite for adding support
> for the Exynos secondary I2S interface as second DAI of the I2S component.
> Doing it that way allows to avoid problems as indicated in commmit
> 6b01e0365b1689 ("ASoC: samsung: i2s: disable secondary DAI until it gets fixed")
>
> The samsung_i2s_get_pri_dai() helper added in this patch is temporary and
> will be removed in one of subsequent patches.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/i2s.c | 192 ++++++++++++++++++++++++----------------
>  1 file changed, 115 insertions(+), 77 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 11/22] ASoC: samsung: i2s: Move registers cache to common
 driver data structure
Date: Mon, 11 Feb 2019 14:45:23 +0100
Message-ID: <CAJKOXPdtUi_n_-zmznziMz41SXr9mMDb+QNoz2Kj1hjTfxcLdA@mail.gmail.com>
References: <CGME20190207170123epcas1p2fae464ba7f102d841548c5a523cc6660@epcas1p2.samsung.com>
 <20190207170028.720-1-s.nawrocki@samsung.com> <20190207170028.720-12-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207170028.720-12-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 7 Feb 2019 at 18:01, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> There is no need to keep the PM suspend/resume register cache separate
> for each DAI as those registers are common, move related i2s_dai data
> structure to the driver's common data structure.  This will allow us
> to simplify the code a little eventually and to make it easier to follow.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/i2s.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

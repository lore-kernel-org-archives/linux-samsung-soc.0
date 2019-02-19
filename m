From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/2] ASoC: samsung: i2s: Fix secondary platform device unregistration
Date: Tue, 19 Feb 2019 16:40:20 +0100
Message-ID: <CAJKOXPdZP1XjkT2GQpy1PS4ToYtz_H-2c2a04pErCwLKaJi1cQ@mail.gmail.com>
References: <CGME20190219152012epcas1p4df1d6e4f6439ab05de95c089a4416e06@epcas1p4.samsung.com>
 <20190219151941.9795-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219151941.9795-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, alsa-devel@alsa-project.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 19 Feb 2019 at 16:20, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> This fixes unregistration of the secondary platform device so all
> resources are properly released.  Additionally the removal sequence
> is corrected so it is in reverse order comparing to probe sequence.
> The test against NULL priv->pdev_sec is removed as it is not necessary.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes since v1:
>  - corrected order of calls on error path in probe() and in remove().
>
>  sound/soc/samsung/i2s.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

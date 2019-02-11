From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 16/22] ASoC: samsung: i2s: Get rid of a static spinlock
Date: Mon, 11 Feb 2019 14:51:43 +0100
Message-ID: <CAJKOXPfPO_4=8p_EQ7zf-x6Ty3CkibysVW1HoqzcjxAmfQv_WA@mail.gmail.com>
References: <CGME20190207170141epcas1p29a038bfd0df69df10e916ea8a695a85b@epcas1p2.samsung.com>
 <20190207170028.720-1-s.nawrocki@samsung.com> <20190207170028.720-17-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207170028.720-17-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 7 Feb 2019 at 18:01, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> This patch makes the spinlock serializing access to the primary/secondary
> PCM a per I2S controller lock, rather than a global one. There is no need
> to have a global lock across multiple I2S controllers in the SoC.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/i2s.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

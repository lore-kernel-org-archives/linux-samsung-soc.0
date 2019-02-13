From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 16/21] ASoC: samsung: i2s: Simplify pri_dai, sec_dai
 pointers usage
Date: Wed, 13 Feb 2019 08:58:41 +0100
Message-ID: <CAJKOXPe8wpP8ky8P4CPq4t51P+fjZ+7kecg2Vsq_9s=4Xa0VrA@mail.gmail.com>
References: <CGME20190212180535epcas2p3aaa1c3d8fd9fcfb5a30bc6d132aba70a@epcas2p3.samsung.com>
 <20190212180342.32040-1-s.nawrocki@samsung.com> <20190212180342.32040-17-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212180342.32040-17-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 12 Feb 2019 at 19:05, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> If the probe call is on the primary DAI we can use 'other' in place of
> i2s->sec_dai, if the probe call is on the secondary DAI we can use 'i2s'
> in place of other->sec_dai.
>
> While at it fix one whitespace issue.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/i2s.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

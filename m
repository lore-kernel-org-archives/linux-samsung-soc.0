From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 09/22] ASoC: samsung: i2s: Move core clk to the driver
 common data structure
Date: Mon, 11 Feb 2019 14:44:18 +0100
Message-ID: <CAJKOXPdjH8W6O+DyMQYU_aTcj2yTouabcsxh2yViumkYu0XC8A@mail.gmail.com>
References: <CGME20190207170116epcas2p1e0768a74062c8af83842ddb59309850f@epcas2p1.samsung.com>
 <20190207170028.720-1-s.nawrocki@samsung.com> <20190207170028.720-10-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207170028.720-10-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 7 Feb 2019 at 18:01, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> The core clock is also common for both CPU DAIs so move it to
> the driver's private data structure.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/i2s.c | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)
>

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

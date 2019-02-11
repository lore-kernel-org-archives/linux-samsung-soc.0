From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 12/22] ASoC: samsung: i2s: Move SFR pointer to common
 driver data structure
Date: Mon, 11 Feb 2019 14:46:06 +0100
Message-ID: <CAJKOXPf4H5MEWsBLe2R3ro3+Jsrzexeu9k9NK6eY5nWY_Lq8zw@mail.gmail.com>
References: <CGME20190207170127epcas2p31da340c3f63e75e7bcb5c9c864a42173@epcas2p3.samsung.com>
 <20190207170028.720-1-s.nawrocki@samsung.com> <20190207170028.720-13-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207170028.720-13-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 7 Feb 2019 at 18:01, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> The SFR region is common for both DAIs so move related data structure
> field from struct i2s_dai to the common driver data structure.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/i2s.c | 105 ++++++++++++++++++++++------------------
>  1 file changed, 58 insertions(+), 47 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

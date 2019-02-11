From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 14/22] ASoC: samsung: i2s: Move IP variant data to common
 driver data structure
Date: Mon, 11 Feb 2019 14:48:09 +0100
Message-ID: <CAJKOXPdPNNcocL21Q-uR56CCujHuQqRBZ2EzhmnTX2OW3FhiJw@mail.gmail.com>
References: <CGME20190207170134epcas2p1a22a5c2f680f33fe562fa22f3aec9e6a@epcas2p1.samsung.com>
 <20190207170028.720-1-s.nawrocki@samsung.com> <20190207170028.720-15-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207170028.720-15-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 7 Feb 2019 at 18:01, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> The IP variant data is another thing common for both DAIs, move it
> to the driver's common data structure.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/i2s.c | 42 ++++++++++++++++++++---------------------
>  1 file changed, 21 insertions(+), 21 deletions(-)
>

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

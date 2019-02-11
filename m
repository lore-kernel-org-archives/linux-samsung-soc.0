From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 21/22] ARM: dts: exynos5422-odroidxu3: Add support for
 secondary DAI
Date: Mon, 11 Feb 2019 15:08:15 +0100
Message-ID: <CAJKOXPdKdROOSuHROEf9-aUY-vTrf9rcb=tZUKWWTNJUOZ-i5g@mail.gmail.com>
References: <CGME20190207170244epcas1p3f0037d3a98ed63b71e8daf14090befe3@epcas1p3.samsung.com>
 <20190207170218.851-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207170218.851-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 7 Feb 2019 at 18:02, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> This patch extends DAPM routing and adds secondary CPU DAI entry
> to support the secondary audio PCM interface on Odroid XU3.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Looks okay, is there dependency on the driver?
I think you need to update the bindings (samsung,audio-routing).

Best regards,
Krzysztof

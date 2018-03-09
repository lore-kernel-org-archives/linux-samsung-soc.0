From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/4] ARM: dts: exynos5250: Add #sound-dai-cells property
 to hdmi device node
Date: Fri, 9 Mar 2018 13:54:26 +0100
Message-ID: <CAJKOXPdgsNwcVQ0FZLDR_q8Dz1AkSEBaG-1Mij7TKSLpSRJLpw@mail.gmail.com>
References: <CGME20180307172723epcas1p1b8879bb555737cab7406a172b7d13a56@epcas1p1.samsung.com>
 <20180307172711.15697-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180307172711.15697-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: kgene@kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Mar 7, 2018 at 6:27 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> This property is required for specifying link between the HDMI IP block
> and the SoC's audio subsystem.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi | 1 +
>  1 file changed, 1 insertion(+)

Subject prefix:
ARM: dts: exynos: Add..... to Exynos5250

Please fix it here and in other places. For arm64 prefix is slightly
different (arm64: dts: exynos:). I did not notice that in your last
patches and applied them but please take care about this in future.

In case you forget how the prefix should look like - run "git log
--oneline -- arch/arm/boot/dts/exynos*" or "git log --oneline --
arch/arm64/boot/dts/exynos/".

BR,
Krzysztof

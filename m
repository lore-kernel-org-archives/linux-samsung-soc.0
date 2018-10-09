From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/7] clocksource: Change CPU hotplug priority of
 exynos_mct driver
Date: Tue, 9 Oct 2018 10:19:45 +0200
Message-ID: <CAJKOXPc5uB0cnwvcN5SinmajKgb=O-bGgrmRHCThNndFwLGeyw@mail.gmail.com>
References: <CGME20181008125047eucas1p1bbd0c4759612b6df8fbe25f759e03130@eucas1p1.samsung.com>
 <20181008125009.3721-1-m.szyprowski@samsung.com> <20181008125009.3721-4-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181008125009.3721-4-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, will.deacon@arm.com, catalin.marinas@arm.com, marc.zyngier@arm.com, tglx@linutronix.de, daniel.lezcano@linaro.org, Chanwoo Choi <cw00.choi@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 8 Oct 2018 at 14:50, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Exynos Multi-Core Timer driver (exynos_mct) must be started before
> ARM Architected Timers (arch_timer), because both timers share common
> hardware block and turning on MCT is needed to get ARM Architected
> Timer working properly.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  include/linux/cpuhotplug.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

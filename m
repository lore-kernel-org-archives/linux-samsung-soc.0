From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v3] clocksource: exynos_mct: Increase priority over ARM
 arch timer
Date: Fri, 31 May 2019 16:50:44 +0200
Message-ID: <a0a97d11-b422-b2c1-0415-ada85f1f493c@linaro.org>
References: <CGME20190530105059eucas1p1d9c911a5ba2ae412166cd8866deb725e@eucas1p1.samsung.com>
 <20190530105043.29965-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190530105043.29965-1-m.szyprowski@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 30/05/2019 12:50, Marek Szyprowski wrote:
> Exynos SoCs based on CA7/CA15 have 2 timer interfaces: custom Exynos MCT
> (Multi Core Timer) and standard ARM Architected Timers.
> 
> There are use cases, where both timer interfaces are used simultanously.
> One of such examples is using Exynos MCT for the main system timer and
> ARM Architected Timers for the KVM and virtualized guests (KVM requires
> arch timers).
> 
> Exynos Multi-Core Timer driver (exynos_mct) must be however started
> before ARM Architected Timers (arch_timer), because they both share some
> common hardware blocks (global system counter) and turning on MCT is
> needed to get ARM Architected Timer working properly.
> 
> To ensure selecting Exynos MCT as the main system timer, increase MCT
> timer rating. To ensure proper starting order of both timers during
> suspend/resume cycle, increase MCT hotplug priority over ARM Archictected
> Timers.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---

Applied thanks!

-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

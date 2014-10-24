From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 2/5] clk: samsung: exynos4415: Add clocks using common
 clock framework
Date: Fri, 24 Oct 2014 22:36:19 +0900
Message-ID: <544A55D3.8000809@samsung.com>
References: <1413775749-17539-1-git-send-email-cw00.choi@samsung.com>
 <1413775935-17743-2-git-send-email-cw00.choi@samsung.com>
 <CAD8Lp45F_6UWXx0f2xVGZL+Rgemg2fzkYhnfPdaeaiky0rKPgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAD8Lp45F_6UWXx0f2xVGZL+Rgemg2fzkYhnfPdaeaiky0rKPgw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, Russell King <linux@arm.linux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>, thomas.abraham@linaro.org, Linus Walleij <linus.walleij@linaro.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, InKi Dae <inki.dae@samsung.com>, geunsik.lim@samsung.com, jh80.chung@samsung.com, jaewon02.kim@samsung.com, ideal.song@samsung.com, yj44.cho@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Daniel,

On 10/24/2014 10:18 PM, Daniel Drake wrote:
> On Sun, Oct 19, 2014 at 9:32 PM, Chanwoo Choi <cw00.choi@samsung.com> wrote:
>> This patch adds the new clock driver of Exynos4415 SoC based on Cortex-A9
>> using common clock framework. The CMU (Clock Management Unit) of Exynos4415
>> controls PLLs(Phase Locked Loops) and generates system clocks for CPU, buses
>> and function clocks for individual IPs.
> 
> There seems to be a lot in common here with other exynos4 variants in
> clk-exynos4.c. Have you considered just adding support for the 4415 in
> the existing driver?

Yes, It is difficult and to make existing clk-exynos4.c more complicated.
Exynos4415 has fewer difference from existing clk-exynos4.c and
different parent source of mux.

For exmaple about PLL,
There are different PLLs between Exynos4412 and Exynos4415.
- Exynos4412 has APLL, MPLL, EPLL, VPLL.
- Exynos4415 has APLL, EPLL, G3D_PLL, ISP_PLL, DISP_PLL and MPLL.
Also, MPLL of Exynos4415 was included in CMU_DMC scope.

Best Regards,
Chanwoo Choi

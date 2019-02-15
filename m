From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/5] clocksource: exynos_mct: Increase priority over ARM
 arch timer
Date: Fri, 15 Feb 2019 13:59:48 +0100
Message-ID: <CAJKOXPdwvPX28WJ8DyXvygzHj_qS0-126cA1aCdL7ktObTPNKA@mail.gmail.com>
References: <CGME20190215125239eucas1p2d9167af42f2d04e462c56a070c3371c2@eucas1p2.samsung.com>
 <20190215125229.30180-1-m.szyprowski@samsung.com>
 <20190215125229.30180-4-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190215125229.30180-4-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 15 Feb 2019 at 13:52, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Exynos Multi-Core Timer driver (exynos_mct) must be started before ARM
> Architected Timers (arch_timer), because they both share some common
> hardware blocks (global system counter) and turning on MCT is needed
> to get ARM Architected Timer working properly. Increase MCT timer rating
> and hotplug priority over ARM Archictected timer driver to achieve that.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clocksource/exynos_mct.c | 4 ++--
>  include/linux/cpuhotplug.h       | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

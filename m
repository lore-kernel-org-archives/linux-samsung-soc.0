From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/5] clocksource: exynos_mct: Increase priority over ARM
 arch timer
Date: Mon, 18 Feb 2019 09:53:12 +0100
Message-ID: <CAJKOXPfs6i08OqXPZeJ19-tyoj7zY60tjq=fEScjm5wdRR6fXw@mail.gmail.com>
References: <20190215125229.30180-1-m.szyprowski@samsung.com>
 <CGME20190215125239eucas1p2d9167af42f2d04e462c56a070c3371c2@eucas1p2.samsung.com>
 <20190215125229.30180-4-m.szyprowski@samsung.com>
 <01569ba7-2e3e-5811-81e1-ca51cacbcb95@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <01569ba7-2e3e-5811-81e1-ca51cacbcb95@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 15 Feb 2019 at 17:35, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>
> On 15/02/2019 13:52, Marek Szyprowski wrote:
> > Exynos Multi-Core Timer driver (exynos_mct) must be started before ARM
> > Architected Timers (arch_timer), because they both share some common
> > hardware blocks (global system counter) and turning on MCT is needed
> > to get ARM Architected Timer working properly. Increase MCT timer rating
> > and hotplug priority over ARM Archictected timer driver to achieve that.
>
> This is a hack.
>
> There are mechanisms to handle this kind of dependency.
>
> eg. https://www.kernel.org/doc/html/v4.15/driver-api/device_link.html

Hi Daniel,

Are you sure you have proper devices at this point so you can order
dependencies with device links?

Best regards,
Krzysztof

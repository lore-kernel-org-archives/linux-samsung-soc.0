From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2 4/4] phy: exynos: Use one define for enable bit
Date: Tue, 14 Mar 2017 16:53:33 +0100
Message-ID: <2409116.U9sOiGfLuq@amdc3058>
References: <20170311182534.13345-1-krzk@kernel.org>
 <2746282.jBJ7tRjldv@amdc3058>
 <CAJKOXPeUYeAuXgZLVYTBNTZhcmiEMr6sfWWpXMytzzeC0+wY4Q@mail.gmail.com>
 <CGME20170314155351epcas5p210791391569477d6b115bb922ab068ed@epcas5p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <CAJKOXPeUYeAuXgZLVYTBNTZhcmiEMr6sfWWpXMytzzeC0+wY4Q@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday, March 14, 2017 04:55:46 PM Krzysztof Kozlowski wrote:
> On Tue, Mar 14, 2017 at 4:46 PM, Bartlomiej Zolnierkiewicz
> <b.zolnierkie@samsung.com> wrote:
> >
> > Hi,
> >
> > On Saturday, March 11, 2017 08:25:34 PM Krzysztof Kozlowski wrote:
> >> There is no need for separate defines for Exynos4 and Exynos5 phy enable
> >> bit and MIPI phy reset bits.  In both cases there are the same so
> >> simplify it.
> >>
> >> This reduces number of defines and allows removal of one header file.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> >> Acked-by: Lee Jones <lee.jones@linaro.org>
> >> ---
> >>  drivers/phy/phy-exynos-dp-video.c           |  5 ++--
> >>  drivers/phy/phy-exynos-mipi-video.c         | 39 ++++++++++++++---------------
> >>  drivers/phy/phy-exynos5-usbdrd.c            |  5 ++--
> >>  include/linux/mfd/syscon/exynos5-pmu.h      | 22 ----------------
> >>  include/linux/soc/samsung/exynos-regs-pmu.h |  3 ++-
> >>  5 files changed, 25 insertions(+), 49 deletions(-)
> >>  delete mode 100644 include/linux/mfd/syscon/exynos5-pmu.h
> >
> > [...]
> >
> >> --- a/include/linux/mfd/syscon/exynos5-pmu.h
> >> +++ /dev/null
> >
> >> -#define EXYNOS5433_PAD_RETENTION_AUD_OPTION          (0x3028)
> >> -#define EXYNOS5433_PAD_INITIATE_WAKEUP_FROM_LOWPWR   BIT(28)
> >
> > EXYNOS5433_PAD_INITIATE_WAKEUP_FROM_LOWPWR is not defined in
> > <soc/samsung/exynos-regs-pmu.h> and is still used by
> > drivers/mfd/exynos-lpass.c (at least in next-20170310)
> >
> > Do I miss something or it needs to be fixed?
> 
> Yeah, kbuild also told me that. :)
> 
> I fixed it in v3, can you take a look?
> http://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1351482.html

Ah, thanks, my mailing lists retrieval setup has some lag..

For the whole v3:

Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

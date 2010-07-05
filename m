From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5P: Add PMU device
Date: Mon, 05 Jul 2010 21:57:26 +0900
Message-ID: <006c01cb1c41$a0af5c10$e20e1430$%kim@samsung.com>
References: <1278294411-5104-1-git-send-email-jy0922.shim@samsung.com>
	<4C31C47C.1050905@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <4C31C47C.1050905@gmail.com>
Content-language: ko
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Maurus Cuelenaere' <mcuelenaere@gmail.com>, 'Joonyoung Shim' <jy0922.shim@samsung.com>
Cc: kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Maurus Cuelenaere wrote:
> 
>  Op 05-07-10 03:46, Joonyoung Shim schreef:
> > This patch adds an initcall for the s5p platforms so that they register
> > their PMU IRQs with the PMU framework in the Kernel.
> >
> > Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> > ---
> >  arch/arm/mach-s5p6442/include/mach/irqs.h |    2 +-
> >  arch/arm/mach-s5pc100/include/mach/irqs.h |    1 +
> >  arch/arm/mach-s5pv210/include/mach/irqs.h |    1 +
> >  arch/arm/plat-s5p/Makefile                |    1 +
> >  arch/arm/plat-s5p/dev-pmu.c               |   37
> +++++++++++++++++++++++++++++
> >  5 files changed, 41 insertions(+), 1 deletions(-)
> >  create mode 100644 arch/arm/plat-s5p/dev-pmu.c
> 
> Wouldn't it be better if this was in plat-samsung? I can see that the S3C6410
> datasheet mentions a PMU_IRQ_ENABLE bit in SYS_OTHERS so I suspect that it
> has
> the same functionality (even though there's no mention of which interrupt this
> is).
> 
Yes, I also found PMU_IRQ_ENABLE bit in System Others register of S3C6410 datasheet. But as your comments, could not found the interrupt number and any description...Actually, need to check whether it's available or not.

And S5P6440 has it.
So Joonyoung, it would be helpful if you could add 6440 PMUIRQ (VIC1[23]) in this patch.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

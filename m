From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/3] [media] s5p-jpeg: Fix compilation with COMPILE_TEST
Date: Tue, 09 Sep 2014 19:54:19 +0200
Message-ID: <60097822.tu6OncvLxQ@wuerfel>
References: <20140909124306.2d5a0d76@canb.auug.org.au>
 <540F15B2.3000902@samsung.com> <20140909120936.527bd852.m.chehab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140909120936.527bd852.m.chehab@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Kamil Debski <k.debski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-next@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, Jacek Anaszewski <j.anaszewski@samsung.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday 09 September 2014 12:09:36 Mauro Carvalho Chehab wrote:
> -exynos4.c
> > > index e51c078360f5..01eeacf28843 100644
> > > --- a/drivers/media/platform/s5p-jpeg/jpeg-hw-exynos4.c
> > > +++ b/drivers/media/platform/s5p-jpeg/jpeg-hw-exynos4.c
> > > @@ -23,7 +23,9 @@ void exynos4_jpeg_sw_reset(void __iomem *base)
> > >     reg = readl(base + EXYNOS4_JPEG_CNTL_REG);
> > >     writel(reg & ~EXYNOS4_SOFT_RESET_HI, base + EXYNOS4_JPEG_CNTL_REG);
> > >  
> > > +#ifndef CONFIG_COMPILE_TEST
> > >     ndelay(100000);
> > > +#endif
> > 
> > Wouldn't be a better fix to replace ndelay(100000); with udelay(100),
> > rather than sticking in a not so pretty #ifndef ?
> 
> Works for me. I'll submit a new version.

New version looks good to me. On a more general level, I would argue
that we should not disable code based on COMPILE_TEST. The typical
use of this symbol is to make it possible to compile more code, not
to change the behavior of code on machines that were able to build
it already.

	Arnd

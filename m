From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 1/2] ARM: EXYNOS4: Change System MMU device	definition
Date: Fri, 07 Oct 2011 19:42:22 +0900
Message-ID: <01eb01cc84dd$cb740940$625c1bc0$%kim@samsung.com>
References: <01e001cc84d7$5e0b84b0$1a228e10$%kim@samsung.com>
	<20111007102754.GF21464@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20111007102754.GF21464@n2100.arm.linux.org.uk>
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
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: 'Ohad Ben-Cohen' <ohad@wizery.com>, linux-samsung-soc@vger.kernel.org, joerg.roedel@amd.com, linux-kernel@vger.kernel.org, younglak1004.kim@samsung.com, iommu@lists.linux-foundation.org, 'Sanghyun Lee' <sanghyun75.lee@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Russell King - ARM Linux wrote:
> 
> On Fri, Oct 07, 2011 at 06:56:21PM +0900, Kukjin Kim wrote:
> > +#define SYSMMU_RESOURCE(ipname, base, irq) \
> > +static struct resource sysmmu_resource_##ipname[] =\
> > +{\
> > +	{\
> > +		.start	= EXYNOS4_PA_SYSMMU_##base,\
> > +		.end	= EXYNOS4_PA_SYSMMU_##base + SZ_4K - 1,\
> > +		.flags	= IORESOURCE_MEM,\
> > +	}, {\
> > +		.start	= IRQ_SYSMMU_##irq##_0,\
> > +		.end	= IRQ_SYSMMU_##irq##_0,\
> > +		.flags	= IORESOURCE_IRQ,\
> > +	},\
> >  }
> 
> #define SYSMMU_RESOURCE(ipname, base, irq) \
> static struct resource sysmmu_resource_##ipname[] = \
> { \
> 	DEFINE_RES_MEM(EXYNOS4_PA_SYSMMU_##base, SZ_4K), \
> 	DEFINE_RES_IRQ(IRQ_SYSMMU_##irq##_0), \
> }

Oops, I missed that.
OK, let him change it.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

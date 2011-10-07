From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v3 1/2] ARM: EXYNOS4: Change System MMU device definition
Date: Fri, 7 Oct 2011 11:27:54 +0100
Message-ID: <20111007102754.GF21464@n2100.arm.linux.org.uk>
References: <01e001cc84d7$5e0b84b0$1a228e10$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <01e001cc84d7$5e0b84b0$1a228e10$%kim@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Ohad Ben-Cohen' <ohad@wizery.com>, linux-samsung-soc@vger.kernel.org, joerg.roedel@amd.com, linux-kernel@vger.kernel.org, younglak1004.kim@samsung.com, iommu@lists.linux-foundation.org, 'Sanghyun Lee' <sanghyun75.lee@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Oct 07, 2011 at 06:56:21PM +0900, Kukjin Kim wrote:
> +#define SYSMMU_RESOURCE(ipname, base, irq) \
> +static struct resource sysmmu_resource_##ipname[] =\
> +{\
> +	{\
> +		.start	= EXYNOS4_PA_SYSMMU_##base,\
> +		.end	= EXYNOS4_PA_SYSMMU_##base + SZ_4K - 1,\
> +		.flags	= IORESOURCE_MEM,\
> +	}, {\
> +		.start	= IRQ_SYSMMU_##irq##_0,\
> +		.end	= IRQ_SYSMMU_##irq##_0,\
> +		.flags	= IORESOURCE_IRQ,\
> +	},\
>  }

#define SYSMMU_RESOURCE(ipname, base, irq) \
static struct resource sysmmu_resource_##ipname[] = \
{ \
	DEFINE_RES_MEM(EXYNOS4_PA_SYSMMU_##base, SZ_4K), \
	DEFINE_RES_IRQ(IRQ_SYSMMU_##irq##_0), \
}

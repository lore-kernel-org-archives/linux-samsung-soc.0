From: Jungseok Lee <jays.lee@samsung.com>
Subject: Re: [PATCH v4 6/7] arm64: mm: Implement 4 levels of translation tables
Date: Wed, 30 Apr 2014 11:29:35 +0900
Message-ID: <007b01cf641c$07357700$15a06500$@samsung.com>
References: <000601cf6367$cffab890$6ff029b0$@samsung.com>
 <20140429170404.GA32121@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20140429170404.GA32121@localhost>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Catalin Marinas' <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 'Marc Zyngier' <Marc.Zyngier@arm.com>, 'Christoffer Dall' <christoffer.dall@linaro.org>, linux-kernel@vger.kernel.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, steve.capper@linaro.org, sungjinn.chung@samsung.com, 'Arnd Bergmann' <arnd@arndb.de>, kgene.kim@samsung.com, ilho215.lee@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wednesday, April 30, 2014 2:04 AM, Catalin Marinas wrote:
> On Tue, Apr 29, 2014 at 05:59:33AM +0100, Jungseok Lee wrote:
> > diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S index
> > 0fd5650..03ec424 100644
> > --- a/arch/arm64/kernel/head.S
> > +++ b/arch/arm64/kernel/head.S
> > @@ -37,8 +37,9 @@
> >
> >  /*
> >   * swapper_pg_dir is the virtual address of the initial page table.
> > We place
> > - * the page tables 3 * PAGE_SIZE below KERNEL_RAM_VADDR. The
> > idmap_pg_dir has
> > - * 2 pages and is placed below swapper_pg_dir.
> > + * the page tables 3 * PAGE_SIZE (2 or 3 levels) or 4 * PAGE_SIZE (4
> > + levels)
> > + * below KERNEL_RAM_VADDR. The idmap_pg_dir has 2 pages (2 or 3
> > + levels) or
> > + * 3 pages (4 levels) and is placed below swapper_pg_dir.
> >   */
> >  #define KERNEL_RAM_VADDR       (PAGE_OFFSET + TEXT_OFFSET)
> >
> > @@ -46,8 +47,13 @@
> >  #error KERNEL_RAM_VADDR must start at 0xXXX80000  #endif
> >
> > +#ifdef CONFIG_ARM64_4_LEVELS
> > +#define SWAPPER_DIR_SIZE       (4 * PAGE_SIZE)
> > +#define IDMAP_DIR_SIZE         (3 * PAGE_SIZE)
> > +#else
> >  #define SWAPPER_DIR_SIZE       (3 * PAGE_SIZE)
> >  #define IDMAP_DIR_SIZE         (2 * PAGE_SIZE)
> > +#endif
> 
> Mark Rutland was doing some clean-up of this code to no longer place swapper_pg_dir and idmap_pg_dir
> below the kernel image. I'm not sure whether the patches ended up on the list yet (not a problem for
> now, just a slight change for your patches).

I don't see those patches in the mailing list yet.
I will keep it in mind. Thanks.

Best Regards
Jungseok Lee

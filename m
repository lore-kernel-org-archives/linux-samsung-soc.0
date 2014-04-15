From: Jungseok Lee <jays.lee@samsung.com>
Subject: Re: [PATCH 2/8] arm/arm64: KVM: Fix line length exceeding 80 characters
Date: Tue, 15 Apr 2014 09:38:33 +0900
Message-ID: <001601cf5843$07c38160$174a8420$@samsung.com>
References: <000001cf57b4$d3450780$79cf1680$@samsung.com>
 <534C0A89.4090907@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:32211 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750831AbaDOAif (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Apr 2014 20:38:35 -0400
In-reply-to: <534C0A89.4090907@arm.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marc Zyngier' <marc.zyngier@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 'Catalin Marinas' <Catalin.Marinas@arm.com>, 'Christoffer Dall' <christoffer.dall@linaro.org>, linux-kernel@vger.kernel.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, sungjinn.chung@samsung.com, 'Arnd Bergmann' <arnd@arndb.de>, kgene.kim@samsung.com, ilho215.lee@samsung.com

On Tuesday, April 15, 2014 1:19 AM, Marc Zyngier wrote:
> On 14/04/14 08:40, Jungseok Lee wrote:
> > This patch deals with checkpatch complaint as fixing line length
> > exceeding 80 characters.
> >
> > WARNING: line over 80 characters
> >
> > Signed-off-by: Jungseok Lee <jays.lee@samsung.com>
> > Reviewed-by: Sungjinn Chung <sungjinn.chung@samsung.com>
> > ---
> >  arch/arm/kvm/mmu.c |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/kvm/mmu.c b/arch/arm/kvm/mmu.c index
> > 80bb1e6..e0d4f24 100644
> > --- a/arch/arm/kvm/mmu.c
> > +++ b/arch/arm/kvm/mmu.c
> > @@ -563,8 +563,8 @@ void kvm_free_stage2_pgd(struct kvm *kvm)
> >  	kvm->arch.pgd = NULL;
> >  }
> >
> > -static pmd_t *stage2_get_pmd(struct kvm *kvm, struct kvm_mmu_memory_cache *cache,
> > -			     phys_addr_t addr)
> > +static pmd_t *stage2_get_pmd(struct kvm *kvm, struct kvm_mmu_memory_cache
> > +			     *cache, phys_addr_t addr)
> 
> Please don't. This makes the code unreadable (and no, I don't care about checkpatch ;-).

Okay. I will drop this patch from the next version.

It would be good to change stage2_set_pmd_huge function for readability
if you don't care about checkpatch.

Best Regards
Jungseok Lee

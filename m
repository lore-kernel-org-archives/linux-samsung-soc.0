From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 2/8] arm/arm64: KVM: Fix line length exceeding 80 characters
Date: Mon, 14 Apr 2014 17:19:21 +0100
Message-ID: <534C0A89.4090907@arm.com>
References: <000001cf57b4$d3450780$79cf1680$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <000001cf57b4$d3450780$79cf1680$@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jungseok Lee <jays.lee@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, Catalin Marinas <Catalin.Marinas@arm.com>, Christoffer Dall <christoffer.dall@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "sungjinn.chung@samsung.com" <sungjinn.chung@samsung.com>, Arnd Bergmann <arnd@arndb.de>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "ilho215.lee@samsung.com" <ilho215.lee@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 14/04/14 08:40, Jungseok Lee wrote:
> This patch deals with checkpatch complaint as fixing line length
> exceeding 80 characters.
> 
> WARNING: line over 80 characters
> 
> Signed-off-by: Jungseok Lee <jays.lee@samsung.com>
> Reviewed-by: Sungjinn Chung <sungjinn.chung@samsung.com>
> ---
>  arch/arm/kvm/mmu.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/kvm/mmu.c b/arch/arm/kvm/mmu.c
> index 80bb1e6..e0d4f24 100644
> --- a/arch/arm/kvm/mmu.c
> +++ b/arch/arm/kvm/mmu.c
> @@ -563,8 +563,8 @@ void kvm_free_stage2_pgd(struct kvm *kvm)
>  	kvm->arch.pgd = NULL;
>  }
>  
> -static pmd_t *stage2_get_pmd(struct kvm *kvm, struct kvm_mmu_memory_cache *cache,
> -			     phys_addr_t addr)
> +static pmd_t *stage2_get_pmd(struct kvm *kvm, struct kvm_mmu_memory_cache
> +			     *cache, phys_addr_t addr)

Please don't. This makes the code unreadable (and no, I don't care about
checkpatch ;-).

	M.
-- 
Jazz is not dead. It just smells funny...

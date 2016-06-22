From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: Samsung: fix missing s5p_init_cpu() declaration
Date: Wed, 22 Jun 2016 12:33:31 +0200
Message-ID: <576A697B.10204@samsung.com>
References: <1466511653-9295-1-git-send-email-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1466511653-9295-1-git-send-email-ben.dooks@codethink.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-kernel@lists.codethink.co.uk
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 06/21/2016 02:20 PM, Ben Dooks wrote:
> The declaration of s5p_init_cpu() in arch/arm/mach-exynos/common.h
> is not included in the platform file arch/arm/plat-samsung/cpu.c
> which generates a warning.
> 
> Fix the following warning by moving the declaration to somewhere
> both the machine and platform code can get to it, and including
> the right files as necessary:
> 
> arch/arm/plat-samsung/cpu.c:47:13: warning: symbol 's5p_init_cpu' was not declared. Should it be static?
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  arch/arm/mach-exynos/common.h            | 1 -
>  arch/arm/mach-exynos/exynos.c            | 1 +
>  arch/arm/plat-samsung/include/plat/cpu.h | 1 +
>  3 files changed, 2 insertions(+), 1 deletion(-)

Thanks, applied for v4.8.

Best regards,
Krzysztof

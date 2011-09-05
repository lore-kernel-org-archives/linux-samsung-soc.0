From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5P64X0: Fix mask value for S5P64X0 CPU IDs
Date: Mon, 05 Sep 2011 19:22:02 +0900
Message-ID: <002701cc6bb5$a7615c10$f6241430$%kim@samsung.com>
References: <1314972141-14387-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1314972141-14387-1-git-send-email-ajaykumar.rs@samsung.com>
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
To: 'Ajay Kumar' <ajaykumar.rs@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Ajay Kumar wrote:
> 
> The current value for S5P64XX_CPU_MASK does not include the necessary
> bits, which causes detection failure.
> 
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  arch/arm/plat-samsung/include/plat/cpu.h |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/include/plat/cpu.h b/arch/arm/plat-
> samsung/include/plat/cpu.h
> index aa1f69b..897d161 100644
> --- a/arch/arm/plat-samsung/include/plat/cpu.h
> +++ b/arch/arm/plat-samsung/include/plat/cpu.h
> @@ -30,7 +30,7 @@ extern unsigned long samsung_cpu_id;
> 
>  #define S5P6440_CPU_ID		0x56440000
>  #define S5P6450_CPU_ID		0x36450000
> -#define S5P64XX_CPU_MASK	0x1FF40000
> +#define S5P64XX_CPU_MASK	0x7FFF0000
> 
>  #define S5PC100_CPU_ID		0x43100000
>  #define S5PC100_CPU_MASK	0xFFFFF000
> --
> 1.7.2.3

Yes, you're right.
But in this case, 0xFFFFF000 is better than 0x7FFF0000.

If any problems with above value, please let me know.

Will apply, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

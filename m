From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCHv2 5/8] ARM: EXYNOS: Support secondary CPU boot of Exynos3250
Date: Wed, 16 Apr 2014 16:28:04 +0200
Message-ID: <534E9374.6010807@samsung.com>
References: <1397527192-21988-1-git-send-email-cw00.choi@samsung.com>
 <1397527192-21988-6-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:59178 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161180AbaDPO2I (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Apr 2014 10:28:08 -0400
In-reply-to: <1397527192-21988-6-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org
Cc: linux@arm.linux.org.uk, ben-linux@fluff.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, kyungmin.park@samsung.com, sw0312.kim@samsung.com, hyunhee.kim@samsung.com, yj44.cho@samsung.com, chanho61.park@samsung.com, arnd@arndb.de, olof@lixom.net, marc.zyngier@arm.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org

Hi Chanwoo,

On 15.04.2014 03:59, Chanwoo Choi wrote:
> This patch fix the offset of CPU boot address and don't operate smc call
> of SMC_CMD_CPU1BOOT command for Exynos3250.
>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>   arch/arm/mach-exynos/firmware.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
> index aa01c42..6205d4f 100644
> --- a/arch/arm/mach-exynos/firmware.c
> +++ b/arch/arm/mach-exynos/firmware.c
> @@ -30,13 +30,16 @@ static int exynos_do_idle(void)
>
>   static int exynos_cpu_boot(int cpu)
>   {
> +	if (soc_is_exynos3250()) {
> +		return 0;

This is strange. How the firmware knows when to boot the CPU then, if 
CPU1BOOT command is not called?

Best regards,
Tomasz

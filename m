From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v6 3/4] ARM: EXYNOS: Add platform driver support for Exynos
 PMU
Date: Tue, 08 Jul 2014 16:31:36 +0200
Message-ID: <53BC00C8.4000204@samsung.com>
References: <1404710376-16448-1-git-send-email-pankaj.dubey@samsung.com>
 <1404710376-16448-4-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:27594 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753811AbaGHOcK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 10:32:10 -0400
In-reply-to: <1404710376-16448-4-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, vikas.sajjan@samsung.com, joshi@samsung.com, naushad@samsung.com, thomas.ab@samsung.com, chow.kim@samsung.com

Hi Pankaj,

Just one comment I already had to previous version.

On 07.07.2014 07:19, Pankaj Dubey wrote:

[snip]

> -static void exynos5_init_pmu(void)
> +static void exynos5_powerdown_conf(enum sys_powerdown mode)
>  {
>  	unsigned int i;
>  	unsigned int tmp;
> @@ -382,51 +398,143 @@ void exynos_sys_powerdown_conf(enum sys_powerdown mode)
>  {
>  	unsigned int i;
>  
> -	if (soc_is_exynos5250())
> -		exynos5_init_pmu();
> +	const struct exynos_pmu_data *pmu_data = pmu_context->pmu_data;
> +
> +	if (!pmu_data)
> +		return;

As I mentioned in my reply to previous version, I don't think there is
any point in probing this driver when there is no pmu_data. AFAIK the
generic syscon driver can take over in such case.

After fixing this, feel free to add

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

--
Best regards,
Tomasz

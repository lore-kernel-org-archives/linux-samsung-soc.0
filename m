From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RFC PATCH 2/2] ARM: EXYNOS: Make sure that the Exynos5420 MDMA0
 clock is enabled during suspend
Date: Fri, 27 Mar 2015 16:11:49 +0100
Message-ID: <55157335.9070808@collabora.co.uk>
References: <1427466097-7287-1-git-send-email-javier.martinez@collabora.co.uk> <1427466097-7287-3-git-send-email-javier.martinez@collabora.co.uk> <55156AD0.5070107@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:39474 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753090AbbC0PLy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Mar 2015 11:11:54 -0400
In-Reply-To: <55156AD0.5070107@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Steve Capper <steve.capper@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Sylwester,

Thanks a lot for your feedback.

On 03/27/2015 03:36 PM, Sylwester Nawrocki wrote:
>>   * GIC wake-up support
>> @@ -374,6 +376,16 @@ static void exynos5420_pm_prepare(void)
>>  {
>>  	unsigned int tmp;
>>  
>> +	/*
>> +	 * Exynos5420 requires the MDMA0 controller clock to be
>> +	 * ungated on suspend in order to be resumed correctly.
>> +	 */
>> +	clk = clk_get(NULL, "mdma0");
>> +	if (IS_ERR(clk))
>> +		pr_warn("Failed to get mdma0 clk (%ld)\n", PTR_ERR(clk));
> 
> I suppose you want this clk_get() call in exynos_pm_init(), now there

Well I wanted to do it in an exynos5420 specific function to avoid
having an of_machine_is_compatible("samsung,exynos5420") but I can
move there if that is preferred.

> is clk_put() missing and this will cause a memory leak.
>

duh, I wonder how I missed that. Thanks for pointing it out.

>> +	else
>> +		clk_prepare_enable(clk);
>> +
>>  	/* Set wake-up mask registers */
>>  	exynos_pm_set_wakeup_mask();
>>  
>> @@ -516,6 +528,9 @@ static void exynos5420_pm_resume(void)
>>  {
>>  	unsigned long tmp;
>>  
>> +	if (!IS_ERR_OR_NULL(clk))
> 
> This should be just IS_ERR().
>

Ok.

>> +		clk_disable_unprepare(clk);
>> +
>>  	/* Restore the CPU0 low power state register */
>>  	tmp = pmu_raw_readl(EXYNOS5_ARM_CORE0_SYS_PWR_REG);
>>  	pmu_raw_writel(tmp | S5P_CORE_LOCAL_PWR_EN,
> 
> --
> Regards,
> Sylwester
> 

Best regards,
Javier

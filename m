From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH 2/5] ARM: EXYNOS5: Fix PMU register configuration for
 local power blocks
Date: Thu, 12 Dec 2013 08:13:23 +0530
Message-ID: <CAM4voamk2j1XEt6Pbt1DtNcY+UrFcK4XsAW2OwYgaXLSpLDOnw@mail.gmail.com>
References: <1386763029-8516-1-git-send-email-a.kesavan@samsung.com>
	<1386763029-8516-3-git-send-email-a.kesavan@samsung.com>
	<1555673.59jhB0RKpX@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f179.google.com ([209.85.216.179]:37183 "EHLO
	mail-qc0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750902Ab3LLCnY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Dec 2013 21:43:24 -0500
Received: by mail-qc0-f179.google.com with SMTP id i8so5837830qcq.38
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Dec 2013 18:43:23 -0800 (PST)
In-Reply-To: <1555673.59jhB0RKpX@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Yadwinder Singh Brar <yadi.brar@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, jonghwa3.lee@samsung.com, Douglas Anderson <dianders@chromium.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Hi Tomasz,

On Wed, Dec 11, 2013 at 5:59 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Abhilash,
>
> [dropping invalid address of DT mailing list]
>
> Please see my comments inline.
>
> On Wednesday 11 of December 2013 17:27:06 Abhilash Kesavan wrote:
>> For the six local power blocks - MFC, DISP1, GSC, MAU, G3D and ISP
>> the respective CMU_RESET, CMU_SYSCLK and CMU_CLKSTOP registers need
>> to be low initially for normal mode on Exynos5250.
>> Also fix the corresponding AFTR and LPA configurations.
>>
>> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
>> ---
>>  arch/arm/mach-exynos/pmu.c |   66 ++++++++++++++++++++++++++++++++------------
>>  1 file changed, 48 insertions(+), 18 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/pmu.c b/arch/arm/mach-exynos/pmu.c
>> index 97d6885..5f4d26b 100644
>> --- a/arch/arm/mach-exynos/pmu.c
>> +++ b/arch/arm/mach-exynos/pmu.c
>> @@ -296,24 +296,24 @@ static struct exynos_pmu_conf exynos5250_pmu_config[] = {
>>       { EXYNOS5_G3D_SYS_PWR_REG,                      { 0x7, 0x0, 0x0} },
>>       { EXYNOS5_DISP1_SYS_PWR_REG,                    { 0x7, 0x0, 0x0} },
>>       { EXYNOS5_MAU_SYS_PWR_REG,                      { 0x7, 0x7, 0x0} },
>> -     { EXYNOS5_CMU_CLKSTOP_GSCL_SYS_PWR_REG,         { 0x1, 0x0, 0x0} },
>> -     { EXYNOS5_CMU_CLKSTOP_ISP_SYS_PWR_REG,          { 0x1, 0x0, 0x0} },
>> -     { EXYNOS5_CMU_CLKSTOP_MFC_SYS_PWR_REG,          { 0x1, 0x0, 0x0} },
>> -     { EXYNOS5_CMU_CLKSTOP_G3D_SYS_PWR_REG,          { 0x1, 0x0, 0x0} },
>> -     { EXYNOS5_CMU_CLKSTOP_DISP1_SYS_PWR_REG,        { 0x1, 0x0, 0x0} },
>> -     { EXYNOS5_CMU_CLKSTOP_MAU_SYS_PWR_REG,          { 0x1, 0x1, 0x0} },
>> -     { EXYNOS5_CMU_SYSCLK_GSCL_SYS_PWR_REG,          { 0x1, 0x0, 0x0} },
>> -     { EXYNOS5_CMU_SYSCLK_ISP_SYS_PWR_REG,           { 0x1, 0x0, 0x0} },
>> -     { EXYNOS5_CMU_SYSCLK_MFC_SYS_PWR_REG,           { 0x1, 0x0, 0x0} },
>> -     { EXYNOS5_CMU_SYSCLK_G3D_SYS_PWR_REG,           { 0x1, 0x0, 0x0} },
>> -     { EXYNOS5_CMU_SYSCLK_DISP1_SYS_PWR_REG,         { 0x1, 0x0, 0x0} },
>> -     { EXYNOS5_CMU_SYSCLK_MAU_SYS_PWR_REG,           { 0x1, 0x1, 0x0} },
>> -     { EXYNOS5_CMU_RESET_GSCL_SYS_PWR_REG,           { 0x1, 0x0, 0x0} },
>> -     { EXYNOS5_CMU_RESET_ISP_SYS_PWR_REG,            { 0x1, 0x0, 0x0} },
>> -     { EXYNOS5_CMU_RESET_MFC_SYS_PWR_REG,            { 0x1, 0x0, 0x0} },
>> -     { EXYNOS5_CMU_RESET_G3D_SYS_PWR_REG,            { 0x1, 0x0, 0x0} },
>> -     { EXYNOS5_CMU_RESET_DISP1_SYS_PWR_REG,          { 0x1, 0x0, 0x0} },
>> -     { EXYNOS5_CMU_RESET_MAU_SYS_PWR_REG,            { 0x1, 0x1, 0x0} },
>> +     { EXYNOS5_CMU_CLKSTOP_GSCL_SYS_PWR_REG,         { 0x0, 0x0, 0x0} },
>> +     { EXYNOS5_CMU_CLKSTOP_ISP_SYS_PWR_REG,          { 0x0, 0x0, 0x0} },
>> +     { EXYNOS5_CMU_CLKSTOP_MFC_SYS_PWR_REG,          { 0x0, 0x0, 0x0} },
>> +     { EXYNOS5_CMU_CLKSTOP_G3D_SYS_PWR_REG,          { 0x0, 0x0, 0x0} },
>> +     { EXYNOS5_CMU_CLKSTOP_DISP1_SYS_PWR_REG,        { 0x0, 0x0, 0x0} },
>> +     { EXYNOS5_CMU_CLKSTOP_MAU_SYS_PWR_REG,          { 0x0, 0x0, 0x0} },
>> +     { EXYNOS5_CMU_SYSCLK_GSCL_SYS_PWR_REG,          { 0x0, 0x0, 0x0} },
>> +     { EXYNOS5_CMU_SYSCLK_ISP_SYS_PWR_REG,           { 0x0, 0x0, 0x0} },
>> +     { EXYNOS5_CMU_SYSCLK_MFC_SYS_PWR_REG,           { 0x0, 0x0, 0x0} },
>> +     { EXYNOS5_CMU_SYSCLK_G3D_SYS_PWR_REG,           { 0x0, 0x0, 0x0} },
>> +     { EXYNOS5_CMU_SYSCLK_DISP1_SYS_PWR_REG,         { 0x0, 0x0, 0x0} },
>> +     { EXYNOS5_CMU_SYSCLK_MAU_SYS_PWR_REG,           { 0x0, 0x0, 0x0} },
>> +     { EXYNOS5_CMU_RESET_GSCL_SYS_PWR_REG,           { 0x0, 0x0, 0x0} },
>> +     { EXYNOS5_CMU_RESET_ISP_SYS_PWR_REG,            { 0x0, 0x0, 0x0} },
>> +     { EXYNOS5_CMU_RESET_MFC_SYS_PWR_REG,            { 0x0, 0x0, 0x0} },
>> +     { EXYNOS5_CMU_RESET_G3D_SYS_PWR_REG,            { 0x0, 0x0, 0x0} },
>> +     { EXYNOS5_CMU_RESET_DISP1_SYS_PWR_REG,          { 0x0, 0x0, 0x0} },
>> +     { EXYNOS5_CMU_RESET_MAU_SYS_PWR_REG,            { 0x0, 0x0, 0x0} },
>>       { PMU_TABLE_END,},
>>  };
>>
>> @@ -337,6 +337,27 @@ static void __iomem *exynos5_list_diable_wfi_wfe[] = {
>>       EXYNOS5_ISP_ARM_OPTION,
>>  };
>>
>> +void __iomem *exynos5_list_disable_pmu_reg[] = {
>
> static void __iomem * const exynos5_list_disable_pmu_reg[] = {

Will fix and re-post.
>
> Best regards,
> Tomasz
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

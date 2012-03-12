From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 2/3] ARM: EXYNOS: Add clkdev lookup entry for lcd clock
Date: Mon, 12 Mar 2012 14:23:02 +0530
Message-ID: <4F5DB96E.3080506@linaro.org>
References: <1322718611-20934-1-git-send-email-tushar.behera@linaro.org> <1322718611-20934-3-git-send-email-tushar.behera@linaro.org> <4F4DBB68.6000108@linaro.org> <CACNz9cV39Nbb0vMGc7xhb7tcFkcMWt_hCaR327oBUKZiGnSQPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:36543 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752724Ab2CLIxH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Mar 2012 04:53:07 -0400
Received: by dajr28 with SMTP id r28so4902865daj.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Mar 2012 01:53:07 -0700 (PDT)
In-Reply-To: <CACNz9cV39Nbb0vMGc7xhb7tcFkcMWt_hCaR327oBUKZiGnSQPQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chenglie He <chengjie.he@linaro.org>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org, patches@linaro.org

On 03/10/2012 07:52 PM, Chenglie He wrote:
> I am doing the suspend and resume of s3cfb on exynos. the clk_on and
> clk_off just failed. I think this is a related issue.
> 
Without this patch, the probe for s3cfb driver itself fails - hence what
you are seeing must be different.

> On 29 February 2012 13:45, Tushar Behera <tushar.behera@linaro.org> wrote:
> 
>> Hi Kukjin,
>>
>> On 12/01/2011 11:20 AM, Tushar Behera wrote:
>>> The framebuffer driver needs the clock named 'lcd' as its bus
>>> clock but the equivalent clock on Exynos4 is named as 'fimd'.
>>> Hence, create a clkdev lookup entry with the name 'lcd' that
>>> references the 'fimd' clock.
>>>
>>> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
>>> ---
>>>  arch/arm/mach-exynos/clock.c |   14 +++++++++-----
>>>  1 files changed, 9 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/arch/arm/mach-exynos/clock.c b/arch/arm/mach-exynos/clock.c
>>> index 5d8d483..607ec28 100644
>>> --- a/arch/arm/mach-exynos/clock.c
>>> +++ b/arch/arm/mach-exynos/clock.c
>>> @@ -489,11 +489,6 @@ static struct clk init_clocks_off[] = {
>>>               .enable         = exynos4_clk_ip_cam_ctrl,
>>>               .ctrlbit        = (1 << 3),
>>>       }, {
>>> -             .name           = "fimd",
>>> -             .devname        = "exynos4-fb.0",
>>> -             .enable         = exynos4_clk_ip_lcd0_ctrl,
>>> -             .ctrlbit        = (1 << 0),
>>> -     }, {
>>>               .name           = "hsmmc",
>>>               .devname        = "s3c-sdhci.0",
>>>               .parent         = &clk_aclk_133.clk,
>>> @@ -782,6 +777,13 @@ static struct clk clk_pdma1 = {
>>>       .ctrlbit        = (1 << 1),
>>>  };
>>>
>>> +static struct clk clk_fimd0 = {
>>> +     .name           = "fimd",
>>> +     .devname        = "exynos4-fb.0",
>>> +     .enable         = exynos4_clk_ip_lcd0_ctrl,
>>> +     .ctrlbit        = (1 << 0),
>>> +};
>>> +
>>>  struct clk *clkset_group_list[] = {
>>>       [0] = &clk_ext_xtal_mux,
>>>       [1] = &clk_xusbxti,
>>> @@ -1294,6 +1296,7 @@ static struct clksrc_clk *sysclks[] = {
>>>  static struct clk *clk_cdev[] = {
>>>       &clk_pdma0,
>>>       &clk_pdma1,
>>> +     &clk_fimd0,
>>>  };
>>>
>>>  static struct clksrc_clk *clksrc_cdev[] = {
>>> @@ -1318,6 +1321,7 @@ static struct clk_lookup exynos4_clk_lookup[] = {
>>>       CLKDEV_INIT("s3c-sdhci.3", "mmc_busclk.2", &clk_sclk_mmc3.clk),
>>>       CLKDEV_INIT("dma-pl330.0", "apb_pclk", &clk_pdma0),
>>>       CLKDEV_INIT("dma-pl330.1", "apb_pclk", &clk_pdma1),
>>> +     CLKDEV_INIT("exynos4-fb.0", "lcd", &clk_fimd0),
>>>  };
>>>
>>>  static int xtal_rate;
>>
>> Would you please review this patch and let me know your opinion? Without
>> this patch, frame-buffer support on EXYNOS4 is broken.
>>
>> --
>> Tushar Behera
>>
>> _______________________________________________
>> linaro-dev mailing list
>> linaro-dev@lists.linaro.org
>> http://lists.linaro.org/mailman/listinfo/linaro-dev
>>
> 


-- 
Tushar Behera

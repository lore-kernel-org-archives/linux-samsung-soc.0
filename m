From: Shaik Ameer Basha <shaik.samsung@gmail.com>
Subject: Re: [PATCH v3 1/2] ARM: EXYNOS: Add clock support for Gscaler
Date: Wed, 1 Aug 2012 12:37:19 +0530
Message-ID: <CAOD6ATqdyS=B=es0sbgVUK+0C77yfci_OKE7EB478LhWikL5qQ@mail.gmail.com>
References: <1342789723-3949-1-git-send-email-shaik.ameer@samsung.com>
	<1342789723-3949-2-git-send-email-shaik.ameer@samsung.com>
	<033101cd6fae$53b4c180$fb1e4480$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:34905 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752412Ab2HAHHU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Aug 2012 03:07:20 -0400
Received: by vcbfk26 with SMTP id fk26so6728259vcb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Aug 2012 00:07:19 -0700 (PDT)
In-Reply-To: <033101cd6fae$53b4c180$fb1e4480$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Shaik Ameer Basha <shaik.ameer@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, sy0816.kang@samsung.com, olofj@google.com, thomas.ab@samsung.com, sylvester.nawrocki@gmail.com, sachin.kamat@linaro.org, joshi@samsung.com

Hi Kukjin Kim,

thanks for the review comments.

On Wed, Aug 1, 2012 at 11:54 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Shaik Ameer Basha wrote:
>>
>> Add required clock support for Gscaler for exynos5
>>
>> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
>> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
>> Signed-off-by: Prathyush K <prathyush.k@samsung.com>
>> Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
>> ---
>>  arch/arm/mach-exynos/clock-exynos5.c |  100
>> ++++++++++++++++++++++++++++++++++
>>  1 files changed, 100 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-
>> exynos/clock-exynos5.c
>> index 774533c..49a76b1 100644
>> --- a/arch/arm/mach-exynos/clock-exynos5.c
>> +++ b/arch/arm/mach-exynos/clock-exynos5.c
>> @@ -552,6 +552,81 @@ static struct clksrc_clk exynos5_clk_aclk_66 = {
>>       .reg_div = { .reg = EXYNOS5_CLKDIV_TOP0, .shift = 0, .size = 3 },
>>  };
>>
>> +/* for aclk_300_gscl_mid */
>
> No need above comment which is certain.
>

Ok. I will remove all unnecessary comments.

>> +static struct clksrc_clk exynos5_clk_mout_aclk_300_gscl_mid = {
>> +     .clk = {
>> +             .name           = "mout_aclk_300_gscl_mid",
>> +     },
>> +     .sources = &exynos5_clkset_aclk,
>> +     .reg_src = { .reg = EXYNOS5_CLKSRC_TOP0, .shift = 24, .size = 1 },
>> +};
>> +
>> +/* for aclk_300_gscl_mid1 */
>
> Same as above.
>
>> +static struct clk *exynos5_clkset_aclk_300_gscl_mid1_list[] = {
>> +     [0] = &exynos5_clk_sclk_vpll.clk,
>> +     [1] = &exynos5_clk_mout_cpll.clk,
>> +};
>
> In this case, the above sources can be used for gscl_mid1 and disp1_mid as
> well. So how about exynos5_clkset_mid1_list?

yes. you are right.
I will change the name as per your suggestion. (i.e.,  exynos5_clkset_mid1_list)

>
>> +
>> +static struct clksrc_sources exynos5_clkset_aclk_300_gscl_mid1 = {
>> +     .sources        = exynos5_clkset_aclk_300_gscl_mid1_list,
>> +     .nr_sources     =
> ARRAY_SIZE(exynos5_clkset_aclk_300_gscl_mid1_list),
>> +};
>
> If so, need to update this.

Ok. I will update here too...

>
>> +
>> +
>
> no need double empty lines.

ok. will remove the extra lines.

>
>> +static struct clksrc_clk exynos5_clk_mout_aclk_300_gscl_mid1 = {
>> +     .clk    = {
>> +             .name           = "mout_aclk_300_gscl_mid1",
>> +     },
>> +     .sources = &exynos5_clkset_aclk_300_gscl_mid1,
>> +     .reg_src = { .reg = EXYNOS5_CLKSRC_TOP1, .shift = 12, .size = 1 },
>> +};
>> +
>> +/* for aclk_300_gscl */
>
> no need useless comment.
>
>> +static struct clk *exynos5_clkset_aclk_300_gscl_list[] = {
>> +     [0] = &exynos5_clk_mout_aclk_300_gscl_mid.clk,
>> +     [1] = &exynos5_clk_mout_aclk_300_gscl_mid1.clk,
>> +};
>> +
>> +static struct clksrc_sources exynos5_clkset_aclk_300_gscl = {
>> +     .sources        = exynos5_clkset_aclk_300_gscl_list,
>> +     .nr_sources     = ARRAY_SIZE(exynos5_clkset_aclk_300_gscl_list),
>> +};
>> +
>> +static struct clksrc_clk exynos5_clk_mout_aclk_300_gscl = {
>> +     .clk    = {
>             ^^^^
> Tap please.

Ok. i will change that.

>
>> +             .name           = "mout_aclk_300_gscl",
>> +     },
>> +     .sources = &exynos5_clkset_aclk_300_gscl,
>> +     .reg_src = { .reg = EXYNOS5_CLKSRC_TOP0, .shift = 25, .size = 1 },
>> +};
>> +
>> +static struct clksrc_clk exynos5_clk_dout_aclk_300_gscl = {
>> +     .clk    = {
>             ^^^^
> Same as above.

Ok. i will change that.

>
>> +             .name           = "dout_aclk_300_gscl",
>> +             .parent         = &exynos5_clk_mout_aclk_300_gscl.clk,
>> +     },
>> +     .reg_div = { .reg = EXYNOS5_CLKDIV_TOP1, .shift = 12, .size = 3 },
>> +};
>
> And I think, we don't need to define above 'clksrc_clk's?
>

Sorry. you are right. i will remove that.

> +static struct clksrc_clk exynos5_clk_mdout_aclk_300_gscl = {
> +       .clk    = {
> +               .name           = "mdout_aclk_300_gscl",
> +       },
> +       .sources = &exynos5_clkset_aclk_300_gscl,
> +       .reg_src = { .reg = EXYNOS5_CLKSRC_TOP0, .shift = 25, .size = 1 },
>> +     .reg_div = { .reg = EXYNOS5_CLKDIV_TOP1, .shift = 12, .size = 3 },
> +};
>
> [...]
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>

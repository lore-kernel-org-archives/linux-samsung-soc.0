From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] clk: samsung: clk-exynos-audss: Fix module autoload
Date: Sun, 16 Oct 2016 10:44:41 -0300
Message-ID: <521c63ea-2564-1739-696f-bc9178eab838@osg.samsung.com>
References: <1476470645-22159-1-git-send-email-javier@osg.samsung.com>
 <20161015172711.GA6465@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:32770
        "EHLO s-opensource.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754399AbcJPNpi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 16 Oct 2016 09:45:38 -0400
In-Reply-To: <20161015172711.GA6465@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org

Hello Krzysztof,

On 10/15/2016 02:27 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 14, 2016 at 03:44:05PM -0300, Javier Martinez Canillas wrote:
>> If the driver is built as a module, autoload won't work because the module
>> alias information is not filled. So user-space can't match the registered
>> device with the corresponding module.
>>
>> Export the module alias information using the MODULE_DEVICE_TABLE() macro.
>>
>> Before this patch:
>>
>> $ modinfo drivers/clk/samsung/clk-exynos-audss.ko | grep alias
>> alias:          platform:exynos-audss-clk
>>
>> After this patch:
>>
>> $ modinfo drivers/clk/samsung/clk-exynos-audss.ko | grep alias
>> alias:          platform:exynos-audss-clk
>> alias:          of:N*T*Csamsung,exynos5420-audss-clockC*
>> alias:          of:N*T*Csamsung,exynos5420-audss-clock
>> alias:          of:N*T*Csamsung,exynos5410-audss-clockC*
>> alias:          of:N*T*Csamsung,exynos5410-audss-clock
>> alias:          of:N*T*Csamsung,exynos5250-audss-clockC*
>> alias:          of:N*T*Csamsung,exynos5250-audss-clock
>> alias:          of:N*T*Csamsung,exynos4210-audss-clockC*
>> alias:          of:N*T*Csamsung,exynos4210-audss-clock
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>> ---
>>
>>  drivers/clk/samsung/clk-exynos-audss.c | 1 +
>>  1 file changed, 1 insertion(+)
> 
> Indeed, this was missed by 4d252fd5719b thus I think it could be
> mentioned as fix tag (just for reference...):
> Fixes: 4d252fd5719b ("clk: samsung: Allow modular build of the Audio Subsystem CLKCON driver")
>

Indeed. I missed that, sorry. I'll post a v2 including this information.
 
> Anyway, this fixes the issue, so:
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Tested-by: Krzysztof Kozlowski <krzk@kernel.org>
>

Thanks!
 
> Best regards,
> Krzysztof
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America

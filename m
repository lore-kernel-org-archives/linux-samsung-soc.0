From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH V2 6/7] ARM: EXYNOS5: Add the bus clock for FIMD
Date: Mon, 23 Jul 2012 18:54:33 +0900
Message-ID: <500D1F59.9030807@samsung.com>
References: <1342591053-7092-1-git-send-email-l.krishna@samsung.com>
 <1342591053-7092-7-git-send-email-l.krishna@samsung.com>
 <500D0C8B.3080007@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:56802 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751126Ab2GWJyW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jul 2012 05:54:22 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7L00ACRY6L43D0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 23 Jul 2012 18:54:21 +0900 (KST)
Received: from [10.90.51.60] by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0M7L00162Y6K1UA0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 23 Jul 2012 18:54:20 +0900 (KST)
In-reply-to: <500D0C8B.3080007@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
Cc: Leela Krishna Amudala <l.krishna@samsung.com>, kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, jg1.han@samsung.com, joshi@samsung.com, grant.likely@secretlab.ca, linux-samsung-soc@vger.kernel.org, thomas.ab@samsung.com, olofj@google.com, linux-arm-kernel@lists.infradead.org

Hi, Jingoo.

On 07/23/2012 05:34 PM, Joonyoung Shim wrote:
> On 07/18/2012 02:57 PM, Leela Krishna Amudala wrote:
>> This patch adds the bus clock for FIMD and changes
>> the device name for lcd clock
>
> Please refer below patch for exynos4.
>
> http://lists.linaro.org/pipermail/linaro-dev/2011-December/008872.html
>
>> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
>> ---
>>   arch/arm/mach-exynos/clock-exynos5.c |    7 ++++++-
>>   1 files changed, 6 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/clock-exynos5.c 
>> b/arch/arm/mach-exynos/clock-exynos5.c
>> index 774533c..f001876 100644
>> --- a/arch/arm/mach-exynos/clock-exynos5.c
>> +++ b/arch/arm/mach-exynos/clock-exynos5.c
>> @@ -634,6 +634,11 @@ static struct clk exynos5_init_clocks_off[] = {
>>           .enable        = exynos5_clk_ip_disp1_ctrl,
>>           .ctrlbit    = (1 << 3),
>>       }, {
>> +        .name           = "fimd",
>> +        .devname        = "exynos5-fb",
>> +        .enable         = exynos5_clk_ip_disp1_ctrl,
>> +        .ctrlbit        = (1 << 0),
>> +    }, {

With this patch, it causes below error at the DP driver because fimd 
clock is disabled.

[    0.210000] exynos-dp exynos-dp: Timeout of video streamclk ok
[    0.210000] exynos-dp exynos-dp: unable to config video
[    0.210000] exynos-dp: probe of exynos-dp failed with error -110

I wonder fimd clock has any dependency with DP

Thanks.

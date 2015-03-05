From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos4: add nodes for jpeg codec
Date: Thu, 05 Mar 2015 13:48:02 +0100
Message-ID: <54F85082.9050205@samsung.com>
References: <1425558488-7039-1-git-send-email-m.szyprowski@samsung.com>
 <CABxcv=nq4v_L4De=nXrhKuXGgGxVPYKohvWRxq2c9=io2Mf6TQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:27311 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751170AbbCEMsH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Mar 2015 07:48:07 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NKQ001SVP2ZYR50@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 05 Mar 2015 12:52:11 +0000 (GMT)
In-reply-to: <CABxcv=nq4v_L4De=nXrhKuXGgGxVPYKohvWRxq2c9=io2Mf6TQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>

Hello,

On 2015-03-05 13:41, Javier Martinez Canillas wrote:
> Hello Marek,
>
> Patch looks good to me. Just a small comment below so feel free to add my
>
> Reviewed by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>
> On Thu, Mar 5, 2015 at 1:28 PM, Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> This patch adds nodes for hardware JPEG codec found in Exynos 4210 and
>> 4x12 SoCs.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   arch/arm/boot/dts/exynos4.dtsi    | 9 +++++++++
>>   arch/arm/boot/dts/exynos4x12.dtsi | 4 ++++
>>   2 files changed, 13 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
>> index 77ea547..1bd630a 100644
>> --- a/arch/arm/boot/dts/exynos4.dtsi
>> +++ b/arch/arm/boot/dts/exynos4.dtsi
>> @@ -685,6 +685,15 @@
>>                  #include "exynos4412-tmu-sensor-conf.dtsi"
>>          };
>>
>> +       jpeg-codec@11840000 {
>> +               compatible = "samsung,exynos4210-jpeg";
>> +               reg = <0x11840000 0x1000>;
>> +               interrupts = <0 88 0>;
>> +               clocks = <&clock CLK_JPEG>;
>> +               clock-names = "jpeg";
>> +               samsung,power-domain = <&pd_cam>;
> Shouldn't you use the generic "power-domains" property here instead?

Definitely. I've missed that after rebasing my local tree...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

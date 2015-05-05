From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH RESEND] ARM: dts: exynos3250: add JPEG codec device node
Date: Tue, 05 May 2015 09:20:24 +0200
Message-ID: <55486F38.7080508@samsung.com>
References: <1422027597-12984-1-git-send-email-j.anaszewski@samsung.com>
 <55484E6E.20906@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:24202 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756539AbbEEHU1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 May 2015 03:20:27 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NNV0052O8E1XQ20@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 May 2015 08:20:25 +0100 (BST)
In-reply-to: <55484E6E.20906@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, Kukjin Kim <kgene@kernel.org>

On 05/05/2015 07:00 AM, Krzysztof Kozlowski wrote:
> W dniu 24.01.2015 o 00:39, Jacek Anaszewski pisze:
>> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>> Tested-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> Cc: Kukjin Kim <kgene@kernel.org>
>> ---
>>   arch/arm/boot/dts/exynos3250.dtsi |   13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
>> index 2246549..3c043d9 100644
>> --- a/arch/arm/boot/dts/exynos3250.dtsi
>> +++ b/arch/arm/boot/dts/exynos3250.dtsi
>> @@ -228,6 +228,19 @@
>>   			interrupts = <0 240 0>;
>>   		};
>>
>> +		jpeg: codec@11830000 {
>> +			compatible = "samsung,exynos3250-jpeg";
>> +			reg = <0x11830000 0x1000>;
>> +			interrupts = <0 171 0>;
>> +			clocks = <&cmu CLK_JPEG>, <&cmu CLK_SCLK_JPEG>;
>> +			clock-names = "jpeg", "sclk";
>> +			samsung,power-domain = <&pd_cam>;
>
> Please switch to generic binding: power-domains.

I've sent updated version, thanks.

-- 
Best Regards,
Jacek Anaszewski

From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v4] ARM: dts: exynos3250: add MFC codec device node
Date: Mon, 15 Sep 2014 13:45:09 +0200
Message-ID: <5416D145.5080402@samsung.com>
References: <1410268169-18424-1-git-send-email-j.anaszewski@samsung.com>
 <1410268169-18424-2-git-send-email-j.anaszewski@samsung.com>
 <541479F3.2030907@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:64843 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753526AbaIOLpN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Sep 2014 07:45:13 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NBX007MHY41A800@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 15 Sep 2014 12:48:01 +0100 (BST)
In-reply-to: <541479F3.2030907@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>

Hi Kukjin,

On 09/13/2014 07:08 PM, Kukjin Kim wrote:
> On 09/09/14 22:09, Jacek Anaszewski wrote:
>> Signed-off-by: Jacek Anaszewski<j.anaszewski@samsung.com>
>> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
>> Cc: Kukjin Kim<kgene.kim@samsung.com>
>> ---
>>   arch/arm/boot/dts/exynos3250.dtsi |   12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos3250.dtsi
>> b/arch/arm/boot/dts/exynos3250.dtsi
>> index bbc1e4c..95cc5a1 100644
>> --- a/arch/arm/boot/dts/exynos3250.dtsi
>> +++ b/arch/arm/boot/dts/exynos3250.dtsi
>> @@ -294,6 +294,18 @@
>>               status = "disabled";
>>           };
>>
>> +        mfc-codec@13400000 {
>
> mfc: codec@13400000 {
>
>> +            compatible = "samsung,mfc-v7";
>> +            reg =<0x13400000 0x10000>;
>> +            interrupts =<0 102 0>;
>> +            clock-names = "mfc", "sclk_mfc";
>> +            clocks =<&cmu CLK_MFC>,<&cmu CLK_SCLK_MFC>;
>> +            #address-cells =<1>;
>> +            #size-cells =<0>;
>
> are the address-cells and size-cells required here?

They are not. I overlooked this.

>> +            samsung,power-domain =<&pd_mfc>;
>> +            status = "disabled";
>> +        };
>> +
>>           serial_0: serial@13800000 {
>>               compatible = "samsung,exynos4210-uart";
>>               reg =<0x13800000 0x100>;
>
> - Kukjin
>

Best Regards,
Jacek Anaszewski

From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] ARM: dts: Add I2S dt node for Exynos3250
Date: Fri, 04 Jul 2014 18:18:14 +0900
Message-ID: <53B67156.2020702@samsung.com>
References: <1404373939-10510-1-git-send-email-cw00.choi@samsung.com>
 <53B66066.4030202@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:21595 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752028AbaGDJSR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jul 2014 05:18:17 -0400
In-reply-to: <53B66066.4030202@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux@arm.linux.org.uk, kgene.kim@samsung.com, t.figa@samsung.com, kyungmin.park@samsung.com, ideal.song@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Dear Kukjin and Tomasz,

On 07/04/2014 05:05 PM, Tomasz Figa wrote:
> Hi Chanwoo,
> 
> On 03.07.2014 09:52, Chanwoo Choi wrote:
>> From: Tomasz Figa <t.figa@samsung.com>
>>
>> This patch add I2S (Inter-IC Sound) dt node which supports 1-port stereo
>> (1 channels) IIS-bus for audio interface with DMA-based operation.
>>
>> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
>> Signed-off-by: Inha Song <ideal.song@samsung.com>
>> Tested-by: Inha Song <ideal.song@samsung.com>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos3250.dtsi | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
>> index 1f8384f..e9017ef 100644
>> --- a/arch/arm/boot/dts/exynos3250.dtsi
>> +++ b/arch/arm/boot/dts/exynos3250.dtsi
>> @@ -644,6 +644,19 @@
>>  			status = "disabled";
>>  		};
>>  
>> +		i2s: i2s@13970000 {
> 
> Shouldn't the label be rather called "i2s2" as the pinctrl entry below
> suggests?
> 
>> +			compatible = "samsung,s3c6410-i2s";
>> +			reg = <0x13970000 0x100>;
>> +			interrupts = <0 126 0>;
>> +			clocks = <&cmu CLK_I2S>, <&cmu CLK_SCLK_I2S>;
>> +			clock-names = "iis", "i2s_opclk0";
>> +			dmas = <&pdma0 14>, <&pdma0 13>;
>> +			dma-names = "tx", "rx";
>> +			pinctrl-0 = <&i2s2_bus>;
>> +			pinctrl-name = "default";
> 
> "pinctrl-name" is not a valid property. I suppose it should be
> "pinctrl-names".

I modify this patch as following. If you confirm following patch, I'll re-send patchset(v2).

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 3e678fa..77a06df 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -425,6 +425,19 @@
 			status = "disabled";
 		};
 
+		i2s2: i2s@13970000 {
+			compatible = "samsung,s3c6410-i2s";
+			reg = <0x13970000 0x100>;
+			interrupts = <0 126 0>;
+			clocks = <&cmu CLK_I2S>, <&cmu CLK_SCLK_I2S>;
+			clock-names = "iis", "i2s_opclk0";
+			dmas = <&pdma0 14>, <&pdma0 13>;
+			dma-names = "tx", "rx";
+			pinctrl-0 = <&i2s2_bus>;
+			pinctrl-names = "default";
+			status = "disabled";
+		};
+
 		pwm: pwm@139D0000 {
 			compatible = "samsung,exynos4210-pwm";
 			reg = <0x139D0000 0x1000>;
-- 
1.8.0


Best Regards,
Chanwoo Choi

From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 1/3] ARM: dts: fix incorrect compatible for exynos4412
Date: Tue, 20 May 2014 01:10:38 +0900
Message-ID: <537A2CFE.9010202@samsung.com>
References: <53633D38.9000108@samsung.com> <5363DEBA.6080804@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:50794 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751596AbaESQKo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 May 2014 12:10:44 -0400
In-Reply-To: <5363DEBA.6080804@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Beomho Seo <beomho.seo@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Myungjoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>

On 05/03/14 03:06, Tomasz Figa wrote:
> On 02.05.2014 08:37, Beomho Seo wrote:
>> This patch fixed incorrect compatible for ak8975 magnetic sensor.
>> ak8975 magnetic sensor use compatible "ak8975" or "asahi-kasei,ak8975"
>> In this patch, use "asahi-kasei,ak8975" according to dt bindings
>> document.
>>
>> Signed-off-by: Beomho Seo <beomho.seo@samsung.com>
>> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
>> ---
>> Changes in v2:
>> - Compatible is changed according to device tree binding document.
>> ---
>> arch/arm/boot/dts/exynos4412-trats2.dts | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts
>> b/arch/arm/boot/dts/exynos4412-trats2.dts
>> index 3228506..1279a8a 100644
>> --- a/arch/arm/boot/dts/exynos4412-trats2.dts
>> +++ b/arch/arm/boot/dts/exynos4412-trats2.dts
>> @@ -494,7 +494,7 @@
>> status = "okay";
>>
>> ak8975@0c {
>> - compatible = "ak,ak8975";
>> + compatible = "asahi-kasei,ak8975";
>> reg = <0x0c>;
>> gpios = <&gpj0 7 0>;
>> };
>>
>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>
Applied, thanks.

- Kukjin

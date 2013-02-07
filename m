From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 1/5] ARM: dts: exynos5250-arndale: Add node entry for
 gpio-buttons
Date: Thu, 07 Feb 2013 11:56:15 +0530
Message-ID: <51134907.1050803@linaro.org>
References: <1360214129-4096-1-git-send-email-tushar.behera@linaro.org> <F3DBB1B3EF102E4994C89758CFCA32412C4E1A@DBDE01.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f174.google.com ([209.85.210.174]:35419 "EHLO
	mail-ia0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750920Ab3BGG0W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Feb 2013 01:26:22 -0500
Received: by mail-ia0-f174.google.com with SMTP id o25so2560879iad.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Feb 2013 22:26:22 -0800 (PST)
In-Reply-To: <F3DBB1B3EF102E4994C89758CFCA32412C4E1A@DBDE01.ent.ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Kumar, Anil" <anilkumar.v@ti.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "patches@linaro.org" <patches@linaro.org>

On 02/07/2013 11:47 AM, Kumar, Anil wrote:
> On Thu, Feb 07, 2013 at 10:45:25, Tushar Behera wrote:
>> Added GPIO buttons DT node to Arndale board file.
>>
>> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>> This series is based on for-next branch of Kukjin Kim's tree
>> and added on top of the below patch:
>> https://patchwork.kernel.org/patch/2042451/
>> ---
>>  arch/arm/boot/dts/exynos5250-arndale.dts |   48 ++++++++++++++++++++++++++++++
>>  1 files changed, 48 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
>> index 63572f9..9ce40df 100644
>> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
>> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
>> @@ -119,4 +119,52 @@
>>  	spi_2: spi@12d40000 {
>>  		status = "disabled";
>>  	};
>> +
>> +	gpio_keys {
>> +		compatible = "gpio-keys";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
> 
> Just want to understand why these properties are here?  
> As these properties are for child dt node. But have not seen
> anyone is using here.
> 

That is how gpio_keys node entries are defined in other .dts files.

-- 
Tushar Behera

From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 2/2] ARM: EXYNOS: Set HDMI platform data in Origen board
Date: Thu, 05 Apr 2012 18:41:19 +0530
Message-ID: <4F7D99F7.4070206@linaro.org>
References: <1333614296-13256-1-git-send-email-tushar.behera@linaro.org> <1333614296-13256-3-git-send-email-tushar.behera@linaro.org> <4F7D67DA.2010105@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:52523 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752549Ab2DENLY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Apr 2012 09:11:24 -0400
Received: by pbcun15 with SMTP id un15so1535828pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Apr 2012 06:11:23 -0700 (PDT)
In-Reply-To: <4F7D67DA.2010105@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Stanislawski <t.stanislaws@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

On 04/05/2012 03:07 PM, Tomasz Stanislawski wrote:
> Hi Tushar Behera,
> 
> On 04/05/2012 10:24 AM, Tushar Behera wrote:
>> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
>> ---
>>  arch/arm/mach-exynos/mach-origen.c |    7 +++++++
>>  1 files changed, 7 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
>> index 878d4c9..ac6f78f 100644
>> --- a/arch/arm/mach-exynos/mach-origen.c
>> +++ b/arch/arm/mach-exynos/mach-origen.c
>> @@ -41,6 +41,7 @@
>>  #include <plat/pd.h>
>>  #include <plat/fb.h>
>>  #include <plat/mfc.h>
>> +#include <plat/hdmi.h>
>>  
>>  #include <mach/ohci.h>
>>  #include <mach/map.h>
>> @@ -671,6 +672,11 @@ static void __init origen_bt_setup(void)
>>  	s3c_gpio_setpull(EXYNOS4_GPX2(2), S3C_GPIO_PULL_NONE);
>>  }
>>  
>> +/* I2C module and id for HDMIPHY */
>> +static struct i2c_board_info hdmiphy_info = {
>> +	I2C_BOARD_INFO("hdmiphy", 0x38),
> 
> I warn you :) that the s5p-hdmiphy driver is going to use driver variant
> to handle per-platform setup arrays for HDMIPHY. Refer to patch
> 
> http://thread.gmane.org/gmane.linux.drivers.video-input-infrastructure/45756/focus=45757
> 
> If the mentioned patch gets merged into the mainline then the support
> for HDMI will be broken on your machine.
> 

Please correct me if I am wrong.

Above patch doesn't remove the usage of platform data, it is still
mandatory to pass platform data from board file. Hence I need to pass a
valid platform data structure to the driver.

With your current patch, won't it just ignore the hdmiphy_info passed
through the platform data and use driver variant to handle per-platform
setup arrays for HDMIPHY.

The reason I am worried is that the support for s5p-tv as such is broken
now because of mandatory usage of platform data. Had it not been the
case, the need for my patch won't have arised. :(

Nevertheless, what do you think is the best solution right now?

-- 
Tushar Behera

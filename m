From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 7/8] ARM: exynos_defconfig: Remove MAX77802 RTC Kconfig
 symbol
Date: Thu, 21 Jan 2016 12:14:16 -0300
Message-ID: <56A0F5C8.3050208@osg.samsung.com>
References: <1453310088-29985-1-git-send-email-javier@osg.samsung.com>
 <1453310088-29985-8-git-send-email-javier@osg.samsung.com>
 <56A03B3A.40709@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56A03B3A.40709@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 01/20/2016 10:58 PM, Krzysztof Kozlowski wrote:
> On 21.01.2016 02:14, Javier Martinez Canillas wrote:
>> The driver has been removed so the Kconfig symbol is not valid anymore.
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>> ---
>>
>>   arch/arm/configs/exynos_defconfig | 1 -
>>   1 file changed, 1 deletion(-)
>
> The patch should go after merging rtc-max77802 into rtc-max77686 to
> preserve bisectability on defconfig.
>

That's correct, same for 8/8.
  
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>

Thanks.
  
> Best regards,
> Krzysztof
>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America

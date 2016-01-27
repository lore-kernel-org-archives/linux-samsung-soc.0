From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 04/10] rtc: max77686: Use a driver data struct instead
 hard-coded values
Date: Wed, 27 Jan 2016 10:47:45 +0900
Message-ID: <56A821C1.6090402@samsung.com>
References: <1453836020-29579-1-git-send-email-javier@osg.samsung.com>
 <1453836020-29579-5-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1453836020-29579-5-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 27.01.2016 04:20, Javier Martinez Canillas wrote:
> The driver has some hard-coded values such as the minimum delay needed
> before a RTC update or the mask used for the sec/min/hour/etc registers.
> 
> Use a data structure that contains these values and pass as driver data
> using the platform device ID table for each device.
> 
> This allows to make the driver's ops callbacks more generic so other RTC
> that are similar but don't have the same values can also be supported.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
> 
> ---
> 
> Changes in v3:
> - Fix max77686 delay. Suggested by Krzysztof Kozlowski.
> - Assign mask to u8 instead of int. Suggested by Krzysztof Kozlowski.
> - Add Laxman Dewangan's Acked-by tag to patch #4.
> 
> Changes in v2:
> - Add a max77686 prefix to rtc_driver_data. Suggested by Krzysztof Kozlowski.
> - Comment about the .delay and .mask fields. Suggested by Krzysztof Kozlowski.
> - Change .mask type to u8. Suggested by Krzysztof Kozlowski.
> - Make .drv_data field const. Suggested by Krzysztof Kozlowski.
> - Don't cast to drop const on .drv_data asign. Suggested by Krzysztof Kozlowski.
> - Use platform_get_device_id() macro. Suggested by Krzysztof Kozlowski.
> 
>  drivers/rtc/rtc-max77686.c | 51 ++++++++++++++++++++++++++++++----------------
>  1 file changed, 34 insertions(+), 17 deletions(-)
> 

Tested on Trats2 (max77686):
Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

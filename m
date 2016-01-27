From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 05/10] rtc: max77686: Add an indirection level to access
 RTC registers
Date: Wed, 27 Jan 2016 10:53:05 +0900
Message-ID: <56A82301.1000301@samsung.com>
References: <1453836020-29579-1-git-send-email-javier@osg.samsung.com>
 <1453836020-29579-6-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1453836020-29579-6-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 27.01.2016 04:20, Javier Martinez Canillas wrote:
> The max77686 driver is generic enough that can be used for other
> Maxim RTC IP blocks but these might not have the same registers
> layout so instead of accessing the registers directly, add a map
> to translate offsets to the real registers addresses for each IP.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
> 
> ---
> 
> Changes in v3:
> - Add Laxman Dewangan's Acked-by tag to patch #5.
> 
> Changes in v2:
> - Rename rtc_reg to max77686_rtc_reg_offset. Suggested by Krzysztof Kozlowski.
> - Comment what's mapped by max77686_map. Suggested by Krzysztof Kozlowski.
> - Use max77686_map array indexes in init. Suggested by Krzysztof Kozlowski.
> - Remove REG_RTC_UPDATE1 since is not used by neither max77686 nor max77802.
> 
>  drivers/rtc/rtc-max77686.c | 90 ++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 80 insertions(+), 10 deletions(-)
> 

Thanks for changes, looks good now.

Tested on Trats2 (max77686):
Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

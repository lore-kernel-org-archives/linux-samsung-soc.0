From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH v2 06/10] rtc: max77686: Add max77802 support
Date: Fri, 22 Jan 2016 15:24:37 +0530
Message-ID: <56A1FC5D.5040506@nvidia.com>
References: <1453407813-14646-1-git-send-email-javier@osg.samsung.com> <1453407813-14646-7-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453407813-14646-7-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


On Friday 22 January 2016 01:53 AM, Javier Martinez Canillas wrote:
> The MAX77686 and MAX77802 RTC IP blocks are very similar with only
> these differences:
>
> 0) The RTC registers layout and addresses are different.
>
> 1) The MAX77686 use 1 bit of the sec/min/hour/etc registers as the
>     alarm enable while MAX77802 has a separate register for that.
>
> 2) The MAX77686 RTCYEAR register valid values range is 0..99 while
>     for MAX77802 is 0..199.
>
> 3) The MAX77686 has a separate I2C address for the RTC registers
>     while the MAX77802 uses the same I2C address as the PMIC regs.
>
> 5) The minimum delay before a RTC update (16 msecs vs 200 usecs).
>
> There are separate drivers for MAX77686 and MAX77802 RTC IP blocks
> but the differences are not that big so the driver can be extended
> to support both instead of duplicating a lot of code in 2 drivers.
>
> Suggested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>
Acked-by: Laxman Dewangan <ldewangan@nvidia.com>

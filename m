From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH] phy: exynos-mipi-video: avoid uninitialized variable use
Date: Thu, 26 May 2016 11:29:14 +0530
Message-ID: <574690B2.9010204@ti.com>
References: <1462971012-562097-1-git-send-email-arnd@arndb.de>
 <20160511185155.GB8265@kozik-lap> <14219690.YQPrXjp7cP@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:42136 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751134AbcEZF7v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 May 2016 01:59:51 -0400
In-Reply-To: <14219690.YQPrXjp7cP@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Arnd,

On Thursday 26 May 2016 12:24 AM, Arnd Bergmann wrote:
> On Wednesday, May 11, 2016 8:51:55 PM CEST Krzysztof Kozlowski wrote:
>> On Wed, May 11, 2016 at 02:49:53PM +0200, Arnd Bergmann wrote:
>>> A rework of the exynos-mipi-video driver caused a warning
>>> about the new __set_phy_state function potentially accessing
>>> a variable before its initialization:
>>>
>>> drivers/phy/phy-exynos-mipi-video.c: In function '__set_phy_state':
>>> drivers/phy/phy-exynos-mipi-video.c:238:13: error: 'val' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>>   return val & data->resetn_val;
>>>          ~~~~^~~~~~~~~~~~~~~~~~
>>> drivers/phy/phy-exynos-mipi-video.c:235:6: note: 'val' was declared here
>>>   u32 val;
>>>
>>> The failure scenario here is the offset passed into a the
>>> stub regmap_read() function that does not modify its output,
>>> however regmap_read() can also fail for other reasons, so
>>> adding error handling (in this case, returning zero from
>>> is_running) seems the best solution.
>>>
>>> Note that this warning showed up with the ARM s5pv210_defconfig,
>>> indicating that we most likely want to either enable CONFIG_REGMAP
>>> in that defconfig as well, or disable the phy-exynos-mipi-video
>>> driver.
>>>
>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>> Fixes: 97a3042f7616 ("phy: exynos-mipi-video: Rewrite handling of phy registers")
>>> ---
>>>  drivers/phy/phy-exynos-mipi-video.c | 6 +++++-
>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/phy/phy-exynos-mipi-video.c b/drivers/phy/phy-exynos-mipi-video.c
>>> index cc093ebfda94..8b851f718123 100644
>>> --- a/drivers/phy/phy-exynos-mipi-video.c
>>> +++ b/drivers/phy/phy-exynos-mipi-video.c
>>> @@ -233,8 +233,12 @@ static inline int __is_running(const struct exynos_mipi_phy_desc *data,
>>>                       struct exynos_mipi_video_phy *state)
>>>  {
>>>       u32 val;
>>
>> Other way would be to initialize val=0 since there is no real error code
>> returned. Anyway:
>>
>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> 
> This hasn't made it into linux-next yet, any chance we'll see it in -rc1 or -rc2?

Not in -rc1. Mostly it'll go in -rc2. Generally I start queuing patches after
-rc1 is tagged.

Thanks
Kishon

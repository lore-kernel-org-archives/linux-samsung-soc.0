From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 03/10] rtc: max77686: Use usleep_range() instead of
 msleep()
Date: Fri, 22 Jan 2016 10:02:17 +0900
Message-ID: <56A17F99.6080903@samsung.com>
References: <1453407813-14646-1-git-send-email-javier@osg.samsung.com>
 <1453407813-14646-4-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:64952 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750951AbcAVBCR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jan 2016 20:02:17 -0500
In-reply-to: <1453407813-14646-4-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org

On 22.01.2016 05:23, Javier Martinez Canillas wrote:
> Documentation/timers/timers-howto.txt suggest to use usleep_range()
> instead of msleep() for small msec (1ms - 20ms) since msleep() will
> often sleep for 20ms for any value in that range.
> 
> This is fine in this case since 16ms is the _minimum_ delay required
> by max77686 for an RTC update but by using usleep_range() instead of
> msleep(), the driver can support other RTC IP blocks with a shorter
> minimum delay (i.e: in the range of usecs instead of msecs).
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> ---
> 
> Changes in v2:
> - Add Krzysztof Kozlowski's Reviewed-by tag to patch #3.
> - Fix typo error in changelog. Suggested by Krzysztof Kozlowski.
> 
>  drivers/rtc/rtc-max77686.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Tested on Trats2 board with max77686:
Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

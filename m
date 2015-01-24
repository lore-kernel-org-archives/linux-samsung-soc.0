From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH v3] ARM: exynos_defconfig Enable CONFIG_LOCKUP_DETECTOR.
Date: Sat, 24 Jan 2015 13:55:23 +0900
Message-ID: <54C325BB.1010904@kernel.org>
References: <1421088614-4662-1-git-send-email-moon.linux@yahoo.com> <1421137088.8355.1.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:40342 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752375AbbAXEzb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jan 2015 23:55:31 -0500
In-Reply-To: <1421137088.8355.1.camel@AMDC1943>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Anand Moon <moon.linux@yahoo.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>, Sachin Kamat <sachin.kamat@samsung.com>, Vivek Gautam <gautam.vivek@samsung.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Tushar Behera <tushar.behera@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 01/13/15 17:18, Krzysztof Kozlowski wrote:
> On wto, 2015-01-13 at 00:20 +0530, Anand Moon wrote:
>> On enabling CONFIG_LOCKUP_DETECTOR the kernel to act as a watchdog
>> to detect hard and soft lockups. Enabling CONFIG_LOCKUP_DETECTOR
>> don't introduce much overhead on exyons SOC.
>>
>> CONFIG_LOCKUP_DETECTOR is enabled on multi_v7_defconfig.
>>
>> Changes since v3:
>>  * Made commit message more clear
>>  * Corrected difference between CONFIG_LOCKUP_DETECTOR and CONFIG_LOCKDEP.
>>
>> Tested on Exynos5422 ODROID XU3 board.
>>
>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> Signed-off-by: Anand Moon <moon.linux@yahoo.com>
> 
> Now it looks okay. My reviewed-by may stay on.
> 
Thanks, applied

- Kukjin

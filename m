From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 1/1] ARM: dts: Make DP a consumer of DISP1 power domain
 on Exynos5420
Date: Thu, 30 Apr 2015 02:32:16 +0200
Message-ID: <55417810.6070202@collabora.co.uk>
References: <1428870659-5525-1-git-send-email-javier.martinez@collabora.co.uk> <552F6750.6020306@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:55761 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751160AbbD3Acd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Apr 2015 20:32:33 -0400
In-Reply-To: <552F6750.6020306@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, kgene.kim@samsung.com
Cc: Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Kukjin,

On 04/16/2015 09:40 AM, Javier Martinez Canillas wrote:
> 
> On 04/12/2015 10:30 PM, Javier Martinez Canillas wrote:
>> Commit ea08de16eb1b ("ARM: dts: Add DISP1 power domain for exynos5420")
>> added a device node for the Exynos5420 DISP1 power domain but dit not
>> make the DP controller a consumer of that power domain.
>> 
>> This causes an "Unhandled fault: imprecise external abort" error if the
>> exynos-dp driver tries to access the DP controller registers and the PD
>> was turned off. This lead to a kernel panic and a complete system hang.
>> 
>> Make the DP controller device node a consumer of the DISP1 power domain
>> to ensure that the PD is turned on when the exynos-dp driver is probed.
>> 
>> Fixes: ea08de16eb1b ("ARM: dts: Add DISP1 power domain for exynos5420")
>> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> 
> Any comments about this patch?
> 
> It's very trivial but fixes a very important regression on Exynos5420 boards
> with display panel and Peach Pit and Pi have been broken since next-20150401.
> 
> This [0] is the Peach Pit boot log with yesteday's linux-next for example.
> 
> Best regards,
> Javier
> 
> [0]: http://arm-soc.lixom.net/bootlogs/next/next-20150415/pit-arm-exynos_defconfig.html
> 

It has been many weeks since this patch has been posted and linux-next
is still broken:

http://arm-soc.lixom.net/bootlogs/next/next-20150429/pi-arm-exynos_defconfig.html

Could you please apply $subject to fix the imprecise external abort issue.

Best regards,
Javier

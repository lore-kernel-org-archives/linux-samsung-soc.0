From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH v4 0/2] mmc: dw_mmc: exynos: Add HS400 support
Date: Thu, 15 Jan 2015 00:35:34 +0900
Message-ID: <54B68CC6.1040907@kernel.org>
References: <1421231446-4776-1-git-send-email-alim.akhtar@samsung.com> <54B67001.2090002@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:46140 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751930AbbANPfl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jan 2015 10:35:41 -0500
In-Reply-To: <54B67001.2090002@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, ulf.hansson@linaro.org, linux-samsung-soc@vger.kernel.org, tgih.jun@samsung.com, chris@printf.net, dianders@chromium.org, kgene@kernel.org, a.kesavan@samsung.com, alim.akhtar@gmail.com, linux-arm-kernel@lists.infradead.org

On 01/14/15 22:32, Jaehoon Chung wrote:
> Hi, Alim.
> 
> On 01/14/2015 07:30 PM, Alim Akhtar wrote:
>> This adds HS400 mode support for exynos dw_mmc host controller.
>>
>> Currently tested on Exynos5800-peach-pi platform for HS400 mode.
>> Tested HS200 mode with this series applied, HS200 still works.
>>
>> Appreciate testing on other exynos5/7 platform which supports emmc5.0
> 
> I will test this patch on exynos5/7 board.
> 

What's the result? :-) If it's OK, I'll take DT changes for exynos
stuff, I'm not sure about the driver changes though...

Thanks,
Kukjin

> Best Regards,
> Jaehoon Chung
>>
>> Changes in V4:
>> 	* drop the idea of changing existing binding for ciu_div as per [1]
>>         * addressed comments from Jaehoon Chung [2]
>>
>> [1] http://www.spinics.net/lists/linux-samsung-soc/msg40923.html
>> [2] http://www.spinics.net/lists/devicetree/msg64373.html
>>
>> Changes in V3:
>> 	rebased on ulf's next (commit: 607b448 mmc: core: Make tuning block patterns static)
>>
>> Seungwon Jeon (2):
>>   mmc: dw_mmc: exynos: Support eMMC's HS400 mode
>>   ARM: dts: Add HS400 support for exynos5420 and exynos5800
>>
>>  .../devicetree/bindings/mmc/exynos-dw-mshc.txt     |    7 +
>>  arch/arm/boot/dts/exynos5420-peach-pit.dts         |    4 +-
>>  arch/arm/boot/dts/exynos5420-pinctrl.dtsi          |    7 +
>>  arch/arm/boot/dts/exynos5420-smdk5420.dts          |    4 +-
>>  arch/arm/boot/dts/exynos5800-peach-pi.dts          |    4 +-
>>  drivers/mmc/host/dw_mmc-exynos.c                   |  187 ++++++++++++++++----
>>  drivers/mmc/host/dw_mmc-exynos.h                   |   19 +-
>>  drivers/mmc/host/dw_mmc.c                          |   16 +-
>>  drivers/mmc/host/dw_mmc.h                          |    2 +
>>  9 files changed, 212 insertions(+), 38 deletions(-)

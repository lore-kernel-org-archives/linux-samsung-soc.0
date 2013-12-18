From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 1/1] ARM: dts: add board dts file for EXYNOS4412 based
 TINY4412 board
Date: Thu, 19 Dec 2013 05:35:12 +0900
Message-ID: <52B20700.9010607@samsung.com>
References: <1387373039-4738-1-git-send-email-kasimling@gmail.com> <1486025.NpqSQkmkfm@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f42.google.com ([209.85.160.42]:45973 "EHLO
	mail-pb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756135Ab3LSUpo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Dec 2013 15:45:44 -0500
In-Reply-To: <1486025.NpqSQkmkfm@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Alex Ling <kasimling@gmail.com>, mark.rutland@arm.com, devicetree@vger.kernel.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, ijc+devicetree@hellion.org.uk, swarren@wwwdotorg.org, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 12/19/13 00:01, Tomasz Figa wrote:
> Hi Alex,
>
Hi,

> On Wednesday 18 of December 2013 21:23:59 Alex Ling wrote:
>> Add a minimal board dts file for EXYNOS4412 based FriendlyARM's
>> TINY4412 board. This patch including support peripherals like
>> UART, SD card on SDMMC2 port and GPIO connected LEDs.
>>
>> Signed-off-by: Alex Ling<kasimling@gmail.com>
>> ---
>> Changes for v2:
>>    - Clean up patch description
>>    - Fix LED labels as Tomasz's suggested
>>    - Fix style issues
>>
>>   arch/arm/boot/dts/Makefile                |    1 +
>>   arch/arm/boot/dts/exynos4412-tiny4412.dts |   93 +++++++++++++++++++++++++++++
>>   2 files changed, 94 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/exynos4412-tiny4412.dts
>
> Reviewed-by: Tomasz Figa<t.figa@samsung.com>
>
Thanks, applied.

- Kukjin

From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 0/3] Add Exynos5800 support
Date: Fri, 02 May 2014 22:14:38 +0900
Message-ID: <53639A3E.6090508@samsung.com>
References: <1399035821-25096-1-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:51342 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751901AbaEBNPD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 May 2014 09:15:03 -0400
In-Reply-To: <1399035821-25096-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, kgene.kim@samsung.com, dianders@chromium.org, olofj@google.com, t.figa@samsung.com, sachin.kamat@linaro.org, tushar.behera@linaro.org, arunkk.samsung@gmail.com

On 05/02/14 22:03, Arun Kumar K wrote:
> Exynos5800 is a derivative of Exynos5420 with higher
> clock speeds and most other IP blocks remaining the same
> except for a few.
> Due to the similarities with 5420, following is done to
> achieve maximum code re-use:
> - Use the same 5420 clock file with few changes for adding
>    extra 5800 clocks.
> - Include the 5420 dtsi into 5800 and override required
>    properties.
>
> This series is dependent on the following patches
> 1) Adding node labels for Exynos5420
>     https://patchwork.kernel.org/patch/4092701/
> 2) Adding pwm nodes for backlight
>     https://patchwork.kernel.org/patch/4101881/
>
> Alim Akhtar (1):
>    clk: exynos5420: Add 5800 specific clocks
>
> Arun Kumar K (2):
>    ARM: dts: Add Exynos5800 dt file
>    ARM: dts: Add peach-pi board support
>
>   .../devicetree/bindings/clock/exynos5420-clock.txt |    3 +-
>   arch/arm/boot/dts/Makefile                         |    3 +-
>   arch/arm/boot/dts/exynos5800-peach-pi.dts          |  144 +++++++++++++++
>   arch/arm/boot/dts/exynos5800.dtsi                  |   24 +++
>   drivers/clk/samsung/clk-exynos5420.c               |  192 +++++++++++++++-----
>   include/dt-bindings/clock/exynos5420.h             |    1 +
>   6 files changed, 320 insertions(+), 47 deletions(-)
>   create mode 100644 arch/arm/boot/dts/exynos5800-peach-pi.dts
>   create mode 100644 arch/arm/boot/dts/exynos5800.dtsi
>
Hi all,

Just note that some changes of C and Kconfig in mach-exynos are missed 
in this series as per my suggestion because I'm working on consolidate 
it for exynos stuff.

So please just review dt and clock stuff.

Thanks,
Kukjin

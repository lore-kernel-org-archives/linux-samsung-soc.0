From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH V2 0/3] clk: Samsung: audss: Register audio subsytem clocks using common clk framework
Date: Fri, 10 May 2013 02:24:38 +0200
Message-ID: <1561518.UR9S1ZDj1n@flatron>
References: <1367909016-19657-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f179.google.com ([209.85.215.179]:42937 "EHLO
	mail-ea0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755029Ab3EJAYn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 May 2013 20:24:43 -0400
Received: by mail-ea0-f179.google.com with SMTP id h14so1855195eaj.38
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 May 2013 17:24:42 -0700 (PDT)
In-Reply-To: <1367909016-19657-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, padma.kvr@gmail.com, sbkim73@samsung.com, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, thomas.abraham@linaro.org, s.nawrocki@samsung.com, Mike Turquette <mturquette@linaro.org>

Hi Padmavathi,

On Tuesday 07 of May 2013 12:13:33 Padmavathi Venna wrote:
> Samsung S5PV210 and Exynos SoC has a separate subsystem for audio. This
> subsystem has a internal clock controller which controls i2s0 and pcm0
> clocks. This patch series adds the Samsung audio subsytem clock to the
> common clock framework and provides the I2S controllers clock
> information in the dtsi file.
> 
> This patch series is dependent on
> https://patchwork.kernel.org/patch/2532091/
> http://www.spinics.net/lists/linux-kbuild/msg07616.html
> 
> This patch series is made based on Kukjin Kim for-next branch
> 
> Changes since V1:
> 	- Reworked on all review comments by Sylwester Nawrocki
> 	- Added a header file for all clock indexes as requested by 
Sylwester
> 	- Added different compatible names for s5pv210, exynos4 and 
exynos5
> 	- Registered the pcm clocks with common clock framework
> 
> Padmavathi Venna (3):
>   clk: samsung: register audio subsystem clocks using common clock
>     framework
>   ARM: dts: add Exynos audio subsystem clock controller node
>   ARM: dts: add clock provider information for i2s controllers in
>     Exynos5250
> 
>  .../bindings/clock/clk-samsung-audss.txt           |   64 +++++++++
>  arch/arm/boot/dts/exynos5250.dtsi                  |   16 +++
>  drivers/clk/samsung/Makefile                       |    1 +
>  drivers/clk/samsung/clk-samsung-audss.c            |  137
> ++++++++++++++++++++ include/dt-bindings/clk/samsung-audss-clk.h       
> |   25 ++++ 5 files changed, 243 insertions(+), 0 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/clock/clk-samsung-audss.txt create
> mode 100644 drivers/clk/samsung/clk-samsung-audss.c
>  create mode 100644 include/dt-bindings/clk/samsung-audss-clk.h

Also, I think that this series lacks

Cc: Mike Turquette <mturquette@linaro.org>

as he's the maintainer of the clk subsystem.

Best regards,
Tomasz

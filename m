From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 0/4] Add support for clocks in S5M8767
Date: Sun, 10 Nov 2013 13:34:24 +0100
Message-ID: <18704605.0nz1OWeNy9@flatron>
References: <1383202124-1775-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f43.google.com ([74.125.83.43]:51137 "EHLO
	mail-ee0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751231Ab3KJMe2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Nov 2013 07:34:28 -0500
In-Reply-To: <1383202124-1775-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Tushar Behera <tushar.behera@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, lee.jones@linaro.org, kgene.kim@samsung.com, mturquette@linaro.org, patches@linaro.org

Hi Tushar,

On Thursday 31 of October 2013 12:18:40 Tushar Behera wrote:
> S5M8767 chip has 3 crystal oscillators which are operated in the same
> as the crystal oscillators in S2MPS11. Extend s2mps11-clk driver to
> support clocks in S5M8767.
> 
> The patches are based on next-20131030.
> 
> Tushar Behera (4):
>   clk: clk-s2mps11: Refactor for including support for other MFD clocks
>   clk: clk-s2mps11: Add support for clocks in S5M8767 MFD
>   mfd: sec-core: Add cells for S5M8767-clocks
>   ARM: dts: Add S5M8767 clock nodes on Arndale board
> 
>  arch/arm/boot/dts/exynos5250-arndale.dts |    7 +++++++
>  drivers/clk/Kconfig                      |    6 ++++--
>  drivers/clk/clk-s2mps11.c                |   25
> +++++++++++++++++++++---- drivers/mfd/sec-core.c                   |   
> 4 +++-
>  4 files changed, 35 insertions(+), 7 deletions(-)

For the whole series:

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz

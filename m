From: Sachin Kamat <spk.linux@gmail.com>
Subject: Re: [PATCHv2 0/5] ARM: remove the sub-node and deprecated
 supports-highspeed property for dwmmc.
Date: Tue, 1 Jul 2014 13:56:29 +0530
Message-ID: <CAK5sBcEa5bRKUBB0n422m-K7A7YSshm2kTBUCNPgzwQkws3H8w@mail.gmail.com>
References: <1404128960-27225-1-git-send-email-jh80.chung@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f169.google.com ([209.85.217.169]:50646 "EHLO
	mail-lb0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757595AbaGAI0c (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Jul 2014 04:26:32 -0400
In-Reply-To: <1404128960-27225-1-git-send-email-jh80.chung@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-mmc <linux-mmc@vger.kernel.org>, Chris Ball <chris@printf.net>, Ulf Hansson <ulf.hansson@linaro.org>, "tgih.jun@samsung.com" <tgih.jun@samsung.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, dinguyen@altera.com, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Jaehoon,

On Mon, Jun 30, 2014 at 5:19 PM, Jaehoon Chung <jh80.chung@samsung.com> wrote:
> Since used the mmc_of_parse(), didn't parse the sub-node.
> So we can remove the sub-node, because almost SoC used the only one card per a host.
> And supports-highspeed can be replaced to "cap-mmc/sd-highspeed" property.
>
> Jaehoon Chung (5):
>   mmc: dw_mmc: modify the dt-binding for removing slot-node and
>     supports-highspeed
>   ARM: dts: exynos: unuse the slot-node and deprecated the
>     supports-highspeed for dw-mmc
>   ARM: dts: socfpga: unuse the slot-node and deprecated the
>     supports-highspeed for dw-mmc
>   ARM: dts: rockchip: unuse the slot-node and deprecated the
>     supports-highspeed for dw-mmc
>   mmc: dw_mmc: replace "disable-wp" from slot's quirk to host's quirk

It is a good practice to include revision history for subsequent versions.

Tested on Exynos 5250 based Snow and Arndale boards. Works fine now.

Tested-by: Sachin Kamat <sachin.kamat@samsung.com>

-- 
Regards,
Sachin.

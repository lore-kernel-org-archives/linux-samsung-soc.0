From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH V3 2/2] pinctrl: exynos: Add BUS1 pin controller for exynos7
Date: Sun, 28 Dec 2014 20:23:28 +0900
Message-ID: <549FE830.7020801@gmail.com>
References: <1418200780-22363-1-git-send-email-gautam.vivek@samsung.com> <1418200780-22363-2-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:35292 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751366AbaL1LXc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 28 Dec 2014 06:23:32 -0500
In-Reply-To: <1418200780-22363-2-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh+dt@kernel.org, kgene@kernel.org, alim.akhtar@samsung.com, Linus Walleij <linus.walleij@linaro.org>

On 10.12.2014 17:39, Vivek Gautam wrote:
> USB and Power regulator on Exynos7 require gpios available
> in BUS1 pin controller block.
> So adding the BUS1 pinctrl support.
>
> Signed-off-by: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> ---
>
> Changes since V2:
>   - Added documentation on alias for BUS1 pin controller block.
>
> Changes since V1:
>   - Added support for all pin banks which are part of BUS1 pin controller.
>
>   .../devicetree/bindings/pinctrl/samsung-pinctrl.txt |    1 +
>   drivers/pinctrl/samsung/pinctrl-exynos.c            |   19 +++++++++++++++++++
>   2 files changed, 20 insertions(+)

Acked-by: Tomasz Figa <tomasz.figa@gmail.com>

Best regards,
Tomasz

From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: exynos: Add AUDIO pin controller for exynos7
Date: Sun, 28 Dec 2014 20:24:23 +0900
Message-ID: <549FE867.5000306@gmail.com>
References: <1418994659-5222-1-git-send-email-padma.v@samsung.com> <1418994659-5222-2-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:35220 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751508AbaL1LY0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 28 Dec 2014 06:24:26 -0500
In-Reply-To: <1418994659-5222-2-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, linus.walleij@linaro.org, s.nawrocki@samsung.com

On 19.12.2014 22:10, Padmavathi Venna wrote:
> Audio IPs on Exynos7 require gpios available in AUDIO
> pin controller block. So adding the AUDIO pinctrl support.
>
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>   .../bindings/pinctrl/samsung-pinctrl.txt           |    1 +
>   drivers/pinctrl/samsung/pinctrl-exynos.c           |   10 ++++++++++
>   2 files changed, 11 insertions(+), 0 deletions(-)

Acked-by: Tomasz Figa <tomasz.figa@gmail.com>

Best regards,
Tomasz

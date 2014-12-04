From: Tyler Baker <tyler.baker@linaro.org>
Subject: Re: [PATCH v2] ARM: dts: Add dts file for odroid XU3 board
Date: Thu, 4 Dec 2014 12:07:01 -0800
Message-ID: <CANMBJr5e_tc9P8g=kh5ARJ1ARnLG2RX2AKVbd2j-=4X8x1uARg@mail.gmail.com>
References: <1417721269-19342-1-git-send-email-sjoerd.simons@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:43267 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751590AbaLDUHD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Dec 2014 15:07:03 -0500
Received: by mail-wg0-f43.google.com with SMTP id l18so23802690wgh.16
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Dec 2014 12:07:01 -0800 (PST)
In-Reply-To: <1417721269-19342-1-git-send-email-sjoerd.simons@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Kevin Hilman <khilman@kernel.org>, Heesub Shin <heesub.shin@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On 4 December 2014 at 11:27, Sjoerd Simons
<sjoerd.simons@collabora.co.uk> wrote:
> Add DTS for the Hardkernel Odroid XU3. The name of the DTS file is kept the
> same as the vendors naming, which means it's prefixed with exynos5422
> instead of exynos5800 as the SoC name even though it includes the
> exyno5800 dtsi.
>
> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>

Tested-by: Tyler Baker <tyler.baker@linaro.org>

Tested this atop of next-20141204, both on exynos_defconfig and
multi_v7_defconfig. All configurations boot fine on my odroid-xu3
board.

Cheers,
Tyler

From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: dts: disable PCIe for SD5v1 board
Date: Sun, 27 Oct 2013 21:51:57 -0700
Message-ID: <CAOesGMjuzKxi_j5pASteHaNXoNQ=nURLPRk5b6pbNLmCPC+txw@mail.gmail.com>
References: <000301cea9fe$619d2900$24d77b00$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qe0-f48.google.com ([209.85.128.48]:56744 "EHLO
	mail-qe0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751381Ab3J1Ev6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Oct 2013 00:51:58 -0400
Received: by mail-qe0-f48.google.com with SMTP id d4so3752171qej.35
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Oct 2013 21:51:57 -0700 (PDT)
In-Reply-To: <000301cea9fe$619d2900$24d77b00$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Wed, Sep 4, 2013 at 11:08 PM, Jingoo Han <jg1.han@samsung.com> wrote:
> Disable PCIe for SD5v1 board, because there is no PCIe slot
> on SD5v1 board.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
> Tested on SD5v1 board.
>
>  arch/arm/boot/dts/exynos5440-sd5v1.dts |    7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5440-sd5v1.dts b/arch/arm/boot/dts/exynos5440-sd5v1.dts
> index 5b22508..78a239d 100644
> --- a/arch/arm/boot/dts/exynos5440-sd5v1.dts
> +++ b/arch/arm/boot/dts/exynos5440-sd5v1.dts
> @@ -36,4 +36,11 @@
>                 status = "disabled";
>         };
>
> +       pcie@290000 {
> +               status = "disabled";
> +       };
> +
> +       pcie@2a0000 {
> +               status = "disabled";
> +       };
>  };

Usually IP blocks like these are always left disabled in the dtsi, and
explicitly _enabled_ in the DTS on boards that make use of that part
of the chip.
So the real solution here should be to move the disabling to the 5440
.dtsi instead.


-Olof

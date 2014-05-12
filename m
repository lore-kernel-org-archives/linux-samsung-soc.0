From: Arun Kumar K <arun.kk@samsung.com>
Subject: Re: [PATCH v3 0/4] ARM: dts: enable display for peach-pit and snow boards
Date: Mon, 12 May 2014 09:33:45 +0530
Message-ID: <CALt3h7-zRZp0HWE8VHUmnovfNESfu6c8f=4xScNRV1ZZcP_1vA@mail.gmail.com>
References: <1399630186-22610-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f180.google.com ([209.85.128.180]:60414 "EHLO
	mail-ve0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750717AbaELEDq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 May 2014 00:03:46 -0400
In-Reply-To: <1399630186-22610-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, inki.dae@samsung.com, Rahul Sharma <r.sh.open@gmail.com>

Hi Rahul,

On Fri, May 9, 2014 at 3:39 PM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>
> Add nodes for fimd and dp controller for exynos5250 based snow
> and exynos5420 based peach-pit board.
>

It would be great to include the display support for 5800 peach-pi board also
in this series. Most of the values would remain the same except for the changes
for bigger display in peach-pi.

Regards
Arun

> This series is based on Kukjin Kims, for-next branch.
>
> V3:
> 1) Dropped 1 patch "ARM: dts: move dp hpd line to the board file for
>  exynos5420".
> 2) Extra blank lines for readability.
> 3) dp hpd gpio name change (dp_hpd -> dp_hpd_gpio)
>
> V2:
> 1) Rebase on Peach-pit dependent patches.
>
> It is dependent on
> 1) Andrew Bresticker's patch for hpd gpio addition, avilable at
> http://www.spinics.net/lists/linux-samsung-soc/msg28827.html [Patch is 'ACK'ed.]
> 2) Arun's patch for adding peach-pit board dts file at
> http://www.spinics.net/lists/linux-samsung-soc/msg30103.html. [Patch is 'ACK'ed.]
>
> Rahul Sharma (4):
>   ARM: dts: enable fimd for exynos5250 based snow board
>   ARM: dts: enable dp-controller for exynos5250 based snow board
>   ARM: dts: enable fimd for exynos5420 based peach-pit board
>   ARM: dts: enable dp-controller for exynos5420 based peach-pit board
>
>  arch/arm/boot/dts/exynos5250-snow.dts      |   35 ++++++++++++++++++++++++
>  arch/arm/boot/dts/exynos5420-peach-pit.dts |   41 ++++++++++++++++++++++++++++
>  2 files changed, 76 insertions(+)
>
> --
> 1.7.9.5
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

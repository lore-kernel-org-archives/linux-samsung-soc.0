From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v5 0/5] ARM: dts: enable hdmi for exynos5 based peach
 and snow boards
Date: Thu, 15 May 2014 21:25:07 +0200
Message-ID: <53751493.8050601@gmail.com>
References: <1400166264-3428-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f42.google.com ([74.125.83.42]:44850 "EHLO
	mail-ee0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755136AbaEOTZT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 May 2014 15:25:19 -0400
In-Reply-To: <1400166264-3428-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com

Hi Rahul,

On 15.05.2014 17:04, Rahul Sharma wrote:
> From: Rahul Sharma <Rahul.Sharma@samsung.com>
> 
> Enable hdmi for exynos5250 based snow board, exynos5420
> based peach pit board and 5800 based peach-pi board.
> 
> V5:
> 1) Moved hdmi_hpd_irq pin back to board files.
> 2) Replaced 0 with GPIO_ACTIVE_HIGH while adding gpio property
> to HDMI node.
> 
> V4:
> 1) Removed hdmi_hpd_irq pin from peach-pi board as it already
> present in exynos5420-pinctrl.dtsi.
> 
> V3:
> 1) Re-spin on dependent patches.
> 2) Added patch to enable hdmi for Peach-pi board.
> 
> V2:
> 1) Re-spin on dependent patches.
> 2) Added patch to remove chip specific hdmi hpd gpio from
> board file top SoC file.
> 
> This series is based on Kukjin Kims, for-next branch.
> 
> It is dependent on
> 
> 1) Sachin's patch: "ARM: dts: exynos5250-snow: add tps65090 power regulator"
> at https://patches.linaro.org/28325/ : [Reviewed-by: Doug Anderson]
> 
> All other dependent patches are already landed in maintainers
> tree.
> 
> Rahul Sharma (4):
>   ARM: dts: enable hdmi for exynos5250 based snow board
>   ARM: dts: change to correct compatible string for exynos5420 hdmi
>   ARM: dts: enable hdmi for exynos5420 based peach-pit board
>   ARM: dts: enable hdmi for exynos5800 based peach-pi board
> 
>  arch/arm/boot/dts/exynos5250-cros-common.dtsi |    6 +++++-
>  arch/arm/boot/dts/exynos5250-snow.dts         |   14 ++++++++++++++
>  arch/arm/boot/dts/exynos5420-peach-pit.dts    |   22 ++++++++++++++++++++++
>  arch/arm/boot/dts/exynos5420.dtsi             |    7 ++++++-
>  arch/arm/boot/dts/exynos5800-peach-pi.dts     |   22 ++++++++++++++++++++++
>  5 files changed, 69 insertions(+), 2 deletions(-)
> 

For the whole series:

Acked-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz

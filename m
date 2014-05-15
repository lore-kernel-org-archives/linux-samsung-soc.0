From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v6 0/8] Enable USB 3.0 support on Exynos5 systems
Date: Fri, 16 May 2014 06:53:48 +0900
Message-ID: <5375376C.90306@samsung.com>
References: <1400076070-12456-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:34570 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932065AbaEOVxz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 May 2014 17:53:55 -0400
In-Reply-To: <1400076070-12456-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, kgene.kim@samsung.com, gregkh@linuxfoundation.org, t.figa@samsung.com, jg1.han@samsung.com, linux-kernel@vger.kernel.org, balbi@ti.com, kishon@ti.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org

On 05/14/14 23:01, Vivek Gautam wrote:
> From: Vivek gautam<gautam.vivek@samsung.com>
>
> Based on 'for-next' branch of Kgene's linux-samsung tree;
> along with dts patches for USB 2.0 phy[1], and Exynos5800 [2].
> Also based on the latest USB 3.0 DRD phy driver patches posted [3].
>
> Changes from v5:
>   - Added node reference names for new boards.
>   - Removed 'samsung,pmu-offset' porperty from nodes, since with latest driver
>     bindings this is not required.
>   - Added aliase nodes in Exynos5420 to facilitate latest driver bindings.
>   - Added patch to add VBUS regulator for peach-pi board also.
>   - Dropped patches removing older usb-phy driver:
>     usb-phy: samsung-usb3: Remove older phy-samsung-usb3 driver
>     ARM: exynos_defconfig: Remove SAMSUNG_USB3PHY config
>     as appeared in V5 version of this series.
>     Will post them separately after the new driver is merged.
>
> [1] http://www.spinics.net/lists/linux-samsung-soc/msg30494.html
> [2] http://comments.gmane.org/gmane.linux.kernel.samsung-soc/31133
> [3] https://lkml.org/lkml/2014/5/13/285
>
> Vivek Gautam (7):
>    ARM: dts: exynos5420: Enable support for USB 3.0 PHY controller
>    ARM: dts: exynos5420: Enable support for DWC3 controller
>    ARM: dts: exynos5250: Enable support for generic USB DRD phy
>    ARM: dts: exynos5250: Update DWC3 usb controller to use new phy
>      driver
>    ARM: dts: exynos5250-snow: Add Vbus regulator for USB 3.0
>    ARM: dts: exynos5420-peach-pit: Add Vbus regulator for USB 3.0
>    ARM: dts: exynos5420-smdk5420: Add Vbus regulator for USB 3.0
>
> Vivek gautam (1):

should be same guy.

Vivek Gautam ;-)

>    ARM: dts: exynos5800-peach-pi: Add Vbus regulator for USB 3.0
>
>   arch/arm/boot/dts/exynos5250-snow.dts      |   22 ++++++++++++
>   arch/arm/boot/dts/exynos5250.dtsi          |   20 +++++------
>   arch/arm/boot/dts/exynos5420-peach-pit.dts |   46 ++++++++++++++++++++++++
>   arch/arm/boot/dts/exynos5420-smdk5420.dts  |   46 ++++++++++++++++++++++++
>   arch/arm/boot/dts/exynos5420.dtsi          |   54 ++++++++++++++++++++++++++++
>   arch/arm/boot/dts/exynos5800-peach-pi.dts  |   46 ++++++++++++++++++++++++
>   6 files changed, 222 insertions(+), 12 deletions(-)
>
Looks good to me.

Applied 1 to 4 patches, but for others 5 to 8 I need to get any review 
or ack from dt guys.

Thanks,
Kukjin

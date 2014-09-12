From: kgene@kernel.org
Subject: RE: [PATCH v3 0/7] Add max77802 support for Peach boards
Date: Fri, 12 Sep 2014 21:26:13 +0900
Message-ID: <0ae801cfce84$be443620$3acca260$@kernel.org>
References: <1410344391-5675-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:36624 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751258AbaILM0R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Sep 2014 08:26:17 -0400
In-reply-to: <1410344391-5675-1-git-send-email-javier.martinez@collabora.co.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>
Cc: 'Doug Anderson' <dianders@chromium.org>, 'Olof Johansson' <olof@lixom.net>, 'Mark Brown' <broonie@kernel.org>, 'Naveen Krishna Chatradhi' <ch.naveen@samsung.com>, 'Rahul Sharma' <rahul.sharma@samsung.com>, 'Andreas Faerber' <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 'Vivek Gautam' <gautam.vivek@samsung.com>

Javier Martinez Canillas wrote:
> 
> Hello Kukjin,
> 
Hi Javier,

> This is a third version of th series that adds max77802 support for
> the Peach Pit and Pi boards. The series also have all the pending
> patches that were posted but depended on this support. I've picked
> all the patches I found and rebased them to be sure that they apply
> cleanly on top of linux-next. Also I've taken some DT snippets from
> the downstream Chrome OS 3.8 kernel DTS for devices that use one of
> these regulators as their input supply.
> 
Thanks a lot and looks good to me. I'll take this whole series.

- Kukjin

> Changes since v2 [0]:
>  - Remove left over supply on ldo35 regulator, suggested by Doug Anderson.
>  - Add a patch to change the i2c7 clock at 400kHz, suggested by Doug Anderson.
>  - Add a patch from Vivek Gautam to enable max77802 regulator driver support.
> 
> Changes sinve v1 [1]:
>  - Dropped patch that added vmmc and vqmmc supplies as suggested
>    by Doug Anderson.
>  - Use IRQ flags define instead of a magic number as suggested by
>    Andreas Faerber.
> 
> The series is composed of the following patches:
> 
> Javier Martinez Canillas (3):
>   ARM: dts: Add Peach Pit and Pi dts entry for max77802 PMIC
>   ARM: dts: Add Peach Pit and Pi dts entry for ISL29018 sensor
>   ARM: dts: Set i2c7 clock at 400kHz for Peach boards
> 
> Naveen Krishna Chatradhi (1):
>   ARM: dts: Add thermistor dts fragment used by exynos based Peach
>     boards
> 
> Rahul Sharma (2):
>   ARM: dts: add hdmi regulators for exynos5800 based peach-pi board
>   ARM: dts: add hdmi regulators for exynos5420 based peach-pit board
> 
> Vivek Gautam (1):
>   ARM: exynos_defconfig: Enable MAX77802
> 
>  arch/arm/boot/dts/cros-adc-thermistors.dtsi |  44 ++++
>  arch/arm/boot/dts/exynos5420-peach-pit.dts  | 389 ++++++++++++++++++++++++++++
>  arch/arm/boot/dts/exynos5800-peach-pi.dts   | 389 ++++++++++++++++++++++++++++
>  arch/arm/configs/exynos_defconfig           |   3 +
>  4 files changed, 825 insertions(+)
>  create mode 100644 arch/arm/boot/dts/cros-adc-thermistors.dtsi
> 
> 
> Best regards,
> Javier
> 
> [0]: https://lkml.org/lkml/2014/8/20/225
> [1]: https://lkml.org/lkml/2014/8/19/372

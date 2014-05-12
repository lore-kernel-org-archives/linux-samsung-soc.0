From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH v3 0/5] ARM: dts: enable hdmi for exynos5 based peach and
 snow boards
Date: Mon, 12 May 2014 16:28:10 +0530
Message-ID: <CAPdUM4M1xR1jGPxhuUi6nnAXuzA8_-9Hbgux66g+3mobhxNwyA@mail.gmail.com>
References: <1399890248-27409-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:63602 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752935AbaELK6L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 May 2014 06:58:11 -0400
In-Reply-To: <1399890248-27409-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>, Rahul Sharma <rahul.sharma@samsung.com>

On 12 May 2014 15:54, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>
> Enable hdmi for exynos5250 based snow board and exynos5420
> based peach pit board. It also adds properties to hdmi nodes
> for accessing hdmiphy as simple phys.
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
> 1) Arun's patch for adding peach-pit board dts file at
> http://www.spinics.net/lists/linux-samsung-soc/msg30103.html. [Patch is 'ACK'ed.]
> 2) Sachin's patch for snow board dts file at
> https://patches.linaro.org/28325/
> 3) DRM Hdmi driver patch which is changing the DT binding at
> http://www.spinics.net/lists/linux-samsung-soc/msg28052.html
> 4) Arun's patches for basic Exynos5800 support, available at
> http://comments.gmane.org/gmane.linux.kernel.samsung-soc/30667
> [Already Applied in Kukjin's v3.16-next/soc-exynos]
>

Updating the dependency:
1) Sachin's patch for snow board dts file at
       https://patches.linaro.org/28325/
2) DRM Hdmi driver patch which is changing the DT binding at
       http://www.spinics.net/lists/linux-samsung-soc/msg28052.html

All other patches are already Applied in Kukjin's for-next and
v3.16-next/soc-exynos branches.

> Rahul Sharma (5):
>   ARM: dts: enable hdmi for exynos5250 based snow board
>   ARM: dts: change to correct compatible string for exynos5420 hdmi
>   ARM: dts: enable hdmi for exynos5420 based peach-pit board
>   ARM: dts: remove chip specific hdmi hpd pin from board
>   ARM: dts: enable hdmi for exynos5800 based peach-pi board
>
>  arch/arm/boot/dts/exynos5250-cros-common.dtsi |    6 +++++-
>  arch/arm/boot/dts/exynos5250-pinctrl.dtsi     |    7 +++++++
>  arch/arm/boot/dts/exynos5250-snow.dts         |    7 +++++++
>  arch/arm/boot/dts/exynos5420-peach-pit.dts    |   19 ++++++++++++++++++
>  arch/arm/boot/dts/exynos5420-pinctrl.dtsi     |    7 +++++++
>  arch/arm/boot/dts/exynos5420-smdk5420.dts     |    9 ---------
>  arch/arm/boot/dts/exynos5420.dtsi             |    7 ++++++-
>  arch/arm/boot/dts/exynos5800-peach-pi.dts     |   26 +++++++++++++++++++++++++
>  8 files changed, 77 insertions(+), 11 deletions(-)
>
> --
> 1.7.9.5
>

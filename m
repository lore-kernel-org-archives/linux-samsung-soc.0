From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH v3 0/9] ARM: dts: exynos: add support for hdmi subsystem
Date: Wed, 14 Aug 2013 19:11:39 +0900
Message-ID: <112701ce98d6$aaed8840$00c898c0$@org>
References: <1374737677-3215-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:51699 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752727Ab3HNKLm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 06:11:42 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MRI00EMVMZAWTK0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Aug 2013 19:11:40 +0900 (KST)
In-reply-to: <1374737677-3215-1-git-send-email-rahul.sharma@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Rahul Sharma' <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, tomasz.figa@gmail.com, rob.herring@calxeda.com, s.nawrocki@samsung.com, grant.likely@linaro.org, joshi@samsung.com, r.sh.open@gmail.com

Rahul Sharma wrote:
> 
> Common properties for I2C and Hdmi Subsystem is moved to exynos5
> dtsi file. It also adds Device tree nodes and clocks information
> for exynos5420 and exynos5250 SoCs. It adds pinctrl node for hdmi
> hpd gpio and update binding documents.
> 
> This set is based on kukjin's for-next branch at
> http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git.
> 
> v3:
> 1) Rebase to kgene for-next based on 3.11-rc1.
> 2) Changes clock numbers as per updated clocks file for
> exyno5250 and exynos5420.
> 3) Dropped Sachin patch as already got merged.
> 
> v2:
> 1) Added patch for moving common i2c properties to exynos5.dtsi
> 2) Added patch for moving common hdmi, mixer properties to exynos5.dtsi
> 3) moved hpd pinctrl node to board file.
> 4) Added Sachin's patch to update binding document for hdmi with hpd
> information.
> 
> Andrew Bresticker (1):
>   ARM: dts: exynos5420: add i2c device nodes
> 
> Rahul Sharma (7):
>   ARM: dts: exynos5250: add clocks to hdmi dt node
>   ARM: dts: exynos5250: move common i2c properties to exynos5 dtsi
>   ARM: dts: exynos5250: move common hdmi properties to exynos5 dtsi
>   ARM: dts: exynos5420: add dt nodes for hdmi subsystem
>   ARM: dts: exynos5420: add clocks for hdmi subsystem
>   ARM: dts: exynos5420: add hdmi hpd gpio pinctrl node
>   of/documentation: update with clock information for exynos hdmi
>     subsystem
> 
> Sean Paul (1):
>   ARM: dts: exynos5250: add mixer clocks to mixer node
> 
>  .../devicetree/bindings/video/exynos_hdmi.txt      |   14 +++++-
>  .../devicetree/bindings/video/exynos_mixer.txt     |    4 ++
>  arch/arm/boot/dts/cros5250-common.dtsi             |    2 +-
>  arch/arm/boot/dts/exynos5.dtsi                     |   48
++++++++++++++++++++
>  arch/arm/boot/dts/exynos5250-arndale.dts           |    8 +++-
>  arch/arm/boot/dts/exynos5250-smdk5250.dts          |   10 +++-
>  arch/arm/boot/dts/exynos5250-snow.dts              |    8 ++++
>  arch/arm/boot/dts/exynos5250.dtsi                  |   36 +++------------
>  arch/arm/boot/dts/exynos5420-smdk5420.dts          |   31 +++++++++++++
>  arch/arm/boot/dts/exynos5420.dtsi                  |   46
+++++++++++++++++++
>  10 files changed, 174 insertions(+), 33 deletions(-)
> 
> --
> 1.7.10.4

See my comments about making common stuff for exynos5 SoCs.

And please don't use title like following,

'ARM: dts: exynos0000: ....'.

Because the relatively long prefix of title can cover _real_ title, So just
'ARM: dts: .... in exynos000' is better.

One more, devicetree(at)vger.kernel.org is right for dt ml.

- Kukjin

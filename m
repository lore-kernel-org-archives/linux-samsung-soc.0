From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: exynos: Fix wrong label for USB 3.0
 controller node
Date: Tue, 18 Jul 2017 07:06:35 +0200
Message-ID: <20170718050635.GB13779@kozik-book>
References: <1497942745-8607-1-git-send-email-dwoo08.lee@samsung.com>
 <CGME20170620071230epcas5p497144c7ccd8485da9109b8905a5ea36e@epcas5p4.samsung.com>
 <1497942745-8607-2-git-send-email-dwoo08.lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:36521 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750730AbdGRFGu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jul 2017 01:06:50 -0400
Content-Disposition: inline
In-Reply-To: <1497942745-8607-2-git-send-email-dwoo08.lee@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dongwoo Lee <dwoo08.lee@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, cw00.choi@samsung.com, andi.shyti@samsung.com

On Tue, Jun 20, 2017 at 04:12:23PM +0900, Dongwoo Lee wrote:
> Exynos5433 has two usb 3.0 controllers: usbhost and usbdrd. usbhost
> is host-only controller whereas usbdrd supports both peripheral and
> host mode. "drd" means dual-role device, so usbhost cannot be labeled
> with the name contains "drd". Howerver, the label usbdrd_dwc3_0 was
> used for usbhost's dwc3 node. It seems it obviously fault because TM2
> and TM2E doesn't use usbhost but dr_mode property is assigned to it.
> 
> This patch assigns the proper label for two dwc3 nodes, and apply
> changes to the related reference.
> 
> Signed-off-by: Dongwoo Lee <dwoo08.lee@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 2 +-
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi            | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof

From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 04/15] ARM: dts: exynos: fix PCI bus dtc warnings
Date: Thu, 23 Mar 2017 21:37:11 +0200
Message-ID: <20170323193711.yu6nyjppformf3tb@kozik-lap>
References: <20170322020313.24338-1-robh@kernel.org>
 <20170322020313.24338-4-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33655 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751728AbdCWThY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Mar 2017 15:37:24 -0400
Content-Disposition: inline
In-Reply-To: <20170322020313.24338-4-robh@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org

On Tue, Mar 21, 2017 at 09:03:02PM -0500, Rob Herring wrote:
> dtc recently added PCI bus checks. Fix these warnings.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Javier Martinez Canillas <javier@osg.samsung.com>
> Cc: linux-samsung-soc@vger.kernel.org
> ---
> Sub-arch maintainers, please apply to your trees unless arm-soc wants 
> to take the whole lot.
> 
>  arch/arm/boot/dts/exynos5440.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>

Hi,

Unfortunately patch does not apply. There were some changes around PCIe
this release so I think the best way would be to rebase on top of linux-next.

Best regards,
Krzysztof

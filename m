From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: exynos: fix PCI bus dtc warnings
Date: Fri, 28 Jul 2017 07:53:37 +0200
Message-ID: <20170728055337.GA2805@kozik-book>
References: <20170726210943.6875-1-robh@kernel.org>
 <20170726210943.6875-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:38080 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750924AbdG1Fxu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 Jul 2017 01:53:50 -0400
Content-Disposition: inline
In-Reply-To: <20170726210943.6875-2-robh@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org

On Wed, Jul 26, 2017 at 04:09:38PM -0500, Rob Herring wrote:
> dtc recently added PCI bus checks. Fix these warnings.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Javier Martinez Canillas <javier@osg.samsung.com>
> Cc: linux-samsung-soc@vger.kernel.org
> ---
> v2:
> - rebase on v4.13-rc2
> 
>  arch/arm/boot/dts/exynos5440.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof

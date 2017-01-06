From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM, ARM64: dts: drop "arm,amba-bus" in favor of
 "simple-bus" part 3
Date: Fri, 6 Jan 2017 16:13:22 +0200
Message-ID: <20170106141322.pejnlr6vbsq6bo6l@kozik-lap>
References: <1482853886-7932-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33918 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750902AbdAFON3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Jan 2017 09:13:29 -0500
Content-Disposition: inline
In-Reply-To: <1482853886-7932-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, Russell King <linux@armlinux.org.uk>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org

On Wed, Dec 28, 2016 at 12:51:26AM +0900, Masahiro Yamada wrote:
> Tree-wide replacement was done by commit 2ef7d5f342c1 ("ARM, ARM64:
> dts: drop "arm,amba-bus" in favor of "simple-bus"), then the 2nd
> round by commit 15b7cc78f095 ("arm64: dts: drop "arm,amba-bus" in
> favor of "simple-bus" part 2").
> 
> Here, some new users have appeared for Linux v4.10-rc1.  Eliminate
> them now.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Hi Arnd, Olof,
> 
> Can you pick this up for v4.10 fixes?
> 
> If we carry arm,amba-bus until the release, we will need to
> take more time to deprecate it.

What is the status of this?

Masahiro, if you would split this, I could take Exynos part through my
tree. Anyway I am fine with taking this directly into arm-soc. I do not
expect conflicts around these lines, so:

For Exynos:
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

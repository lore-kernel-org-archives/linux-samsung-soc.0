From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM, ARM64: dts: drop "arm,amba-bus" in favor of
 "simple-bus" part 3
Date: Mon, 9 Jan 2017 19:11:53 -0800
Message-ID: <20170110031153.GD22261@localhost>
References: <1482853886-7932-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1482853886-7932-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, Russell King <linux@armlinux.org.uk>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

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

Applied to fixes for 4.10.


Thanks,

-Olof

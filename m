From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 0/3] arm64: dts: exynos: Fix DTC warnings for Exynos
 boards
Date: Tue, 10 Jan 2017 20:42:34 +0200
Message-ID: <20170110184234.rzxedwnvsun7cfk2@kozik-lap>
References: <1484069912-6534-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1484069912-6534-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jan 10, 2017 at 02:38:29PM -0300, Javier Martinez Canillas wrote:
> Hello Krzysztof,
> 
> This trivial series contains fixes for DTC warnings caused by mismatches
> between unit names and reg properties in device tree nodes.
> 
> The patches shouldn't cause a functional change but have been just build
> tested. I compared the generated DTB though to make sure that only these
> nodes changed.
> 
> Best regards,
> Javier
> 
> Changes since v1:
>   - Fix subject line since I forgot the "exynos" prefix.

Thanks :)

Best regards,
Krzysztof

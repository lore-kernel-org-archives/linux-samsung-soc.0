From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 4/4] arm64: dts: exynos: DT64 for v4.11, third round
Date: Thu, 09 Feb 2017 16:19:57 +0100
Message-ID: <2382634.UqDUkYPZrI@wuerfel>
References: <20170202183008.23500-1-krzk@kernel.org>
 <20170202183008.23500-5-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170202183008.23500-5-krzk@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@kernel.org>, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thursday, February 2, 2017 8:30:08 PM CET Krzysztof Kozlowski wrote:
>  arch/arm64/boot/dts/exynos/exynos5433-tm2.dts      |  34 +++
>  arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts     |  34 +++
>  arch/arm64/boot/dts/exynos/exynos7-espresso.dts    |  49 +++-
>  arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi    | 302 +++++++++++----------
>  arch/arm64/boot/dts/exynos/exynos7.dtsi            |  34 +++
>  drivers/clk/samsung/clk-exynos5433.c               |   8 +-
>  include/dt-bindings/clock/exynos5433.h             |   5 +-
>  include/dt-bindings/pinctrl/samsung.h              |   8 +
> 

It seems a drivers/clk change slipped in there in addition to the header changes.
We are trying to keep the next/dt branches free of driver changes, are you
able to rework the branch without this?

Sorry for the late request.

	Arnd

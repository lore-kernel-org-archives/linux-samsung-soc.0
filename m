From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 4/4] ARM64: dts: TM2: comply to the samsung pinctrl
 naming convention
Date: Fri, 6 Jan 2017 08:49:15 +0200
Message-ID: <20170106064915.33zblfctcnrh55jg@kozik-lap>
References: <20161230041421.24448-1-andi.shyti@samsung.com>
 <CGME20161230041427epcas1p135fd1703c0bb0cc47a60f4c619b49973@epcas1p1.samsung.com>
 <20161230041421.24448-5-andi.shyti@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20161230041421.24448-5-andi.shyti@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andi Shyti <andi.shyti@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Andi Shyti <andi@etezian.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will.deacon@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Dec 30, 2016 at 01:14:21PM +0900, Andi Shyti wrote:
> Change the PIN() macro definition so that it can use the macros
> from pinctrl/samsung.h header file.
> 
> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi |  25 +-
>  arch/arm64/boot/dts/exynos/exynos5433-tm2.dts      | 254 ++++++++++-----------
>  2 files changed, 133 insertions(+), 146 deletions(-)
> 

Thanks, applied (here and in 3/4 with fixed subject).

Best regards,
Krzysztof

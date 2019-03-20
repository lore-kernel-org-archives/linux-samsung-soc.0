From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 1/3] arm64: dts: exynos: add SlimSSS for Exynos5433
Date: Wed, 20 Mar 2019 20:58:58 +0100
Message-ID: <20190320195858.GB9956@kozik-lap>
References: <20190222122144.19024-1-k.konieczny@partner.samsung.com>
 <CGME20190222122203eucas1p19a77c1cb72526ce36e99542926fd5a17@eucas1p1.samsung.com>
 <20190222122144.19024-2-k.konieczny@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190222122144.19024-2-k.konieczny@partner.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Feb 22, 2019 at 01:21:42PM +0100, Kamil Konieczny wrote:
> Add DT node for SlimSSS (aka Slim SecuritySubSystem) in Exynos5433 SoC.
> The users can use compatibility "samsung,exynos5433-slim-sss".
> 
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 9 +++++++++

Thanks, applied.

Best regards,
Krzysztof

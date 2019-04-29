From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RFC 3/8] dt-bindings: exynos: Add ASV tables binding
 documentation
Date: Mon, 29 Apr 2019 12:23:37 -0500
Message-ID: <20190429172337.GA30032@bogus>
References: <20190404171735.12815-1-s.nawrocki@samsung.com>
 <CGME20190404172234epcas1p37667ec0996000aff9297f13639908dfc@epcas1p3.samsung.com>
 <20190404171735.12815-4-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190404171735.12815-4-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, cw00.choi@samsung.com, myungjoo.ham@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, pankaj.dubey@samsung.com, b.zolnierkie@samsung.com, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Apr 04, 2019 at 07:17:30PM +0200, Sylwester Nawrocki wrote:
> This patch adds documentation of the Exynos ASV (Adaptive Voltage Supply)
> tables DT binding.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  .../devicetree/bindings/arm/samsung/asv.txt   | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/samsung/asv.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung/asv.txt b/Documentation/devicetree/bindings/arm/samsung/asv.txt
> new file mode 100644
> index 000000000000..0db907263a91
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/samsung/asv.txt
> @@ -0,0 +1,76 @@
> +Exynos Adaptive Supply Voltage (ASV) tables
> +-------------------------------------------
> +
> +The Adaptive Supply Voltage (ASV) on Exynos SoCs is a technique of adjusting
> +operating points, i.e. the power supply voltage for given clock frequency,
> +in order to better match actual capabilities of the hardware and optimize power
> +consumption.  This applies to subsystem of the SoC like: CPU clusters, GPU,
> +the memory controller or camera ISP.  During production process the SoC chip
> +is assigned to one of several bins (ASV groups) and the group information
> +is encoded in the SoC CHIPID block registers and/or OTP memory. This information
> +is then used by the OS to select more finely matching operating points for
> +devices.

We already have OPP tables defined for QCom CPUs to do speed bining, and 
I just reviewed something from Allwinner for similar purposes. We can't 
have each vendor doing their own thing here.

Rob

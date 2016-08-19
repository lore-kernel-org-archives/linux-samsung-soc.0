From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 6/7] arm64: dts: exynos: Add dts file for Exynos5433-based
 TM2 board
Date: Fri, 19 Aug 2016 19:05:46 +0200
Message-ID: <0aba7694-e5fc-47be-dce6-06f64fb3759d@samsung.com>
References: <1471328843-26653-1-git-send-email-cw00.choi@samsung.com>
 <1471329328-26842-2-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1471329328-26842-2-git-send-email-cw00.choi@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: devicetree@vger.kernel.org, k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, chanwoo@kernel.org, jy0922.shim@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, jh80.chung@samsung.com, a.hajda@samsung.com, kgene@kernel.org, krzk@kernel.org, jaewon02.kim@samsung.com, human.hwang@samsung.com, m.szyprowski@samsung.com, beomho.seo@samsung.com, ingi2.kim@samsung.com, ideal.song@samsung.com, linux-arm-kernel@lists.infradead.org, jonghwa3.lee@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 08/16/2016 08:35 AM, Chanwoo Choi wrote:
> &spi_1 {
> +	cs-gpios = <&gpd6 3 GPIO_ACTIVE_HIGH>;
> +	status = "okay";
> +
> +	wm5110: wm5110-codec@0 {
> +		compatible = "wlf,wm5110";
> +		reg = <0x0>;
> +		spi-max-frequency = <20000000>;
> +		interrupt-parent = <&gpa0>;
> +		interrupts = <4 0 0>;
> +		clocks = <&xxti>, <&s2mps13_osc 2>;

The first clock needs to be CLKOUT, i.e.

	clocks = <&pmu_system_controller 0>, <&s2mps13_osc 2>;


-- 
Thanks,
Sylwester

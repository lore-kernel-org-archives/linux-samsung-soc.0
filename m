From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 2/3] ARM: dts: Add DP PHY node to exynos5250.dtsi
Date: Fri, 28 Jun 2013 11:11:40 +0530
Message-ID: <51CD2214.10506@ti.com>
References: <001601ce73bf$9f2e9120$dd8bb360$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <001601ce73bf$9f2e9120$dd8bb360$@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: linux-fbdev@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>, 'Donghwa Lee' <dh09.lee@samsung.com>, 'Felipe Balbi' <balbi@ti.com>, 'Inki Dae' <inki.dae@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Jean-Christophe PLAGNIOL-VILLARD' <plagnioj@jcrosoft.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Friday 28 June 2013 10:53 AM, Jingoo Han wrote:
> Add PHY provider node for the DP PHY.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>   arch/arm/boot/dts/exynos5250.dtsi |   13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 41cd625..d1d6e14 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -614,6 +614,12 @@
>   		interrupts = <0 94 0>;
>   	};
>
> +	dp_phy: video-phy@10040720 {
> +		compatible = "samsung,exynos5250-dp-video-phy";
> +		reg = <0x10040720 4>;
> +		#phy-cells = <1>;

phy-cells can be '0' here since this phy_provider implements only one PHY.

Thanks
Kishon

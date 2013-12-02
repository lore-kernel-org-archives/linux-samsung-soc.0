From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/1] ARM: dts: Add missing clock names for exynos4412
 dwmmc node
Date: Mon, 2 Dec 2013 09:52:53 +0000
Message-ID: <20131202095253.GC12952@e106331-lin.cambridge.arm.com>
References: <1385892707-25063-1-git-send-email-kasimling@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1385892707-25063-1-git-send-email-kasimling@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alex Ling <kasimling@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, Pawel Moll <Pawel.Moll@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "ben-linux@fluff.org" <ben-linux@fluff.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, Dec 01, 2013 at 10:11:47AM +0000, Alex Ling wrote:
> This patch adds "biu" and "ciu" clock names for exynos4412 dwmmc
> node. Without this patch, dwmmc host driver will skip enabling the
> two clocks and it will break dwmmc host function on exynos4412.
> Tested on FriendlyARM TINY4412 board.

The patch description is a little off; this patch adds the clocks as
well as the clock-names.

The patch itself looks fine to me.

Mark.

> 
> Signed-off-by: Alex Ling <kasimling@gmail.com>
> ---
>  arch/arm/boot/dts/exynos4412.dtsi |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
> index e743e67..67bef99 100644
> --- a/arch/arm/boot/dts/exynos4412.dtsi
> +++ b/arch/arm/boot/dts/exynos4412.dtsi
> @@ -67,5 +67,7 @@
>  		interrupts = <0 77 0>;
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> +		clocks = <&clock 301>, <&clock 149>;
> +		clock-names = "biu", "ciu";
>  	};
>  };
> -- 
> 1.7.9.5
> 
> 

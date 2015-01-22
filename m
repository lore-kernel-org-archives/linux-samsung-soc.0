From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH v3 3/4] ARM: dts: set clock out parent to
 XUSBXTI
Date: Thu, 22 Jan 2015 13:25:07 +0100
Message-ID: <54C0EC23.9070209@samsung.com>
References: <1421925482-15861-1-git-send-email-ideal.song@samsung.com>
 <1421925482-15861-4-git-send-email-ideal.song@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1421925482-15861-4-git-send-email-ideal.song@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Inha Song <ideal.song@samsung.com>, alsa-devel@alsa-project.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sbkim73@samsung.com, linux-kernel@vger.kernel.org, broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.de, robh+dt@kernel.org, kgene@kernel.org, galak@codeaurora.org, grant.likely@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 22/01/15 12:18, Inha Song wrote:
> This patch set clock out parent to XUSBXTI.
> 
> Signed-off-by: Inha Song <ideal.song@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> index b8168f1..020bbaf 100644
> --- a/arch/arm/boot/dts/exynos4.dtsi
> +++ b/arch/arm/boot/dts/exynos4.dtsi
> @@ -141,6 +141,8 @@
>  	pmu_system_controller: system-controller@10020000 {
>  		compatible = "samsung,exynos4210-pmu", "syscon";
>  		reg = <0x10020000 0x4000>;
> +		assigned-clocks = <&pmu_system_controller 0>;
> +		assigned-clock-parents =  <&clock CLK_XUSBXTI>;
>  	};

Looks good, except it needs to be done only for the Trats2 board, i.e.
the PMU device node including these properties should be added to
exynos4412-trats2.dts.  I think it's fine to make it a one patch including
all dts changes.


-- 
Regards,
Sylwester

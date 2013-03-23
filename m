From: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 12/12] ARM: dts: Add camera node to exynos5250-smdk5250.dts
Date: Sat, 23 Mar 2013 13:18:02 +0100
Message-ID: <514D9D7A.5060000@gmail.com>
References: <1362570838-4737-1-git-send-email-shaik.ameer@samsung.com>
 <1362570838-4737-13-git-send-email-shaik.ameer@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1362570838-4737-13-git-send-email-shaik.ameer-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Shaik Ameer Basha <shaik.ameer-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shaik.samsung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 03/06/2013 12:53 PM, Shaik Ameer Basha wrote:
> Signed-off-by: Shaik Ameer Basha<shaik.ameer-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>   arch/arm/boot/dts/exynos5250-smdk5250.dts |   43 ++++++++++++++++++++++++++++-
>   1 file changed, 42 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> index 4b10744..7fbc236 100644
> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> @@ -85,9 +85,26 @@
>   	};
>
>   	i2c@12CA0000 {
> -		status = "disabled";
> +		samsung,i2c-sda-delay =<100>;
> +		samsung,i2c-max-bus-freq =<100000>;
>   		pinctrl-0 =<&i2c4_bus>;
>   		pinctrl-names = "default";
> +
> +		m5mols@1f {
> +			compatible = "fujitsu,m-5mols";
> +			reg =<0x1F>;
> +			gpios =<&gpx3 3 0xf>,<&gpx1 2 1>;
> +			clock-frequency =<24000000>;
> +			pinctrl-0 =<&cam_port_a_clk_active>;
> +			pinctrl-names = "default";

Ah, so it's that way... I don't think that is correct. What you're doing
here is assigning an SoC clock output pin pinctrl node to pinctrl property
of an image sensor device that is external to an SoC. Why don't you put
this pinctrl properties in the common "camera" node ?

> +
> +			port {
> +				m5mols_ep: endpoint {
> +					remote-endpoint =<&csis0_ep>;
> +				};
> +			};
> +
> +		};
>   	};
>
>   	i2c@12CB0000 {
> @@ -214,4 +231,28 @@
>   		samsung,mfc-r =<0x43000000 0x800000>;
>   		samsung,mfc-l =<0x51000000 0x800000>;
>   	};
> +
> +	camera {
> +		compatible = "samsung,exynos5-fimc", "simple-bus";

Shouldn't it be "samsung,exynos5-is" (Imaging Subsystem), or something
more relevant to exynos5 ? Or what would be reasons to use "fimc" for
exynos5 ?

From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v6 3/8] dts: Add usb2phy to Exynos 4
Date: Wed, 29 Jan 2014 12:50:53 -0800
Message-ID: <CAOesGMh8qEumWGb_mVuiSTWE=tsEusntG5r9xL3Z+f_WUnBQSw@mail.gmail.com>
References: <1391016574-25237-1-git-send-email-k.debski@samsung.com>
	<1391016574-25237-4-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1391016574-25237-4-git-send-email-k.debski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Debski <k.debski@samsung.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, Tomasz Figa <t.figa@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Vivek Gautam <gautam.vivek@samsung.com>, mat.krawczuk@gmail.com, yulgon.kim@samsung.com, p.paneri@samsung.com, av.tikhomirov@samsung.com, Jingoo Han <jg1.han@samsung.com>, Kumar Gala <galak@codeaurora.org>, Matt Porter <matt.porter@linaro.org>, tjakobi@math.uni-bielefeld.de, Alan Stern <stern@rowland.harvard.edu>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jan 29, 2014 at 9:29 AM, Kamil Debski <k.debski@samsung.com> wrote:
> Add support to PHY of USB2 of the Exynos 4 SoC.
>
> Signed-off-by: Kamil Debski <k.debski@samsung.com>
> ---
>  .../devicetree/bindings/arm/samsung/pmu.txt        |    2 ++
>  arch/arm/boot/dts/exynos4.dtsi                     |   31 ++++++++++++++++++++
>  arch/arm/boot/dts/exynos4210.dtsi                  |   17 +++++++++++
>  arch/arm/boot/dts/exynos4x12.dtsi                  |   17 +++++++++++
>  4 files changed, 67 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.txt b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
> index 307e727..a76f91d 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/pmu.txt
> +++ b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
> @@ -3,6 +3,8 @@ SAMSUNG Exynos SoC series PMU Registers
>  Properties:
>   - name : should be 'syscon';
>   - compatible : should contain two values. First value must be one from following list:
> +                  - "samsung,exynos4210-pmu" - for Exynos4210 SoC,
> +                  - "samsung,exynos4x12-pmu" - for Exynos4212 SoC,
>                    - "samsung,exynos5250-pmu" - for Exynos5250 SoC,
>                    - "samsung,exynos5420-pmu" - for Exynos5420 SoC.
>                 second value must be always "syscon".

This and other PMU related bindings/dts changes should probably go in
separate patch(es) instead of being snuck in with USB changes.


-Olof

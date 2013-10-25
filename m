From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 1/5] phy: Add new Exynos USB PHY driver
Date: Fri, 25 Oct 2013 16:36:23 -0500
Message-ID: <1A9F8795-C8EC-443C-9396-49BBA589C8B7@codeaurora.org>
References: <1382710529-12082-1-git-send-email-k.debski@samsung.com> <1382710529-12082-2-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382710529-12082-2-git-send-email-k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mat.krawczuk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


On Oct 25, 2013, at 9:15 AM, Kamil Debski wrote:

> Add a new driver for the Exynos USB PHY. The new driver uses the generic
> PHY framework. The driver includes support for the Exynos 4x10 and 4x12
> SoC families.
> 
> Signed-off-by: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> .../devicetree/bindings/phy/samsung-usbphy.txt     |   51 +++
> drivers/phy/Kconfig                                |   21 ++
> drivers/phy/Makefile                               |    3 +
> drivers/phy/phy-exynos-usb.c                       |  245 ++++++++++++++
> drivers/phy/phy-exynos-usb.h                       |   94 ++++++
> drivers/phy/phy-exynos4210-usb.c                   |  295 +++++++++++++++++
> drivers/phy/phy-exynos4212-usb.c                   |  343 ++++++++++++++++++++
> 7 files changed, 1052 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/phy/samsung-usbphy.txt
> create mode 100644 drivers/phy/phy-exynos-usb.c
> create mode 100644 drivers/phy/phy-exynos-usb.h
> create mode 100644 drivers/phy/phy-exynos4210-usb.c
> create mode 100644 drivers/phy/phy-exynos4212-usb.c
> 
> diff --git a/Documentation/devicetree/bindings/phy/samsung-usbphy.txt b/Documentation/devicetree/bindings/phy/samsung-usbphy.txt
> new file mode 100644
> index 0000000..f112b37
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/samsung-usbphy.txt
> @@ -0,0 +1,51 @@
> +Samsung S5P/EXYNOS SoC series USB PHY
> +-------------------------------------------------
> +
> +Required properties:
> +- compatible : should be one of the listed compatibles:
> +	- "samsung,exynos4210-usbphy"
> +	- "samsung,exynos4212-usbphy"
> +- reg : a list of registers used by phy driver
> +	- first and obligatory is the location of phy modules registers
> +	- second and also required is the location of isolation registers
> +	  (isolation registers control the physical connection between the in
> +	  SoC modules and outside of the SoC, this also can be called enable
> +	  control in the documentation of the SoC)
> +	- third is the location of the mode switch register, this only applies
> +	  to SoCs that have such a feature; mode switching enables to have
> +	  both host and device used the same SoC pins and is commonly used
> +	  when OTG is supported
> +- #phy-cells : from the generic phy bindings, must be 1;

Please add if clock & clock-names are required properties.

> +
> +The second cell in the PHY specifier identifies the PHY its meaning is SoC
> +dependent. For the currently supported SoCs (Exynos 4210 and Exynos 4212) it
> +is as follows:

Can we say instead of 'its meaning is SoC dependent...' something like 'its meaning is compatible dependent"?

> +  0 - USB device,
> +  1 - USB host,
> +  2 - HSIC0,
> +  3 - HSIC1,
> +
> +Example:
> +
> +For Exynos 4412 (compatible with Exynos 4212):
> +
> +exynos_usbphy: exynos-usbphy@125B0000 {
> +	compatible = "samsung,exynos4212-usbphy";
> +	reg = <0x125B0000 0x100 0x10020704 0x0c 0x1001021c 0x4>;
> +	ranges;
> +	#address-cells = <1>;
> +	#size-cells = <1>;

Why do you have ranges, and #address-cells & #size-cells here?

> +	clocks = <&clock 305>, <&clock 2>, <&clock 2>, <&clock 2>,
> +							<&clock 2>;
> +	clock-names = "phy", "device", "host", "hsic0", "hsic1";
> +	status = "okay";
> +	#phy-cells = <1>;
> +};
> +
> +Then the PHY can be used in other nodes such as:
> +
> +ehci@12580000 {
> +	status = "okay";
> +	phys = <&exynos_usbphy 2>;
> +	phy-names = "hsic0";
> +};

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

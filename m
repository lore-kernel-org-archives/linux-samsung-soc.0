From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 2/9] ARM: dts: s5pv210: Add initial DTS for Samsung
 Aries based phones
Date: Sat, 7 Jul 2018 10:43:58 +0200
Message-ID: <20180707084358.4o53vtwycaul7vcu@kozik-lap>
References: <1530901970-14972-1-git-send-email-pawel.mikolaj.chmiel@gmail.com>
 <1530901970-14972-3-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1530901970-14972-3-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xc-racer2@live.ca
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jul 06, 2018 at 08:32:43PM +0200, Paweł Chmiel wrote:
> This DTS file have initial support Samsung Aries based phones.
> Initial version have support for:
> - sdcard
> - internal memory (present only on non 4g variant)
> - max8998 pmic and rtc
> - max17040 fuel gauge
> - gpio keys
> - fimd (no panel driver yet)
> - usb (peripherial mode)
> - wifi
> 
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
> Changes from v2:
>   - Restored pinctrl nodes order
>   - Correct order of nodes
> 
> Changes from v1:
>   - Removed duplicated and unneeded headers
>   - Corrected node names
>   - Added missing spaces
>   - Removed unneeded pinctrl and sorted entries
>   - Set correct interrupt type for max8998 pmic
>   - Add missing regulators
> ---
> ---

I applied this and 3/9 but then dtc complained about warnings
make dtbs W=1:

arch/arm/boot/dts/s5pv210-galaxys.dtb: Warning (unit_address_vs_reg): /soc/fimd@f8000000/display-timings/timing@0: node has a unit name, but no reg property
arch/arm/boot/dts/s5pv210-galaxys.dtb: Warning (avoid_unnecessary_addr_size): /soc/fimd@f8000000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

These should be fixed (unless such warning come from following bindings,
e.g. like in case of ports for Exynos HDMI nodes).

Please, always run dtbs W=1 for DTS patches, check with sparse for
regular code and checkpatch for everything.  Checks with smatch
and coccinelle are also appreciated (although coccinelle is run by
kbuild bot).

Best regards,
Krzysztof

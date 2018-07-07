From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 3/5] ARM: dts: s5pv210: Add initial DTS for SGH-T959P
 phone
Date: Sat, 7 Jul 2018 12:33:34 +0200
Message-ID: <20180707103334.rnvgdnfxvoogudrg@kozik-lap>
References: <1530958183-10956-1-git-send-email-pawel.mikolaj.chmiel@gmail.com>
 <1530958183-10956-4-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1530958183-10956-4-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xc-racer2@live.ca
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Jul 07, 2018 at 12:09:41PM +0200, Paweł Chmiel wrote:
> From: Jonathan Bakker <xc-racer2@live.ca>
> 
> This DTS file have initial support Samsung SGH-T959P phone,
> also known as Samsung Galaxy S 4G or fascinate4g.
> It belongs to Samsung Aries devices family.
> Initial version have support for:
> - sdcard
> - max8998 pmic and rtc
> - max17040 fuel gauge
> - gpio keys
> - fimd (no panel driver yet)
> - usb (peripherial mode)
> - wifi
> 
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
> 
> Changes from v1:
>   - Added missing commit msg
>   - Removed duplicated and unneeded headers
>   - Added stdout-path
>   - Added information why we hardcode bootargs
> ---
> ---
>  arch/arm/boot/dts/Makefile                |  1 +
>  arch/arm/boot/dts/s5pv210-fascinate4g.dts | 45 +++++++++++++++++++++++++++++++
>  2 files changed, 46 insertions(+)

Thanks, applied.

Best regards,
Krzysztof

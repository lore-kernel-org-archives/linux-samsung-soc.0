From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 1/9] ARM: dts: s5pv210: Add missing
 interrupt-controller property to gph2
Date: Sat, 7 Jul 2018 10:38:52 +0200
Message-ID: <20180707083852.sqjfcxyicilwekuv@kozik-lap>
References: <1530901970-14972-1-git-send-email-pawel.mikolaj.chmiel@gmail.com>
 <1530901970-14972-2-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1530901970-14972-2-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xc-racer2@live.ca
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jul 06, 2018 at 08:32:42PM +0200, Paweł Chmiel wrote:
> Adds missing interrupt-controller property to gph2 block,
> to silence following warnings during build
>   /soc/pinctrl@e0200000/gph2: Missing interrupt-controller or interrupt-map property
> 
> It's reguired by Samsung aries boards, an S5PV210 based
> Samsung Galaxy S (i9000) and Galaxy S 4G phones, which are added in next patches.
> 
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
>  arch/arm/boot/dts/s5pv210-pinctrl.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof

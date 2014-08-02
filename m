From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v6 03/10] ARM: dts: Prepare node labels for exynos5250
Date: Sat, 02 Aug 2014 14:19:23 +0200
Message-ID: <53DCD74B.8090400@gmail.com>
References: <1406940750-15880-1-git-send-email-afaerber@suse.de> <1406940750-15880-4-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406940750-15880-4-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, open list <linux-kernel@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Kumar Gala <galak@codeaurora.org>, Stephan van Schaik <stephan@synkhronix.com>, Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>, Ben Dooks <ben-linux@fluff.org>, Russell King <linux@arm.linux.org.uk>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Andreas,

Ehh, one more thing. It looks like my memory is playing tricks on me.
Please see inline.

On 02.08.2014 02:52, Andreas F=C3=A4rber wrote:
> Allows them to be extended by reference.
>=20
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  v6: Split off from Snow/SMDK cleanups (Doug Anderson)

[snip]

> -	serial@12C00000 {
> +	uart0: serial@12C00000 {
>  		clocks =3D <&clock CLK_UART0>, <&clock CLK_SCLK_UART0>;
>  		clock-names =3D "uart", "clk_uart_baud0";
>  	};
> =20
> -	serial@12C10000 {
> +	uart1: serial@12C10000 {
>  		clocks =3D <&clock CLK_UART1>, <&clock CLK_SCLK_UART1>;
>  		clock-names =3D "uart", "clk_uart_baud0";
>  	};
> =20
> -	serial@12C20000 {
> +	uart2: serial@12C20000 {
>  		clocks =3D <&clock CLK_UART2>, <&clock CLK_SCLK_UART2>;
>  		clock-names =3D "uart", "clk_uart_baud0";
>  	};
> =20
> -	serial@12C30000 {
> +	uart3: serial@12C30000 {
>  		clocks =3D <&clock CLK_UART3>, <&clock CLK_SCLK_UART3>;
>  		clock-names =3D "uart", "clk_uart_baud0";
>  	};

I forgot about a series [1] that went through tty tree, which is going
to conflict with this patch. It already adds labels to uart nodes in
serial_X format. I don't really remember why I went with this format fo=
r
Exynos SoCs and with uartX for older ones...

[1]
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit=
/arch/arm/boot/dts?id=3D1e64f48ea7c59fb94acd7551dd9fa68b8a752efc

Best regards,
Tomasz

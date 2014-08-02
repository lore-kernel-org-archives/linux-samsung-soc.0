From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v6 03/10] ARM: dts: Prepare node labels for exynos5250
Date: Sat, 02 Aug 2014 15:00:36 +0200
Message-ID: <53DCE0F4.4060101@suse.de>
References: <1406940750-15880-1-git-send-email-afaerber@suse.de> <1406940750-15880-4-git-send-email-afaerber@suse.de> <53DCD74B.8090400@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53DCD74B.8090400-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephan van Schaik <stephan-zGZ7W/ttz6xN8Ch2cx6nig@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Am 02.08.2014 14:19, schrieb Tomasz Figa:
> Andreas,
>=20
> Ehh, one more thing. It looks like my memory is playing tricks on me.
> Please see inline.
>=20
> On 02.08.2014 02:52, Andreas F=C3=A4rber wrote:
>> Allows them to be extended by reference.
>>
>> Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
>> ---
>>  v6: Split off from Snow/SMDK cleanups (Doug Anderson)
>=20
> [snip]
>=20
>> -	serial@12C00000 {
>> +	uart0: serial@12C00000 {
>>  		clocks =3D <&clock CLK_UART0>, <&clock CLK_SCLK_UART0>;
>>  		clock-names =3D "uart", "clk_uart_baud0";
>>  	};
>> =20
>> -	serial@12C10000 {
>> +	uart1: serial@12C10000 {
>>  		clocks =3D <&clock CLK_UART1>, <&clock CLK_SCLK_UART1>;
>>  		clock-names =3D "uart", "clk_uart_baud0";
>>  	};
>> =20
>> -	serial@12C20000 {
>> +	uart2: serial@12C20000 {
>>  		clocks =3D <&clock CLK_UART2>, <&clock CLK_SCLK_UART2>;
>>  		clock-names =3D "uart", "clk_uart_baud0";
>>  	};
>> =20
>> -	serial@12C30000 {
>> +	uart3: serial@12C30000 {
>>  		clocks =3D <&clock CLK_UART3>, <&clock CLK_SCLK_UART3>;
>>  		clock-names =3D "uart", "clk_uart_baud0";
>>  	};
>=20
> I forgot about a series [1] that went through tty tree, which is goin=
g
> to conflict with this patch. It already adds labels to uart nodes in
> serial_X format. I don't really remember why I went with this format =
for
> Exynos SoCs and with uartX for older ones...
>=20
> [1]
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/comm=
it/arch/arm/boot/dts?id=3D1e64f48ea7c59fb94acd7551dd9fa68b8a752efc

I doubt that I'll manage to resend another time today, so please just
drop those hunks from my patch before applying - I ended up not using
them here.

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

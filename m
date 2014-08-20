From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH v6 03/10] ARM: dts: Prepare node labels for exynos5250
Date: Wed, 20 Aug 2014 15:06:36 +0200
Message-ID: <53F49D5C.4050007@suse.de>
References: <1406940750-15880-1-git-send-email-afaerber@suse.de> <1406940750-15880-4-git-send-email-afaerber@suse.de> <53DCD74B.8090400@gmail.com> <53DCE0F4.4060101@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46205 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750703AbaHTNGj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Aug 2014 09:06:39 -0400
In-Reply-To: <53DCE0F4.4060101@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, open list <linux-kernel@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Kumar Gala <galak@codeaurora.org>, Stephan van Schaik <stephan@synkhronix.com>, Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>, Ben Dooks <ben-linux@fluff.org>, Russell King <linux@arm.linux.org.uk>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org

Am 02.08.2014 15:00, schrieb Andreas F=C3=A4rber:
> Am 02.08.2014 14:19, schrieb Tomasz Figa:
>> Andreas,
>>
>> Ehh, one more thing. It looks like my memory is playing tricks on me=
=2E
>> Please see inline.
>>
>> On 02.08.2014 02:52, Andreas F=C3=A4rber wrote:
>>> Allows them to be extended by reference.
>>>
>>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>>> ---
>>>  v6: Split off from Snow/SMDK cleanups (Doug Anderson)
>>
>> [snip]
>>
>>> -	serial@12C00000 {
>>> +	uart0: serial@12C00000 {
>>>  		clocks =3D <&clock CLK_UART0>, <&clock CLK_SCLK_UART0>;
>>>  		clock-names =3D "uart", "clk_uart_baud0";
>>>  	};
>>> =20
>>> -	serial@12C10000 {
>>> +	uart1: serial@12C10000 {
>>>  		clocks =3D <&clock CLK_UART1>, <&clock CLK_SCLK_UART1>;
>>>  		clock-names =3D "uart", "clk_uart_baud0";
>>>  	};
>>> =20
>>> -	serial@12C20000 {
>>> +	uart2: serial@12C20000 {
>>>  		clocks =3D <&clock CLK_UART2>, <&clock CLK_SCLK_UART2>;
>>>  		clock-names =3D "uart", "clk_uart_baud0";
>>>  	};
>>> =20
>>> -	serial@12C30000 {
>>> +	uart3: serial@12C30000 {
>>>  		clocks =3D <&clock CLK_UART3>, <&clock CLK_SCLK_UART3>;
>>>  		clock-names =3D "uart", "clk_uart_baud0";
>>>  	};
>>
>> I forgot about a series [1] that went through tty tree, which is goi=
ng
>> to conflict with this patch. It already adds labels to uart nodes in
>> serial_X format. I don't really remember why I went with this format=
 for
>> Exynos SoCs and with uartX for older ones...
>>
>> [1]
>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/com=
mit/arch/arm/boot/dts?id=3D1e64f48ea7c59fb94acd7551dd9fa68b8a752efc
>=20
> I doubt that I'll manage to resend another time today, [...]

Sorry, forgot about this. Done now. v7 as individual reply.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg

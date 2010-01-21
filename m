From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 01/10] ARM: S5PV210: Add Samsung S5PV210 CPU support
Date: Thu, 21 Jan 2010 09:42:41 +0900
Message-ID: <003201ca9a32$a3c4dab0$eb4e9010$%kim@samsung.com>
References: <1263868047-30646-1-git-send-email-kgene.kim@samsung.com>
 <9c9fda241001191918h17eb2ff2ma7698de689ef91bd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:45936 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751147Ab0AUAks convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jan 2010 19:40:48 -0500
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KWK00GB5N7YCF@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jan 2010 09:40:46 +0900 (KST)
Received: from kgenekim ([12.23.109.129])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KWK003WIN7XP1@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jan 2010 09:40:46 +0900 (KST)
In-reply-to: <9c9fda241001191918h17eb2ff2ma7698de689ef91bd@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Kyungmin Park wrote:
> On Tue, Jan 19, 2010 at 11:27 AM, Kukjin Kim <kgene.kim@samsung.com> =
wrote:
> > This patch adds support for Samsung S5PV210 CPU. This patch also ad=
ds
> > an entry for S5PV210 cpu in plat-s5p cpu table.
> >
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---

(snip)

> > +/* GPIO bank sizes */
> > +#define S5PV210_GPIO_A0_NR =A0 =A0 (8)
> > +#define S5PV210_GPIO_A1_NR =A0 =A0 (4)
> > +#define S5PV210_GPIO_B_NR =A0 =A0 =A0(8)
> > +#define S5PV210_GPIO_C0_NR =A0 =A0 (5)
> > +#define S5PV210_GPIO_C1_NR =A0 =A0 (5)
> > +#define S5PV210_GPIO_D0_NR =A0 =A0 (4)
> > +#define S5PV210_GPIO_D1_NR =A0 =A0 (6)
> > +#define S5PV210_GPIO_E0_NR =A0 =A0 (8)
> > +#define S5PV210_GPIO_E1_NR =A0 =A0 (5)
> > +#define S5PV210_GPIO_F0_NR =A0 =A0 (8)
> > +#define S5PV210_GPIO_F1_NR =A0 =A0 (8)
> > +#define S5PV210_GPIO_F2_NR =A0 =A0 (8)
> > +#define S5PV210_GPIO_F3_NR =A0 =A0 (6)
> > +#define S5PV210_GPIO_G0_NR =A0 =A0 (7)
> > +#define S5PV210_GPIO_G1_NR =A0 =A0 (7)
> > +#define S5PV210_GPIO_G2_NR =A0 =A0 (7)
> > +#define S5PV210_GPIO_G3_NR =A0 =A0 (7)
> > +#define S5PV210_GPIO_H0_NR =A0 =A0 (8)
> > +#define S5PV210_GPIO_H1_NR =A0 =A0 (8)
> > +#define S5PV210_GPIO_H2_NR =A0 =A0 (8)
> > +#define S5PV210_GPIO_H3_NR =A0 =A0 (8)
> > +#define S5PV210_GPIO_I_NR =A0 =A0 =A0(7)
> > +#define S5PV210_GPIO_J0_NR =A0 =A0 (8)
> > +#define S5PV210_GPIO_J1_NR =A0 =A0 (6)
> > +#define S5PV210_GPIO_J2_NR =A0 =A0 (8)
> > +#define S5PV210_GPIO_J3_NR =A0 =A0 (8)
> > +#define S5PV210_GPIO_J4_NR =A0 =A0 (5)
>=20
> Is there any reason to use the actual NR number? How about to define
> it's all 8. why not?
> E.g., this chip support only 7 at GPIO I. then when we set the 7th
> bit. what's the matter?
> This make a below macros are simple.

Hi,

There are banks that have less than 8 gpio's.
So it is better to keep to define the bank sizes correctly.

> > +
> > +/* GPIO bank numbers */
> > +
> > +/* CONFIG_S3C_GPIO_SPACE allows the user to select extra
> > + * space for debugging purposes so that any accidental
> > + * change from one gpio bank to another can be caught.
> > +*/
> > +
> > +#define S5PV210_GPIO_NEXT(__gpio) \
> > + =A0 =A0 =A0 ((__gpio##_START) + (__gpio##_NR) + CONFIG_S3C_GPIO_S=
PACE + 1)
> > +
> > +enum s5p_gpio_number {
> > + =A0 =A0 =A0 S5PV210_GPIO_A0_START =A0 =3D 0,
> > + =A0 =A0 =A0 S5PV210_GPIO_A1_START =A0 =3D
> S5PV210_GPIO_NEXT(S5PV210_GPIO_A0),
> > + =A0 =A0 =A0 S5PV210_GPIO_B_START =A0 =A0=3D
> S5PV210_GPIO_NEXT(S5PV210_GPIO_A1),
> > + =A0 =A0 =A0 S5PV210_GPIO_C0_START =A0 =3D
> S5PV210_GPIO_NEXT(S5PV210_GPIO_B),
> > + =A0 =A0 =A0 S5PV210_GPIO_C1_START =A0 =3D
> S5PV210_GPIO_NEXT(S5PV210_GPIO_C0),
> > + =A0 =A0 =A0 S5PV210_GPIO_D0_START =A0 =3D
> S5PV210_GPIO_NEXT(S5PV210_GPIO_C1),
> > + =A0 =A0 =A0 S5PV210_GPIO_D1_START =A0 =3D
> S5PV210_GPIO_NEXT(S5PV210_GPIO_D0),
> > + =A0 =A0 =A0 S5PV210_GPIO_E0_START =A0 =3D
> S5PV210_GPIO_NEXT(S5PV210_GPIO_D1),
> > + =A0 =A0 =A0 S5PV210_GPIO_E1_START =A0 =3D
> S5PV210_GPIO_NEXT(S5PV210_GPIO_E0),
> > + =A0 =A0 =A0 S5PV210_GPIO_F0_START =A0 =3D
> S5PV210_GPIO_NEXT(S5PV210_GPIO_E1),
> > + =A0 =A0 =A0 S5PV210_GPIO_F1_START =A0 =3D
> S5PV210_GPIO_NEXT(S5PV210_GPIO_F0),
> > + =A0 =A0 =A0 S5PV210_GPIO_F2_START =A0 =3D
> S5PV210_GPIO_NEXT(S5PV210_GPIO_F1),
> > + =A0 =A0 =A0 S5PV210_GPIO_F3_START =A0 =3D
> S5PV210_GPIO_NEXT(S5PV210_GPIO_F2),
> > + =A0 =A0 =A0 S5PV210_GPIO_G0_START =A0 =3D
> S5PV210_GPIO_NEXT(S5PV210_GPIO_F3),
> > + =A0 =A0 =A0 S5PV210_GPIO_G1_START =A0 =3D
> S5PV210_GPIO_NEXT(S5PV210_GPIO_G0),
> > + =A0 =A0 =A0 S5PV210_GPIO_G2_START =A0 =3D
> S5PV210_GPIO_NEXT(S5PV210_GPIO_G1),
> > + =A0 =A0 =A0 S5PV210_GPIO_G3_START =A0 =3D
> S5PV210_GPIO_NEXT(S5PV210_GPIO_G2),
> > + =A0 =A0 =A0 S5PV210_GPIO_H0_START =A0 =3D
> S5PV210_GPIO_NEXT(S5PV210_GPIO_G3),
> > + =A0 =A0 =A0 S5PV210_GPIO_H1_START =A0 =3D
> S5PV210_GPIO_NEXT(S5PV210_GPIO_H0),
> > + =A0 =A0 =A0 S5PV210_GPIO_H2_START =A0 =3D
> S5PV210_GPIO_NEXT(S5PV210_GPIO_H1),
> > + =A0 =A0 =A0 S5PV210_GPIO_H3_START =A0 =3D
> S5PV210_GPIO_NEXT(S5PV210_GPIO_H2),
> > + =A0 =A0 =A0 S5PV210_GPIO_I_START =A0 =A0=3D
> S5PV210_GPIO_NEXT(S5PV210_GPIO_H3),
> > + =A0 =A0 =A0 S5PV210_GPIO_J0_START =A0 =3D S5PV210_GPIO_NEXT(S5PV2=
10_GPIO_I),
> > + =A0 =A0 =A0 S5PV210_GPIO_J1_START =A0 =3D
> S5PV210_GPIO_NEXT(S5PV210_GPIO_J0),
> > + =A0 =A0 =A0 S5PV210_GPIO_J2_START =A0 =3D
> S5PV210_GPIO_NEXT(S5PV210_GPIO_J1),
> > + =A0 =A0 =A0 S5PV210_GPIO_J3_START =A0 =3D
> S5PV210_GPIO_NEXT(S5PV210_GPIO_J2),
> > + =A0 =A0 =A0 S5PV210_GPIO_J4_START =A0 =3D
> S5PV210_GPIO_NEXT(S5PV210_GPIO_J3),
> > +};


(snip)


> > +/* UART */
> > +#define S5PV210_PA_UART =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xE2900000=
)
> > +#define S5P_PA_UART =A0 =A0 =A0 =A0 =A0 =A0S5PV210_PA_UART
> > +#define S5P_VA_UART =A0 =A0 =A0 =A0 =A0 =A0S3C_VA_UART
> > +
> > +#define S5P_PA_UART0 =A0 =A0 =A0 =A0 =A0 (S5P_PA_UART + 0x0)
> > +#define S5P_PA_UART1 =A0 =A0 =A0 =A0 =A0 (S5P_PA_UART + 0x400)
> > +#define S5P_PA_UART2 =A0 =A0 =A0 =A0 =A0 (S5P_PA_UART + 0x800)
> > +#define S5P_PA_UART3 =A0 =A0 =A0 =A0 =A0 (S5P_PA_UART + 0xC00)
> > +#define S5P_UART_OFFSET =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x400)
> > +
> > +#define S5P_VA_UARTx(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(S5P_VA_UAR=
T + (S5P_PA_UART &
> 0xfffff) \
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 + ((x=
) * S5P_UART_OFFSET))
> > +
> > +#define S5P_VA_UART0 =A0 =A0 =A0 =A0 =A0 S5P_VA_UARTx(0)
> > +#define S5P_VA_UART1 =A0 =A0 =A0 =A0 =A0 S5P_VA_UARTx(1)
> > +#define S5P_VA_UART2 =A0 =A0 =A0 =A0 =A0 S5P_VA_UARTx(2)
> > +#define S5P_VA_UART3 =A0 =A0 =A0 =A0 =A0 S5P_VA_UARTx(3)
> > +#define S5P_SZ_UART =A0 =A0 =A0 =A0 =A0 =A0SZ_256
>=20
> Please remove unfamiliar x S5P_VA_UARTx -> S5P_VA_UART.

The S5P_VA_UARTx(x) macro is used calculate the virtual base address fo=
r all
instances of UART module. So this macro is fine.

(snip)

> > +#define PHYS_OFFSET =A0 =A0 =A0 =A0 =A0 =A0UL(0x20000000)
> > +#define CONSISTENT_DMA_SIZE =A0 =A0(SZ_8M + SZ_4M + SZ_2M)
> > +#define NODE_MEM_SIZE_BITS =A0 =A0 28
>=20
> Can you confirm the PHYS_OFFSET is right? At previous time LSI guided
> that you should use the 0x3000'0000 for MFC issues. And please keep
> the consistent If you commit this one. we have to change the our
> environment from bootloader and kernel. Now we use the local kernel
> and mainline.
>=20
> Also how can you use if we got the 0x2000'0000 with 128MiB and
> 0x4000'0000 with 384MiB or 512MiB.
> There's too much memory holes. Please don't say use the split the use=
r
> and kernel 2G/2G configuration
> If we modify the base address, we can use above memory configuration
> without any changes.

According to hardware spec, PHYS_OFFSET is correct.

Actually in the previous kernel version, we used 0x3000_0000 as PHYS_OF=
=46SET
because of some issue. But there is no problem about that, in the prese=
nt
kernel.

I can understand, your concern if it changes.
So I will think more about that.

Thank you for your input.

(snip)

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
System LSI Division, SAMSUNG ELECTRONICS CO., LTD.

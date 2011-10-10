From: "Hyok S. Choi" <hyok.choi@samsung.com>
Subject: RE: [PATCH] arm: mm: Fix infinite looping issue
Date: Mon, 10 Oct 2011 09:31:58 +0900
Message-ID: <04ed01cc86e4$05760d70$10622850$@samsung.com>
References: <1317724684-29115-1-git-send-email-girish.shivananjappa@linaro.org>
 <CAKrE-KfYAwsPGgFQyV6M3tYpzWPgZCGdRGNxQUiB4ESC9i_L8A@mail.gmail.com>
Reply-To: hyok.choi@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:25289 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750925Ab1JJAcn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 9 Oct 2011 20:32:43 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LST00ASBQU3EV60@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Oct 2011 09:32:41 +0900 (KST)
Received: from DOHYOKCHOI03 ([168.219.193.154])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LST00F8JQUG9FB0@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 10 Oct 2011 09:32:40 +0900 (KST)
In-reply-to: <CAKrE-KfYAwsPGgFQyV6M3tYpzWPgZCGdRGNxQUiB4ESC9i_L8A@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Girish KS' <girishks2000@gmail.com>, 'Girish K S' <girish.shivananjappa@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, rmk+kernel@arm.linux.org.uk, linux-samsung-soc@vger.kernel.org, patches@linaro.org

Seems to be okay.

Thanks,
Hyok

-----Original Message-----
=46rom: Girish KS [mailto:girishks2000@gmail.com]=20
Sent: Saturday, October 08, 2011 2:25 PM
To: Girish K S
Cc: linux-arm-kernel@lists.infradead.org; rmk+kernel@arm.linux.org.uk;
linux-samsung-soc@vger.kernel.org; hyok.choi@samsung.com; patches@linar=
o.org
Subject: Re: [PATCH] arm: mm: Fix infinite looping issue

On Tue, Oct 4, 2011 at 4:08 PM, Girish K S <girish.shivananjappa@linaro=
=2Eorg>
wrote:
> This patch fixes the problem of infinite looping while booting.
>
> The bne instruction expects the z flag to be set to break the loop.
> The (mov r1, r1, lsr #1) doesn't behave in the expected way. If=20
> replaced with the movs instruction then the execution will exit the=20
> loop.
>
> Signed-off-by: Girish K S <girish.shivananjappa@linaro.org>
> ---
> =A0arch/arm/mm/proc-arm740.S | =A0 =A04 ++--
> =A0arch/arm/mm/proc-arm940.S | =A0 =A04 ++--
> =A0arch/arm/mm/proc-arm946.S | =A0 =A04 ++--
> =A03 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/mm/proc-arm740.S b/arch/arm/mm/proc-arm740.S=20
> index 4506be3..9284f10 100644
> --- a/arch/arm/mm/proc-arm740.S
> +++ b/arch/arm/mm/proc-arm740.S
> @@ -77,7 +77,7 @@ __arm740_setup:
> =A0 =A0 =A0 =A0ldr =A0 =A0 r1, =3D(CONFIG_DRAM_SIZE >> 12) =A0 @ size=
 of RAM (must be=20
> >=3D 4KB)
> =A0 =A0 =A0 =A0mov =A0 =A0 r2, #10 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 @ 11 is the minimum=20
> (4KB)
> =A01: =A0 =A0 add =A0 =A0 r2, r2, #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0@ area size *=3D 2
> - =A0 =A0 =A0 mov =A0 =A0 r1, r1, lsr #1
> + =A0 =A0 =A0 movs =A0 =A0r1, r1, lsr #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0@ set zero bit if r1=3D0
> =A0 =A0 =A0 =A0bne =A0 =A0 1b =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0@ count not zero=20
> r-shift
> =A0 =A0 =A0 =A0orr =A0 =A0 r0, r0, r2, lsl #1 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0@ the area register=20
> value
> =A0 =A0 =A0 =A0orr =A0 =A0 r0, r0, #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0@ set enable bit @@=20
> -87,7 +87,7 @@ __arm740_setup:
> =A0 =A0 =A0 =A0ldr =A0 =A0 r1, =3D(CONFIG_FLASH_SIZE >> 12) =A0@ size=
 of FLASH (must=20
> be >=3D 4KB)
> =A0 =A0 =A0 =A0mov =A0 =A0 r2, #10 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 @ 11 is the minimum=20
> (4KB)
> =A01: =A0 =A0 add =A0 =A0 r2, r2, #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0@ area size *=3D 2
> - =A0 =A0 =A0 mov =A0 =A0 r1, r1, lsr #1
> + =A0 =A0 =A0 movs =A0 =A0r1, r1, lsr #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0@ set zero bit if r1=3D0
> =A0 =A0 =A0 =A0bne =A0 =A0 1b =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0@ count not zero=20
> r-shift
> =A0 =A0 =A0 =A0orr =A0 =A0 r0, r0, r2, lsl #1 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0@ the area register=20
> value
> =A0 =A0 =A0 =A0orr =A0 =A0 r0, r0, #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0@ set enable bit diff=20
> --git a/arch/arm/mm/proc-arm940.S b/arch/arm/mm/proc-arm940.S index=20
> ac750d5..e639034 100644
> --- a/arch/arm/mm/proc-arm940.S
> +++ b/arch/arm/mm/proc-arm940.S
> @@ -296,7 +296,7 @@ __arm940_setup:
> =A0 =A0 =A0 =A0ldr =A0 =A0 r1, =3D(CONFIG_DRAM_SIZE >> 12) =A0 @ size=
 of RAM (must be=20
> >=3D 4KB)
> =A0 =A0 =A0 =A0mov =A0 =A0 r2, #10 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 @ 11 is the minimum=20
> (4KB)
> =A01: =A0 =A0 add =A0 =A0 r2, r2, #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0@ area size *=3D 2
> - =A0 =A0 =A0 mov =A0 =A0 r1, r1, lsr #1
> + =A0 =A0 =A0 movs =A0 =A0r1, r1, lsr #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0@ set zero bit if r1=3D0
> =A0 =A0 =A0 =A0bne =A0 =A0 1b =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0@ count not zero=20
> r-shift
> =A0 =A0 =A0 =A0orr =A0 =A0 r0, r0, r2, lsl #1 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0@ the area register=20
> value
> =A0 =A0 =A0 =A0orr =A0 =A0 r0, r0, #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0@ set enable bit @@=20
> -307,7 +307,7 @@ __arm940_setup:
> =A0 =A0 =A0 =A0ldr =A0 =A0 r1, =3D(CONFIG_FLASH_SIZE >> 12) =A0@ size=
 of FLASH (must=20
> be >=3D 4KB)
> =A0 =A0 =A0 =A0mov =A0 =A0 r2, #10 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 @ 11 is the minimum=20
> (4KB)
> =A01: =A0 =A0 add =A0 =A0 r2, r2, #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0@ area size *=3D 2
> - =A0 =A0 =A0 mov =A0 =A0 r1, r1, lsr #1
> + =A0 =A0 =A0 movs =A0 =A0r1, r1, lsr #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0@ set zero bit if r1=3D0
> =A0 =A0 =A0 =A0bne =A0 =A0 1b =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0@ count not zero=20
> r-shift
> =A0 =A0 =A0 =A0orr =A0 =A0 r0, r0, r2, lsl #1 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0@ the area register=20
> value
> =A0 =A0 =A0 =A0orr =A0 =A0 r0, r0, #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0@ set enable bit diff=20
> --git a/arch/arm/mm/proc-arm946.S b/arch/arm/mm/proc-arm946.S index=20
> 683af3a..731388a 100644
> --- a/arch/arm/mm/proc-arm946.S
> +++ b/arch/arm/mm/proc-arm946.S
> @@ -341,7 +341,7 @@ __arm946_setup:
> =A0 =A0 =A0 =A0ldr =A0 =A0 r1, =3D(CONFIG_DRAM_SIZE >> 12) =A0 @ size=
 of RAM (must be=20
> >=3D 4KB)
> =A0 =A0 =A0 =A0mov =A0 =A0 r2, #10 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 @ 11 is the minimum=20
> (4KB)
> =A01: =A0 =A0 add =A0 =A0 r2, r2, #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0@ area size *=3D 2
> - =A0 =A0 =A0 mov =A0 =A0 r1, r1, lsr #1
> + =A0 =A0 =A0 movs =A0 =A0r1, r1, lsr #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0@ set zero bit if r1=3D0
> =A0 =A0 =A0 =A0bne =A0 =A0 1b =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0@ count not zero=20
> r-shift
> =A0 =A0 =A0 =A0orr =A0 =A0 r0, r0, r2, lsl #1 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0@ the region register=20
> value
> =A0 =A0 =A0 =A0orr =A0 =A0 r0, r0, #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0@ set enable bit @@=20
> -351,7 +351,7 @@ __arm946_setup:
> =A0 =A0 =A0 =A0ldr =A0 =A0 r1, =3D(CONFIG_FLASH_SIZE >> 12) =A0@ size=
 of FLASH (must=20
> be >=3D 4KB)
> =A0 =A0 =A0 =A0mov =A0 =A0 r2, #10 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 @ 11 is the minimum=20
> (4KB)
> =A01: =A0 =A0 add =A0 =A0 r2, r2, #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0@ area size *=3D 2
> - =A0 =A0 =A0 mov =A0 =A0 r1, r1, lsr #1
> + =A0 =A0 =A0 movs =A0 =A0r1, r1, lsr #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0@ set zero bit if r1=3D0
> =A0 =A0 =A0 =A0bne =A0 =A0 1b =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0@ count not zero=20
> r-shift
> =A0 =A0 =A0 =A0orr =A0 =A0 r0, r0, r2, lsl #1 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0@ the region register=20
> value
> =A0 =A0 =A0 =A0orr =A0 =A0 r0, r0, #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0@ set enable bit
> --
> 1.7.1
>
>Hello Mr choi,
 Sorry for my previous top posting.
If there is no issue with this patch can you apply to your for-next tre=
e

> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

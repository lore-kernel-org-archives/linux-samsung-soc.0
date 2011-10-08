From: Girish KS <girishks2000@gmail.com>
Subject: Re: [PATCH] arm: mm: Fix infinite looping issue
Date: Sat, 8 Oct 2011 10:54:53 +0530
Message-ID: <CAKrE-KfYAwsPGgFQyV6M3tYpzWPgZCGdRGNxQUiB4ESC9i_L8A@mail.gmail.com>
References: <1317724684-29115-1-git-send-email-girish.shivananjappa@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:53389 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750730Ab1JHFYz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 8 Oct 2011 01:24:55 -0400
Received: by ggnv2 with SMTP id v2so3340825ggn.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Oct 2011 22:24:55 -0700 (PDT)
In-Reply-To: <1317724684-29115-1-git-send-email-girish.shivananjappa@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Girish K S <girish.shivananjappa@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, rmk+kernel@arm.linux.org.uk, linux-samsung-soc@vger.kernel.org, hyok.choi@samsung.com, patches@linaro.org

On Tue, Oct 4, 2011 at 4:08 PM, Girish K S
<girish.shivananjappa@linaro.org> wrote:
> This patch fixes the problem of infinite looping while booting.
>
> The bne instruction expects the z flag to be set to break the loop.
> The (mov r1, r1, lsr #1) doesn't behave in the expected way. If
> replaced with the movs instruction then the execution will exit
> the loop.
>
> Signed-off-by: Girish K S <girish.shivananjappa@linaro.org>
> ---
> =A0arch/arm/mm/proc-arm740.S | =A0 =A04 ++--
> =A0arch/arm/mm/proc-arm940.S | =A0 =A04 ++--
> =A0arch/arm/mm/proc-arm946.S | =A0 =A04 ++--
> =A03 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/mm/proc-arm740.S b/arch/arm/mm/proc-arm740.S
> index 4506be3..9284f10 100644
> --- a/arch/arm/mm/proc-arm740.S
> +++ b/arch/arm/mm/proc-arm740.S
> @@ -77,7 +77,7 @@ __arm740_setup:
> =A0 =A0 =A0 =A0ldr =A0 =A0 r1, =3D(CONFIG_DRAM_SIZE >> 12) =A0 @ size=
 of RAM (must be >=3D 4KB)
> =A0 =A0 =A0 =A0mov =A0 =A0 r2, #10 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 @ 11 is the minimum (4KB)
> =A01: =A0 =A0 add =A0 =A0 r2, r2, #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0@ area size *=3D 2
> - =A0 =A0 =A0 mov =A0 =A0 r1, r1, lsr #1
> + =A0 =A0 =A0 movs =A0 =A0r1, r1, lsr #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0@ set zero bit if r1=3D0
> =A0 =A0 =A0 =A0bne =A0 =A0 1b =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0@ count not zero r-shift
> =A0 =A0 =A0 =A0orr =A0 =A0 r0, r0, r2, lsl #1 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0@ the area register value
> =A0 =A0 =A0 =A0orr =A0 =A0 r0, r0, #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0@ set enable bit
> @@ -87,7 +87,7 @@ __arm740_setup:
> =A0 =A0 =A0 =A0ldr =A0 =A0 r1, =3D(CONFIG_FLASH_SIZE >> 12) =A0@ size=
 of FLASH (must be >=3D 4KB)
> =A0 =A0 =A0 =A0mov =A0 =A0 r2, #10 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 @ 11 is the minimum (4KB)
> =A01: =A0 =A0 add =A0 =A0 r2, r2, #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0@ area size *=3D 2
> - =A0 =A0 =A0 mov =A0 =A0 r1, r1, lsr #1
> + =A0 =A0 =A0 movs =A0 =A0r1, r1, lsr #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0@ set zero bit if r1=3D0
> =A0 =A0 =A0 =A0bne =A0 =A0 1b =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0@ count not zero r-shift
> =A0 =A0 =A0 =A0orr =A0 =A0 r0, r0, r2, lsl #1 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0@ the area register value
> =A0 =A0 =A0 =A0orr =A0 =A0 r0, r0, #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0@ set enable bit
> diff --git a/arch/arm/mm/proc-arm940.S b/arch/arm/mm/proc-arm940.S
> index ac750d5..e639034 100644
> --- a/arch/arm/mm/proc-arm940.S
> +++ b/arch/arm/mm/proc-arm940.S
> @@ -296,7 +296,7 @@ __arm940_setup:
> =A0 =A0 =A0 =A0ldr =A0 =A0 r1, =3D(CONFIG_DRAM_SIZE >> 12) =A0 @ size=
 of RAM (must be >=3D 4KB)
> =A0 =A0 =A0 =A0mov =A0 =A0 r2, #10 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 @ 11 is the minimum (4KB)
> =A01: =A0 =A0 add =A0 =A0 r2, r2, #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0@ area size *=3D 2
> - =A0 =A0 =A0 mov =A0 =A0 r1, r1, lsr #1
> + =A0 =A0 =A0 movs =A0 =A0r1, r1, lsr #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0@ set zero bit if r1=3D0
> =A0 =A0 =A0 =A0bne =A0 =A0 1b =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0@ count not zero r-shift
> =A0 =A0 =A0 =A0orr =A0 =A0 r0, r0, r2, lsl #1 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0@ the area register value
> =A0 =A0 =A0 =A0orr =A0 =A0 r0, r0, #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0@ set enable bit
> @@ -307,7 +307,7 @@ __arm940_setup:
> =A0 =A0 =A0 =A0ldr =A0 =A0 r1, =3D(CONFIG_FLASH_SIZE >> 12) =A0@ size=
 of FLASH (must be >=3D 4KB)
> =A0 =A0 =A0 =A0mov =A0 =A0 r2, #10 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 @ 11 is the minimum (4KB)
> =A01: =A0 =A0 add =A0 =A0 r2, r2, #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0@ area size *=3D 2
> - =A0 =A0 =A0 mov =A0 =A0 r1, r1, lsr #1
> + =A0 =A0 =A0 movs =A0 =A0r1, r1, lsr #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0@ set zero bit if r1=3D0
> =A0 =A0 =A0 =A0bne =A0 =A0 1b =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0@ count not zero r-shift
> =A0 =A0 =A0 =A0orr =A0 =A0 r0, r0, r2, lsl #1 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0@ the area register value
> =A0 =A0 =A0 =A0orr =A0 =A0 r0, r0, #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0@ set enable bit
> diff --git a/arch/arm/mm/proc-arm946.S b/arch/arm/mm/proc-arm946.S
> index 683af3a..731388a 100644
> --- a/arch/arm/mm/proc-arm946.S
> +++ b/arch/arm/mm/proc-arm946.S
> @@ -341,7 +341,7 @@ __arm946_setup:
> =A0 =A0 =A0 =A0ldr =A0 =A0 r1, =3D(CONFIG_DRAM_SIZE >> 12) =A0 @ size=
 of RAM (must be >=3D 4KB)
> =A0 =A0 =A0 =A0mov =A0 =A0 r2, #10 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 @ 11 is the minimum (4KB)
> =A01: =A0 =A0 add =A0 =A0 r2, r2, #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0@ area size *=3D 2
> - =A0 =A0 =A0 mov =A0 =A0 r1, r1, lsr #1
> + =A0 =A0 =A0 movs =A0 =A0r1, r1, lsr #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0@ set zero bit if r1=3D0
> =A0 =A0 =A0 =A0bne =A0 =A0 1b =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0@ count not zero r-shift
> =A0 =A0 =A0 =A0orr =A0 =A0 r0, r0, r2, lsl #1 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0@ the region register value
> =A0 =A0 =A0 =A0orr =A0 =A0 r0, r0, #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0@ set enable bit
> @@ -351,7 +351,7 @@ __arm946_setup:
> =A0 =A0 =A0 =A0ldr =A0 =A0 r1, =3D(CONFIG_FLASH_SIZE >> 12) =A0@ size=
 of FLASH (must be >=3D 4KB)
> =A0 =A0 =A0 =A0mov =A0 =A0 r2, #10 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 @ 11 is the minimum (4KB)
> =A01: =A0 =A0 add =A0 =A0 r2, r2, #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0@ area size *=3D 2
> - =A0 =A0 =A0 mov =A0 =A0 r1, r1, lsr #1
> + =A0 =A0 =A0 movs =A0 =A0r1, r1, lsr #1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0@ set zero bit if r1=3D0
> =A0 =A0 =A0 =A0bne =A0 =A0 1b =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0@ count not zero r-shift
> =A0 =A0 =A0 =A0orr =A0 =A0 r0, r0, r2, lsl #1 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0@ the region register value
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

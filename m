From: Seungwhan Youn <claude.youn@gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: EXYNOS4: Add EPLL clock operations
Date: Wed, 22 Jun 2011 17:01:55 +0900
Message-ID: <BANLkTim2pK5qKwQ5fmJxRHmNHCU=oJtf3A@mail.gmail.com>
References: <1308655463-8787-1-git-send-email-ch.naveen@samsung.com>
	<1308655463-8787-4-git-send-email-ch.naveen@samsung.com>
	<BANLkTim_0yj8hSefv5BUg5Z1vLh5SWhqjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f42.google.com ([74.125.82.42]:34258 "EHLO
	mail-ww0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751613Ab1FVIB4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jun 2011 04:01:56 -0400
Received: by wwg11 with SMTP id 11so982649wwg.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Jun 2011 01:01:55 -0700 (PDT)
In-Reply-To: <BANLkTim_0yj8hSefv5BUg5Z1vLh5SWhqjA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jassisinghbrar@gmail.com, sbkim73@samsung.com, sw.youn@samsung.com, kgene.kim@samsung.com

Hi Naveen,

On Wed, Jun 22, 2011 at 3:51 PM, Naveen Krishna Ch
<naveenkrishna.ch@gmail.com> wrote:
> Hi Every one,
>
> 1. Both S5P6440 and S5P6450 uses PLL90XX for EPLL.
> =C2=A0However, the same epll_ops is duplicated in the following files
> =C2=A0arch/arm/mach-s5p64x0/clock-s5p6440.c
> =C2=A0arch/arm/mach-s5p64x0/clock-s5p6450.c
>
> =C2=A0Please find attached patch which moves it to the common clock.c
> =C2=A0Attachment: "0001-ARM-S5P64X0-Move-duplicated-epll-code.patch"
>
> 2. Also, S5PV210, C110, C100, 6450/6440 and EXYNOS4 define their own
> =C2=A0epll_ops.
>
> =C2=A0The following attachment consolidates the same on the basis of =
PLL types
> =C2=A0"Eg: PLL90XX. PLL46XX, PLL45XX and PLL65XX"
>
> =C2=A0Kindly, review the approach and comment.
> =C2=A0Attachment: "0001-ARM-Samsung-organize-duplicated-EPLL-code.pat=
ch"

I think this is a good try to clean-up Samsung platform's PLL settings.=
 :)
But one thing that I concern is 'epll_div' values are not a common
value, it depends on board because of these values come from outer xtl
which was selected by OM on board side. So, I wonder if you want to
make PLL as a common platform, you may solve these 'epll_div' values
to be correct. For example, you may calculate 'epll_div' values with
formula which is in user manual or set 'epll_div' values in board
specific file not platform file.

        claude

From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 1/6] ARM: Exynos4: Fix the incorrect hierarchy of spi
 controller bus clock
Date: Thu, 24 May 2012 14:30:04 +0530
Message-ID: <CAJuYYwT7oscA6_fHLqSke0-STF7ssVput8NniP9QkqwX2_L2bg@mail.gmail.com>
References: <1337334392-6441-1-git-send-email-thomas.abraham@linaro.org>
	<1337334392-6441-2-git-send-email-thomas.abraham@linaro.org>
	<006601cd397e$a9932df0$fcb989d0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:35045 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754206Ab2EXJAG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 May 2012 05:00:06 -0400
Received: by wgbdr13 with SMTP id dr13so8083691wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 May 2012 02:00:04 -0700 (PDT)
In-Reply-To: <006601cd397e$a9932df0$fcb989d0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, jaswinder.singh@linaro.org

On 24 May 2012 12:57, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Thomas Abraham wrote:
>>
>> The sclk_spi clock is derived currently from the first level divider
>> (MMCx_RATIO) which is incorrect. The output of the first level clock
>> is divided by a second level divider (MMCx_PRE_RATIO), the output of
>> which is used as the spi bus clock (sclk_spi). Fix the clock hierarc=
hy
>> issues for the sclk_spi clock.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> Acked-by: Jaswinder Singh <jaswinder.singh@linaro.org>
>> ---
>> =A0arch/arm/mach-exynos/clock-exynos4.c | =A0 48
> ++++++++++++++++++++++++++++--
>> ---
>> =A01 files changed, 40 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/clock-exynos4.c b/arch/arm/mach-
>> exynos/clock-exynos4.c
>> index 10a46a9..b5f0507 100644
>> --- a/arch/arm/mach-exynos/clock-exynos4.c
>> +++ b/arch/arm/mach-exynos/clock-exynos4.c
>> @@ -1242,40 +1242,70 @@ static struct clksrc_clk exynos4_clk_sclk_mm=
c3 =3D {
>> =A0 =A0 =A0 .reg_div =3D { .reg =3D EXYNOS4_CLKDIV_FSYS2, .shift =3D=
 24, .size =3D 8 },
>> =A0};
>>
>> +static struct clksrc_clk exynos4_clk_mdout_spi0 =3D {
>
> In this case, it's expected that 'exynos4_clk_dout_spi0' will be used=
 even
> though this indicates the clock of mux_out and divider_out together.
>
>> + =A0 =A0 .clk =A0 =A0=3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "sclk_spi_md=
out",
>
> So, this should be 'dout_spi0'

This clock instance has both a mux and a divider. So I used mdout to
mean that there is both a mux and a divider in this clock instance. If
you insist on changing the name to dout_spi0, I will change it.

Thanks,
Thomas.

>
>> + =A0 =A0 =A0 =A0 =A0 =A0 .devname =A0 =A0 =A0 =A0=3D "exynos4210-sp=
i.0",
>
> [...]
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>

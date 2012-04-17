From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 03/12] ARM: Exynos5: Add watchdog timer clock instance
Date: Tue, 17 Apr 2012 13:42:11 +0530
Message-ID: <CAJuYYwTLZ8TCkaTFOGB8cS9AXXf_OyTkCysWHoGR4h7C47-JWA@mail.gmail.com>
References: <1334641595-25301-1-git-send-email-thomas.abraham@linaro.org>
	<1334641595-25301-4-git-send-email-thomas.abraham@linaro.org>
	<CAH9JG2WOUjG=spRGPCcWocLkhMXA7PtmdxLdq87VCez_6L84XA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:64054 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755188Ab2DQIMM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Apr 2012 04:12:12 -0400
Received: by vbbff1 with SMTP id ff1so3947939vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Apr 2012 01:12:11 -0700 (PDT)
In-Reply-To: <CAH9JG2WOUjG=spRGPCcWocLkhMXA7PtmdxLdq87VCez_6L84XA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

On 17 April 2012 11:44, Kyungmin Park <kmpark@infradead.org> wrote:
> On 4/17/12, Thomas Abraham <thomas.abraham@linaro.org> wrote:
>> Add watchdog timer clock instance for Exynos5 watchdog controller.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>> =A0arch/arm/mach-exynos/clock-exynos5.c | =A0 =A05 +++++
>> =A01 files changed, 5 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/clock-exynos5.c
>> b/arch/arm/mach-exynos/clock-exynos5.c
>> index ad3bec4..662615d 100644
>> --- a/arch/arm/mach-exynos/clock-exynos5.c
>> +++ b/arch/arm/mach-exynos/clock-exynos5.c
>> @@ -474,6 +474,11 @@ static struct clk exynos5_init_clocks_off[] =3D=
 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D exynos5_clk_=
ip_peris_ctrl,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 20),
>> =A0 =A0 =A0 }, {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "watchdog",
>> + =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &exynos5_clk_a=
clk_66.clk,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D exynos5_clk_ip=
_peris_ctrl,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 19),
>
> Hi,
>
> Can you place this in order? It has same "exynos5_clk_ip_peris_ctrl",
> but located under (1 << 20).

Hi Mr. Park,

At present, there is only one clock gate from the peris register for
which there is a struct clock instance. This patch adds the watchdog
timer clock gate right below it and maintains the descending bit
position order.

Thanks,
Thomas.

>
> Thank you,
> Kyungmin Park
>> + =A0 =A0 }, {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "hsmmc",
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .devname =A0 =A0 =A0 =A0=3D "exynos4-sdh=
ci.0",
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &exynos5_clk=
_aclk_200.clk,
>> --
>> 1.6.6.rc2
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-sams=
ung-soc"
>> in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>

From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 6/6] arm: exynos4: Add a new Exynos4 device tree enabled machine
Date: Tue, 21 Jun 2011 17:00:41 +0530
Message-ID: <BANLkTi=OVkGVP-FJkjHbd9tLuQE9gAFP9A@mail.gmail.com>
References: <1308567752-13451-1-git-send-email-thomas.abraham@linaro.org>
	<1308567752-13451-7-git-send-email-thomas.abraham@linaro.org>
	<BANLkTinaXg+_4xQiMCUw-aeGFeZs1iNuCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:47103 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750782Ab1FULam convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2011 07:30:42 -0400
Received: by qwk3 with SMTP id 3so1224741qwk.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Jun 2011 04:30:41 -0700 (PDT)
In-Reply-To: <BANLkTinaXg+_4xQiMCUw-aeGFeZs1iNuCQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

On 20 June 2011 22:25, Grant Likely <grant.likely@secretlab.ca> wrote:

<snip>

>> +
>> +static const struct of_dev_auxdata exynos4_auxdata_lookup[] __initc=
onst =3D {
>> + =A0 =A0 =A0 OF_DEV_AUXDATA("samsung,s3c-sdhci", EXYNOS4_PA_HSMMC(2=
),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "s3c-s=
dhci.2", &s3c_hsmmc2_def_platdata),
>> + =A0 =A0 =A0 OF_DEV_AUXDATA("samsung,s3c-sdhci", EXYNOS4_PA_HSMMC(0=
),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "s3c-s=
dhci.0", &s3c_hsmmc0_def_platdata),
>> + =A0 =A0 =A0 OF_DEV_AUXDATA("samsung,s5pv210-uart", S5P_PA_UART0,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "s5pv2=
10-uart.0", NULL),
>> + =A0 =A0 =A0 OF_DEV_AUXDATA("samsung,s5pv210-uart", S5P_PA_UART1,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "s5pv2=
10-uart.1", NULL),
>> + =A0 =A0 =A0 {},
>> +};

<snip>

>> +static void __init exynos4_dt_machine_init(void)
>> +{
>> + =A0 =A0 =A0 s3c_sdhci0_set_platdata(&smdkv310_hsmmc0_pdata);
>> + =A0 =A0 =A0 s3c_sdhci2_set_platdata(&smdkv310_hsmmc2_pdata);
>
> Are these two lines still necessary?

Yes, but these are temporary. The data from smdkv310_hsmmc0_pdata is
copied to s3c_hsmmc2_def_platdata which is then used as platform data.
I will remove them in the next version of the patch.

Thanks,
Thomas.

>
> Otherwise, the patch looks good to me.
>
> g.

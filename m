From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: [PATCH 1/3] ARM: EXYNOS: Add ASV feature for Exynos4 series
Date: Thu, 10 Nov 2011 14:57:34 +0900
Message-ID: <CAJ0PZbR9DEOud8j90n0M4UHQ=HA35NSzO0MHUzAxsOz4ViVCKA@mail.gmail.com>
References: <1319677938-25732-1-git-send-email-boyko.lee@samsung.com>
	<1319677938-25732-2-git-send-email-boyko.lee@samsung.com>
	<4EAAF8EF.5010201@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:61190 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753074Ab1KJF5f convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Nov 2011 00:57:35 -0500
Received: by bke11 with SMTP id 11so1980016bke.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Nov 2011 21:57:34 -0800 (PST)
In-Reply-To: <4EAAF8EF.5010201@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <snjw23@gmail.com>
Cc: Jongpill Lee <boyko.lee@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On Sat, Oct 29, 2011 at 3:48 AM, Sylwester Nawrocki <snjw23@gmail.com> =
wrote:
>
> You're putting whole driver under arch/arm/, I'm wondering whether th=
e functionality
> it provides could be handled by some generic framework, like cpufreq =
or devfreq.
> How this driver is different from cpufreq drivers ?

I think there would be futher usage with ASV if IEM and proper PMICs
are attaches; however, for now, ASV guides proper vddarm and vddint
voltages for each freuquency.

Both drivers in cpufreq(vddarm and arm core freq) and devfreq(vddint
and memory/bus freq.. and GPU or MMC later?) should use the result
value of ASV because they both alter voltages according to the ASV
value.

Thus, if this is going to be located in drivers/, it'd better be in
elsewhere (drivers/misc? drivers/hwmon? ..???) and capable of
providing values to other device drivers, at least to cpufreq and
devfreq drivers.


Cheers!
MyungJoo

>
> --
> Thanks,
> Sylwester
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab, DMC Business, Samsung Electronics

From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH V3 0/4] clk: Samsung: audss: Register audio subsytem clocks
 using common clk framework
Date: Sat, 01 Jun 2013 11:20:50 +0200
Message-ID: <51A9BCF2.1060009@gmail.com>
References: <1369735378-10003-1-git-send-email-padma.v@samsung.com> <51A9B0D1.2090408@gmail.com> <CAAgF-BfSv2WYiZrPzbdsE+7ReoncOAf1gQn+N7A2yrETFb_D4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f50.google.com ([209.85.214.50]:45682 "EHLO
	mail-bk0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756756Ab3FAJUz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 1 Jun 2013 05:20:55 -0400
Received: by mail-bk0-f50.google.com with SMTP id ik5so1107638bkc.23
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Jun 2013 02:20:54 -0700 (PDT)
In-Reply-To: <CAAgF-BfSv2WYiZrPzbdsE+7ReoncOAf1gQn+N7A2yrETFb_D4g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, sbkim73@samsung.com, broonie@kernel.org, kgene.kim@samsung.com, mturquette@linaro.org

Hi,

On 06/01/2013 11:06 AM, Padma Venkat wrote:
> Actuvally I added samsung prefix when I added s5pv210 compatible name.
>   But I also feel
> Exynos would be better now. I will resend the patch with Exynos prefix
> and with your reviewed-by.

Yes, that sounds like a good idea. S5PV210 is also known as Exynos3110,
and before the Exynos4210 name first appeared we had S5PV310.

Thanks,
Sylwester

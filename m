From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/3] clk: exynos5250: Add G2D gate clock
Date: Sat, 27 Jul 2013 18:59:56 +0530
Message-ID: <CAK9yfHw6KtVDAns-1JhNpiS0brTeUpfiHS-v3q7H2GLWkY-Adw@mail.gmail.com>
References: <1373013749-14530-1-git-send-email-sachin.kamat@linaro.org>
	<20130726201800.7598.54329@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:48287 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751759Ab3G0N34 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 27 Jul 2013 09:29:56 -0400
Received: by mail-ob0-f169.google.com with SMTP id wc20so5775obb.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Jul 2013 06:29:56 -0700 (PDT)
In-Reply-To: <20130726201800.7598.54329@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, patches@linaro.org, inki.dae@samsung.com

On 27 July 2013 01:48, Mike Turquette <mturquette@linaro.org> wrote:
> Quoting Sachin Kamat (2013-07-05 01:42:27)
>> Adds gate clock for G2D IP for Exynos5250 SoC.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> Cc: Mike Turquette <mturquette@linaro.org>
>
> I've taken patch #1 into clk-next.

Thanks Mike.

>
>> ---
>> This patch depends on the following patch:
>> http://thread.gmane.org/gmane.linux.kernel.samsung-soc/20581
>
> I think I've gotten all three series you sent out, can you confirm?

I haven't seen any update in your tree [1] since quite some time. The
last commit I see in clk-next branch is 45e3ec3784 ("clk: tegra: fix
ifdef for tegra_periph_reset_assert inline"). I hope I am looking at
the right tree?

[1] git://git.linaro.org/people/mturquette/linux.git

-- 
With warm regards,
Sachin

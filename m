From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [GIT PULL] Samsung clock changes for v3.15
Date: Wed, 19 Mar 2014 02:19:25 +0100
Message-ID: <5328F09D.9090103@gmail.com>
References: <1395079197-13598-1-git-send-email-t.figa@samsung.com> <20140319010634.30995.4609@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f47.google.com ([74.125.83.47]:47914 "EHLO
	mail-ee0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758754AbaCSBTX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Mar 2014 21:19:23 -0400
Received: by mail-ee0-f47.google.com with SMTP id b15so5967187eek.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Mar 2014 18:19:22 -0700 (PDT)
In-Reply-To: <20140319010634.30995.4609@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Tomasz Figa <t.figa@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Mike,

On 19.03.2014 02:06, Mike Turquette wrote:
> Quoting Tomasz Figa (2014-03-17 10:59:57)
>> The following changes since commit 38dbfb59d1175ef458d006556061adeaa8751b72:
>>
>>    Linus 3.14-rc1 (2014-02-02 16:42:13 -0800)
>>
>> are available in the git repository at:
>>
>>    git://git.kernel.org/pub/scm/linux/kernel/git/tfiga/samsung-clk.git tags/for_3.15/samsung-clk
>>
>> for you to fetch changes up to 70d1cf1c85486753fec0c60a9a093bdfe42b89b4:
>>
>>    Merge branch 'for_3.15/misc' into samsung-next (2014-03-17 13:00:01 +0100)
>>
>> ----------------------------------------------------------------
>>
>> Samsung clock patches for v3.15.
>>
>> Due to dependencies, most of the patches already went through linux-samsung
>> tree, so this pull request is rather small.
>
> I'm a bit confused. This PR is not really small (32 patches) and it
> covers more stuff from arch/arm that I usually take.
>
>> It contains various patches
>> collected since the last merge window:
>>
>> 1) non-critical fixes (without need to push to stable):
>>
>> 220b0cc clk: samsung: Initialize clock table with error pointers
>> 58d83cb clk: exynos-5420: Fix VPLL lock offset
>> 3299bc3 clk: samsung: fixed compiler warning [-Wpointer-to-int-cast]
>>
>> 2) clock driver extensions:
>>
>> db40d0c clk: samsung exynos5250/5420: Add gate clock for SSS module
>> d8b9731 clk/samsung: add support for multiple clock providers
>> 45af130 clk/samsung: add support for pll2550xx
>> adec437 clk/samsung: add support for pll2650xx
>
> Right, these 7 patches would constitute a small PR. Was there a mistake
> when generating this pull request?

The problem with this pull request is that it contains patches that 
require quite a lot of dependencies that have been already applied into 
Samsung SoC tree. I'm not sure how else such situation could be handled, 
other than pulling respective commits into my tree as well.

I don't think this would make any problem when merging into Linus' tree, 
as these are exactly the same commits that will go through ARM SoC, so 
git should merge them just fine. Still, if you have a better idea what 
to do now, I will do so.

Best regards,
Tomasz

From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 0/2] Clock changes for supporting CPUFreq on Exynos5250
Date: Fri, 07 Jun 2013 09:27:13 +0530
Message-ID: <51B15A19.2020403@linaro.org>
References: <1368770153-29041-1-git-send-email-tushar.behera@linaro.org> <51A442E4.90307@linaro.org> <20130529224203.6058.75266@quantum> <51B0501A.8070004@linaro.org> <20130606195156.10233.37021@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:45835 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752312Ab3FGD5W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Jun 2013 23:57:22 -0400
Received: by mail-pa0-f42.google.com with SMTP id rl6so2244385pac.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Jun 2013 20:57:22 -0700 (PDT)
In-Reply-To: <20130606195156.10233.37021@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, patches@linaro.org

>> Would it be possible for you to queue them for 3.10-rc? These two
>> patches are sufficient for cpufreq to work on Arndale board. It would be
>> nice to have cpufreq working on 3.10 kernel.
>>
> 
> I only want to take bug fixes into the -rc's.  Did cpufreq work on
> Arndale in v3.10?  If it did then this is a regression and can be fixed.
> If this is a new feature however I'll keep the patches in clk-next.
> 

This fixes a regression as cpufreq was working for EXYNOS5250 based
systems before migration to CCF.

Though Arndale support was added during 3.10, this holds good for other
EXYNOS5250 based systems.

-- 
Tushar Behera

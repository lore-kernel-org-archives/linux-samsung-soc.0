From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 0/2] Clock changes for supporting CPUFreq on Exynos5250
Date: Thu, 06 Jun 2013 14:32:18 +0530
Message-ID: <51B0501A.8070004@linaro.org>
References: <1368770153-29041-1-git-send-email-tushar.behera@linaro.org> <51A442E4.90307@linaro.org> <20130529224203.6058.75266@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130529224203.6058.75266@quantum>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

On 05/30/2013 04:12 AM, Mike Turquette wrote:
> Quoting Tushar Behera (2013-05-27 22:38:44)
>> On 05/17/2013 11:25 AM, Tushar Behera wrote:
>>> With the use of common clock framework, CPUFreq driver on EXYNOS5250 now
>>> requires a few changes in clocks.
>>>
>>> Tested on Exynos5250 based Arndale board.
>>> The patches are based on v3.10-rc1.
>>>
>>> Tushar Behera (2):
>>>   clk: exynos5250: Update cpufreq related clocks for EXYNOS5250
>>>   clk: exynos5250: Add sclk_mpll to the parent list of mout_cpu clock
>>>
>>>  drivers/clk/samsung/clk-exynos5250.c |    8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>
>> Any comments on this series?
>>
> 
> I've taken both patches into clk-next.
> 

Would it be possible for you to queue them for 3.10-rc? These two
patches are sufficient for cpufreq to work on Arndale board. It would be
nice to have cpufreq working on 3.10 kernel.

> Regards,
> Mike
> 
>> -- 
>> Tushar Behera


-- 
Tushar Behera

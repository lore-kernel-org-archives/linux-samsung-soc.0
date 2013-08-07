From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [RFC v3 09/13] [media] exynos5-fimc-is: Add the hardware pipeline control
Date: Wed, 7 Aug 2013 11:22:30 +0530
Message-ID: <CAK9yfHy0BH4mUz+hYbBExpdo3kNG3iVo7NrN45tqiHrX2rCtcw@mail.gmail.com>
References: <1375455762-22071-1-git-send-email-arun.kk@samsung.com>
	<1375455762-22071-10-git-send-email-arun.kk@samsung.com>
	<51FE6C86.1010906@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <51FE6C86.1010906@gmail.com>
Sender: linux-media-owner@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Arun Kumar K <arun.kk@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, s.nawrocki@samsung.com, hverkuil@xs4all.nl, a.hajda@samsung.com, shaik.ameer@samsung.com, kilyeon.im@samsung.com, arunkk.samsung@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Arun,

On 4 August 2013 20:30, Sylwester Nawrocki <sylvester.nawrocki@gmail.com> wrote:
> Hi Arun,
>
> On 08/02/2013 05:02 PM, Arun Kumar K wrote:
>>
>> This patch adds the crucial hardware pipeline control for the
>> fimc-is driver. All the subdev nodes will call this pipeline
>> interfaces to reach the hardware. Responsibilities of this module
>> involves configuring and maintaining the hardware pipeline involving
>> multiple sub-ips like ISP, DRC, Scalers, ODC, 3DNR, FD etc.
>>
>> Signed-off-by: Arun Kumar K<arun.kk@samsung.com>
>> Signed-off-by: Kilyeon Im<kilyeon.im@samsung.com>
>> ---
>>   .../media/platform/exynos5-is/fimc-is-pipeline.c   | 1961
>> ++++++++++++++++++++
>>   .../media/platform/exynos5-is/fimc-is-pipeline.h   |  129 ++
>>   2 files changed, 2090 insertions(+)
>>   create mode 100644 drivers/media/platform/exynos5-is/fimc-is-pipeline.c
>>   create mode 100644 drivers/media/platform/exynos5-is/fimc-is-pipeline.h

[snip]

>> +                       setfile_name,&is->pdev->dev);
>> +       if (ret != 0) {
>> +               pr_err("Setfile %s not found\n", setfile_name);
>
>
> dev_err(), please. I'm a bit tired of commenting on this excessive pr_*
> usage. Please really make sure dev_err()/v4l2_err() is used where possible.

pr_* should be used only when device pointer is not available. In all
other cases dev_* takes priority.

-- 
With warm regards,
Sachin

From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] clk: exynos5250: Fix divider values for sclk_mmc{0,1,2,3}
Date: Tue, 23 Apr 2013 08:22:14 +0530
Message-ID: <5175F75E.105@linaro.org>
References: <1364890840-20052-1-git-send-email-tushar.behera@linaro.org> <20130404213331.8665.7028@quantum> <2c9001ce3429$e5989a50$b0c9cef0$%kim@samsung.com> <CAD=FV=UUg9Apb0o+zLdidDUmkLZt1phgo80bxug=o6JmANCPfw@mail.gmail.com> <CAOesGMj-wfWNwvP7iAyr0nB0HE_PBzj3DGeE-ixNc3MqtCH9Qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOesGMj-wfWNwvP7iAyr0nB0HE_PBzj3DGeE-ixNc3MqtCH9Qg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Doug Anderson <dianders@chromium.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Patch Tracking <patches@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, Olof Johansson <olofj@chromium.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 04/22/2013 11:10 PM, Olof Johansson wrote:
> Hi,
> 
> On Tue, Apr 16, 2013 at 12:35 PM, Doug Anderson <dianders@chromium.org> wrote:
>> Hi,
>>
>> On Mon, Apr 8, 2013 at 12:22 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
>>> Mike Turquette wrote:
>>>>
>>>> Quoting Tushar Behera (2013-04-02 01:20:40)
>>>>> In legacy setup, sclk_mmc{0,1,2,3} used PRE_RATIO bit-field (8-bit wide)
>>>>> instead of RATIO bit-field (4-bit wide) for dividing clock rate.
>>>>>
>>>>> With current common clock setup, we are using RATIO bit-field which
>>>>> is creating FIFO read errors while accessing eMMC. Changing over to
>>>>> use PRE_RATIO bit-field fixes this issue.
>>>>>
>>>>> dwmmc_exynos 12200000.dwmmc0: data FIFO error (status=00008020)
>>>>> mmcblk0: error -5 transferring data, sector 1, nr 7, cmd response 0x900,
>>>> card status 0x0
>>>>> end_request: I/O error, dev mmcblk0, sector 1
>>>>>
>>>>> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
>>>>> CC: Thomas Abraham <thomas.abraham@linaro.org>
>>>>
>>>> I guess this will be applied through the samsung tree, so:
>>>>
>>>> Acked-by: Mike Turquette <mturquette@linaro.org>
>>>>
>>> Thanks, applied.
>>
>> I haven't yet had time to dig / track down why, but this patch totally
>> messes up access to the eMMC on the ARM Chromebook (exynos5250-snow).
>> I suddenly start getting FIFO errors like you show above.  When I
>> revert your change then I'm all happy.
>>
>> Perhaps I need a device tree setting change as well?  I always forget
>> how the "samsung,dw-mshc-ciu-div" / "samsung,dw-mshc-sdr-timing"
>> properties work...
>>
>> For the short term I'm going to revert locally since I've got a few
>> other things to do over the next few days.  If nobody else gets around
>> to it then I'll try to find time to dig further.
> 
> Unless I hear differently within 24 hours, I am going to revert this
> in arm-soc (since that is where it is merged right now).
> 

I will have a look at it today.

> It is obviously causing regressions on existing platforms. I am _NOT_
> happy to see dead silence about this for 6 days. Tushar??
> 

Apologies.

> 
> 
> -Olof
> 


-- 
Tushar Behera

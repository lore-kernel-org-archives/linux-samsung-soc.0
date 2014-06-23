From: Kevin Hilman <khilman@linaro.org>
Subject: Re: mainline boot: 64 boots: 62 pass, 2 fail (v3.16-rc1-2-gebe0618)
Date: Mon, 23 Jun 2014 11:32:43 -0700
Message-ID: <CAGa+x85H510fNGTXJHGYfQybRa2FGgg2NyCgJ8rmjJ6TE7GNbA@mail.gmail.com>
References: <539fdd37.e7bc420a.76b9.ffffb583@mx.google.com>
	<CAGa+x85nqPbH-sye28ni=gUEdgjGdUDqHhv1+0pV5aO8y1+wHQ@mail.gmail.com>
	<53A106F1.10201@gmail.com>
	<CAGa+x8527FEPk6fg5kv-fbOzK3MzcFooFGE9Me12b9C_Pv=UzA@mail.gmail.com>
	<53A2AE11.2050208@gmail.com>
	<53A2BE94.2010308@gmail.com>
	<53A7A579.4010702@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f54.google.com ([209.85.192.54]:56371 "EHLO
	mail-qg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751436AbaFWSco (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jun 2014 14:32:44 -0400
Received: by mail-qg0-f54.google.com with SMTP id q107so6172393qgd.41
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jun 2014 11:32:43 -0700 (PDT)
In-Reply-To: <53A7A579.4010702@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <trblinux@gmail.com>
Cc: Laura Abbott <lauraa@codeaurora.org>, Sachin Kamat <spk.linux@gmail.com>, kernel-build-reports@lists.linaro.org, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, Russell King <linux@arm.linux.org.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Sun, Jun 22, 2014 at 8:56 PM, Tushar Behera <trblinux@gmail.com> wrote:
> Adding linux-samsung-soc and linux-arm-kernel ML for wider audience.
>
> On 06/19/2014 04:12 PM, Tushar Behera wrote:
>> On 06/19/2014 03:02 PM, Tushar Behera wrote:
>>> On 06/18/2014 09:22 AM, Kevin Hilman wrote:
>>>> On Tue, Jun 17, 2014 at 8:26 PM, Tushar Behera <trblinux@gmail.com> wrote:
>>>>> On 06/17/2014 10:23 PM, Kevin Hilman wrote:
>>>>>> Sachin,
>>>>>>
>>>>>> On Mon, Jun 16, 2014 at 11:16 PM, Kevin's boot bot <khilman@linaro.org> wrote:
>>>>>>>
>>>>>>> Tree/Branch: mainline
>>>>>>> Git describe: v3.16-rc1-2-gebe0618
>>>>>>> Failed boot tests (console logs at the end)
>>>>>>> ===========================================
>>>>>>>      exynos5420-arndale-octa:     FAIL:    arm-exynos_defconfig
>>>>>>>                 ste-snowball:     FAIL:    arm-u8500_defconfig
>>>>>>
>>>>>> FYI... these failures are getting more consistent on my octa board,
>>>>>> but still not failing every time.
>>>>>>
>>>>>> Kevin
>>>>>>
>>>>>
>>>>> Hi Kevin,
>>>>>
>>>>> Same here.
>>>>>
>>>>> Observation: If you soft-reset the board (through the jumpers) after
>>>>> getting this problem, the problem keeps repeating. But if you hard-reset
>>>>> the board (by removing the power cord), the problem doesn't occur during
>>>>> next iteration.
>>>>
>>>> I don't ever use the soft-reset, I only toggle the wall power.  I
>>>> don't ever actually remove the power cord though, I'm using a
>>>> USB-controlled relay to toggle the wall power.
>>>>
>>>> Kevin
>>>>
>>>
>>> Laura,
>>>
>>> We are getting following kernel panic [1] (not always, but quite
>>> regularly) while booting Arndale-Octa (based on Samsung's Exynos5420)
>>> board with upstream kernel. I haven't observed this issue with other
>>> boards yet.
>>>
>>> This issue is observed when I am booting with uImage + dtb (within
>>> roughly ~10 iterations).
>>>
>>
>> Some more information:
>>
>> The boot logs are provided in pastebin, okay[2] and failed[3].
>>
>> In case of boot failures, I am getting a higher value for vm_total_pages
>> (684424 in [3]). In case of successful boot on my board, it is always
>> 521232 [2] on my board.

I can confirm that reverting the "Get rid of meminfo" patch gets the
Octa board booting reliably again for me also.

In case it helps, some boot logs for failures from the last copule
linux-next build/boot cycles can be seen here:
http://armcloud.us/kernel-ci/next/next-20140623/arm-exynos_defconfig/boot-exynos5420-arndale-octa.log
http://armcloud.us/kernel-ci/next/next-20140620/arm-exynos_defconfig/boot-exynos5420-arndale-octa.log

Kevin

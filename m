From: Arun Kumar K <arunkk.samsung@gmail.com>
Subject: Re: [RFC v3 10/13] [media] exynos5-fimc-is: Add the hardware
 interface module
Date: Wed, 7 Aug 2013 10:46:34 +0530
Message-ID: <CALt3h7-hJtKi8p=kt719LfRRu0N4PSbju-Uh=XobZvx85gyngg@mail.gmail.com>
References: <1375455762-22071-1-git-send-email-arun.kk@samsung.com>
	<1375455762-22071-11-git-send-email-arun.kk@samsung.com>
	<51FE6D38.6020208@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <51FE6D38.6020208@gmail.com>
Sender: linux-media-owner@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: LMML <linux-media@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Hajda <a.hajda@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, shaik.ameer@samsung.com, kilyeon.im@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Sylwester,

On Sun, Aug 4, 2013 at 8:33 PM, Sylwester Nawrocki
<sylvester.nawrocki@gmail.com> wrote:
> Hi Arun,
>
>
> On 08/02/2013 05:02 PM, Arun Kumar K wrote:
>>
>> The hardware interface module finally sends the commands to the
>> FIMC-IS firmware and runs the interrupt handler for getting the
>> responses.
>>
>> Signed-off-by: Arun Kumar K<arun.kk@samsung.com>
>> Signed-off-by: Kilyeon Im<kilyeon.im@samsung.com>
>> ---

[snip]

>> +static int itf_get_state(struct fimc_is_interface *itf,
>> +               unsigned long state)
>> +{
>> +       int ret = 0;
>> +       unsigned long flags;
>> +
>> +       spin_lock_irqsave(&itf->slock_state, flags);
>> +       ret = test_bit(state,&itf->state);
>
>
> Shouldn't it be __test_bit() ?
>

__test_bit() is not availble !
In file include/asm-generic/bitops/non-atomic.h, all other ops
are prefixed with __xxx(), but its just test_bit().

Regards
Arun

From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] Documentation: devicetree: mct: Fix counter bit of CPU
 local timers
Date: Wed, 22 Jan 2014 09:31:16 +0100
Message-ID: <52DF81D4.9000008@linaro.org>
References: <000001cf1687$a0e5e250$e2b1a6f0$%han@samsung.com> <000101cf1749$30ae3b50$920ab1f0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <000101cf1749$30ae3b50$920ab1f0$%han@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: 'Thomas Gleixner' <tglx@linutronix.de>, 'Kukjin Kim' <kgene.kim@samsung.com>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Tomasz Figa' <t.figa@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 01/22/2014 09:08 AM, Jingoo Han wrote:
> On Tuesday, January 21, 2014 6:03 PM, Jingoo Han wrote:
>>
>> According to the datasheet of Exynos SoCs, the counter bit
>> of CPU local timers is 31-bit, not 32-bit; thus, it should
>> be fixed.
>
> Please, ignore this patch.
> There is a 31-bit counter in CPU local timers; however,
> FRC (free running down-counters) of CPU local timers is
> 32-bit. Thus, there is no need to fix it.
> Thank you.

Ok.

>>
>> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
>> ---
>>   Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.txt=
 |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/timer/samsung,exynos4=
210-mct.txt
>> b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.txt
>> index 167d5da..8c77791 100644
>> --- a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct=
=2Etxt
>> +++ b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct=
=2Etxt
>> @@ -3,7 +3,7 @@ Samsung's Multi Core Timer (MCT)
>>   The Samsung's Multi Core Timer (MCT) module includes two main bloc=
ks, the
>>   global timer and CPU local timers. The global timer is a 64-bit fr=
ee running
>>   up-counter and can generate 4 interrupts when the counter reaches =
one of the
>> -four preset counter values. The CPU local timers are 32-bit free ru=
nning
>> +four preset counter values. The CPU local timers are 31-bit free ru=
nning
>>   down-counters and generate an interrupt when the counter expires. =
There is
>>   one CPU local timer instantiated in MCT for every CPU in the syste=
m.
>>
>> --
>> 1.7.10.4
>
>


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


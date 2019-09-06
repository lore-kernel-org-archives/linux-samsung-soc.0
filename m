From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: Re: [PATCH 3/3] dt-bindings: ddr: Add bindings for Samsung LPDDR3
 memories
Date: Fri, 6 Sep 2019 14:14:07 +0200
Message-ID: <99d2f2be-80f8-258c-2621-a4b5ff5cd177@partner.samsung.com>
References: <CGME20190906101407eucas1p15eb0df53374b27497b4793eab24becf6@eucas1p1.samsung.com>
        <20190906101344.3535-1-l.luba@partner.samsung.com>
        <20190906101344.3535-4-l.luba@partner.samsung.com>
        <CAJKOXPfoYxTVvt_bMQOs1=BkHzUuW_WvL9zn0jTGS6LLpv=fhQ@mail.gmail.com>
        <52963d0d-cf48-7085-5581-a94c6e15e0bd@partner.samsung.com>
        <CAJKOXPfEcURr_bLRaAdjWT3cb7mcuKTk8rmn7OTO=xtvjvJ=jQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPfEcURr_bLRaAdjWT3cb7mcuKTk8rmn7OTO=xtvjvJ=jQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-pm@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org



On 9/6/19 1:50 PM, Krzysztof Kozlowski wrote:
> On Fri, 6 Sep 2019 at 13:39, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>>
>> Hi Krzysztof,
>>
>> On 9/6/19 12:56 PM, Krzysztof Kozlowski wrote:
>>> On Fri, 6 Sep 2019 at 12:14, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>>>>
>>>> Add description of bindings for Samsung k3qf2f20db LPDDR3 memory.
>>>> Minor fixes in the old documentation.
>>>>
>>>> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
>>>> ---
>>>>    .../devicetree/bindings/ddr/lpddr3.txt        | 29 +++++++++++++++++--
>>>>    1 file changed, 27 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/ddr/lpddr3.txt b/Documentation/devicetree/bindings/ddr/lpddr3.txt
>>>> index 3b2485b84b3f..de0905239767 100644
>>>> --- a/Documentation/devicetree/bindings/ddr/lpddr3.txt
>>>> +++ b/Documentation/devicetree/bindings/ddr/lpddr3.txt
>>>> @@ -40,10 +40,34 @@ Child nodes:
>>>>      a given speed-bin. Please see Documentation/devicetree/
>>>>      bindings/ddr/lpddr3-timings.txt for more information on "lpddr3-timings"
>>>>
>>>> +Samsung K3QF2F20DB LPDDR3 memory
>>>> +------------------------------------------------------------
>>>> +
>>>> +This binding uses the LPDDR3 binding (described above)
>>>> +
>>>> +Required properties:
>>>> +- compatible:  Should be:
>>>> +               "samsung,K3QF2F20DB"
>>>> +               followed by "jedec,lpddr3"
>>>> +- density  : <u32> representing density in Mb (Mega bits)
>>>> +- io-width : <u32> representing bus width. Possible value 32
>>>> +- #address-cells: Must be set to 1
>>>> +- #size-cells: Must be set to 0
>>>
>>> If you decided to repeat all properties again, then it deserves its
>>> own bindings file. However I though about simpler solution - just
>>> document compatible. Exactly the same as AT24 or AT25 EEPROM bindings.
>>> There is not much benefit from copying all these properties.
>> OK, I see. I will add only 'compatible' and skip the rest then.
>> So the lpddr3.txt file will get this addition:
>>
>> +Samsung K3QF2F20DB LPDDR3 memory
>> +------------------------------------------------------------
>> +
>> +This binding uses the LPDDR3 binding (described above)
>> +
>> +Required properties:
>> +- compatible:  Should be:
>> +               "samsung,K3QF2F20DB"
>> +               followed by "jedec,lpddr3"
>> +
>> +Optional properties:
>> +
>> +The optional properties are the same as in the LPDDR3 generic bindings and
>> +values should be taken from the data-sheet. Detailed bindings are described
>> +above.
>> +
>> +Child nodes:
>> +
>> +Detailed bindings are described in LPDDR3 generic bindings described above.
>> +
>>
>> Is it OK?
> 
> To me it is still a lot of text just for one compatible and I can
> image more of such entries for other memories... However I do not mind
> and anyway, YAML will simplify it. If you're in doubt, wait for Rob's
> reply as this is his part.

You are definitely right, YAML will simplify this.
I will wait a few days with the v2 series, maybe Rob would like to see
something different. If not, I will send v2 with the above change.
Thank you for your comments.

Regards,
Lukasz

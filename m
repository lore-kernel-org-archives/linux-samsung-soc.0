From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 4/5] ASoC: samsung: Document compatible
 strings for Odroid X/X2, Odroid XU3
Date: Mon, 19 Mar 2018 11:17:54 +0100
Message-ID: <dad52dab-d6e3-0283-0a19-b42d6632df29@samsung.com>
References: <CGME20180314164301epcas1p105f42730914735774284892b71839572@epcas1p1.samsung.com>
 <20180314164242.22927-1-s.nawrocki@samsung.com>
 <CAJKOXPdxSULHestFBc2YmtVzEpu422VdqtKMmy9FoCOjGV3wgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-reply-to: <CAJKOXPdxSULHestFBc2YmtVzEpu422VdqtKMmy9FoCOjGV3wgw@mail.gmail.com>
Content-language: en-GB
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>, sbkim73@samsung.com, broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 03/16/2018 08:37 AM, Krzysztof Kozlowski wrote:
>> diff --git a/Documentation/devicetree/bindings/sound/samsung,odroid.txt b/Documentation/devicetree/bindings/sound/samsung,odroid.txt
>> index f35a2694eb04..a50a0c6a354b 100644
>> --- a/Documentation/devicetree/bindings/sound/samsung,odroid.txt
>> +++ b/Documentation/devicetree/bindings/sound/samsung,odroid.txt
>> @@ -1,8 +1,10 @@
>> -Samsung Exynos Odroid XU3/XU4 audio complex with MAX98090 codec
>> +Hardkernel Odroid X/X2/U3/XU3/XU4 audio complex with MAX98090 codec
>>
>>  Required properties:
>>
>> - - compatible - "hardkernel,odroid-xu3-audio" - for Odroid XU3 board,
>> + - compatible - "hardkernel,odroid-u3-audio" - for Odroid U3 board,
>> +               "hardkernel,odroid-x-audio" - for Odroid X, Odroid X2 boards,
>> +               "hardkernel,odroid-xu3-audio" - for Odroid XU3 board,
>>                 "hardkernel,odroid-xu4-audio" - for Odroid XU4 board
>
> These are the same so I think they should not get separate
> compatibles. By definition [2] the compatible expresses the
> compatibility with family of devices. In this case - these belong to
> the same family.
> 
> The same applies to patch 5/5 (implementation of this).

Given that everything except XU4 is already obsoleted, are we going to use
"hardkernel,odroid-xu3-audio" for Odroid X and Odroid U3?

We could also make it:
"hardkernel,odroid-xu3-audio", "hardkernel,odroid-x-audio" - for Odroid X, Odroid X2
"hardkernel,odroid-xu3-audio", "hardkernel,odroid-u3-audio" - for Odroid U3

And in the driver wee would only have "hardkernel,odroid-xu3-audio", while dts
would contain detailed compatible.

-- 
Regards,
Sylwester

From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 8/8] ASoC: samsung,tm2-audio DT binding documentation
 update
Date: Wed, 07 Feb 2018 17:31:18 +0100
Message-ID: <67a9f473-0eba-b3d0-ae92-5602658b6958@samsung.com>
References: <CGME20180205154537epcas1p10a9a30a574e3f472358e7dacf3cb0489@epcas1p1.samsung.com>
        <20180205154403.13520-1-s.nawrocki@samsung.com>
        <20180205154403.13520-9-s.nawrocki@samsung.com>
        <CAJKOXPeRFgJQpUTeJeYYo+qqAxkT1iZczSJQzRzn3O3bXmvOZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAJKOXPeRFgJQpUTeJeYYo+qqAxkT1iZczSJQzRzn3O3bXmvOZA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jcsing.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 02/06/2018 02:05 PM, Krzysztof Kozlowski wrote:
> On Mon, Feb 5, 2018 at 4:44 PM, Sylwester Nawrocki
> <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> This patch documents additional entries of the audio-codec and
>> i2s-controller properties required for the HDMI audio support.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  .../devicetree/bindings/sound/samsung,tm2-audio.txt        | 14 +++++++++-----
>>  1 file changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt b/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
>> index 94442e5673b3..f5ccc12ddc00 100644
>> --- a/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
>> +++ b/Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
>> @@ -4,9 +4,13 @@ Required properties:
>>
>>   - compatible           : "samsung,tm2-audio"
>>   - model                : the user-visible name of this sound complex
>> - - audio-codec          : the phandle of the wm5110 audio codec node,
>> -                          as described in ../mfd/arizona.txt
>> - - i2s-controller       : the phandle of the I2S controller
>> + - audio-codec          : the first entry should be phandle of the wm5110 audio
>> +                          codec node, as described in ../mfd/arizona.txt;
>> +                          the second entry should be phandle of the HDMI
>
> AFAIU, this property is still optional so the wording should be
> different. Maybe just add "optional properties" paragraph?

I'd like to keep the second entries required in the documentation,
and the driver would still be handling the case with just single 
entries.

-- 
Regards,
Sylwester
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 18/21] ASoC: samsung: i2s: Comments clean up
Date: Wed, 13 Feb 2019 20:07:29 +0100
Message-ID: <8e68b53f-5e19-c686-dd37-8f730ae1c256@samsung.com>
References: <CGME20190212180542epcas2p2f7252babc9b4dc97eaaa214658afe5d0@epcas2p2.samsung.com>
        <20190212180342.32040-1-s.nawrocki@samsung.com>
        <20190212180342.32040-19-s.nawrocki@samsung.com>
        <CAJKOXPeSYf8bHNSnpvK1X=cCV=_JxzN_bKdvN9a+RCEqBfK3hQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAJKOXPeSYf8bHNSnpvK1X=cCV=_JxzN_bKdvN9a+RCEqBfK3hQ@mail.gmail.com>
Content-language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 2/13/19 09:06, Krzysztof Kozlowski wrote:
>> @@ -742,7 +742,7 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
>>         switch (params_channels(params)) {
>>         case 6:
>>                 val |= MOD_DC2_EN;
>> -               /* fall through */
>> +               /* Fall through */

> Just to be sure - did you check whether this passes GCC
> -Wimplicit-fallthrough=3 (you need GCC v7)? It looks correct - like
> one of accepted patterns
> (https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html).

I just checked it now and with comment in upper case the warning 
is also being suppressed.

-- 
Regards,
Sylwester

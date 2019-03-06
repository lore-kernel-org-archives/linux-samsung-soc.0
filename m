From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4 3/3] crypto: s5p: add AES support for Exynos5433
Date: Wed, 6 Mar 2019 09:31:58 -0800
Message-ID: <873d345a-4893-412d-78d7-58c3e8cd61c2@roeck-us.net>
References: <20190222122144.19024-1-k.konieczny@partner.samsung.com>
 <CGME20190222122204eucas1p1ee66c9d937bdf328588ececb1f005526@eucas1p1.samsung.com>
 <20190222122144.19024-4-k.konieczny@partner.samsung.com>
 <20190305171303.GA29802@roeck-us.net>
 <CAJKOXPdqf6b6LSxyhFJwoP+Jk+KCDvTtN1yM-LSP3n3kVt_nLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPdqf6b6LSxyhFJwoP+Jk+KCDvTtN1yM-LSP3n3kVt_nLQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kamil Konieczny <k.konieczny@partner.samsung.com>, Vladimir Zapolskiy <vz@mleia.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 3/5/19 11:51 AM, Krzysztof Kozlowski wrote:
> On Tue, 5 Mar 2019 at 18:13, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Fri, Feb 22, 2019 at 01:21:44PM +0100, Kamil Konieczny wrote:
>>> Add AES crypto HW acceleration for Exynos5433, with the help of SlimSSS IP.
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
>>> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
>>> ---
>>>   drivers/crypto/s5p-sss.c | 50 ++++++++++++++++++++++++++++++++++++----
>>>   1 file changed, 46 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/crypto/s5p-sss.c b/drivers/crypto/s5p-sss.c
>>> index 0064be0e3941..3f45cc5cb94a 100644
>>> --- a/drivers/crypto/s5p-sss.c
>>> +++ b/drivers/crypto/s5p-sss.c
>>> @@ -232,6 +232,7 @@
>>>    * struct samsung_aes_variant - platform specific SSS driver data
>>>    * @aes_offset: AES register offset from SSS module's base.
>>>    * @hash_offset: HASH register offset from SSS module's base.
>>> + * @clk_names: names of clocks needed to run SSS IP
>>>    *
>>>    * Specifies platform specific configuration of SSS module.
>>>    * Note: A structure for driver specific platform data is used for future
>>> @@ -240,6 +241,7 @@
>>>   struct samsung_aes_variant {
>>>        unsigned int                    aes_offset;
>>>        unsigned int                    hash_offset;
>>> +     const char                      *clk_names[];
>>
>> This array does not have a fixed size.
> 
> Yes, correct. Kamil already sent a fix:
> https://patchwork.kernel.org/patch/10835389/
> 

Excellent. Note that the offending patch is now in mainline.

Guenter

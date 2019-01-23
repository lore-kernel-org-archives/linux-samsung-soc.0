From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: Re: [PATCH v1 3/3] crypto: s5p: add AES support for Exynos5433
Date: Wed, 23 Jan 2019 15:27:14 +0100
Message-ID: <9654ab25-2f9f-9bd1-e60c-df1ba5e90e98@partner.samsung.com>
References: <CGME20190122152609eucas1p287b83592af600dc080374a197e6dd917@eucas1p2.samsung.com>
        <20190122152553.1537-1-k.konieczny@partner.samsung.com>
        <20190122152553.1537-4-k.konieczny@partner.samsung.com>
        <CAJKOXPdkDrwy2rSs-Fj1rq8rTOHvtQTrZTY5ER=pPWRPwx5qfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPdkDrwy2rSs-Fj1rq8rTOHvtQTrZTY5ER=pPWRPwx5qfA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 23.01.2019 09:13, Krzysztof Kozlowski wrote:
> On Tue, 22 Jan 2019 at 16:26, Kamil Konieczny
> <k.konieczny@partner.samsung.com> wrote:
>>
>> Add AES crypto HW acceleration for Exynos5433, with the help of SlimSSS IP.
>>
>> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
>> [...]
>> @@ -384,11 +387,19 @@ struct s5p_hash_ctx {
>>  static const struct samsung_aes_variant s5p_aes_data = {
>>         .aes_offset     = 0x4000,
>>         .hash_offset    = 0x6000,
>> +       .clk_names      = { "secss", }
> 
> Put trailing comma so it can be extended without touching previous
> line (just like old code).
> 

ok, I will do this and two following commas.

>>  [...]
>> +       if (variant->clk_names[1]) {
>> +               pdata->pclk = devm_clk_get(dev, variant->clk_names[1]);
>> +               if (IS_ERR(pdata->pclk)) {
>> +                       dev_err(dev, "failed to find clock %s\n",
>> +                               variant->clk_names[1]);
>> +                       clk_disable_unprepare(pdata->clk);
>> +                       return -ENOENT;
> 
> goto err_irq (eventually rename the label)?

I will add 'goto err_clk' with proper cleanup.

>> +                       }
> 
> Indentation looks wrong here.

ok

>> +
>> +               err = clk_prepare_enable(pdata->pclk);
>> +               if (err < 0) {
>> +                       dev_err(dev, "Enabling clock %s failed, err %d\n",
>> +                               variant->clk_names[0], err);
>> +                       clk_disable_unprepare(pdata->clk);
>> +                       return err;
> 
> goto...

Yes, I will put the same goto here.

-- 
Best regards,
Kamil Konieczny
Samsung R&D Institute Poland

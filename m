From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH -next v2] pinctrl: samsung: Fix return value check in
 samsung_pinctrl_get_soc_data()
Date: Tue, 21 Feb 2017 14:49:34 +0100
Message-ID: <c4dd122b-0312-fcca-08e2-4d4586949a88@samsung.com>
References: <20170125140321.23911-1-weiyj.lk@gmail.com>
 <20170205155849.4362-1-weiyj.lk@gmail.com>
 <CGME20170213145008epcas3p119bdd6f76468a00fb8d796308ad37698@epcas3p1.samsung.com>
 <CACRpkda0BYLNpPFwpNaEMdeyx61KDUQz_6Y=FQj340pViFjVVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-reply-to: <CACRpkda0BYLNpPFwpNaEMdeyx61KDUQz_6Y=FQj340pViFjVVQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Wei Yongjun <weiyj.lk@gmail.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Wei Yongjun <weiyongjun1@huawei.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, =?UTF-8?B?64yA7J246riw?= <inki.dae@samsung.com>, =?UTF-8?B?7LWc7LCs7Jqw?= <cw00.choi@samsung.com>, =?UTF-8?B?6rmA7Iq57Jqw?= <sw0312.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi All,

On 2017-02-13 15:49, Linus Walleij wrote:
> On Sun, Feb 5, 2017 at 4:58 PM, Wei Yongjun <weiyj.lk@gmail.com> wrote:
>
>> From: Wei Yongjun <weiyongjun1@huawei.com>
>>
>> In case of error, the function devm_ioremap() returns NULL pointer not
>> ERR_PTR(). Fix by using devm_ioremap_resource instead of devm_ioremap.
>>
>> Fixes: 8b1bd11c1f8f ("pinctrl: samsung: Add the support the multiple
>> IORESOURCE_MEM for one pin-bank")
>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>> ---
>> v1 -> v2: use devm_ioremap_resource instead of devm_ioremap
> Patch applied with Krzysztof's ACK.

Sadly this patch breaks support for IMEM pinctrl block on Exynos5433/TM2
and it took us some time to find the source of the problem.

devm_ioremap_resource() is not functionally a full equivalent of
devm_ioremap(). The problem here is that registers for IMEM and ALIVE
pin controllers are shared and both devices have <0x11090000 0x1000>
range in their reg property. devm_ioremap_resource() maps given
resource exclusively for the device, while devm_ioremap() allows
non-exclusive mappings.

This patch has to be reverted asap.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


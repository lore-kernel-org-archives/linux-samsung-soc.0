From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 3/7] pinctrl: samsung: Add the support the multiple
 IORESOURCE_MEM for one pin-bank
Date: Thu, 25 Aug 2016 23:41:04 +0900
Message-ID: <CA+Ln22Guw1LghdV64cSKjByDExr+2HnvEK7DNkYz+XPAmVuAzA@mail.gmail.com>
References: <1472046551-703-1-git-send-email-cw00.choi@samsung.com>
 <1472046551-703-4-git-send-email-cw00.choi@samsung.com>
 <CA+Ln22Ew=8S382zn+M8Ys5vztqvzp1+3EOTKtd81WSfuSyvY6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CA+Ln22Ew=8S382zn+M8Ys5vztqvzp1+3EOTKtd81WSfuSyvY6w@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, chanwoo@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will.deacon@arm.com>, Andrzej Hajda <a.hajda@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Beomho Seo <beomho.seo@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Jonghwa Lee <jonghwa3.lee@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>, Kukjin Kim <kgene@kernel.org>, devicetree <devicetree@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, ingi2.kim@samsung.comlinux-arm-kernel <li>
List-Id: linux-samsung-soc@vger.kernel.org

2016-08-25 23:30 GMT+09:00 Tomasz Figa <tomasz.figa@gmail.com>:
>> +       }
>> +
>> +#define EXYNOS_PIN_BANK_EINTN_EXT(pins, reg, id, pctl_idx, eint_idx)   \
>> +       {                                               \
>> +               .type           = &bank_type_off,       \
>> +               .pctl_offset    = reg,                  \
>> +               .nr_pins        = pins,                 \
>> +               .eint_type      = EINT_TYPE_NONE,       \
>> +               .name           = id,                   \
>> +               .pctl_res_idx   = pctl_idx,             \
>> +               .eint_res_idx   = eint_dix              \
>> +       }
>
> Your patch 4/7 doesn't seem to use this one, so this is dead code for
> the time being. Please add when there is real need for it.
>
> Also it doesn't really make much sense to have index for both pctl and
> eint. Please define first entry of regs property as always pointing to
> pctl registers and by also eint registers for usual controllers. Then
> second regs entry would be eint registers for controllers with
> separate register blocks. Then there is only a need to have
> eint_res_idx in the driver and no need for pctl_res_idx, because it
> would be always 0.

Ah, sorry, I got confused again by which registers are where in these
GPF banks. Let's make it the other way around and make DT contain eint
registers in first regs entry and hardcode eint_res_idx to 0 for the
time being. However it should be still beneficial to refactor the code
and calculate per-bank eint_base to avoid adding the offset every
time, similarly to pctl_base/offset, from my suggestion below.

>> @@ -345,7 +346,8 @@ static void pin_to_reg_bank(struct samsung_pinctrl_drv_data *drvdata,
>>                         ((b->pin_base + b->nr_pins - 1) < pin))
>>                 b++;
>>
>> -       *reg = drvdata->virt_base + b->pctl_offset;
>> +       pctl_res_idx = b->pctl_res_idx;
>> +       *reg = drvdata->virt_base[pctl_res_idx] + b->pctl_offset;
>
> I suggested something slightly different. Instead of
> bank::pctl_res_idx, I proposed bank::pctl_base.
> bank_info::pctl_res_idx would be specified only in init driver data
> and bank::pctl_base would be calculated at probe time as
> drvdata->virt_base[bank_info->pctl_res_idx] + bank_info->pctl_offset.
> This would eliminate the need to do any indexing and adding further in
> the code and make things simpler.
>
> Taking my other comments above, pctl part would be unchanged and only
> eint addresses and offsets would be affected.

Ah, scratch this one sentence. I got confused with the register layout
again, sorry. Please refactor both eint and pctl as I suggested in the
upper paragraph.

Best regards,
Tomasz

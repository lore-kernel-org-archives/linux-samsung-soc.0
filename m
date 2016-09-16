From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 01/17] pinctrl: dt-bindings: samsung: Add header with
 values used for configuration
Date: Fri, 16 Sep 2016 09:56:23 +0200
Message-ID: <5e0deae4-cb77-93e2-e22c-74184064adab@kernel.org>
References: <1472987060-28293-1-git-send-email-krzk@kernel.org>
 <1472987060-28293-2-git-send-email-krzk@kernel.org>
 <CACRpkdb9gq0Zez=_NW8XB6YKiJteC3GB12e-Wi9my52b4Q-C7A@mail.gmail.com>
 <CGME20160916075624eucas1p23a12de912f92f0c557f17fbd394b186e@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CACRpkdb9gq0Zez=_NW8XB6YKiJteC3GB12e-Wi9my52b4Q-C7A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Javier Martinez Canillas <javier@osg.samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 09/07/2016 11:18 PM, Linus Walleij wrote:
> On Sun, Sep 4, 2016 at 1:04 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
>> From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>
>> Hard-coded pinctrl configuration values are scattered through DTS files.
>> The numbers are difficult to decode by human, especially without the
>> datasheet.  Additionally the drive strength differs between S3C64xx,
>> S5PV210 and Exynos SoC families increasing the confusion.
>>
>> The header will help making this more readable and maintainable.
>>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Take this with the rest of the changes into ARM SoC.

Thanks!

Applied entire patchset.

Best regards,
Krzysztof

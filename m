From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 13/22] ARM: dts: exynos: Move common nodes to
 exynos5.dtsi
Date: Tue, 10 May 2016 07:30:38 +0200
Message-ID: <573171FE.6070309@kernel.org>
References: <1462734367-5619-1-git-send-email-krzk@kernel.org>
 <1462734367-5619-14-git-send-email-krzk@kernel.org>
 <1cee1acf-fb07-9a7f-5d18-b4824a10f5a2@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1cee1acf-fb07-9a7f-5d18-b4824a10f5a2@osg.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 05/09/2016 11:25 PM, Javier Martinez Canillas wrote:
> Hello Krzysztof,
> 
> On 05/08/2016 03:05 PM, Krzysztof Kozlowski wrote:
>> Exynos5420 and Exynos5250 share some nodes: the PWM and syscon
>> (sysreg_system_controller). Move them to parent DTSI to avoid
>> duplication.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>> ---
> 
> I see that the i2c_[0-3] nodes are also the same in both DTSI. Do you
> think that makes sense to also move those to exynos5.dtsi as well?

Thanks, that is a good suggestion. I didn't add the I2C and its children
to Odroid XU yet but probably having the nodes defined won't hurt.
Especially that they are disabled by default.

Best regards,
Krzysztof

> In any case that can be made as a follow-up, so:
> 
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> Best regards,
> 


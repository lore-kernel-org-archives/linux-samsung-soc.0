From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH] arm64: dts: Add nodes for pdma0 and pdam1 for exynos7
Date: Wed, 13 Apr 2016 10:09:34 +0530
Message-ID: <570DCD86.40208@samsung.com>
References: <1460465378-23486-1-git-send-email-alim.akhtar@samsung.com>
 <570D00C6.9000203@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <570D00C6.9000203@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, thomas.ab@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 04/12/2016 07:35 PM, Krzysztof Kozlowski wrote:
> On 04/12/2016 02:49 PM, Alim Akhtar wrote:
>> This patch adds device tree nodes for pdma0 and pdma1 controllers
>> found on exynos7 SoCs.
>>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> ---
>>   arch/arm64/boot/dts/exynos/exynos7.dtsi |   29 +++++++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>
> I would prefer avoid adding all new stuff at the end because it is
> conflict-prone. Alphabetical order or by address... but none of these
> are used currently. How about putting it after 'gic' node?
>
hmm....ok will send v2 with suggested changes.
Looks like other platforms also put it below 'gic'.

> Anyway the code looks fine:
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>
> Best regards,
> Krzysztof
>
>

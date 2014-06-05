From: YoungJun Cho <yj44.cho@samsung.com>
Subject: Re: [PATCH v3 13/15] ARM: dts: exynos5: add system register support
Date: Thu, 05 Jun 2014 11:52:57 +0900
Message-ID: <538FDB89.70504@samsung.com>
References: <1401686571-22148-1-git-send-email-yj44.cho@samsung.com>
 <1401686571-22148-14-git-send-email-yj44.cho@samsung.com>
 <CAFp+6iFpSHWwH68BSNzetrTdxt2wpZC3y3WfQ+nuRDBeask_MA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <CAFp+6iFpSHWwH68BSNzetrTdxt2wpZC3y3WfQ+nuRDBeask_MA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>, robh+dt <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Vivek,

On 06/04/2014 08:50 PM, Vivek Gautam wrote:
> On Mon, Jun 2, 2014 at 10:52 AM, YoungJun Cho <yj44.cho@samsung.com> wrote:
>> This patch adds sysreg device node, and sysreg property
>> to fimd device node which is required to use I80 interface.
>
> Same here. The system register nodes have been added to exynos5250 and
> exynos5420 by the patch:
> dfbbdbf ARM: dts: Add sysreg sytem controller node to exynos5250 and exynos5420
>
> May be, you may want to move those two nodes to this common file (exynos5.dtsi).
>

Thank you for reporting.
I didn't check linux-samsung-soc.

The exynos5410, 5420 and 5422 use system register with base address
0x10050000.
But exynos5260 and 5430 are different.
And I can't check exynos5250.

So with this condition, it is reasonable to remove these sysreg relevant
patches.

Thank you.
Best regards YJ

>>
>> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
>> Acked-by: Inki Dae <inki.dae@samsung.com>
>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>>   arch/arm/boot/dts/exynos5.dtsi |    6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
>> index 79d0608..95ee496 100644
>> --- a/arch/arm/boot/dts/exynos5.dtsi
>> +++ b/arch/arm/boot/dts/exynos5.dtsi
>> @@ -81,12 +81,18 @@
>>                  status = "disabled";
>>          };
>>
>> +       sys_reg: syscon@10050000 {
>> +               compatible = "samsung,exynos5-sysreg", "syscon";
>> +               reg = <0x10050000 0x500>;
>> +       };
>> +
>>          fimd@14400000 {
>>                  compatible = "samsung,exynos5250-fimd";
>>                  interrupt-parent = <&combiner>;
>>                  reg = <0x14400000 0x40000>;
>>                  interrupt-names = "fifo", "vsync", "lcd_sys";
>>                  interrupts = <18 4>, <18 5>, <18 6>;
>> +               samsung,sysreg = <&sys_reg>;
>>                  status = "disabled";
>>          };
>>
>> --
>> 1.7.9.5
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>

From: Jaewon Kim <jaewon02.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH RESEND] phy: exynos5-usbdrd: Add to support for Exynos5433
 SoC
Date: Tue, 31 Mar 2015 14:06:29 +0900
Message-ID: <551A2B55.7000500@samsung.com>
References: <1427336323-10515-1-git-send-email-jaewon02.kim@samsung.com>
 <CAFp+6iGbLB74D3GhrrQ8uHDtMj+dnT_E8zjvNfjUhzHQKLAjow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAFp+6iGbLB74D3GhrrQ8uHDtMj+dnT_E8zjvNfjUhzHQKLAjow-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kishon.

Could you check my patch??

On 26/03/2015 14:16, Vivek Gautam wrote:
> On Thu, Mar 26, 2015 at 7:48 AM, Jaewon Kim <jaewon02.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> This patch adds driver data to support for Exynos5433 SoC.
>> The Exynos5433 has one USB3.0 Host and USB3.0 DRD(Dual Role Device).
>> Exynos5433 is simplar to Eyxnos7 but Exynos5433 have
>> one more USB3.0 Host controller.
>>
>> Signed-off-by: Jaewon Kim <jaewon02.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Tested-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
> Patch looks good to me.
>
> Reviewed-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>
>>   .../devicetree/bindings/phy/samsung-phy.txt        |    3 ++-
>>   drivers/phy/phy-exynos5-usbdrd.c                   |   10 ++++++++++
>>   include/linux/mfd/syscon/exynos5-pmu.h             |    3 +++
>>   3 files changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/samsung-phy.txt b/Documentation/devicetree/bindings/phy/samsung-phy.txt
>> index 91e38cf..60c6f2a 100644
>> --- a/Documentation/devicetree/bindings/phy/samsung-phy.txt
>> +++ b/Documentation/devicetree/bindings/phy/samsung-phy.txt
>> @@ -128,6 +128,7 @@ Required properties:
>>   - compatible : Should be set to one of the following supported values:
>>          - "samsung,exynos5250-usbdrd-phy" - for exynos5250 SoC,
>>          - "samsung,exynos5420-usbdrd-phy" - for exynos5420 SoC.
>> +       - "samsung,exynos5433-usbdrd-phy" - for exynos5433 SoC.
>>          - "samsung,exynos7-usbdrd-phy" - for exynos7 SoC.
>>   - reg : Register offset and length of USB DRD PHY register set;
>>   - clocks: Clock IDs array as required by the controller
>> @@ -139,7 +140,7 @@ Required properties:
>>                 PHY operations, associated by phy name. It is used to
>>                 determine bit values for clock settings register.
>>                 For Exynos5420 this is given as 'sclk_usbphy30' in CMU.
>> -       - optional clocks: Exynos7 SoC has now following additional
>> +       - optional clocks: Exynos5433 & Exynos7 SoC has now following additional
>>                             gate clocks available:
>>                             - phy_pipe: for PIPE3 phy
>>                             - phy_utmi: for UTMI+ phy
>> diff --git a/drivers/phy/phy-exynos5-usbdrd.c b/drivers/phy/phy-exynos5-usbdrd.c
>> index e2a0be7..d72ef15 100644
>> --- a/drivers/phy/phy-exynos5-usbdrd.c
>> +++ b/drivers/phy/phy-exynos5-usbdrd.c
>> @@ -624,6 +624,13 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5250_usbdrd_phy = {
>>          .has_common_clk_gate    = true,
>>   };
>>
>> +static const struct exynos5_usbdrd_phy_drvdata exynos5433_usbdrd_phy = {
>> +       .phy_cfg                = phy_cfg_exynos5,
>> +       .pmu_offset_usbdrd0_phy = EXYNOS5_USBDRD_PHY_CONTROL,
>> +       .pmu_offset_usbdrd1_phy = EXYNOS5433_USBHOST30_PHY_CONTROL,
>> +       .has_common_clk_gate    = false,
>> +};
>> +
>>   static const struct exynos5_usbdrd_phy_drvdata exynos7_usbdrd_phy = {
>>          .phy_cfg                = phy_cfg_exynos5,
>>          .pmu_offset_usbdrd0_phy = EXYNOS5_USBDRD_PHY_CONTROL,
>> @@ -638,6 +645,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
>>                  .compatible = "samsung,exynos5420-usbdrd-phy",
>>                  .data = &exynos5420_usbdrd_phy
>>          }, {
>> +               .compatible = "samsung,exynos5433-usbdrd-phy",
>> +               .data = &exynos5433_usbdrd_phy
>> +       }, {
>>                  .compatible = "samsung,exynos7-usbdrd-phy",
>>                  .data = &exynos7_usbdrd_phy
>>          },
>> diff --git a/include/linux/mfd/syscon/exynos5-pmu.h b/include/linux/mfd/syscon/exynos5-pmu.h
>> index 00ef24b..9352adc 100644
>> --- a/include/linux/mfd/syscon/exynos5-pmu.h
>> +++ b/include/linux/mfd/syscon/exynos5-pmu.h
>> @@ -36,6 +36,9 @@
>>   #define EXYNOS5420_MTCADC_PHY_CONTROL          (0x724)
>>   #define EXYNOS5420_DPTX_PHY_CONTROL            (0x728)
>>
>> +/* Exynos5433 specific register definitions */
>> +#define EXYNOS5433_USBHOST30_PHY_CONTROL       (0x728)
>> +
>>   #define EXYNOS5_PHY_ENABLE                     BIT(0)
>>
>>   #define EXYNOS5_MIPI_PHY_S_RESETN              BIT(1)
>> --
>> 1.7.9.5
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>

Thanks,
Jaewon Kim.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

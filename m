From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: exynos: add OF graph between USB-PHY and MUIC
Date: Thu, 1 Feb 2018 09:43:53 +0100
Message-ID: <CAJKOXPfs7Es4S5EdOg_en+WPFV6hcNf-0rZO-+7uNiNS96DcVg@mail.gmail.com>
References: <CGME20180131155734eucas1p1c7988ce46f3164329a39d2358d9fada9@eucas1p1.samsung.com>
 <20180131155718.5237-1-a.hajda@samsung.com> <20180131155718.5237-3-a.hajda@samsung.com>
 <CAJKOXPewrA38bxiCKa=pjhVKXys2KRstV2w=+MP3TVi9kkN1kw@mail.gmail.com> <6581962f-3552-2891-e6b3-b2f7c0018c93@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:42558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751399AbeBAIn4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Feb 2018 03:43:56 -0500
In-Reply-To: <6581962f-3552-2891-e6b3-b2f7c0018c93@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

On Thu, Feb 1, 2018 at 9:19 AM, Andrzej Hajda <a.hajda@samsung.com> wrote:
> On 01.02.2018 08:50, Krzysztof Kozlowski wrote:
>> On Wed, Jan 31, 2018 at 4:57 PM, Andrzej Hajda <a.hajda@samsung.com> wrote:
>>> OF graph describes USB data lanes between USB-PHY and respective MUIC.
>>> Since graph is present and DWC driver can use it to get extcon, obsolete
>>> extcon property can be removed.
>>>
>>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>>> ---
>>>  arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 18 +++++++++++++++++-
>>>  1 file changed, 17 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
>>> index 427ff861b441..b20b42659206 100644
>>> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
>>> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
>>> @@ -828,6 +828,17 @@
>>>                                         };
>>>                                 };
>>>                         };
>>> +
>>> +                       ports {
>>> +                               #address-cells = <1>;
>>> +                               #size-cells = <0>;
>>> +
>>> +                               port@0 {
>>> +                                       reg = <0>;
>>> +                                       muic_to_usb: endpoint {
>>> +                                               remote-endpoint = <&usb_to_muic>;
>>> +                                       };
>>> +                               };
>>>                         };
>>>                 };
>>>
>>> @@ -1242,12 +1253,17 @@
>>>
>>>  &usbdrd_dwc3 {
>>>         dr_mode = "otg";
>>> -       extcon = <&muic>;
>> Look ok for me.
>>
>> Does this depend on #1 patch for DWC?
>
> Yes, it depends. #1 adds code to find extcon using graph, without it
> dwc3 won't be able to work in dual-role mode.
> Alternatively, I could split this patch into two parts:
> 2a. adding graph bindings.
> 2b. removing extcon property.
> In such case only 2b depends on #1.

Without splitting, this patch would have to wait till #1 gets into
mainline (so probably till v4.17-rc1 because we are in merge window
already). I am fine with this split-approach so only the cleanup patch
would get postponed. Up to you.

Best regards,
Krzysztof

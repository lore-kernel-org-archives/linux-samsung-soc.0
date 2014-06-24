From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v2] ARM: dts: Add cros_ec to exynos5420-peach-pit and
 exynos5800-peach-pi
Date: Tue, 24 Jun 2014 18:33:37 +0200
Message-ID: <53A9A861.4020502@collabora.co.uk>
References: <1403556576-8038-1-git-send-email-dianders@chromium.org>	<53A91E09.7050603@gmail.com> <CAD=FV=WwmjyH4Uq_SeRMf9-f6pgu+HpkZYRx_Sv-CJV-z8rkmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:59808 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753257AbaFXQdo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jun 2014 12:33:44 -0400
In-Reply-To: <CAD=FV=WwmjyH4Uq_SeRMf9-f6pgu+HpkZYRx_Sv-CJV-z8rkmA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>, Tushar Behera <trblinux@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Mark Rutland <mark.rutland@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kevin Hilman <khilman@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Tushar Behera <tushar.b@samsung.com>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, Ben Dooks <ben-linux@fluff.org>, naveen krishna <ch.naveen@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rahul Sharma <rahul.sharma@samsung.com>, Simon Glass <sjg@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Ajay kumar <ajaynumb@gmail.co>

Hello Doug,

On 06/24/2014 06:28 PM, Doug Anderson wrote:
> Tushar,
> 
> On Mon, Jun 23, 2014 at 11:43 PM, Tushar Behera <trblinux@gmail.com> wrote:
>> On 06/24/2014 02:19 AM, Doug Anderson wrote:
>>> This adds cros_ec to exynos5420-peach-pit and exynos5800-peach-pi,
>>> including:
>>> * The keyboard
>>> * The i2c tunnel
>>> * The tps65090 under the i2c tunnel
>>> * The battery under the i2c tunnel
>>>
>>> To add extra motivation, it should be noted that tps65090 is one of
>>> the things needed to get display-related FETs turned on for pit and
>>> pi.
>>>
>>> Note that this relies on a few outstanding changes:
>>> * Needs (spi: s3c64xx: fix broken "cs_gpios" usage in the driver) and
>>>   (spi: s3c64xx: for DT platofrms always get the chipselect info from
>>>   DT node) to work properly and match the documented bindings.  See
>>>   <https://patchwork.kernel.org/patch/4346701/> and
>>>   <https://patchwork.kernel.org/patch/4346711/>
>>>
>>> Signed-off-by: Doug Anderson <dianders@chromium.org>
>>> Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>>
>> Along with the dependency patches on next-20140623, tested keyboard on
>> Peach-Pi board.
>>
>> Tested-by: Tushar Behera <tushar.b@samsung.com>
>>
>> Some comments below.
>>
>>> ---
>>> Changes in v2:
>>> - Now just one patch since mfd patch landed.
>>> - Rebased to ToT linux-next
>>>
>>>  arch/arm/boot/dts/exynos5420-peach-pit.dts | 145 +++++++++++++++++++++++++++++
>>>  arch/arm/boot/dts/exynos5800-peach-pi.dts  | 145 +++++++++++++++++++++++++++++
>>>  2 files changed, 290 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
>>> index 7649982..581f385 100644
>>> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
>>> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
>>
>>> +                             regulators {
>>> +                                     dcdc1 {
>>> +                                             ti,enable-ext-control;
>>> +                                     };
>>> +                                     dcdc2 {
>>> +                                             ti,enable-ext-control;
>>> +                                     };
>>> +                                     dcdc3 {
>>> +                                             ti,enable-ext-control;
>>> +                                     };
>>> +                                     fet1 {
>>
>> "tps65090_fet1: fet1 {" ?
>>
>>> +                                             regulator-name = "vcd_led";
>>> +                                     };
>>> +                                     tps65090_fet2: fet2 {
>>
>> I would suggest we add similar labels to fet1, fet3, fet4, fet5 and fet6
>> also. That way it would be easy to reference them in subsequent DT nodes.
>>
>> Same comment for Peach-Pi dts file too.
> 
> OK.  I added it to all the regulators in tps65090.  That'll probably
> be useful for Javier in his max77802 work.
>

Thanks, in fact I did add both tps65090_dcdc1 and tps65090_dcdc2 labels to be
able to use these regulators as supply for some of the max77802 regulators.

Will rebase on top of this.

Best regards,
Javier

> -Doug
> 

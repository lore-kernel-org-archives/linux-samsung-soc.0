From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [RESEND PATCH 1/2] ARM: dts: Improve Peach Pit and Pi power scheme
Date: Mon, 18 Aug 2014 13:27:48 -0500
Message-ID: <53F245A4.5010106@samsung.com>
References: <1407757091-18730-1-git-send-email-javier.martinez@collabora.co.uk> <CAD=FV=UbckfwGucuPjEtHixVgF5K2fD5N3EPS2BH96DRDACuqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f42.google.com ([209.85.213.42]:61440 "EHLO
	mail-yh0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751676AbaHRS1v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Aug 2014 14:27:51 -0400
In-Reply-To: <CAD=FV=UbckfwGucuPjEtHixVgF5K2fD5N3EPS2BH96DRDACuqw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 08/11/14 10:46, Doug Anderson wrote:
> Javier,
>
> On Mon, Aug 11, 2014 at 4:38 AM, Javier Martinez Canillas
> <javier.martinez@collabora.co.uk>  wrote:
>> The DeviceTree files for the Peach Pit and Pi machines have
>> a simplistic model of the connections between the different
>> regulators since not all the tps65090 regulators get their
>> input supply voltage from the VDC. DCDC1-3, LD0-1 and fet7
>> parent supply is indded VDC but the fet1-6 get their input
>> supply from the DCDC1 and DCDC2 output voltage rails.
>>
>> Update the DeviceTree to better reflect the real connections
>> between tps65090 regulators. Having this information in the
>> DTS is useful since FETs are switches that don't provide an
>> output voltage so the regulator core needs to fetch the FET
>> parent output voltage if the child voltage is queried.
>>
>> Signed-off-by: Javier Martinez Canillas<javier.martinez@collabora.co.uk>
>> Acked-by: Mark Brown<broonie@linaro.org>
>> ---
>>   arch/arm/boot/dts/exynos5420-peach-pit.dts | 12 ++++++------
>>   arch/arm/boot/dts/exynos5800-peach-pi.dts  | 12 ++++++------
>>   2 files changed, 12 insertions(+), 12 deletions(-)
>
> Matches my schematics.  Kukjin: I think this could be applied to
> for-next whenever it's convenient.
>
OK, I've applied this but 2nd in this series...

> Acked-by: Doug Anderson<dianders@chromium.org>
>
Thanks,
Kukjin

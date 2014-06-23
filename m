From: Tushar Behera <trblinux@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: max98090: Add max98091 compatible string
Date: Mon, 23 Jun 2014 11:49:33 +0530
Message-ID: <53A7C6F5.9070203@gmail.com>
References: <1403251396-17487-1-git-send-email-tushar.b@samsung.com> <CAD=FV=XX1XAX-jZTJaQYTHbeXkHu2uX_6==vHYbSnVpjJe6+tQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:46460 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751261AbaFWGTk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jun 2014 02:19:40 -0400
In-Reply-To: <CAD=FV=XX1XAX-jZTJaQYTHbeXkHu2uX_6==vHYbSnVpjJe6+tQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>, Tushar Behera <tushar.b@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, alsa-devel@alsa-project.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, tiwai@suse.de, "broonie@kernel.org" <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Wonjoon Lee <woojoo.lee@samsung.com>

On 06/21/2014 02:02 AM, Doug Anderson wrote:
> Tushar,
> 
> On Fri, Jun 20, 2014 at 1:03 AM, Tushar Behera <tushar.b@samsung.com> wrote:
>> From: Wonjoon Lee <woojoo.lee@samsung.com>
>>
>> The MAX98091 CODEC is the same as MAX98090 CODEC, but with an extra
>> microphone. Existing driver for MAX98090 CODEC already has support
>> for MAX98091 CODEC. Adding proper compatible string so that MAX98091
>> CODEC can be specified from device tree.
>>
>> Signed-off-by: Wonjoon Lee <woojoo.lee@samsung.com>
>> Signed-off-by: Doug Anderson <dianders@chromium.org>
>> Signed-off-by: Tushar Behera <tushar.b@samsung.com>
>> ---
>>
>> Picked from https://chromium-review.googlesource.com/#/c/184091/
>>
>>  .../devicetree/bindings/sound/max98090.txt         |    2 +-
>>  sound/soc/codecs/max98090.c                        |    2 ++
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/max98090.txt b/Documentation/devicetree/bindings/sound/max98090.txt
>> index a5e63fa..c454e67 100644
>> --- a/Documentation/devicetree/bindings/sound/max98090.txt
>> +++ b/Documentation/devicetree/bindings/sound/max98090.txt
>> @@ -4,7 +4,7 @@ This device supports I2C only.
>>
>>  Required properties:
>>
>> -- compatible : "maxim,max98090".
>> +- compatible : "maxim,max98090" or "maxim,max98091".
>>
>>  - reg : The I2C address of the device.
>>
>> diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
>> index f5fccc7..4f5534d 100644
>> --- a/sound/soc/codecs/max98090.c
>> +++ b/sound/soc/codecs/max98090.c
>> @@ -2460,12 +2460,14 @@ static const struct dev_pm_ops max98090_pm = {
>>
>>  static const struct i2c_device_id max98090_i2c_id[] = {
>>         { "max98090", MAX98090 },
>> +       { "max98091", MAX98091 },
> 
> optional: This would allow you to add some extra error checking in
> max98090_probe() to make sure that the device-tree specified device
> matched the device that was detected.  That could be in a future
> patch, though.
> 
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> 

Okay. I will add that in a follow-up patch.

Thanks for reviewing.
-- 
Tushar Behera

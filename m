From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V4 04/10] drm/panel: Add driver for lvds/edp based panels
Date: Tue, 24 Jun 2014 04:22:19 -0400
Message-ID: <CAEC9eQPmRhP9TjUo8sV7J78B=rEGbgH21CZWEQYtOUGnb739YA@mail.gmail.com>
References: <1402511228-18945-1-git-send-email-ajaykumar.rs@samsung.com>
	<1402511228-18945-5-git-send-email-ajaykumar.rs@samsung.com>
	<CAH9NwWeZ2i_zDD2EkE7nE12W314TiAUPudBu_WEXT34az3xOYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f176.google.com ([209.85.128.176]:64999 "EHLO
	mail-ve0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751326AbaFXIWU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jun 2014 04:22:20 -0400
In-Reply-To: <CAH9NwWeZ2i_zDD2EkE7nE12W314TiAUPudBu_WEXT34az3xOYw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Sean Paul <seanpaul@google.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, Rahul Sharma <rahul.sharma@samsung.com>

Hi Gmeiner,

On Mon, Jun 23, 2014 at 12:55 PM, Christian Gmeiner
<christian.gmeiner@gmail.com> wrote:
> Hi
>
>
> 2014-06-11 20:27 GMT+02:00 Ajay Kumar <ajaykumar.rs@samsung.com>:
>> This patch adds a simple driver to handle all the LCD and LED
>> powerup/down routines needed to support eDP/LVDS panels.
>>
>> The LCD and LED units are usually powered up via regulators,
>> and almost on all boards, we will have a BACKLIGHT_EN pin to
>> enable/ disable the backlight.
>> Sometimes, we can have LCD_EN switches as well.
>>
>> The routines in this driver can be used to control
>> panel power sequence on such boards.
>>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
>> ---
>>  .../devicetree/bindings/panel/panel-lvds.txt       |   50 ++++
>>  drivers/gpu/drm/panel/Kconfig                      |   10 +
>>  drivers/gpu/drm/panel/Makefile                     |    1 +
>>  drivers/gpu/drm/panel/panel-lvds.c                 |  262 ++++++++++++++++++++
>>  4 files changed, 323 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/panel/panel-lvds.txt
>>  create mode 100644 drivers/gpu/drm/panel/panel-lvds.c
>>
>> diff --git a/Documentation/devicetree/bindings/panel/panel-lvds.txt b/Documentation/devicetree/bindings/panel/panel-lvds.txt
>> new file mode 100644
>> index 0000000..7cb6084
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/panel/panel-lvds.txt
>> @@ -0,0 +1,50 @@
>> +panel interface for eDP/lvds panels
>> +
>> +Required properties:
>> +  - compatible: "panel-lvds"
>> +
>> +Optional properties:
>> +       -lcd-en-gpio:
>> +               panel LCD poweron GPIO.
>> +                       Indicates which GPIO needs to be powered up as output
>> +                       to powerup/enable the switch to the LCD panel.
>> +       -led-en-gpio:
>> +               panel LED enable GPIO.
>> +                       Indicates which GPIO needs to be powered up as output
>> +                       to enable the backlight.
>> +       -panel-prepare-delay:
>> +               delay value in ms required for panel_prepare process
>> +                       Delay in ms needed for the panel LCD unit to
>> +                       powerup completely.
>> +                       ex: delay needed till eDP panel throws HPD.
>> +                           delay needed so that we cans tart reading edid.
>> +       -panel-enable-delay:
>> +               delay value in ms required for panel_enable process
>> +                       Delay in ms needed for the panel backlight/LED unit
>> +                       to powerup, and delay needed between video_enable and
>> +                       backlight_enable.
>> +       -panel-disable-delay:
>> +               delay value in ms required for panel_disable process
>> +                       Delay in ms needed for the panel backlight/LED unit
>> +                       powerdown, and delay needed between backlight_disable
>> +                       and video_disable.
>> +       -panel-unprepare-delay:
>> +               delay value in ms required for panel_post_disable process
>> +                       Delay in ms needed for the panel LCD unit to
>> +                       to powerdown completely, and the minimum delay needed
>> +                       before powering it on again.
>> +       -panel-width-mm: physical panel width [mm]
>> +       -panel-height-mm: physical panel height [mm]
>> +
>
> For what are these two properties are needed?
Actually, these are needed to caluculate DPI(dots/pixels per inch).
That information will be used by the corresponding userspace to
deliver proper size fonts.
You can refer other panel drivers, even they too are using it!

Regards,
Ajay

> If I find some time I will give this patch a try as I need something
> like this for an imx6d based device.
That would be great, Thanks.

Ajay

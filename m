From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V5 11/12] Documentation: Add DT bindings for ps8622/ps8625
 bridge driver
Date: Mon, 21 Jul 2014 16:24:52 +0530
Message-ID: <CAEC9eQPpVykXKo8ZwCvmm_kBT5MgAqdt+6rmCiZjJc81H641mw@mail.gmail.com>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
	<1405629839-12086-12-git-send-email-ajaykumar.rs@samsung.com>
	<20140721070627.GA8843@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f169.google.com ([209.85.220.169]:44207 "EHLO
	mail-vc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754350AbaGUKyx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jul 2014 06:54:53 -0400
Received: by mail-vc0-f169.google.com with SMTP id hu12so11955385vcb.28
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jul 2014 03:54:52 -0700 (PDT)
In-Reply-To: <20140721070627.GA8843@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>, Vincent Palatin <vpalatin@chromium.org>

Hi Thierry,

On Mon, Jul 21, 2014 at 12:36 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Fri, Jul 18, 2014 at 02:13:57AM +0530, Ajay Kumar wrote:
>> From: Vincent Palatin <vpalatin@chromium.org>
>>
>> Add DT binding documentation for ps8622/ps8625 bridge driver.
>>
>> Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> ---
>>  .../devicetree/bindings/drm/bridge/ps8622.txt      |   21 ++++++++++++++++++++
>
> This is the wrong directory. Bindings are supposed to be OS agnostic,
> but DRM is (mostly) Linux-specific. video/bridge would be a better
> subdirectory for this. Somebody really ought to be moving out the
> existing bindings in the drm subdirectory to a more proper location.
Ok. I will move them out into video/bridge.

>>  1 file changed, 21 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/drm/bridge/ps8622.txt
>>
>> diff --git a/Documentation/devicetree/bindings/drm/bridge/ps8622.txt b/Documentation/devicetree/bindings/drm/bridge/ps8622.txt
>> new file mode 100644
>> index 0000000..1d154ac
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/drm/bridge/ps8622.txt
>> @@ -0,0 +1,21 @@
>> +ps8622-bridge bindings
>> +
>> +Required properties:
>> +     - compatible: "parade,ps8622" or "parade,ps8625"
>
> Documentation/devicetree/bindings/vendor-prefixes.txt doesn't contain an
> entry for parade yet.
I will fix this.

>> +     - reg: first i2c address of the bridge
>> +     - sleep-gpios: OF device-tree gpio specification
>> +     - reset-gpios: OF device-tree gpio specification
>> +
>> +Optional properties:
>> +     - lane-count: number of DP lanes to use
>> +     - use-external-pwm: backlight will be controlled by an external PWM
>
> In case of an external backlight, don't you still need a way to control
> it? Perhaps instead of using this boolean property you should make this
> take a phandle to the real backlight? Like so:
>
>         backlight {
>                 compatible = "pwm-backlight";
>                 ...
>         }
>
>         bridge@48 {
>                 compatible = "parade,ps8622";
>                 ...
>                 backlight = <&/backlight>;
>         }
>
> Then you can simply look up the backlight device when that property
> exists and instantiate the built-in backlight otherwise.
Thanks for the pointer, this approach seems perfect!

>> +
>> +Example:
>> +     ps8622-bridge@48 {
>> +             compatible = "parade,ps8622";
>> +             reg = <0x48>;
>> +             sleep-gpios = <&gpc3 6 1 0 0>;
>> +             reset-gpios = <&gpc3 1 1 0 0>;
>> +             display-timings = <&lcd_display_timings>;
>
> Why is this specifying display-timings? It's not mentioned in the
> binding above and I don't see why the bridge would need to provide
> one since it's really a property of the panel.
Ahh. I was trying to copy bindings from previous patchset and I messed it up.
Will fix it.

Ajay

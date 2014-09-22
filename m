From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Mon, 22 Sep 2014 14:01:38 +0530
Message-ID: <CAEC9eQPKqGaHdQXNu75LOno0RTePk4zbBuaf9WESaZfbcpCVmg@mail.gmail.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
	<5419760A.7020908@ti.com>
	<CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>
	<5419B52D.4060107@ti.com>
	<CAEC9eQO2rfmVEKTCUJk+SpfdeUr81gN3stYV3wE6yR3E=-zonA@mail.gmail.com>
	<20140922081036.GD1470@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f172.google.com ([209.85.213.172]:58156 "EHLO
	mail-ig0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752747AbaIVIbk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Sep 2014 04:31:40 -0400
In-Reply-To: <20140922081036.GD1470@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, InKi Dae <inki.dae@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Hi Thierry,

On Mon, Sep 22, 2014 at 1:40 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Thu, Sep 18, 2014 at 11:20:40AM +0530, Ajay kumar wrote:
>> Hi Tomi,
>>
>> On Wed, Sep 17, 2014 at 9:52 PM, Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>> > On 17/09/14 17:29, Ajay kumar wrote:
>> >> Hi Tomi,
>> >>
>> >> Thanks for your comments.
>> >>
>> >> On Wed, Sep 17, 2014 at 5:22 PM, Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>> >>> On 27/08/14 17:39, Ajay Kumar wrote:
>> >>>> Add documentation for DT properties supported by ps8622/ps8625
>> >>>> eDP-LVDS converter.
>> >>>>
>> >>>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> >>>> ---
>> >>>>  .../devicetree/bindings/video/bridge/ps8622.txt    |   20 ++++++++++++++++++++
>> >>>>  1 file changed, 20 insertions(+)
>> >>>>  create mode 100644 Documentation/devicetree/bindings/video/bridge/ps8622.txt
>> >>>>
>> >>>> diff --git a/Documentation/devicetree/bindings/video/bridge/ps8622.txt b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
>> >>>> new file mode 100644
>> >>>> index 0000000..0ec8172
>> >>>> --- /dev/null
>> >>>> +++ b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
>> >>>> @@ -0,0 +1,20 @@
>> >>>> +ps8622-bridge bindings
>> >>>> +
>> >>>> +Required properties:
>> >>>> +     - compatible: "parade,ps8622" or "parade,ps8625"
>> >>>> +     - reg: first i2c address of the bridge
>> >>>> +     - sleep-gpios: OF device-tree gpio specification for PD_ pin.
>> >>>> +     - reset-gpios: OF device-tree gpio specification for RST_ pin.
>> >>>> +
>> >>>> +Optional properties:
>> >>>> +     - lane-count: number of DP lanes to use
>> >>>> +     - use-external-pwm: backlight will be controlled by an external PWM
>> >>>
>> >>> What does this mean? That the backlight support from ps8625 is not used?
>> >>> If so, maybe "disable-pwm" or something?
>> >> "use-external-pwm" or "disable-bridge-pwm" would be better.
>> >
>> > Well, the properties are about the bridge. "use-external-pwm" means that
>> > the bridge uses an external PWM, which, if I understood correctly, is
>> > not what the property is about.
>> >
>> > "disable-bridge-pwm" is ok, but the "bridge" there is extra. The
>> > properties are about the bridge, so it's implicit.
>> Ok. I will use "disable-pwm".
>
> Why is this even necessary? According to the datasheet this device has
> circuitry for backlight control. If so, I'd expect it to expose either a
> backlight device or a PWM device. That way unless somebody is using the
> backlight/PWM exposed by the bridge the bridge can simply disable PWM.
The driver does expose a backlight device.
And, the decision(whether to expose a backlight device or not) is made
based on the DT flag "use-external-pwm".
This was discussed before, and you suggested to use the boolean
property, refer to this link:
http://lists.freedesktop.org/archives/dri-devel/2014-July/065048.html

Ajay

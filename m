From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Thu, 18 Sep 2014 11:20:40 +0530
Message-ID: <CAEC9eQO2rfmVEKTCUJk+SpfdeUr81gN3stYV3wE6yR3E=-zonA@mail.gmail.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <5419760A.7020908@ti.com>
 <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>
 <5419B52D.4060107@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5419B52D.4060107@ti.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tomi,

On Wed, Sep 17, 2014 at 9:52 PM, Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
> On 17/09/14 17:29, Ajay kumar wrote:
>> Hi Tomi,
>>
>> Thanks for your comments.
>>
>> On Wed, Sep 17, 2014 at 5:22 PM, Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>>> On 27/08/14 17:39, Ajay Kumar wrote:
>>>> Add documentation for DT properties supported by ps8622/ps8625
>>>> eDP-LVDS converter.
>>>>
>>>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>>>> ---
>>>>  .../devicetree/bindings/video/bridge/ps8622.txt    |   20 ++++++++++++++++++++
>>>>  1 file changed, 20 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/video/bridge/ps8622.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/video/bridge/ps8622.txt b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
>>>> new file mode 100644
>>>> index 0000000..0ec8172
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/video/bridge/ps8622.txt
>>>> @@ -0,0 +1,20 @@
>>>> +ps8622-bridge bindings
>>>> +
>>>> +Required properties:
>>>> +     - compatible: "parade,ps8622" or "parade,ps8625"
>>>> +     - reg: first i2c address of the bridge
>>>> +     - sleep-gpios: OF device-tree gpio specification for PD_ pin.
>>>> +     - reset-gpios: OF device-tree gpio specification for RST_ pin.
>>>> +
>>>> +Optional properties:
>>>> +     - lane-count: number of DP lanes to use
>>>> +     - use-external-pwm: backlight will be controlled by an external PWM
>>>
>>> What does this mean? That the backlight support from ps8625 is not used?
>>> If so, maybe "disable-pwm" or something?
>> "use-external-pwm" or "disable-bridge-pwm" would be better.
>
> Well, the properties are about the bridge. "use-external-pwm" means that
> the bridge uses an external PWM, which, if I understood correctly, is
> not what the property is about.
>
> "disable-bridge-pwm" is ok, but the "bridge" there is extra. The
> properties are about the bridge, so it's implicit.
Ok. I will use "disable-pwm".

>>>> +
>>>> +Example:
>>>> +     lvds-bridge@48 {
>>>> +             compatible = "parade,ps8622";
>>>> +             reg = <0x48>;
>>>> +             sleep-gpios = <&gpc3 6 1 0 0>;
>>>> +             reset-gpios = <&gpc3 1 1 0 0>;
>>>> +             lane-count = <1>;
>>>> +     };
>>>>
>>>
>>> I wish all new display component bindings would use the video
>>> ports/endpoints to describe the connections. It will be very difficult
>>> to improve the display driver model later if we're missing such critical
>>> pieces from the DT bindings.
>> Why do we need a complex graph when it can be handled using a simple phandle?
>
> Maybe in your case you can handle it with simple phandle. Can you
> guarantee that it's enough for everyone, on all platforms?
Yes, as of now exynos5420-peach-pit and exynos5250-spring boards use
this. In case of both, the phandle to bridge node is passed to the
exynos_dp node.

> The point of the ports/endpoint graph is to also support more
> complicated scenarios. If you now create ps8622 bindings that do not
> support those graphs, the no one else using ps8622 can use
> ports/endpoint graphs either.
>
> Btw, is there an example how the bridge with these bindings is used in a
> board's .dts file? I couldn't find any example with a quick search. So
> it's unclear to me what the "simple phandle" actually is.
Please refer to the following link:
https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/tree/arch/arm/boot/dts/exynos5420-peach-pit.dts?id=samsung-dt#n129
Let me know if you still think we would need to describe it as a complex graph!

Ajay

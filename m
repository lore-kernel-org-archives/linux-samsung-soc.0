From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V5 05/12] Documentation: Add DT bindings for panel-lvds
 driver
Date: Fri, 18 Jul 2014 02:20:39 +0530
Message-ID: <CAEC9eQNygvwOGvw6QPGp+=7K9=oC9XvcEf9QSv=JBsEHyhM0wA@mail.gmail.com>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
 <1405629839-12086-6-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1405629839-12086-6-git-send-email-ajaykumar.rs@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Javier Martinez Canillas <javier@dowhile0.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

+devicetree@vger.kernel.org

On Fri, Jul 18, 2014 at 2:13 AM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
> Add DT binding documentation for panel-lvds driver.
>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  .../devicetree/bindings/panel/panel-lvds.txt       |   50 ++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/panel-lvds.txt
>
> diff --git a/Documentation/devicetree/bindings/panel/panel-lvds.txt b/Documentation/devicetree/bindings/panel/panel-lvds.txt
> new file mode 100644
> index 0000000..fdf91da2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/panel-lvds.txt
> @@ -0,0 +1,50 @@
> +panel interface for eDP/lvds panels
> +
> +Required properties:
> +  - compatible: "panel-lvds"
> +
> +Optional properties:
> +       -lcd-enable-gpios:
> +               panel LCD poweron GPIO.
> +                       Indicates which GPIO needs to be powered up as output
> +                       to powerup/enable the switch to the LCD panel.
> +       -backlight-enable-gpios:
> +               panel LED enable GPIO.
> +                       Indicates which GPIO needs to be powered up as output
> +                       to enable the backlight.
> +       -panel-prepare-delay:
> +               delay value in ms required for panel_prepare process
> +                       Delay in ms needed for the panel LCD unit to
> +                       powerup completely.
> +                       ex: delay needed till eDP panel throws HPD.
> +                           delay needed so that we cans tart reading edid.
> +       -panel-enable-delay:
> +               delay value in ms required for panel_enable process
> +                       Delay in ms needed for the panel backlight/LED unit
> +                       to powerup, and delay needed between video_enable and
> +                       backlight_enable.
> +       -panel-disable-delay:
> +               delay value in ms required for panel_disable process
> +                       Delay in ms needed for the panel backlight/LED unit
> +                       powerdown, and delay needed between backlight_disable
> +                       and video_disable.
> +       -panel-unprepare-delay:
> +               delay value in ms required for panel_post_disable process
> +                       Delay in ms needed for the panel LCD unit to
> +                       to powerdown completely, and the minimum delay needed
> +                       before powering it on again.
> +       -panel-width-mm: physical panel width [mm]
> +       -panel-height-mm: physical panel height [mm]
> +
> +Example:
> +
> +       panel-lvds {
> +               compatible = "panel-lvds";
> +               backlight-enable-gpios = <&gpx3 0 0>;
> +               panel-prepare-delay = <40>;
> +               panel-enable-delay = <20>;
> +               panel-disable-delay = <20>;
> +               panel-unprepare-delay = <30>;
> +               panel-width-mm = <256>;
> +               panel-height-mm = <144>;
> +       };
> --
> 1.7.9.5
>

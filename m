From: Christian Gmeiner <christian.gmeiner@gmail.com>
Subject: Re: [PATCH V4 04/10] drm/panel: Add driver for lvds/edp based panels
Date: Mon, 23 Jun 2014 18:55:01 +0200
Message-ID: <CAH9NwWeZ2i_zDD2EkE7nE12W314TiAUPudBu_WEXT34az3xOYw@mail.gmail.com>
References: <1402511228-18945-1-git-send-email-ajaykumar.rs@samsung.com>
 <1402511228-18945-5-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1402511228-18945-5-git-send-email-ajaykumar.rs@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, seanpaul@google.com, daniel.vetter@ffwll.ch, joshi@samsung.com, DRI mailing list <dri-devel@lists.freedesktop.org>, ajaynumb@gmail.com, marcheu@chromium.org, prashanth.g@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi


2014-06-11 20:27 GMT+02:00 Ajay Kumar <ajaykumar.rs@samsung.com>:
> This patch adds a simple driver to handle all the LCD and LED
> powerup/down routines needed to support eDP/LVDS panels.
>
> The LCD and LED units are usually powered up via regulators,
> and almost on all boards, we will have a BACKLIGHT_EN pin to
> enable/ disable the backlight.
> Sometimes, we can have LCD_EN switches as well.
>
> The routines in this driver can be used to control
> panel power sequence on such boards.
>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
> ---
>  .../devicetree/bindings/panel/panel-lvds.txt       |   50 ++++
>  drivers/gpu/drm/panel/Kconfig                      |   10 +
>  drivers/gpu/drm/panel/Makefile                     |    1 +
>  drivers/gpu/drm/panel/panel-lvds.c                 |  262 ++++++++++++++++++++
>  4 files changed, 323 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/panel-lvds.txt
>  create mode 100644 drivers/gpu/drm/panel/panel-lvds.c
>
> diff --git a/Documentation/devicetree/bindings/panel/panel-lvds.txt b/Documentation/devicetree/bindings/panel/panel-lvds.txt
> new file mode 100644
> index 0000000..7cb6084
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/panel-lvds.txt
> @@ -0,0 +1,50 @@
> +panel interface for eDP/lvds panels
> +
> +Required properties:
> +  - compatible: "panel-lvds"
> +
> +Optional properties:
> +       -lcd-en-gpio:
> +               panel LCD poweron GPIO.
> +                       Indicates which GPIO needs to be powered up as output
> +                       to powerup/enable the switch to the LCD panel.
> +       -led-en-gpio:
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

For what are these two properties are needed?

If I find some time I will give this patch a try as I need something
like this for an imx6d based device.

greets
--
Christian Gmeiner, MSc

https://soundcloud.com/christian-gmeiner

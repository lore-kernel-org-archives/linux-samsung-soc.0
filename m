From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V5 11/12] Documentation: Add DT bindings for ps8622/ps8625
 bridge driver
Date: Fri, 18 Jul 2014 02:21:14 +0530
Message-ID: <CAEC9eQORLcGhA=n_v3+_UAB4d114zsJBXyukfXuhK_VqP0_fMw@mail.gmail.com>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
 <1405629839-12086-12-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1405629839-12086-12-git-send-email-ajaykumar.rs@samsung.com>
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
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Javier Martinez Canillas <javier@dowhile0.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

+devicetree@vger.kernel.org

On Fri, Jul 18, 2014 at 2:13 AM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
> From: Vincent Palatin <vpalatin@chromium.org>
>
> Add DT binding documentation for ps8622/ps8625 bridge driver.
>
> Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  .../devicetree/bindings/drm/bridge/ps8622.txt      |   21 ++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/drm/bridge/ps8622.txt
>
> diff --git a/Documentation/devicetree/bindings/drm/bridge/ps8622.txt b/Documentation/devicetree/bindings/drm/bridge/ps8622.txt
> new file mode 100644
> index 0000000..1d154ac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/drm/bridge/ps8622.txt
> @@ -0,0 +1,21 @@
> +ps8622-bridge bindings
> +
> +Required properties:
> +       - compatible: "parade,ps8622" or "parade,ps8625"
> +       - reg: first i2c address of the bridge
> +       - sleep-gpios: OF device-tree gpio specification
> +       - reset-gpios: OF device-tree gpio specification
> +
> +Optional properties:
> +       - lane-count: number of DP lanes to use
> +       - use-external-pwm: backlight will be controlled by an external PWM
> +
> +Example:
> +       ps8622-bridge@48 {
> +               compatible = "parade,ps8622";
> +               reg = <0x48>;
> +               sleep-gpios = <&gpc3 6 1 0 0>;
> +               reset-gpios = <&gpc3 1 1 0 0>;
> +               display-timings = <&lcd_display_timings>;
> +               lane-count = <1>
> +       };
> --
> 1.7.9.5
>

From: Philipp Zabel <philipp.zabel@gmail.com>
Subject: Re: [PATCH v6 01/10] Documentation: dt: Add binding documentation for
 S5K6A3 image sensor
Date: Thu, 6 Mar 2014 19:08:59 +0100
Message-ID: <CA+gwMcc7sLp0N5oyCYf-121AzS8KsRdNsvY3DJ7p3z=yVLrBdw@mail.gmail.com>
References: <1394122819-9582-1-git-send-email-s.nawrocki@samsung.com>
	<1394122819-9582-2-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1394122819-9582-2-git-send-email-s.nawrocki@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-samsung-soc@vger.kernel.org, a.hajda@samsung.com, kyungmin.park@samsung.com, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Sylwester,

On Thu, Mar 6, 2014 at 5:20 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> This patch adds binding documentation for the Samsung S5K6A3(YX)
> raw image sensor.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> ---
> Changes since v5:
>   - none.
>
> Changes since v2:
>  - rephrased 'clocks' and 'clock-names' properties' description;
> ---
>  .../devicetree/bindings/media/samsung-s5k6a3.txt   |   33 ++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/samsung-s5k6a3.txt
>
> diff --git a/Documentation/devicetree/bindings/media/samsung-s5k6a3.txt b/Documentation/devicetree/bindings/media/samsung-s5k6a3.txt
> new file mode 100644
> index 0000000..cce01e8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/samsung-s5k6a3.txt
> @@ -0,0 +1,33 @@
> +Samsung S5K6A3(YX) raw image sensor
> +---------------------------------
> +
> +S5K6A3(YX) is a raw image sensor with MIPI CSI-2 and CCP2 image data interfaces
> +and CCI (I2C compatible) control bus.
> +
> +Required properties:
> +
> +- compatible   : "samsung,s5k6a3";
> +- reg          : I2C slave address of the sensor;
> +- svdda-supply : core voltage supply;
> +- svddio-supply        : I/O voltage supply;
> +- afvdd-supply : AF (actuator) voltage supply;
> +- gpios                : specifier of a GPIO connected to the RESET pin;

Please use 'reset-gpios' for GPIOs connected to reset pins.

regards
Philipp

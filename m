From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: mfd: s2mps11: add documentation for
 s2mps15 PMIC
Date: Fri, 6 Nov 2015 16:33:39 -0600
Message-ID: <20151106223339.GA22411@rob-hp-laptop>
References: <1446186334-16510-1-git-send-email-alim.akhtar@samsung.com>
 <1446186334-16510-2-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1446186334-16510-2-git-send-email-alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Oct 30, 2015 at 11:55:31AM +0530, Alim Akhtar wrote:
> From: Thomas Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> 
> Add dt-binding documentation for s2mps15 PMIC device. The s2mps15 device
> is similar to s2mps11/14 PMIC device and has 27 LDO and 10 buck regulators.
> This also supports RTC and three 32.768KHz clock outputs.
> 
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Thomas Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/s2mps11.txt |   21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt b/Documentation/devicetree/bindings/mfd/s2mps11.txt
> index 890f0b0e1643..4c0543ceec25 100644
> --- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
> +++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
> @@ -1,5 +1,5 @@
>  
> -* Samsung S2MPS11, S2MPS13, S2MPS14 and S2MPU02 Voltage and Current Regulator
> +* Samsung S2MPS11/13/14/15 and S2MPU02 Voltage and Current Regulator
>  
>  The Samsung S2MPS11 is a multi-function device which includes voltage and
>  current regulators, RTC, charger controller and other sub-blocks. It is
> @@ -7,8 +7,12 @@ interfaced to the host controller using an I2C interface. Each sub-block is
>  addressed by the host system using different I2C slave addresses.
>  
>  Required properties:
> -- compatible: Should be "samsung,s2mps11-pmic" or "samsung,s2mps13-pmic"
> -	      or "samsung,s2mps14-pmic" or "samsung,s2mpu02-pmic".
> +- compatible: Should be one of the following
> +	- "samsung,s2mps11-pmic"
> +	- "samsung,s2mps13-pmic"
> +	- "samsung,s2mps14-pmic"
> +	- "samsung,s2mps15-pmic"
> +	- "samsung,s2mpu02-pmic".
>  - reg: Specifies the I2C slave address of the pmic block. It should be 0x66.
>  
>  Optional properties:
> @@ -24,7 +28,7 @@ Optional properties:
>    unwanted buck warm reset (setting buck voltages to default values).
>  
>  Optional nodes:
> -- clocks: s2mps11, s2mps13 and s5m8767 provide three(AP/CP/BT) buffered 32.768
> +- clocks: s2mps11, s2mps13, s2mps15 and s5m8767 provide three(AP/CP/BT) buffered 32.768

s5m8767 doesn't seem to be documented. Can you please fix or remove.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

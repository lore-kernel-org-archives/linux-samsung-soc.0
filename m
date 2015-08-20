From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v3 08/14] phy: Add driver for rockchip Display Port PHY
Date: Thu, 20 Aug 2015 01:56:25 -0500
Message-ID: <55D57A19.7020205@rock-chips.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
 <1439995877-18496-1-git-send-email-ykk@rock-chips.com>
 <55D55A3E.8090905@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0618583954=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <55D55A3E.8090905@ti.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Kishon Vijay Abraham I <kishon@ti.com>, Heiko Stuebner <heiko@sntech.de>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Fabio Estevam <fabio.estevam@freescale.com>, Inki Dae <inki.dae@samsung.com>, joe@perches.com, Russell King <rmk+kernel@arm.linux.org.uk>
Cc: seanpaul@google.com, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, linux-samsung-soc@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, dianders@google.com, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, djkurtz@google.com, Kumar Gala <galak@codeaurora.org>, ajaynumb@gmail.com, Andy Yan <andy.yan@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.
--===============0618583954==
Content-Type: multipart/alternative;
 boundary="------------030602030902040002010505"

This is a multi-part message in MIME format.
--------------030602030902040002010505
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kishon,

On 08/19/2015 11:40 PM, Kishon Vijay Abraham I wrote:
> Hi,
>
> On Wednesday 19 August 2015 08:21 PM, Yakir Yang wrote:
>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> where's the commit message?

Actually I have no detail words for this, so leave this empty :-)

If you think I should add some words here, I may want to declare
the relationship  of this driver and remote analogix dp driver.


>> ---
>> Changes in v3:
>> - Take Heiko suggest, add rockchip dp phy driver,
>>    collect the phy clocks and power control.
>>
>> Changes in v2: None
>>
>>   .../devicetree/bindings/phy/rockchip-dp-phy.txt    |  26 +++
>>   drivers/phy/Kconfig                                |   7 +
>>   drivers/phy/Makefile                               |   1 +
>>   drivers/phy/phy-rockchip-dp.c                      | 185 +++++++++++++++++++++
>>   4 files changed, 219 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt
>>   create mode 100644 drivers/phy/phy-rockchip-dp.c
>>
>> diff --git a/Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt b/Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt
>> new file mode 100644
>> index 0000000..5de1088
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt
>> @@ -0,0 +1,26 @@
>> +Rockchip Soc Seroes Display Port PHY
>> +------------------------------------
>> +
>> +Required properties:
>> +- compatible : should be one of the following supported values:
>> +	 - "rockchip.rk3288-dp-phy"
>> +
>> +- reg : a list of registers used by phy driver
>> +- clocks: from common clock binding: handle to dp clock.
>> +	of memory mapped region.
>> +- clock-names: from common clock binding:
>> +	Required elements: "sclk_dp" "sclk_dp_24m"
>> +
>> +- rockchip,grf: this soc should set GRF regs, so need get grf here.
>> +- #phy-cells : from the generic PHY bindings, must be 0;
>> +
>> +Example:
>> +
>> +edp_phy: phy@ff770274 {
>> +	compatilble = "rockchip,rk3288-dp-phy";
>> +	reg = <0xff770274 4>;
>> +	rockchip,grf = <&grf>;
>> +	clocks = <&cru SCLK_EDP_24M>;
>> +	clock-names = "24m";
>> +	#phy-cells = <0>;
>> +}
>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
>> index 6b8dd16..da00440 100644
>> --- a/drivers/phy/Kconfig
>> +++ b/drivers/phy/Kconfig
>> @@ -297,6 +297,13 @@ config PHY_ROCKCHIP_USB
>>   	help
>>   	  Enable this to support the Rockchip USB 2.0 PHY.
>>   
>> +config PHY_ROCKCHIP_DP
>> +	tristate "Rockchip Display Port PHY Driver"
>> +	depends on ARCH_ROCKCHIP && OF
>> +	select GENERIC_PHY
>> +	help
>> +	  Enable this to support the Rockchip Display Port PHY.
>> +
>>   config PHY_ST_SPEAR1310_MIPHY
>>   	tristate "ST SPEAR1310-MIPHY driver"
>>   	select GENERIC_PHY
>> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
>> index f344e1b..35e3ce6 100644
>> --- a/drivers/phy/Makefile
>> +++ b/drivers/phy/Makefile
>> @@ -33,6 +33,7 @@ phy-exynos-usb2-$(CONFIG_PHY_S5PV210_USB2)	+= phy-s5pv210-usb2.o
>>   obj-$(CONFIG_PHY_EXYNOS5_USBDRD)	+= phy-exynos5-usbdrd.o
>>   obj-$(CONFIG_PHY_QCOM_APQ8064_SATA)	+= phy-qcom-apq8064-sata.o
>>   obj-$(CONFIG_PHY_ROCKCHIP_USB) += phy-rockchip-usb.o
>> +obj-$(CONFIG_PHY_ROCKCHIP_DP)		+= phy-rockchip-dp.o
>>   obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
>>   obj-$(CONFIG_PHY_ST_SPEAR1310_MIPHY)	+= phy-spear1310-miphy.o
>>   obj-$(CONFIG_PHY_ST_SPEAR1340_MIPHY)	+= phy-spear1340-miphy.o
>> diff --git a/drivers/phy/phy-rockchip-dp.c b/drivers/phy/phy-rockchip-dp.c
>> new file mode 100644
>> index 0000000..4759111
>> --- /dev/null
>> +++ b/drivers/phy/phy-rockchip-dp.c
>> @@ -0,0 +1,185 @@
>> +/*
>> + * Rockchip DP PHY driver
>> + *
>> + * Copyright (C) 2015 FuZhou Rockchip Co., Ltd.
>> + * Author: Yakir Yang <ykk@@rock-chips.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License.
>> + */
>> +
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>> +#include <linux/clk.h>
>> +#include <linux/phy/phy.h>
>> +#include <linux/regmap.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/platform_device.h>
>> +
>> +#define GRF_SOC_CON12                   0x0274
>> +#define GRF_EDP_REF_CLK_SEL_INTER       BIT(4)
>> +
>> +#define DP_PHY_SIDDQ_WRITE_EN           BIT(21)
>> +#define DP_PHY_SIDDQ_ON                 0
>> +#define DP_PHY_SIDDQ_OFF                BIT(5)
>> +
>> +struct rockchip_dp_phy {
>> +	struct device  *dev;
>> +	struct regmap  *grf;
>> +	void __iomem   *regs;
>> +	struct clk     *phy_24m;
>> +};
>> +
>> +static int rockchip_dp_phy_clk_enable(struct rockchip_dp_phy *dp)
>> +{
>> +	int ret = 0;
>> +
>> +	ret = clk_set_rate(dp->phy_24m, 24000000);
>> +	if (ret < 0) {
>> +		dev_err(dp->dev, "cannot set clock phy_24m %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = clk_prepare_enable(dp->phy_24m);
>> +	if (ret < 0) {
>> +		dev_err(dp->dev, "cannot enable clock phy_24m %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int rockchip_dp_phy_clk_disable(struct rockchip_dp_phy *dp)
>> +{
>> +	clk_disable_unprepare(dp->phy_24m);
>> +
>> +	return 0;
>> +}
>> +
>> +static int rockchip_set_phy_state(struct phy *phy, bool enable)
>> +{
>> +	struct rockchip_dp_phy *dp = phy_get_drvdata(phy);
>> +
>> +	if (enable) {
>> +		rockchip_dp_phy_clk_enable(dp);
>> +		writel(DP_PHY_SIDDQ_WRITE_EN | DP_PHY_SIDDQ_ON, dp->regs);
>> +	} else {
>> +		rockchip_dp_phy_clk_disable(dp);
>> +		writel(DP_PHY_SIDDQ_WRITE_EN | DP_PHY_SIDDQ_OFF, dp->regs);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int rockchip_dp_phy_power_on(struct phy *phy)
>> +{
>> +	return rockchip_set_phy_state(phy, true);
>> +}
>> +
>> +static int rockchip_dp_phy_power_off(struct phy *phy)
>> +{
>> +	return rockchip_set_phy_state(phy, false);
>> +}
>> +
>> +static struct phy_ops rockchip_dp_phy_ops = {
>> +	.power_on	= rockchip_dp_phy_power_on,
>> +	.power_off	= rockchip_dp_phy_power_off,
>> +	.owner		= THIS_MODULE,
>> +};
>> +
>> +static int rockchip_dp_phy_init(struct rockchip_dp_phy *dp)
>> +{
>> +	struct device *dev = dp->dev;
>> +	struct device_node *np = dev->of_node;
>> +	int ret;
>> +
>> +	dp->phy_24m = devm_clk_get(dev, "24m");
>> +	if (IS_ERR(dp->phy_24m)) {
>> +		dev_err(dev, "cannot get clock 24m\n");
>> +		return PTR_ERR(dp->phy_24m);
>> +	}
>> +
>> +	ret = rockchip_dp_phy_clk_enable(dp);
>> +	if (ret < 0) {
>> +		dev_err(dp->dev, "cannot enable dp phy clk %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	dp->grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
>> +	if (IS_ERR(dp->grf)) {
>> +		dev_err(dev, "rk3288-dp needs rockchip,grf property\n");
>> +		return PTR_ERR(dp->grf);
>> +	}
>> +
>> +	ret = regmap_write(dp->grf, GRF_SOC_CON12,
>> +			   GRF_EDP_REF_CLK_SEL_INTER |
>> +			   (GRF_EDP_REF_CLK_SEL_INTER << 16));
>> +	if (ret != 0) {
>> +		dev_err(dp->dev, "Could not config GRF edp ref clk: %d\n", ret);
>> +		return ret;
>> +	}
> This function can be split to do only clk_get and syscon_regmap_lookup in
> probe, clk_enable and regmap_write in phy_init?

Yeah, I agree with you to move DT property code to probe
function, and I do find a bug that clk_enable should be remove
from probe/phy_init function.

If clock have been enabled in probe function, then the reference
count of this clock would never reach zero, cause phy_power_on
always corresponding to phy_power_off.

So phy_init function would only have one expression regmap_write,
it's redundant, let's just delete phy_init function, move all code to probe.

Thanks,
- Yakir

------------------------------------------------------------------------------------------------
static int rockchip_dp_phy_probe(struct platform_device *pdev)
  {
         struct device *dev = &pdev->dev;
+       struct device_node *np = dev->of_node;
         struct phy_provider *phy_provider;
         struct rockchip_dp_phy *dp;
         struct resource *res;
@@ -146,15 +112,31 @@ static int rockchip_dp_phy_probe(struct 
platform_device *pdev)
         if (IS_ERR(dp->regs))
                 return PTR_ERR(dp->regs);

-       ret = rockchip_dp_phy_init(dp);
-       if (ret)
+       dp->phy_24m = devm_clk_get(dev, "24m");
+       if (IS_ERR(dp->phy_24m)) {
+               dev_err(dev, "cannot get clock 24m\n");
+               return PTR_ERR(dp->phy_24m);
+       }
+
+       dp->grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
+       if (IS_ERR(dp->grf)) {
+               dev_err(dev, "rk3288-dp needs rockchip,grf property\n");
+               return PTR_ERR(dp->grf);
+       }
+
+       ret = regmap_write(dp->grf, GRF_SOC_CON12, 
GRF_EDP_REF_CLK_SEL_INTER |
+                          (GRF_EDP_REF_CLK_SEL_INTER << 16));
+       if (ret) {
+               dev_err(dp->dev, "Could not config GRF edp ref clk: 
%d\n", ret);
                 return ret;
+       }

         phy = devm_phy_create(dev, NULL, &rockchip_dp_phy_ops, NULL);
         if (IS_ERR(phy)) {
                 dev_err(dev, "failed to create phy\n");
                 return PTR_ERR(phy);
         }


>> +
>> +	return 0;
>> +}
>> +
>> +static int rockchip_dp_phy_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct phy_provider *phy_provider;
>> +	struct rockchip_dp_phy *dp;
>> +	struct resource *res;
>> +	struct phy *phy;
>> +	int ret;
>> +
>> +	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
>> +	if (IS_ERR(dp))
>> +		return -ENOMEM;
>> +
>> +	dp->dev = dev;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	dp->regs = devm_ioremap_resource(dev, res);
>> +	if (IS_ERR(dp->regs))
>> +		return PTR_ERR(dp->regs);
>> +
>> +	ret = rockchip_dp_phy_init(dp);
>> +	if (ret)
>> +		return ret;
>> +
>> +	phy = devm_phy_create(dev, NULL, &rockchip_dp_phy_ops, NULL);
>> +	if (IS_ERR(phy)) {
>> +		dev_err(dev, "failed to create phy\n");
>> +		return PTR_ERR(phy);
>> +	}
>> +	phy_set_drvdata(phy, dp);
>> +
>> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>> +
>> +	return PTR_ERR_OR_ZERO(phy_provider);
>> +}
>> +
>> +static const struct of_device_id rockchip_dp_phy_dt_ids[] = {
>> +	{ .compatible = "rockchip,rk3288-dp-phy" },
>> +	{}
>> +};
>> +
>> +MODULE_DEVICE_TABLE(of, rockchip_dp_phy_dt_ids);
>> +
>> +static struct platform_driver rockchip_dp_phy_driver = {
>> +	.probe		= rockchip_dp_phy_probe,
>> +	.driver		= {
>> +		.name	= "rockchip-dp-phy",
>> +		.owner	= THIS_MODULE,
> owner is not required here.
>
> Thanks
> Kishon
>
>
>


--------------030602030902040002010505
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3Dwindows-1252"
      http-equiv=3D"Content-Type">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    Hi Kishon,<br>
    <br>
    <div class=3D"moz-cite-prefix">On 08/19/2015 11:40 PM, Kishon Vijay
      Abraham I wrote:<br>
    </div>
    <blockquote cite=3D"mid:55D55A3E.8090905@ti.com" type=3D"cite">
      <pre wrap=3D"">Hi,

On Wednesday 19 August 2015 08:21 PM, Yakir Yang wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">Signed-off-by: Yakir Yang <a class=3D"moz-txt-link=
-rfc2396E" href=3D"mailto:ykk@rock-chips.com">&lt;ykk@rock-chips.com&gt;<=
/a>
</pre>
      </blockquote>
      <pre wrap=3D"">
where's the commit message?</pre>
    </blockquote>
    <br>
    Actually I have no detail words for this, so leave this empty :-)<br>
    <br>
    If you think I should add some words here, I may want to declare<br>
    the relationship=A0 of this driver and remote analogix dp driver.<br>
    <br>
    <br>
    <blockquote cite=3D"mid:55D55A3E.8090905@ti.com" type=3D"cite">
      <pre wrap=3D"">
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">---
Changes in v3:
- Take Heiko suggest, add rockchip dp phy driver,
  collect the phy clocks and power control.

Changes in v2: None

 .../devicetree/bindings/phy/rockchip-dp-phy.txt    |  26 +++
 drivers/phy/Kconfig                                |   7 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-rockchip-dp.c                      | 185 +++++++++++++++=
++++++
 4 files changed, 219 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip-dp-phy=
.txt
 create mode 100644 drivers/phy/phy-rockchip-dp.c

diff --git a/Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt b/=
Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt
new file mode 100644
index 0000000..5de1088
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt
@@ -0,0 +1,26 @@
+Rockchip Soc Seroes Display Port PHY
+------------------------------------
+
+Required properties:
+- compatible : should be one of the following supported values:
+	 - "rockchip.rk3288-dp-phy"
+
+- reg : a list of registers used by phy driver
+- clocks: from common clock binding: handle to dp clock.
+	of memory mapped region.
+- clock-names: from common clock binding:
+	Required elements: "sclk_dp" "sclk_dp_24m"
+
+- rockchip,grf: this soc should set GRF regs, so need get grf here.
+- #phy-cells : from the generic PHY bindings, must be 0;
+
+Example:
+
+edp_phy: phy@ff770274 {
+	compatilble =3D "rockchip,rk3288-dp-phy";
+	reg =3D &lt;0xff770274 4&gt;;
+	rockchip,grf =3D &lt;&amp;grf&gt;;
+	clocks =3D &lt;&amp;cru SCLK_EDP_24M&gt;;
+	clock-names =3D "24m";
+	#phy-cells =3D &lt;0&gt;;
+}
diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 6b8dd16..da00440 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -297,6 +297,13 @@ config PHY_ROCKCHIP_USB
 	help
 	  Enable this to support the Rockchip USB 2.0 PHY.
=20
+config PHY_ROCKCHIP_DP
+	tristate "Rockchip Display Port PHY Driver"
+	depends on ARCH_ROCKCHIP &amp;&amp; OF
+	select GENERIC_PHY
+	help
+	  Enable this to support the Rockchip Display Port PHY.
+
 config PHY_ST_SPEAR1310_MIPHY
 	tristate "ST SPEAR1310-MIPHY driver"
 	select GENERIC_PHY
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index f344e1b..35e3ce6 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -33,6 +33,7 @@ phy-exynos-usb2-$(CONFIG_PHY_S5PV210_USB2)	+=3D phy-s5p=
v210-usb2.o
 obj-$(CONFIG_PHY_EXYNOS5_USBDRD)	+=3D phy-exynos5-usbdrd.o
 obj-$(CONFIG_PHY_QCOM_APQ8064_SATA)	+=3D phy-qcom-apq8064-sata.o
 obj-$(CONFIG_PHY_ROCKCHIP_USB) +=3D phy-rockchip-usb.o
+obj-$(CONFIG_PHY_ROCKCHIP_DP)		+=3D phy-rockchip-dp.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+=3D phy-qcom-ipq806x-sata.o
 obj-$(CONFIG_PHY_ST_SPEAR1310_MIPHY)	+=3D phy-spear1310-miphy.o
 obj-$(CONFIG_PHY_ST_SPEAR1340_MIPHY)	+=3D phy-spear1340-miphy.o
diff --git a/drivers/phy/phy-rockchip-dp.c b/drivers/phy/phy-rockchip-dp.=
c
new file mode 100644
index 0000000..4759111
--- /dev/null
+++ b/drivers/phy/phy-rockchip-dp.c
@@ -0,0 +1,185 @@
+/*
+ * Rockchip DP PHY driver
+ *
+ * Copyright (C) 2015 FuZhou Rockchip Co., Ltd.
+ * Author: Yakir Yang <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
ykk@@rock-chips.com">&lt;ykk@@rock-chips.com&gt;</a>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License.
+ */
+
+#include &lt;linux/io.h&gt;
+#include &lt;linux/kernel.h&gt;
+#include &lt;linux/module.h&gt;
+#include &lt;linux/of.h&gt;
+#include &lt;linux/of_address.h&gt;
+#include &lt;linux/clk.h&gt;
+#include &lt;linux/phy/phy.h&gt;
+#include &lt;linux/regmap.h&gt;
+#include &lt;linux/mfd/syscon.h&gt;
+#include &lt;linux/platform_device.h&gt;
+
+#define GRF_SOC_CON12                   0x0274
+#define GRF_EDP_REF_CLK_SEL_INTER       BIT(4)
+
+#define DP_PHY_SIDDQ_WRITE_EN           BIT(21)
+#define DP_PHY_SIDDQ_ON                 0
+#define DP_PHY_SIDDQ_OFF                BIT(5)
+
+struct rockchip_dp_phy {
+	struct device  *dev;
+	struct regmap  *grf;
+	void __iomem   *regs;
+	struct clk     *phy_24m;
+};
+
+static int rockchip_dp_phy_clk_enable(struct rockchip_dp_phy *dp)
+{
+	int ret =3D 0;
+
+	ret =3D clk_set_rate(dp-&gt;phy_24m, 24000000);
+	if (ret &lt; 0) {
+		dev_err(dp-&gt;dev, "cannot set clock phy_24m %d\n", ret);
+		return ret;
+	}
+
+	ret =3D clk_prepare_enable(dp-&gt;phy_24m);
+	if (ret &lt; 0) {
+		dev_err(dp-&gt;dev, "cannot enable clock phy_24m %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int rockchip_dp_phy_clk_disable(struct rockchip_dp_phy *dp)
+{
+	clk_disable_unprepare(dp-&gt;phy_24m);
+
+	return 0;
+}
+
+static int rockchip_set_phy_state(struct phy *phy, bool enable)
+{
+	struct rockchip_dp_phy *dp =3D phy_get_drvdata(phy);
+
+	if (enable) {
+		rockchip_dp_phy_clk_enable(dp);
+		writel(DP_PHY_SIDDQ_WRITE_EN | DP_PHY_SIDDQ_ON, dp-&gt;regs);
+	} else {
+		rockchip_dp_phy_clk_disable(dp);
+		writel(DP_PHY_SIDDQ_WRITE_EN | DP_PHY_SIDDQ_OFF, dp-&gt;regs);
+	}
+
+	return 0;
+}
+
+static int rockchip_dp_phy_power_on(struct phy *phy)
+{
+	return rockchip_set_phy_state(phy, true);
+}
+
+static int rockchip_dp_phy_power_off(struct phy *phy)
+{
+	return rockchip_set_phy_state(phy, false);
+}
+
+static struct phy_ops rockchip_dp_phy_ops =3D {
+	.power_on	=3D rockchip_dp_phy_power_on,
+	.power_off	=3D rockchip_dp_phy_power_off,
+	.owner		=3D THIS_MODULE,
+};
+
+static int rockchip_dp_phy_init(struct rockchip_dp_phy *dp)
+{
+	struct device *dev =3D dp-&gt;dev;
+	struct device_node *np =3D dev-&gt;of_node;
+	int ret;
+
+	dp-&gt;phy_24m =3D devm_clk_get(dev, "24m");
+	if (IS_ERR(dp-&gt;phy_24m)) {
+		dev_err(dev, "cannot get clock 24m\n");
+		return PTR_ERR(dp-&gt;phy_24m);
+	}
+
+	ret =3D rockchip_dp_phy_clk_enable(dp);
+	if (ret &lt; 0) {
+		dev_err(dp-&gt;dev, "cannot enable dp phy clk %d\n", ret);
+		return ret;
+	}
+
+	dp-&gt;grf =3D syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
+	if (IS_ERR(dp-&gt;grf)) {
+		dev_err(dev, "rk3288-dp needs rockchip,grf property\n");
+		return PTR_ERR(dp-&gt;grf);
+	}
+
+	ret =3D regmap_write(dp-&gt;grf, GRF_SOC_CON12,
+			   GRF_EDP_REF_CLK_SEL_INTER |
+			   (GRF_EDP_REF_CLK_SEL_INTER &lt;&lt; 16));
+	if (ret !=3D 0) {
+		dev_err(dp-&gt;dev, "Could not config GRF edp ref clk: %d\n", ret);
+		return ret;
+	}
</pre>
      </blockquote>
      <pre wrap=3D"">
This function can be split to do only clk_get and syscon_regmap_lookup in
probe, clk_enable and regmap_write in phy_init?</pre>
    </blockquote>
    <br>
    Yeah, I agree with you to move DT property code to probe<br>
    function, and I do find a bug that clk_enable should be remove<br>
    from probe/phy_init function.<br>
    <br>
    If clock have been enabled in probe function, then the reference<br>
    count of this clock would never reach zero, cause phy_power_on<br>
    always corresponding to phy_power_off.<br>
    <br>
    So phy_init function would only have one expression regmap_write,<br>
    it's
    <meta http-equiv=3D"content-type" content=3D"text/html;
      charset=3Dwindows-1252">
    redundant, let's just delete phy_init function, move all code to
    probe.<br>
    <br>
    Thanks,<br>
    - Yakir<br>
    <br>
-------------------------------------------------------------------------=
-----------------------<br>
    static int rockchip_dp_phy_probe(struct platform_device *pdev)<br>
    =A0{<br>
    =A0=A0=A0=A0=A0=A0=A0 struct device *dev =3D &amp;pdev-&gt;dev;<br>
    +=A0=A0=A0=A0=A0=A0 struct device_node *np =3D dev-&gt;of_node;<br>
    =A0=A0=A0=A0=A0=A0=A0 struct phy_provider *phy_provider;<br>
    =A0=A0=A0=A0=A0=A0=A0 struct rockchip_dp_phy *dp;<br>
    =A0=A0=A0=A0=A0=A0=A0 struct resource *res;<br>
    @@ -146,15 +112,31 @@ static int rockchip_dp_phy_probe(struct
    platform_device *pdev)<br>
    =A0=A0=A0=A0=A0=A0=A0 if (IS_ERR(dp-&gt;regs))<br>
    =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return PTR_ERR(dp-&gt;r=
egs);<br>
    =A0<br>
    -=A0=A0=A0=A0=A0=A0 ret =3D rockchip_dp_phy_init(dp);<br>
    -=A0=A0=A0=A0=A0=A0 if (ret)<br>
    +=A0=A0=A0=A0=A0=A0 dp-&gt;phy_24m =3D devm_clk_get(dev, "24m");<br>
    +=A0=A0=A0=A0=A0=A0 if (IS_ERR(dp-&gt;phy_24m)) {<br>
    +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(dev, "cannot get =
clock 24m\n");<br>
    +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return PTR_ERR(dp-&gt;phy=
_24m);<br>
    +=A0=A0=A0=A0=A0=A0 }<br>
    +<br>
    +=A0=A0=A0=A0=A0=A0 dp-&gt;grf =3D syscon_regmap_lookup_by_phandle(np=
,
    "rockchip,grf");<br>
    +=A0=A0=A0=A0=A0=A0 if (IS_ERR(dp-&gt;grf)) {<br>
    +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(dev, "rk3288-dp n=
eeds rockchip,grf
    property\n");<br>
    +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return PTR_ERR(dp-&gt;grf=
);<br>
    +=A0=A0=A0=A0=A0=A0 }<br>
    +<br>
    +=A0=A0=A0=A0=A0=A0 ret =3D regmap_write(dp-&gt;grf, GRF_SOC_CON12,
    GRF_EDP_REF_CLK_SEL_INTER |<br>
    +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 (GRF_EDP_REF_CLK_SEL_INTER &lt;&lt; 16));<br>
    +=A0=A0=A0=A0=A0=A0 if (ret) {<br>
    +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(dp-&gt;dev, "Coul=
d not config GRF edp ref
    clk: %d\n", ret);<br>
    =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;<br>
    +=A0=A0=A0=A0=A0=A0 }<br>
    =A0<br>
    =A0=A0=A0=A0=A0=A0=A0 phy =3D devm_phy_create(dev, NULL, &amp;rockchi=
p_dp_phy_ops,
    NULL);<br>
    =A0=A0=A0=A0=A0=A0=A0 if (IS_ERR(phy)) {<br>
    =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(dev, "failed to=
 create phy\n");<br>
    =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return PTR_ERR(phy);<br=
>
    =A0=A0=A0=A0=A0=A0=A0 }<br>
    <br>
    <br>
    <blockquote cite=3D"mid:55D55A3E.8090905@ti.com" type=3D"cite">
      <pre wrap=3D"">
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">+
+	return 0;
+}
+
+static int rockchip_dp_phy_probe(struct platform_device *pdev)
+{
+	struct device *dev =3D &amp;pdev-&gt;dev;
+	struct phy_provider *phy_provider;
+	struct rockchip_dp_phy *dp;
+	struct resource *res;
+	struct phy *phy;
+	int ret;
+
+	dp =3D devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
+	if (IS_ERR(dp))
+		return -ENOMEM;
+
+	dp-&gt;dev =3D dev;
+
+	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	dp-&gt;regs =3D devm_ioremap_resource(dev, res);
+	if (IS_ERR(dp-&gt;regs))
+		return PTR_ERR(dp-&gt;regs);
+
+	ret =3D rockchip_dp_phy_init(dp);
+	if (ret)
+		return ret;
+
+	phy =3D devm_phy_create(dev, NULL, &amp;rockchip_dp_phy_ops, NULL);
+	if (IS_ERR(phy)) {
+		dev_err(dev, "failed to create phy\n");
+		return PTR_ERR(phy);
+	}
+	phy_set_drvdata(phy, dp);
+
+	phy_provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate=
);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct of_device_id rockchip_dp_phy_dt_ids[] =3D {
+	{ .compatible =3D "rockchip,rk3288-dp-phy" },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, rockchip_dp_phy_dt_ids);
+
+static struct platform_driver rockchip_dp_phy_driver =3D {
+	.probe		=3D rockchip_dp_phy_probe,
+	.driver		=3D {
+		.name	=3D "rockchip-dp-phy",
+		.owner	=3D THIS_MODULE,
</pre>
      </blockquote>
      <pre wrap=3D"">
owner is not required here.

Thanks
Kishon



</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------030602030902040002010505--


--===============0618583954==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0618583954==--

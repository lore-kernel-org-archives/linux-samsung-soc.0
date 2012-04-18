From: Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/3] i2c-s3c2410: Add HDMIPHY quirk for S3C2440
Date: Wed, 18 Apr 2012 18:31:28 +0200
Message-ID: <4F8EEC60.2080603@samsung.com>
References: <1332357113-2973-1-git-send-email-k.lewandowsk@samsung.com>
 <1332357113-2973-4-git-send-email-k.lewandowsk@samsung.com>
 <20120417174029.GC22406@pengutronix.de>
 <00dd01cd1d5c$57ce7f80$076b7e80$%szyprowski@samsung.com>
 <20120418134644.GB19220@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20120418134644.GB19220-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomasz Stanislawski <t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 18.04.2012 15:46, Wolfram Sang wrote:

> 
>>>>  Optional properties:
>>>> +  - gpios: The order of the gpios should be the following: <SDA, SCL>.
>>>> +    The gpio specifier depends on the gpio controller. Required in all cases
>>>> +    except when "samsung,i2c-no-gpio" is also specified.
>>>> +  - samsung,i2c-no-gpio: input/output lines of the controller are
>>>> +    permanently wired to the respective client, there are no gpio
>>>> +    lines that need to be configured to enable this controller
>>>
>>> Can't we just skip this property...
>>
>> All standard s3c-24x0 i2c controllers require gpio lines for proper operation,
>> so lack of the gpios property should be considered as an error. However there
>> is a special case of internal, embedded i2c controller which has no such gpio 
>> lines at all.
>>
>>>>    - samsung,i2c-slave-addr: Slave address in multi-master enviroment. If not
>>>>      specified, default value is 0.
>>>>    - samsung,i2c-max-bus-freq: Desired frequency in Hz of the bus. If not
>>>>      specified, the default value in Hz is 100000.
>>>> +  - samsung,i2c-quirk-hdmiphy: Quirk for HDMI PHY block found on
>>>> +    Exynos4 platform - reduce timeout and reset controller after each
>>>> +    transfer
>>>
>>> ... and this one, if we declare a new compatible-entry for exynos4?
>>
>> It is not strictly related to Exynos4 SoCs. Exynos4 SoC has 8 standard s3c2440 style
>> i2c controllers and one additional, internal controller for HDMIPHY, which needs 
>> some workarounds in the driver. Maybe the quirk should be named 'broken timeout 
>> detection'
> 
> I was wondering since you do what I suggested for platform devices already:
> 
> +               .name           = "s3c2440-hdmiphy-i2c",
> +               .driver_data    = QUIRK_S3C2440 | QUIRK_HDMIPHY | QUIRK_NO_GPIO,


Here I've done it this way for compatibility with legacy driver and
board(s).

Device tree is new interface, and I thought that it would be better
to describe things explicitly and separately from device type.

Right now these properties are used only on S3C2440, but I don't
consider it highly unlikely to see these on S3C**** in future.

Tomasz had similar doubts when I've posted patch that checked these
quirks only for S3C2440:

  http://permalink.gmane.org/gmane.linux.drivers.i2c/10305

Thus, I've chosen properties and not separate type.

It's easy to introduce compat string (see below), but given above
I'm afraid that we might end up adding -hdmiphy- variant for every
new version of i2c controller.


  E.g.

diff --git a/Documentation/devicetree/bindings/i2c/samsung-i2c.txt b/Documentation/devicetree/bindings/i2c/samsung-i2c.txt
index c6670f9..b1d106e 100644
--- a/Documentation/devicetree/bindings/i2c/samsung-i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/samsung-i2c.txt
@@ -6,6 +6,8 @@ Required properties:
   - compatible: value should be either of the following.
       (a) "samsung, s3c2410-i2c", for i2c compatible with s3c2410 i2c.
       (b) "samsung, s3c2440-i2c", for i2c compatible with s3c2440 i2c.
+      (c) "samsung, s3c2440-hdmiphy-i2c", for s3c2440-like i2c used
+          inside HDMIPHY block found on several samsung SoCs
   - reg: physical base address of the controller and length of memory mapped
     region.
   - interrupts: interrupt number to the cpu.
@@ -13,18 +15,13 @@ Required properties:
 
 Optional properties:
   - gpios: The order of the gpios should be the following: <SDA, SCL>.
-    The gpio specifier depends on the gpio controller. Required in all cases
-    except when "samsung,i2c-no-gpio" is also specified.
-  - samsung,i2c-no-gpio: input/output lines of the controller are
-    permanently wired to the respective client, there are no gpio
-    lines that need to be configured to enable this controller
+    The gpio specifier depends on the gpio controller. Required in all
+    cases except for "samsung,i2c-hdmiphy-i2c" whose input/output
+    lines are permanently wired to the respective client
   - samsung,i2c-slave-addr: Slave address in multi-master enviroment. If not
     specified, default value is 0.
   - samsung,i2c-max-bus-freq: Desired frequency in Hz of the bus. If not
     specified, the default value in Hz is 100000.
-  - samsung,i2c-quirk-hdmiphy: Quirk for HDMI PHY block found on
-    Exynos4 platform - reduce timeout and reset controller after each
-    transfer
 
 Example:
 
diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 71438eb..bc82045 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -106,6 +106,8 @@ MODULE_DEVICE_TABLE(platform, s3c24xx_driver_ids);
 static const struct of_device_id s3c24xx_i2c_match[] = {
        { .compatible = "samsung,s3c2410-i2c", .data = (void *)0 },
        { .compatible = "samsung,s3c2440-i2c", .data = (void *)QUIRK_S3C2440 },
+       { .compatible = "samsung,s3c2440-hdmiphy-i2c",
+         .data = (void *)(QUIRK_S3C2440 | QUIRK_HDMIPHY | QUIRK_NO_GPIO) },
        {},
 };
 MODULE_DEVICE_TABLE(of, s3c24xx_i2c_match);
@@ -902,12 +904,6 @@ s3c24xx_i2c_parse_dt(struct device_node *np, struct s3c24xx_i2c *i2c)
 
        pdata->bus_num = -1; /* i2c bus number is dynamically assigned */
 
-       if (of_get_property(np, "samsung,i2c-quirk-hdmiphy", NULL))
-               i2c->quirks |= QUIRK_HDMIPHY;
-
-       if (of_get_property(np, "samsung,i2c-no-gpio", NULL))
-               i2c->quirks |= QUIRK_NO_GPIO;
-
        of_property_read_u32(np, "samsung,i2c-sda-delay", &pdata->sda_delay);
        of_property_read_u32(np, "samsung,i2c-slave-addr", &pdata->slave_addr);
        of_property_read_u32(np, "samsung,i2c-max-bus-freq",


Regards,
-- 
Karol Lewandowski | Samsung Poland R&D Center | Linux/Platform

From: Donggeun Kim <dg77.kim@samsung.com>
Subject: Re: [lm-sensors] [RFC PATCH 2/3] thermal: exynos4: Register the tmu
 sensor with the thermal interface layer
Date: Thu, 05 Jan 2012 14:57:35 +0900
Message-ID: <4F053BCF.7030600@samsung.com>
References: <1324468798-20423-1-git-send-email-amit.kachhap@linaro.org>
 <1324468798-20423-3-git-send-email-amit.kachhap@linaro.org>
 <1325629553.26706.11.camel@groeck-laptop>
 <CAK44p20XeLVkJyox2SsDqyy=RYgEQNpyGGypwTMPXpueQT1T3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-acpi-owner@vger.kernel.org>
In-reply-to: <CAK44p20XeLVkJyox2SsDqyy=RYgEQNpyGGypwTMPXpueQT1T3g@mail.gmail.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Amit Kachhap <amit.kachhap@linaro.org>
Cc: guenter.roeck@ericsson.com, "linux-pm@lists.linux-foundation.org" <linux-pm@lists.linux-foundation.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linaro-dev@lists.linaro.org" <linaro-dev@lists.linaro.org>, "patches@linaro.org" <patches@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "lm-sensors@lm-sensors.org" <lm-sensors@lm-sensors.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "lenb@kernel.org" <lenb@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Actually, the TMU driver is closely related to thermal layer.
I think it's okay to move it to the thermal.

Thanks.
-Donggeun

On 2012=EB=85=84 01=EC=9B=94 04=EC=9D=BC 19:14, Amit Kachhap wrote:
> Hi Guenter,
>=20
> The main idea of this work is to leave the current userspace based
> notification scheme and add the kernel based cooling scheme on top of
> it. Anyway, It is a good idea to move the file hwmon/exynos4_tmu.c as
> this creates 2 hwmon entries.
> Adding CC: Donggeun Kim to know his opinion.
>=20
> Thanks,
> Amit Daniel
>=20
> On 4 January 2012 03:55, Guenter Roeck <guenter.roeck@ericsson.com> w=
rote:
>> On Wed, 2011-12-21 at 06:59 -0500, Amit Daniel Kachhap wrote:
>>> Export and register information from the hwmon tmu sensor to the sa=
msung
>>> exynos kernel thermal framework where different cooling devices and=
 thermal
>>> zone are binded. The exported information is based according to the=
 data
>>> structure thermal_sensor_conf present in exynos_thermal.h. HWMON sy=
sfs
>>> functions are currently left although all of them are present in ge=
neric
>>> linux thermal layer.
>>> Also the platform data structure is modified to pass frequency cool=
ing
>>> in percentages for each thermal level.
>>>
>> Hi Amit,
>>
>> wouldn't it make more sense to merge the code as necessary from
>> hwmon/exynos4_tmu.c into the new thermal/exynos_thermal.c, and drop
>> hwmon/exynos4_tmu.c entirely ?
>>
>> With that, you should get the hwmon entries for free, and we would n=
ot
>> have to maintain two drivers with overlapping functionality.
>>
>> Thanks,
>> Guenter
>>
>>> Signed-off-by: Amit Daniel Kachhap <amit.kachhap@linaro.org>
>>> ---
>>>  drivers/hwmon/exynos4_tmu.c               |   34 +++++++++++++++++=
+++++++++--
>>>  include/linux/platform_data/exynos4_tmu.h |    7 ++++++
>>>  2 files changed, 38 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/exynos4_tmu.c b/drivers/hwmon/exynos4_tm=
u.c
>>> index f2359a0..6912a7f 100644
>>> --- a/drivers/hwmon/exynos4_tmu.c
>>> +++ b/drivers/hwmon/exynos4_tmu.c
>>> @@ -37,6 +37,9 @@
>>>  #include <linux/hwmon-sysfs.h>
>>>
>>>  #include <linux/platform_data/exynos4_tmu.h>
>>> +#ifdef CONFIG_SAMSUNG_THERMAL_INTERFACE
>>> +#include <linux/exynos_thermal.h>
>>> +#endif
>>>
>>>  #define EXYNOS4_TMU_REG_TRIMINFO     0x0
>>>  #define EXYNOS4_TMU_REG_CONTROL              0x20
>>> @@ -248,10 +251,13 @@ static void exynos4_tmu_work(struct work_stru=
ct *work)
>>>
>>>       kobject_uevent(&data->hwmon_dev->kobj, KOBJ_CHANGE);
>>>
>>> -     enable_irq(data->irq);
>>>
>>>       clk_disable(data->clk);
>>>       mutex_unlock(&data->lock);
>>> +#ifdef CONFIG_SAMSUNG_THERMAL_INTERFACE
>>> +     exynos4_report_trigger();
>>> +#endif
>>> +     enable_irq(data->irq);
>>>  }
>>>
>>>  static irqreturn_t exynos4_tmu_irq(int irq, void *id)
>>> @@ -345,6 +351,14 @@ static const struct attribute_group exynos4_tm=
u_attr_group =3D {
>>>       .attrs =3D exynos4_tmu_attributes,
>>>  };
>>>
>>> +#ifdef CONFIG_SAMSUNG_THERMAL_INTERFACE
>>> +static struct thermal_sensor_conf exynos4_sensor_conf =3D {
>>> +     .name                   =3D "exynos4-therm",
>>> +     .read_temperature       =3D (int (*)(void *))exynos4_tmu_read=
,
>>> +};
>>> +#endif
>>> +/*CONFIG_SAMSUNG_THERMAL_INTERFACE*/
>>> +
>>>  static int __devinit exynos4_tmu_probe(struct platform_device *pde=
v)
>>>  {
>>>       struct exynos4_tmu_data *data;
>>> @@ -432,9 +446,20 @@ static int __devinit exynos4_tmu_probe(struct =
platform_device *pdev)
>>>       }
>>>
>>>       exynos4_tmu_control(pdev, true);
>>> -
>>> +#ifdef CONFIG_SAMSUNG_THERMAL_INTERFACE
>>> +     (&exynos4_sensor_conf)->private_data =3D data;
>>> +     (&exynos4_sensor_conf)->sensor_data =3D pdata;
>>> +     ret =3D exynos4_register_thermal(&exynos4_sensor_conf);
>>> +     if (ret) {
>>> +             dev_err(&pdev->dev, "Failed to register thermal inter=
face\n");
>>> +             goto err_hwmon_device;
>>> +     }
>>> +#endif
>>>       return 0;
>>> -
>>> +#ifdef CONFIG_SAMSUNG_THERMAL_INTERFACE
>>> +err_hwmon_device:
>>> +     hwmon_device_unregister(data->hwmon_dev);
>>> +#endif
>>>  err_create_group:
>>>       sysfs_remove_group(&pdev->dev.kobj, &exynos4_tmu_attr_group);
>>>  err_clk:
>>> @@ -458,6 +483,9 @@ static int __devexit exynos4_tmu_remove(struct =
platform_device *pdev)
>>>
>>>       exynos4_tmu_control(pdev, false);
>>>
>>> +#ifdef CONFIG_SAMSUNG_THERMAL_INTERFACE
>>> +     exynos4_unregister_thermal();
>>> +#endif
>>>       hwmon_device_unregister(data->hwmon_dev);
>>>       sysfs_remove_group(&pdev->dev.kobj, &exynos4_tmu_attr_group);
>>>
>>> diff --git a/include/linux/platform_data/exynos4_tmu.h b/include/li=
nux/platform_data/exynos4_tmu.h
>>> index 39e038c..642c508 100644
>>> --- a/include/linux/platform_data/exynos4_tmu.h
>>> +++ b/include/linux/platform_data/exynos4_tmu.h
>>> @@ -21,6 +21,7 @@
>>>
>>>  #ifndef _LINUX_EXYNOS4_TMU_H
>>>  #define _LINUX_EXYNOS4_TMU_H
>>> +#include <linux/cpu_cooling.h>
>>>
>>>  enum calibration_type {
>>>       TYPE_ONE_POINT_TRIMMING,
>>> @@ -64,6 +65,9 @@ enum calibration_type {
>>>   *   in the positive-TC generator block
>>>   *   0 <=3D reference_voltage <=3D 31
>>>   * @cal_type: calibration type for temperature
>>> + * @freq_pctg_table: Table representing frequency reduction percen=
tage.
>>> + * @freq_tab_count: Count of the above table as frequency reductio=
n may
>>> + *   applicable to only some of the trigger levels.
>>>   *
>>>   * This structure is required for configuration of exynos4_tmu dri=
ver.
>>>   */
>>> @@ -79,5 +83,8 @@ struct exynos4_tmu_platform_data {
>>>       u8 reference_voltage;
>>>
>>>       enum calibration_type cal_type;
>>> +
>>> +     struct freq_pctg_table freq_tab[4];
>>> +     unsigned int freq_tab_count;
>>>  };
>>>  #endif /* _LINUX_EXYNOS4_TMU_H */
>>
>>
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-acpi" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

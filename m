From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH v3 1/3] phy: Add exynos-simple-phy driver
Date: Thu, 15 May 2014 19:15:57 +0530
Message-ID: <CAPdUM4PYtWW_EjGTDmuWe9gGbwugCSBJ2XzQ7Pf4zsyx_QE14Q@mail.gmail.com>
References: <1400095043-685-1-git-send-email-rahul.sharma@samsung.com>
 <1400095043-685-2-git-send-email-rahul.sharma@samsung.com>
 <1584926.JkD1mqdaNu@amdc1032>
 <CAPdUM4O2Qpf+XmtRoXNVfSBODKJqtG9uUfAJpt-zvDwBwh05oQ@mail.gmail.com>
 <5374C40F.3090402@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5374C40F.3090402@ti.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Tomasz Stanislawski <t.stanislaws@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, sunil joshi <joshi@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Grant Likely <grant.likely@linaro.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 15 May 2014 19:11, Kishon Vijay Abraham I <kishon@ti.com> wrote:
>
>
> On Thursday 15 May 2014 07:05 PM, Rahul Sharma wrote:
>> Hi,
>>
>> On 15 May 2014 19:01, Bartlomiej Zolnierkiewicz
>> <b.zolnierkie@samsung.com> wrote:
>>>
>>> Hi,
>>>
>>> On Thursday, May 15, 2014 12:47:21 AM Rahul Sharma wrote:
>>>> From: Tomasz Stanislawski <t.stanislaws@samsung.com>
>>>>
>>>> Add exynos-simple-phy driver to support a single register
>>>> PHY interfaces present on Exynos4 SoC.
>>>>
>>>> Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
>>>> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
>>>>
>>>> ---
>>>>  .../devicetree/bindings/phy/samsung-phy.txt        |   56 ++++++
>>>>  drivers/phy/Kconfig                                |    5 +
>>>>  drivers/phy/Makefile                               |    1 +
>>>>  drivers/phy/exynos-simple-phy.c                    |  189 ++++++++++++++++++++
>>>>  include/dt-bindings/phy/exynos-simple-phy.h        |   27 +++
>>>>  5 files changed, 278 insertions(+)
>>>>  create mode 100644 drivers/phy/exynos-simple-phy.c
>>>>  create mode 100644 include/dt-bindings/phy/exynos-simple-phy.h
>>>
>>> [...]
>>>
>>>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
>>>> index 16a2f06..2a13e0d 100644
>>>> --- a/drivers/phy/Kconfig
>>>> +++ b/drivers/phy/Kconfig
>>>> @@ -178,4 +178,9 @@ config PHY_XGENE
>>>>       help
>>>>         This option enables support for APM X-Gene SoC multi-purpose PHY.
>>>>
>>>> +config EXYNOS_SIMPLE_PHY
>>>> +     tristate "Exynos Simple PHY driver"
>>>
>>> Please limit this driver to EXYNOS platforms with:
>>>
>>>         depends on ARCH_EXYNOS
>>>
>>> or (optionally)
>>>
>>>         depends on ARCH_EXYNOS || COMPILE_TEST
>>>
>>> Moreover the generic PHY dependency is missing.  It can be fixed with:
>>>
>>>         select GENERIC_PHY
>>>
>>
>> Yea, I will fix this part.
>
> While at that, change the header of the driver file to *2014*
>
Sure.

Thanks,
Rahul Sharma.

> Thanks
> Kishon
>>
>> Regards,
>> Rahul Sharma.
>>
>>>> +     help
>>>> +       Support for 1-bit PHY controllers on SoCs from Exynos family.
>>>> +
>>>>  endmenu
>>>
>>> Best regards,
>>> --
>>> Bartlomiej Zolnierkiewicz
>>> Samsung R&D Institute Poland
>>> Samsung Electronics
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

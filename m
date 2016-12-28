From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [RFC PATCH 1/6] phy: exynos-pcie: Add support for Exynos PCIe phy
Date: Wed, 28 Dec 2016 15:42:15 +0530
Message-ID: <CAFp+6iFSfC97g2NsW9NZtxgxxbXW5vwbtk=6kMUiQZcY4J0-1Q@mail.gmail.com>
References: <CGME20161226052030epcas5p4ea673fc4ee5c0b2664e80f53d4758553@epcas5p4.samsung.com>
 <20161226052029.10552-1-jh80.chung@samsung.com> <20161226052029.10552-2-jh80.chung@samsung.com>
 <CAFp+6iH0q9TNvPgv3_Nexm-vE6TBB_eQHXCwniO-Yn=fq+WWMg@mail.gmail.com>
 <21de9ca7-e586-e5c8-ecda-d30c18bb6e40@samsung.com> <CAFp+6iEOvdaRdvmz45ZVpqPrdSmeKk9je0bHg9FtNg8hE8YUxg@mail.gmail.com>
 <ebdb57b1-9a24-f83e-ac26-887f7a2263d3@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ebdb57b1-9a24-f83e-ac26-887f7a2263d3-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, robh+dt <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, kishon <kishon-l0cyMroinI0@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, catalin.marinas-5wv7dgnIgG8@public.gmane.org, CPGS <cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Dec 28, 2016 at 3:05 PM, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Hi Vivek,
>
> On 12/28/2016 05:58 PM, Vivek Gautam wrote:
>> Hi Jaehoon,
>>
>> On Wed, Dec 28, 2016 at 8:19 AM, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>> Hi Vivek,
>>>
>>> On 12/27/2016 02:53 PM, Vivek Gautam wrote:
>>>> Hi Jaehoon,
>>>>
>>>>
>>>> On Mon, Dec 26, 2016 at 10:50 AM, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>>>> This patch supports to use Generic Phy framework for Exynos PCIe phy.
>>>>> When Exynos that supported the pcie want to use the PCIe,
>>>>> it needs to control the phy resgister.
>>>>> But it should be more complex to control in their own PCIe device drivers.
>>>>>
>>>>> Signed-off-by: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>>>> ---
>>>>>  drivers/phy/Kconfig           |   9 ++
>>>>>  drivers/phy/Makefile          |   1 +
>>>>>  drivers/phy/phy-exynos-pcie.c | 227 ++++++++++++++++++++++++++++++++++++++++++
>>>>>  3 files changed, 237 insertions(+)
>>>>>  create mode 100644 drivers/phy/phy-exynos-pcie.c
>>>>>
>>>>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
>>>>> index fe00f91..94b0433 100644
>>>>> --- a/drivers/phy/Kconfig
>>>>> +++ b/drivers/phy/Kconfig
>>>>> @@ -341,6 +341,15 @@ config PHY_EXYNOS5_USBDRD
>>>>>           This driver provides PHY interface for USB 3.0 DRD controller
>>>>>           present on Exynos5 SoC series.
>>>>>
>>>>> +config PHY_EXYNOS_PCIE
>>>>> +       bool "Exynos PCIe PHY driver"
>>>>
>>>> Is there a reason for this not being 'tristate' ?
>>>
>>> Will change.
>>
>> I notice that PCI_EXYNOS5433 is bool as well.
>> If the host has to be 'bool' then it makes sense to have phy
>> also bool as well. But if PCI_EXYNOS5433 can be made
>> tristate, then this also changes to tristate.
>
> Right. I understood what you said.
>
>>
>>>
>>>>
>>>>> +       depends on ARCH_EXYNOS && OF
>>>>> +       depends on PCI_EXYNOS5433
>>>>> +       select GENERIC_PHY
>>>>> +       help
>>>>> +         Enable PCIe PHY support for Exynos SoC series.
>>>>
>>>> If this driver is for Exynos5433, then same should come in this help
>>>> text as well.
>>>
>>> will support the other exynos series.
>>> I'm working on refactoring exynos5440 with PHY generic Framework.
>>> Then this drive is not for only Exnyos5433. how about?
>>
>> Ok, it's good then. My only concern is 'depends on PCI_EXYNOS5433'
>> makes it look like it is for EXYNOS5433. I am fine if that changes as well.
>
> I will not put PCI_EXYNOS5433, just will use the PCI_EXYNOS.
> Because it will be supported only one file as pci-exynos.c

cool then.

[...]

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

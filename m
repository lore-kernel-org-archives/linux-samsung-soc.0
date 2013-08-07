From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH V5] pci: exynos: split into two parts such as Synopsys
 part and Exynos part
Date: Wed, 7 Aug 2013 11:04:54 -0600
Message-ID: <CAErSpo4YuSEsUp6wyXEJyySvqUwOisdq7BURL-eVmzWL+qSgHw@mail.gmail.com>
References: <002501ce9324$8066f5a0$8134e0e0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <002501ce9324$8066f5a0$8134e0e0$@samsung.com>
Sender: linux-pci-owner@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Pratyush Anand <pratyush.anand@st.com>, Mohit KUMAR <Mohit.KUMAR@st.com>, Arnd Bergmann <arnd@arndb.de>, Sean Cross <xobs@kosagi.com>, Kishon Vijay Abraham I <kishon@ti.com>, Thierry Reding <thierry.reding@gmail.com>, SRIKANTH TUMKUR SHIVANAND <ts.srikanth@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Aug 6, 2013 at 10:13 PM, Jingoo Han <jg1.han@samsung.com> wrote:
> On Wednesday, July 31, 2013 5:14 PM, Jingoo Han <jg1.han@samsung.com> wrote:
>> Exynos PCIe IP consists of Synopsys specific part and Exynos
>> specific part. Only core block is a Synopsys designware part;
>> other parts are Exynos specific.
>> Also, the Synopsys designware part can be shared with other
>> platforms; thus, it can be split two parts such as Synopsys
>> designware part and Exynos specific part.
>>
>> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
>> Cc: Pratyush Anand <pratyush.anand@st.com>
>> Cc: Mohit KUMAR <Mohit.KUMAR@st.com>
>
> Hi Bjorn Helgaas,
>
> There is no comment for last 2 weeks.
> Will you accept this patch?

I don't have any problem with this, since it's really arch code.  Do
you want me to merge it, or do you have a standard path for merging
Exynos and/or Designware changes?

Bjorn

In case you need it:

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

>> ---
>> Changes since v4:
>> - fixed section mismatch warnings
>> - fixed sparse warnings
>>
>>  .../devicetree/bindings/pci/designware-pcie.txt    |    3 +
>>  arch/arm/boot/dts/exynos5440.dtsi                  |    2 +
>>  drivers/pci/host/Makefile                          |    3 +-
>>  drivers/pci/host/pci-exynos.c                      |  530 ++++++++++
>>  drivers/pci/host/pcie-designware.c                 | 1011 ++++++--------------
>>  drivers/pci/host/pcie-designware.h                 |   65 ++
>>  6 files changed, 874 insertions(+), 740 deletions(-)
>>  create mode 100644 drivers/pci/host/pci-exynos.c
>>  create mode 100644 drivers/pci/host/pcie-designware.h
>
>

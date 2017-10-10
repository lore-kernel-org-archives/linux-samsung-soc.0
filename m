From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH] PCI: exynos: remove redundant code in
 exynos_pcie_establish_link
Date: Tue, 10 Oct 2017 19:11:00 +0530
Message-ID: <fce4fba6-62ad-c718-2496-b7efe27dec80@samsung.com>
References: <CGME20171009141438epcas2p4ead7e2f2d1af7e0950f2c026e3a9943b@epcas2p4.samsung.com>
        <1507558478-3218-1-git-send-email-pankaj.dubey@samsung.com>
        <CAJKOXPeC=cS2cvAXHrKuK5F4tEqH6PppwYkxC+Z8+5D--48CAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:59402 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755866AbdJJNko (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Oct 2017 09:40:44 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20171010134042epoutp02aa889fabc7bac54f8e3f310c5645859e~sOS2DPiZH1135411354epoutp02k
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Oct 2017 13:40:42 +0000 (GMT)
In-Reply-To: <CAJKOXPeC=cS2cvAXHrKuK5F4tEqH6PppwYkxC+Z8+5D--48CAg@mail.gmail.com>
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: inux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Anvesh Salveru <anvesh.s@samsung.com>



On 10/09/2017 08:13 PM, Krzysztof Kozlowski wrote:
> On Mon, Oct 9, 2017 at 4:14 PM, Pankaj Dubey <pankaj.dubey@samsung.com> wrote:
>> From: Anvesh Salveru <anvesh.s@samsung.com>
>>
>> In exynos_pcie_establish_link if driver is not using generic phy,
>> we are resetting PHY twice, which is redundant, so this patch removes
> Hi Pankaj,
>
> This lacks the information why it is redundant.
Sure. Ok probably commit message should have been covered more information.

I can see this patch tries to fix redundancy added by patch [1]:

[1] e7cd7ef58e1f "PCI: exynos: Support the PHY generic framework"

Before adding support for the generic PHY, exynos5440 was doing PHY 
reset via

/* pulse for common reset */
exynos_pcie_writel(ep->mem_res->block_base, 1, PCIE_PHY_COMMON_RESET);
udelay(500);
exynos_pcie_writel(ep->mem_res->block_base, 0, PCIE_PHY_COMMON_RESET);

But when Jaehoon introduced generic PHY support, above two lines have been
copied in else part (else case covers: if platform does not uses generic 
PHY),
so eventually we will end-up doing PHY reset twice.

For more clarity copy pasting part of above patch:

------------------------------------
      exynos_pcie_assert_core_reset(ep);
-    exynos_pcie_assert_phy_reset(ep);
-    exynos_pcie_deassert_phy_reset(ep);
-    exynos_pcie_power_on_phy(ep);
-    exynos_pcie_init_phy(ep);
+
+    if (ep->using_phy) {
+        phy_reset(ep->phy);
+
+        exynos_pcie_writel(ep->mem_res->elbi_base, 1,
+                PCIE_PWR_RESET);
+
+        phy_power_on(ep->phy);
+        phy_init(ep->phy);
+    } else {
+        exynos_pcie_assert_phy_reset(ep);
+        exynos_pcie_deassert_phy_reset(ep);
+        exynos_pcie_power_on_phy(ep);
+        exynos_pcie_init_phy(ep);
+
+        /* pulse for common reset */
+        exynos_pcie_writel(ep->mem_res->block_base, 1,
+                    PCIE_PHY_COMMON_RESET);
+        udelay(500);
+        exynos_pcie_writel(ep->mem_res->block_base, 0,
+                    PCIE_PHY_COMMON_RESET);
+    }

      /* pulse for common reset */
      exynos_pcie_writel(ep->mem_res->block_base, 1, 
PCIE_PHY_COMMON_RESET);
      udelay(500);
      exynos_pcie_writel(ep->mem_res->block_base, 0, PCIE_PHY_COMMON_RESET);
  -----------------------------------------------

So if you see, eventually now we will end up doing common reset twice in 
case
platform not using generic PHY (once in else part and immediately after 
else).

We have submitted this patch without verifying on actual Exynos5440 board,
as currently we do not have access to this board.

But I feel in the original patch this flow has been changed, that too 
probably without verifying
on Exynos5440 board (Probably as I came across Exynos5433 PCIe patch of 
Jaehoon where
he mentioned he also do not have access to Exynos5440 board).

So this patch removes that double reset of PHY and makes the code flow 
as it was originally,
before introduction of generic PHY.


Thanks,
Pankaj Dubey
>> repeated lines of code for PHY reset.
>>
>> Signed-off-by: Anvesh Salveru <anvesh.s@samsung.com>
> Your Signed-off-by is needed here.
I missed it, will add in v2.
>
> Best regards,
> Krzysztof
>
>> ---
>>   drivers/pci/dwc/pci-exynos.c | 7 -------
>>   1 file changed, 7 deletions(-)
>>
>> diff --git a/drivers/pci/dwc/pci-exynos.c b/drivers/pci/dwc/pci-exynos.c
>> index 5596fde..85d2f4b 100644
>> --- a/drivers/pci/dwc/pci-exynos.c
>> +++ b/drivers/pci/dwc/pci-exynos.c
>> @@ -423,13 +423,6 @@ static int exynos_pcie_establish_link(struct exynos_pcie *ep)
>>                  exynos_pcie_deassert_phy_reset(ep);
>>                  exynos_pcie_power_on_phy(ep);
>>                  exynos_pcie_init_phy(ep);
>> -
>> -               /* pulse for common reset */
>> -               exynos_pcie_writel(ep->mem_res->block_base, 1,
>> -                                       PCIE_PHY_COMMON_RESET);
>> -               udelay(500);
>> -               exynos_pcie_writel(ep->mem_res->block_base, 0,
>> -                                       PCIE_PHY_COMMON_RESET);
>>          }
>>
>>          /* pulse for common reset */
>> --
>> 2.7.4
>>
>
>

From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH V3] pci: exynos: split into two parts such as Synopsys
 part and Exynos part
Date: Thu, 26 Sep 2013 15:42:27 +0530
Message-ID: <5244088B.20807@ti.com>
References: <000701ce8741$fe47deb0$fad79c10$@samsung.com> <201309242323.55323.arnd@arndb.de> <5243C0E5.7020508@ti.com> <201309261151.42034.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201309261151.42034.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Bjorn Helgaas' <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, 'Kukjin Kim' <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mohit KUMAR DCG <Mohit.KUMAR-qxv4g6HH51o@public.gmane.org>, 'Sean Cross' <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>, 'Thierry Reding' <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'SRIKANTH TUMKUR SHIVANAND' <ts.srikanth-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Arnd,

On Thursday 26 September 2013 03:21 PM, Arnd Bergmann wrote:
> On Thursday 26 September 2013, Kishon Vijay Abraham I wrote:
>> On Wednesday 25 September 2013 02:53 AM, Arnd Bergmann wrote:
>>> On Monday 23 September 2013, Kishon Vijay Abraham I wrote:
>>>> Btw if we hadn't programmed inbound translation table, the address will go
>>>> untranslated (according to the data book). I guess that's how it was working
>>>> for Jingoo Han.
>>>>
>>>> **
>>>> 3.10.4
>>>> Inbound iATU Operation
>>>>
>>>> When there is no match, then the address is untranslated
>>>> **
>>>>
>>>
>>> Well, that should work just as well, since you have a 1:1 translation anyway.
>>> Do you get the same error without the translation?
>>
>> Yes. I get the same non-fatal error interrupt in RC.
> 
> Ok, then I guess the translation is actually not at fault here but something
> else. I would recommend looking at the IOMMU as the potential culprit. Maybe
> having it disabled means that no DMA is going through, rather than all DMA
> going through untranslated. Another possibility is that the IOMMU is set up
> so that when disabled, it maps DMA address 0 to the start of RAM, rather
> than identity mapping DMA address 0x80000000 there. If that's the case,
> you either have to use the IOMMU, or set up the mapping in the root
> complex to revert it.

Thanks for your inputs. I'll check if that's the problem.

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v6 5/5] arm: exynos: Add MCPM call-back functions
Date: Tue, 13 May 2014 23:34:16 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1405132328030.980@knanqh.ubzr>
References: <1399982324-27879-1-git-send-email-a.kesavan@samsung.com> <1399982324-27879-6-git-send-email-a.kesavan@samsung.com> <20140513164845.GA10210@red-moon> <CAM4voamY+nM3eoJWfR=0VBDtbf6wan-2awRaALN=ym9gGC_DYg@mail.gmail.com>
 <CANuQgHES4O=mWjVVY5=6KwSee-TzL8HdTFhfr-VGu=d9GS-ZWQ@mail.gmail.com> <alpine.LFD.2.11.1405132301360.980@knanqh.ubzr> <CANuQgHFPUhcB+GmjqixajMPguDCuiWzHNZ00RUQSg6YaJdnz_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f172.google.com ([209.85.216.172]:46487 "EHLO
	mail-qc0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752874AbaENDea (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 May 2014 23:34:30 -0400
Received: by mail-qc0-f172.google.com with SMTP id l6so1826304qcy.17
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2014 20:34:30 -0700 (PDT)
In-Reply-To: <CANuQgHFPUhcB+GmjqixajMPguDCuiWzHNZ00RUQSg6YaJdnz_A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chander Kashyap <chander.kashyap@linaro.org>
Cc: Abhilash Kesavan <kesavan.abhilash@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "abrestic@chromium.org" <abrestic@chromium.org>, "thomas.ab@samsung.com" <thomas.ab@samsung.com>, "inderpal.s@samsung.com" <inderpal.s@samsung.com>, Dave P Martin <Dave.Martin@arm.com>, "t.figa@samsung.com" <t.figa@samsung.com>

On Wed, 14 May 2014, Chander Kashyap wrote:
> On 14 May 2014 08:32, Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
> > On Wed, 14 May 2014, Chander Kashyap wrote:
> >> On 14 May 2014 08:14, Abhilash Kesavan <kesavan.abhilash@gmail.com> wrote:
> >> > On Tue, May 13, 2014 at 10:18 PM, Lorenzo Pieralisi
> >> > <lorenzo.pieralisi@arm.com> wrote:
> >> >> On Tue, May 13, 2014 at 12:58:44PM +0100, Abhilash Kesavan wrote:
> >> >>
> >> >>> +       /*
> >> >>> +        * Future entries into the kernel can now go
> >> >>> +        * through the cluster entry vectors.
> >> >>> +        */
> >> >>> +       __raw_writel(virt_to_phys(mcpm_entry_point),
> >> >>> +                       ns_sram_base_addr + MCPM_BOOT_ADDR_OFFSET);
> >> >>> +
> >> >>
> >> >> ns_sram_base_addr must be unmapped, since it is unused after the write.
> >> > Will unmap.
> >>
> >> This mapping is required in for cpuilde (suspend) to program
> >> mcpm_entry before going to suspend.
> >
> > Why?
> 
> This is required to program the mcpm_entry point address (resume
> address) after cpuidle exit/fail.

You should be using mcpm_set_entry_vector() for that.  Once 
mcpm_entry_point is set, it shouldn't need to be changed.


Nicolas

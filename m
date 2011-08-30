From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 0/6] Add device tree support for PL330 dma controller driver
Date: Tue, 30 Aug 2011 17:58:15 +0530
Message-ID: <CAJuYYwQCdWjEzAeO-Gm2GTKO3_ocSOx8sZeBQP-7Y=GbHf=5vQ@mail.gmail.com>
References: <1314348014-2481-1-git-send-email-thomas.abraham@linaro.org>
	<1314638947.1606.157.camel@vkoul-udesk3>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:39054 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751273Ab1H3M2P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Aug 2011 08:28:15 -0400
Received: by pzk37 with SMTP id 37so10231525pzk.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Aug 2011 05:28:15 -0700 (PDT)
In-Reply-To: <1314638947.1606.157.camel@vkoul-udesk3>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vinod Koul <vinod.koul@linux.intel.com>
Cc: devicetree-discuss@lists.ozlabs.org, boojin.kim@samsung.com, kgene.kim@samsung.com, patches@linaro.org, jassisinghbrar@gmail.com, grant.likely@secretlab.ca, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Vinod,

On 29 August 2011 22:59, Vinod Koul <vinod.koul@linux.intel.com> wrote:
> On Fri, 2011-08-26 at 14:10 +0530, Thomas Abraham wrote:
>> This patchset adds device tree support for PL330 driver and uses it
>> to add device tree support for Samsung platforms, specifically Exynos4.
> The DMA patches looks good to me. Do you want this to go thru slave-dma
> tree or somewhere else.
> I will need acks on 3, 5 and 6th patch to carry them.

There are couple of changes required in patch 4/6 of this series. I
will do that and resubmit.

Since these patches are based on Boojin's pl330 driver update patches,
it would be easier to take the same route which Boojin's patches will
take. I will try to get acks' for the patches that you have listed.

Thanks for your help.

Regards,
Thomas.

>
> --
> ~Vinod
>
>

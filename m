From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 4/6] DMA: PL330: Add device tree support
Date: Tue, 30 Aug 2011 17:51:17 +0530
Message-ID: <CAJuYYwR6_67d4h7dvF+67JnnEqhPyWrXqJ=tTE32wnzkNfabzQ@mail.gmail.com>
References: <1314348014-2481-1-git-send-email-thomas.abraham@linaro.org>
	<1314348014-2481-2-git-send-email-thomas.abraham@linaro.org>
	<1314348014-2481-3-git-send-email-thomas.abraham@linaro.org>
	<1314348014-2481-4-git-send-email-thomas.abraham@linaro.org>
	<1314348014-2481-5-git-send-email-thomas.abraham@linaro.org>
	<4E579C9B.7030807@gmail.com>
	<20110826142305.GA23469@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:50191 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751964Ab1H3MVR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Aug 2011 08:21:17 -0400
Received: by pzk37 with SMTP id 37so10222633pzk.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Aug 2011 05:21:17 -0700 (PDT)
In-Reply-To: <20110826142305.GA23469@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Rob Herring <robherring2@gmail.com>, boojin.kim@samsung.com, kgene.kim@samsung.com, patches@linaro.org, vinod.koul@intel.com, devicetree-discuss@lists.ozlabs.org, jassisinghbrar@gmail.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Russell,

On 26 August 2011 19:53, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
>
> On Fri, Aug 26, 2011 at 08:16:11AM -0500, Rob Herring wrote:
> > Thomas,
> >
> > On 08/26/2011 03:40 AM, Thomas Abraham wrote:
> > > + =A0- arm,pl330-peri-reqs: number of actual peripheral requests =
connected to the
> > > + =A0 =A0dma controller. Maximum value is 32.
> >
> > Perhaps could be a bitmask for sparsely populated requests. May not
> > matter since phandles will define the connections.
> >
> > Can be optional and not present means 00 requests (mem-to-mem only)=
=2E
>
> The number of peripheral requests is readable from configuration regi=
ster
> zero, so this is discoverable. =A0Why should we put this information =
into
> DT if its provided by the hardware?
>
> The number of DMA channels available is also configurable by the SoC
> designer, yet you don't specify that in DT. =A0And there's a whole bu=
nch
> of other configuration options available to the SoC designer, most of
> which are discoverable from the configuration registers.
>
> So, I don't think you should be specifying the number of requests.

Ok. The property specifying the number of peripheral requests will be d=
ropped.

Thanks,
Thomas.

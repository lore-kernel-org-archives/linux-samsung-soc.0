From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 11/14] arm64: dts: Add initial device tree support for
 EXYNOS7
Date: Wed, 27 Aug 2014 15:54:00 +0100
Message-ID: <20140827145359.GD13850@arm.com>
References: <1409132660-1898-1-git-send-email-ch.naveen@samsung.com>
 <1409132660-1898-3-git-send-email-ch.naveen@samsung.com>
 <20140827104231.GB7773@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fw-tnat.austin.arm.com ([217.140.110.23]:24741 "EHLO
	collaborate-mta1.arm.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S933630AbaH0Oyd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Aug 2014 10:54:33 -0400
Content-Disposition: inline
In-Reply-To: <20140827104231.GB7773@leverpostej>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, "naveenkrishna.ch@gmail.com" <naveenkrishna.ch@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "cpgs@samsung.com" <cpgs@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Rob Herring <robh@kernel.org>

On Wed, Aug 27, 2014 at 11:42:31AM +0100, Mark Rutland wrote:
> On Wed, Aug 27, 2014 at 10:44:18AM +0100, Naveen Krishna Chatradhi wrote:
> > +       cpus {
> > +               #address-cells = <2>;
> > +               #size-cells = <0>;
> > +
> > +               cpu@0 {
> > +                       device_type = "cpu";
> > +                       compatible = "arm,cortex-a57", "arm,armv8";
> > +                       reg = <0x0 0x0>;
> > +               };
> > +       };
> 
> Only UP?

I see what you meant. Maybe this is populated by firmware and that's
only an example.

-- 
Catalin

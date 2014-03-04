From: Javi Merino <javi.merino@arm.com>
Subject: Re: [REGRESSION] Arndale Octa panics when booting 3.14-rc1
Date: Tue, 4 Mar 2014 14:24:36 +0000
Message-ID: <20140304142435.GA15738@e102654-lin.cambridge.arm.com>
References: <20140303185755.GA11460@e102654-lin.cambridge.arm.com>
 <5314D239.7090001@gmail.com>
 <5314EBCB.3060400@gmail.com>
 <20140304101608.GA3852@e102654-lin.cambridge.arm.com>
 <5315AB3B.5080207@samsung.com>
 <20140304103936.GA10559@e102654-lin.cambridge.arm.com>
 <CAHbNUh2kbYUa1OegRrOXMAEmKRjsf4PifT6tZnKdBx7NoDkq6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:48195 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932159AbaCDOYm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Mar 2014 09:24:42 -0500
In-Reply-To: <CAHbNUh2kbYUa1OegRrOXMAEmKRjsf4PifT6tZnKdBx7NoDkq6A@mail.gmail.com>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sachin Kamat <sachin.kamat@linaro.org>, Chander Kashyap <chander.kashyap@linaro.org>

Hi Tushar,

On Tue, Mar 04, 2014 at 12:01:26PM +0000, Tushar Behera wrote:
> On 4 March 2014 16:09, Javi Merino <javi.merino@arm.com> wrote:
> > On Tue, Mar 04, 2014 at 10:30:19AM +0000, Sylwester Nawrocki wrote:
> >> On 04/03/14 11:16, Javi Merino wrote:
> >> > Yes, with [1] applied I don't get a kernel panic but the kernel fails
> >> > to boot later on with an Imprecise external abort.  Removing the mdma
> >> > nodes from the dts gets rid of that.  I guess what's missing is what
> >> > you said: clocks for the mdma devices.
> >>
> >> Is removing mdm0 node enough to fix the boot failure, or both have to be
> >> removed ?
> >
> > Actually, you it's only mdma1.  Just removing the mdma1 node from the
> > dt fixes the imprecise external abort.
> >
> 
> MDMA1 can support both secure and non-secure AXI transactions, the
> actual behaviour is controlled by trustzone software. It may be the
> case that MDMA1 is configured to be used in secure mode only, hence
> accessing it in non-secure mode is causing the oops.
> 
> Right now, the only solution looks like disabling this node in
> Arndale-Octa dts file.
> 
> --- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> +++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
> @@ -354,4 +354,16 @@
>                 samsung,i2s-controller = <&i2s0>;
>                 samsung,audio-codec = <&i2s_stub>;
>         };
> +
> +       amba {
> +               mdma1: mdma@11C10000 {
> +                       /*
> +                        * MDMA1 can support both secure and non-secure
> +                        * AXI transactions. When this is enabled in the kernel
> +                        * for boards that run in secure mode, we are getting
> +                        * imprecise external aborts causing the kernel to oops.
> +                        */
> +                       status = "disabled";
> +               };
> +       };
> 
> If it works, I will submit this patch.

It works.  Please submit it.  Cheers,
Javi

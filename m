From: Pavel Fedin <p.fedin@samsung.com>
Subject: RE: [PATCH v4 1/4] Documentation: dt-bindings: Describe SROMc
 configuration
Date: Mon, 02 Nov 2015 10:31:52 +0300
Message-ID: <012101d11540$8c280be0$a47823a0$@samsung.com>
References: <cover.1446122247.git.p.fedin@samsung.com>
 <f1fbd1a7877090f4318705f0fccbf4d96c0ebc9c.1446122247.git.p.fedin@samsung.com>
 <56330E6E.50003@samsung.com> <00d401d112ff$c426e9a0$4c74bce0$@samsung.com>
 <5635D1EE.5010604@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:58709 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752273AbbKBHb5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Nov 2015 02:31:57 -0500
In-reply-to: <5635D1EE.5010604@samsung.com>
Content-language: ru
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: k.kozlowski.k@gmail.com, 'Mark Rutland' <mark.rutland@arm.com>, 'Pawel Moll' <pawel.moll@arm.com>, 'Ian Campbell' <ijc+devicetree@hellion.org.uk>, 'Rob Herring' <robh+dt@kernel.org>, 'Kukjin Kim' <kgene@kernel.org>, 'Kumar Gala' <galak@codeaurora.org>

 Hello!

> > --- cut exynos5410.dtsi ---
> > 		sromc: sromc@12250000 {
> > 			#address-cells = <2>;
> > 			#size-cells = <1>;
> > 			ranges = <0 0 0x04000000 0x20000
> > 				  1 0 0x05000000 0x20000
> > 				  2 0 0x06000000 0x20000
> > 				  3 0 0x07000000 0x20000>;
> 
> Do you have to use 2 cells for address? Cannot it be:
>  			ranges = <0 0x04000000 0x20000
>  				  1 0x05000000 0x20000
>  				  2 0x06000000 0x20000
>  				  3 0x07000000 0x20000>;

 I tried this first, but it didn't work, and ranges translation
gave me something really weird (like addr = 0x80 and
size = 0x04000004). I decided not to dig deeply into
"ranges" processing, but just followed GPMC approach. They say
that first number is range ID and second number is offset within
the range. And it just worked.

> >  3. About samsung,srom-config array. I have the following reasons to keep if this way:
> >     - listing every property under own name is just too much typing
> >     - these values really do not make sense without each other, or partialy. I would say
> that in array form they are even better
> > readable, because it is the same order in which they go into the register.
> 
> For timings - OK. PMC is separate. This is not a timing.

 But it's srom-config, and not srom-timing anymore. So do you want
two properties like srom-timing + srom-page-mode (with vendor prefix
of course)?

> You need to document them. We are not gonna put some data looking like a
> vendor blob into the binding. I understand that document has
> confidential mark... all of Samsung datasheets I've seen had it. I don't
> find it as problem but of course I am not the one to judge here. If you
> do not feel comfortable publishing such data, get an approval from your
> manager. You can also try to search for this in vendor code
> (opensource.samsung.com). If it is published there, then this won't be a
> disclosure.

 I've seen the actual SROMc settings in some old Android kernels, like 3.0.4.
But they are not documented there, no comments, just #define's.
 Ok, i'll try to take a look how to minimize the actual information. :)

> BTW, your email client is weird. You are sending non-wrapped emails
> without format=flowed in Content-Type. Please stick to mailing list
> convention of wrapping at 72-char.

 I know, sorry, this is MS Outlook (not Express), and it's impossible
to configure it this way (if i just set up word wrap, it starts to
corrupt patches). I am now trying to wrap the text by hands, i hope
it's better. And i cannot use anything else because... You know why. :)

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia

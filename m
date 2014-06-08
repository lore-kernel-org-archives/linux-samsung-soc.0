From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: Problems booting exynos5420 with >1 CPU
Date: Sun, 8 Jun 2014 20:02:51 +0100
Message-ID: <20140608190251.GQ23430@n2100.arm.linux.org.uk>
References: <CAM4voam5KDicwLAt3EA1UC7M+EciGccrnMUKxoR-5c8xT8-zSQ@mail.gmail.com> <alpine.LFD.2.11.1406062340480.25775@knanqh.ubzr> <20140607175618.GA25068@e102568-lin.cambridge.arm.com> <alpine.LFD.2.11.1406071431490.25775@knanqh.ubzr> <20140607223614.GA26641@e102568-lin.cambridge.arm.com> <CAOesGMj+itYr-daqxfX=J3Ss+7YdWhUUzBWTW3FqVEH8tXqt-A@mail.gmail.com> <20140608001942.GM23430@n2100.arm.linux.org.uk> <alpine.LFD.2.11.1406081356050.25775@knanqh.ubzr> <20140608182949.GP23430@n2100.arm.linux.org.uk> <alpine.LFD.2.11.1406081452590.25775@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:50907 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755134AbaFHTEo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 8 Jun 2014 15:04:44 -0400
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.11.1406081452590.25775@knanqh.ubzr>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Olof Johansson <olof@lixom.net>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Tushar Behera <trblinux@gmail.com>, "Turquette, Mike" <mturquette@linaro.org>, Doug Anderson <dianders@google.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kevin Hilman <khilman@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Sonny Rao <sonnyrao@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Arun Kumar <arun.kk@samsung.com>

On Sun, Jun 08, 2014 at 02:55:03PM -0400, Nicolas Pitre wrote:
> On Sun, 8 Jun 2014, Russell King - ARM Linux wrote:
> > No, I was specifically thinking about the various iPAQ specific things
> > like the additional platform specific ATAGs that they invented with
> > zero reference to mainline, and then expected them to be accepted as-is.
> > 
> > I gave them a very clear message over that (which was "no way") and that
> > was essentially the last of their mainline submissions.
> 
> That's basically what I'm saying.  They were too lazy to fix their code.  
> But nothing prevented that otherwise. They certainly couldn't use the 
> "firmware is broken and too hard to update" excuse.

No, they just continued to use those ATAGs that they invented.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.

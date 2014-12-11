From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [RFC 04/15] regulator: add restrack support
Date: Thu, 11 Dec 2014 13:43:27 +0000
Message-ID: <20141211134327.GO11285@n2100.arm.linux.org.uk>
References: <1418226513-14105-1-git-send-email-a.hajda@samsung.com>
 <1418226513-14105-5-git-send-email-a.hajda@samsung.com>
 <20141210160720.GS11764@sirena.org.uk>
 <548976D2.7080005@samsung.com>
 <20141211125837.GV11764@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141211125837.GV11764@sirena.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, open list <linux-kernel@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mike Turquette <mturquette@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Inki Dae <inki.dae@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/CLKDEV SUPPORT" <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, boris.brezillon@fr
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Dec 11, 2014 at 12:58:37PM +0000, Mark Brown wrote:
> I'd expect someone reading the change in the regulator API to have at
> least some idea how this fits in with the rest of the API and how to use
> it, and probably more importantly I'd expect to be able to understand
> why this is DT only.

Yep.

This is a repetitive problem, and I fully agree with your concern about
stuff which is supposed to be arch-independent being designed with only
DT in mind.

New core kernel features should *not* be designed with only DT in mind -
DT is not the only firmware description language which the kernel
supports.  Folk need to understand that if they design a new arch
independent kernel feature where the sole use case is with DT, that new
feature is probably going to get rejected, especially when it's
something as generic as resource tracking.

The world is not DT only.

-- 
FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.

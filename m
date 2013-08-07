From: Julius Werner <jwerner@chromium.org>
Subject: Re: [PATCH 1/3 v5] usb: phy-samsung-usb: Simplify PMU register handling
Date: Wed, 7 Aug 2013 10:06:05 -0700
Message-ID: <CAODwPW9DmVdzHbHN0NUK0fYUNw0tj2ktyh-20no30r14_JayFQ@mail.gmail.com>
References: <1375812017-6287-1-git-send-email-jwerner@chromium.org>
	<20130807163045.GK28558@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130807163045.GK28558@e106331-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Julius Werner <jwerner@chromium.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Kukjin Kim <kgene.kim@samsung.com>, Felipe Balbi <balbi@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Vivek Gautam <gautam.vivek@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

> This breaks compatibility, both for an old kernel and a new dt and a new
> kernel with an old dt. Is anyone using these bindings?

They only affect Samsung SoCs and have only been upstream for half a
year, so I doubt it's heavily used.

> Why are we describing fewer registers now? Are they described elsewhere?
>
> The dt should describe the device, not only the portion of it Linux
> wants to use right now.

This only ever described a small section of the huge set of PMU
registers anyway. Before it described up to three registers
controlling different PHYs (using hardcoded offsets in the code to
later find the right one)... with my patch every PHY's DT entry only
describes the one register concerning itself, which makes more sense
in my opinion. It will also prevent the register descriptions in
different DT entries from overlapping.

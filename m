From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Thu, 23 May 2013 15:39:55 -0600
Message-ID: <519E8CAB.7000807@wwwdotorg.org>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com> <1426243.rhL8pXoalu@flatron> <20130518081847.GD1952@game.jcrosoft.org> <1855701.nJQdRzsWsg@flatron> <20130518163001.GE1952@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:47535 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758255Ab3EWVj7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 May 2013 17:39:59 -0400
In-Reply-To: <20130518163001.GE1952@game.jcrosoft.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Doug Anderson <dianders@google.com>, Kukjin Kim <kgene.kim@gmail.com>

On 05/18/2013 10:30 AM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> On 16:57 Sat 18 May     , Tomasz Figa wrote:
...
>> Personally I'd prefer a solution with separate property for each 
>> parameter, because it's much more flexible and allows shorter lines, 
>> making device tree sources more readable.
>
> we already discuss this on the ML the one property perline will endup with
> 100s of node if not 1000s so we all do agree we do not want this in the DT

If you introduce s second level of nodes into the DT like the Tegra
bindings do, that's really not an issue.

For Tegra, each pinctrl state is a node.

Within this, there are a bunch of child nodes, each of which applies to
n pins, and sets up an arbitrary set of parameters; some nodes can set
up mux functions, some can set up e.g. pull-up, etc. The same pin can be
affected by multiple of these nodes.

This all allows you to group together common settings and avoid
duplication and having too many nodes.

Then, client drivers' pincrl-0 properties just reference a single
top-level "state" node, not each of the 10/100/... child nodes.

Take a look at something like nodes state_i2xmux_* in
arch/arm/boot/dts/tegra20-seaboard.dts.

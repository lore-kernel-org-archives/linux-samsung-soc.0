From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 1/2] ARM: S3C64XX: Add suspend support
Date: Wed, 06 Oct 2010 23:22:48 +0100
Message-ID: <4CACF6B8.9030304@fluff.org>
References: <cover.1286319272.git.mcuelenaere@gmail.com>	<1fa4a7a39d9fd48b8329e1a1077a65adb96475b5.1286319272.git.mcuelenaere@gmail.com> <AANLkTi=CH6BJZDYsCHXmcYAVuu-LTsqjKXUVGnBAikiN@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from dsl78-143-211-26.in-addr.fast.co.uk ([78.143.211.26]:55624 "EHLO
	ben-laptop" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1757092Ab0JFWW7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Oct 2010 18:22:59 -0400
In-Reply-To: <AANLkTi=CH6BJZDYsCHXmcYAVuu-LTsqjKXUVGnBAikiN@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Maurus Cuelenaere <mcuelenaere@gmail.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

On 06/10/10 00:23, Kyungmin Park wrote:
> Hi,
> 
> I agree your approach, put the common features in common place.
> but Samsung maintainers insist put these at each machine file at current time.

This is just an init call, the actuall implementation is common to the
core. We did it this was as it was not clear if _all_ machines under
the architecture could do this by default, or would need extra code in
their mach implementation, or in a driver elsewhere.

I would still prefer each machine that can do pm to call s3c_pm_init()
in their setup code to ensure that we don't enable pm on a machine with
possibly incomplete support (especially as PM can be one of the more
difficult things to debug).

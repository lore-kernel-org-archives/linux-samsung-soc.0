From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH 0/4] tree-wide: fix comparison to bitshift when dealing
 with a mask
Date: Tue, 6 Feb 2018 14:54:29 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1802061453440.3306@hadrien>
References: <20180205201002.23621-1-wsa+renesas@sang-engineering.com> <20180206131044.oso33fvv553trrd7@mwanda> <alpine.DEB.2.20.1802061414340.3306@hadrien> <20180206132335.luut6em3kut7f7ej@mwanda> <alpine.DEB.2.20.1802061439110.3306@hadrien>
 <20180206135310.deiaz55xemc26xn4@ninjato>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180206135310.deiaz55xemc26xn4@ninjato>
Sender: netdev-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, netdev@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org



On Tue, 6 Feb 2018, Wolfram Sang wrote:

> Hi Julia,
>
> > and got the results below.  I can make a version for the kernel shortly.
>
> It should probably take care of right-shifting, too?

I did that too but got no results.  Perhaps right shifting constants is
pretty uncommon.  I can put that in the complete rule though.

julia

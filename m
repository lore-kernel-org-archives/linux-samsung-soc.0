From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [clocks] ARM: S3C64XX: Use new clock-clksrc.c code for clocks.
Date: Tue, 1 Dec 2009 11:10:54 +0000
Message-ID: <20091201111054.GI4808@trinity.fluff.org>
References: <1259631793-25480-1-git-send-email-ben-linux@fluff.org> <1259631793-25480-6-git-send-email-ben-linux@fluff.org> <9c9fda240912010148w59d8b3f3n749d174ae738e017@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:47386 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750843AbZLALKv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Dec 2009 06:10:51 -0500
Content-Disposition: inline
In-Reply-To: <9c9fda240912010148w59d8b3f3n749d174ae738e017@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, laforge@gnumonks.org

Thanks, I'll look at adding named initialisers as they're nice than hiding
stuff behind macros.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.

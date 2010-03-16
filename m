From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PULL] Please pull bjdooks' for-linus/samsung-fixes
Date: Tue, 16 Mar 2010 10:40:44 +0000
Message-ID: <20100316104044.GA21604@sirena.org.uk>
References: <20100315232027.GA11570@fluff.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:44214 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932139Ab0CPKkq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Mar 2010 06:40:46 -0400
Content-Disposition: inline
In-Reply-To: <20100315232027.GA11570@fluff.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, Vasily Khoruzhick <anarsoul@gmail.com>

On Mon, Mar 15, 2010 at 11:20:27PM +0000, Ben Dooks wrote:

> Ben Dooks (2):
>       ARM: SAMSUNG: Fix build error from stale define in <plat/uncompress.h>

This should already be in Russell's tree as part of patch 5985/2 (not
that this duplication should do any harm, git should just cope).

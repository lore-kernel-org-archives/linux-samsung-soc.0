From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH] regulator: s2m,s5m: constify regulator_ops structures
Date: Wed, 23 Dec 2015 08:20:43 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1512230819490.2081@localhost6.localdomain6>
References: <1450537080-17387-1-git-send-email-Julia.Lawall@lip6.fr> <20151223000043.GE16023@sirena.org.uk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:40087 "EHLO
	mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S933281AbbLWHUq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Dec 2015 02:20:46 -0500
In-Reply-To: <20151223000043.GE16023@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, kernel-janitors@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org



On Wed, 23 Dec 2015, Mark Brown wrote:

> On Sat, Dec 19, 2015 at 03:58:00PM +0100, Julia Lawall wrote:
> > The regulator_ops structures are never modified, so declare them as const.
> > 
> > Done with the help of Coccinelle.
> 
> This doesn't apply against current code, please check and resend.

It works fine for me on today's linux-next (80c75a0f1d).  What goes wrong?

julia

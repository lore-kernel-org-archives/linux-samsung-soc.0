From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v3 05/12] s3c-fb: Add support for display panning
Date: Fri, 2 Jul 2010 12:52:05 +0100
Message-ID: <20100702115205.GB30655@sirena.org.uk>
References: <1277712538-23188-1-git-send-email-p.osciak@samsung.com> <1277712538-23188-6-git-send-email-p.osciak@samsung.com> <4C288779.8040702@gmail.com> <4C2DCCAD.9080306@simtec.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:40501 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752659Ab0GBLwI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Jul 2010 07:52:08 -0400
Content-Disposition: inline
In-Reply-To: <4C2DCCAD.9080306@simtec.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben@simtec.co.uk>
Cc: Maurus Cuelenaere <mcuelenaere@gmail.com>, Pawel Osciak <p.osciak@samsung.com>, linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com

On Fri, Jul 02, 2010 at 12:25:33PM +0100, Ben Dooks wrote:
> On 28/06/10 12:28, Maurus Cuelenaere wrote:

> > No need for the '? 1 : 0'

> I tihnk there is, IIRC there is no neccessity for a compiler to produce
> one for true, just that the result be !0

The compiler will *produce* 1 for true, but it will accept any non-zero
value as true.

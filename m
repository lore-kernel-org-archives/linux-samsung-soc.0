From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] drm/exynos: Add missing includes
Date: Sat, 06 Jul 2013 01:41:02 +0200
Message-ID: <1504355.0ZFzGzMgKd@flatron>
References: <1372683355-27460-1-git-send-email-broonie@kernel.org> <008a01ce771e$afe02670$0fa07350$%dae@samsung.com> <20130702150449.GO27646@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f51.google.com ([74.125.83.51]:63761 "EHLO
	mail-ee0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751224Ab3GEXlG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Jul 2013 19:41:06 -0400
Received: by mail-ee0-f51.google.com with SMTP id e52so1629238eek.38
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Jul 2013 16:41:05 -0700 (PDT)
In-Reply-To: <20130702150449.GO27646@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, 'Joonyoung Shim' <jy0922.shim@samsung.com>, 'Seung-Woo Kim' <sw0312.kim@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'David Airlie' <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Tuesday 02 of July 2013 16:04:49 Mark Brown wrote:
> On Tue, Jul 02, 2013 at 09:21:32PM +0900, Inki Dae wrote:
> > > Ensure that all externally accessed functions are correctly
> > > prototyped
> > > when defined in each file by making sure the headers with the
> > > protoypes
> > > are included in the file with the definition.
> > 
> > I don't see why this patch is needed. it seems like including
> > unnecessary headers so it makes the code size enlarged.
> 
> Well, aside from it being basic good practice and allowing the compiler
> to check for errors in the prototypes this is also something that sparse
> warns about.
> 
> If the resulting binary size is changed by having the headers included
> then that indicates a bug in the headers - they *really* shouldn't be
> doing anything substantial here.  None of the headers in question looked
> at all worrying.

+1

Best regards,
Tomasz

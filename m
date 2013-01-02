From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 0/2] Add missing fixed regulators on Origen board
Date: Wed, 2 Jan 2013 11:28:31 -0800
Message-ID: <20130102192831.GA6087@quad.lixom.net>
References: <1356683670-30451-1-git-send-email-tushar.behera@linaro.org>
 <CAOesGMi_bmm9ZpiMzVHN=YUmsLSvyiUyvKRq5DxDmxnMu+Z-tQ@mail.gmail.com>
 <50E0FE22.8070406@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:34443 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752404Ab3ABT2W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jan 2013 14:28:22 -0500
Received: by mail-pb0-f51.google.com with SMTP id ro12so8075845pbb.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Jan 2013 11:28:22 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <50E0FE22.8070406@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On Mon, Dec 31, 2012 at 08:23:22AM +0530, Tushar Behera wrote:
> On 12/30/2012 11:55 AM, Olof Johansson wrote:
> > Hi,
> > 
> > On Fri, Dec 28, 2012 at 12:34 AM, Tushar Behera
> > <tushar.behera@linaro.org> wrote:
> >> This patchset adds vmmc and hdmi-en regulators for Origen board.
> >>
> >> Tushar Behera (2):
> >>   ARM: EXYNOS: Add vmmc regulator for Origen board
> >>   ARM: EXYNOS: Add hdmi-en regulator for Origen board
> > 
> > The vmmc one seems to already be there in the dts file for origen. It
> > looks like the HDMI one is still needed though.
> > 
> 
> DT enablement patches for HDMI driver were posted sometime back, but
> they have not yet been merged in trunk. So HDMI regulator entry for DT
> will be added after that.
> 
> > Please move to using DT board files instead of expanding the legacy board files.
> > 
> 
> Sure, the focus would be on adding DT support.
> 
> Legacy board support for Origen is pretty much complete with support for
> various multimedia drivers, so it provides a good environment for
> testing different features. It would be good to get these patches in for
> enabling HDMI support, which otherwise would be broken if
> REGULATOR_DUMMY is not defined.

Ok. Sounds like the work to mostly remove legacy board files is planned to
happen soon, so if this helps things meanwhile I guess it's ok. I just prefer
to avoid seeing churn that's just going to be removed soon anyway.


-Olof
